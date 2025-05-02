from datetime import datetime
import os
import shutil
from fastapi import APIRouter, Depends, File, Form, HTTPException, Query, UploadFile
from sqlalchemy.orm import Session, joinedload
from database import get_db
from models import Comment, MapRoute, Post, RouteConnection, User
from schemas import FollowUserSchema, ProfileSchema, UserUpdateSchema
from fastapi.security import OAuth2PasswordBearer
from utils import verify_access_token

router = APIRouter()
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    payload = verify_access_token(token)
    if payload is None:
        raise HTTPException(status_code=401, detail="Недействительный токен")
    
    email = payload.get("sub")
    user = db.query(User).filter(User.email == email).first()
    if not user:
        raise HTTPException(status_code=401, detail="Пользователь не найден")
    
    return user

from fastapi import Request
from sqlalchemy.orm import joinedload
@router.post("")
def get_user_profile(
    profile_data: ProfileSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
    request: Request = None
):
    target_user_id = profile_data.target_user_id or current_user.id

    user = db.query(User).options(
        joinedload(User.followers),
        joinedload(User.following)
    ).filter(User.id == target_user_id).first()

    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    is_current_user = user.id == current_user.id
    is_following = any(f.id == current_user.id for f in user.followers)

    base_url = str(request.base_url).rstrip('/')

    posts = db.query(Post).options(
        joinedload(Post.user).joinedload(User.followers),
        joinedload(Post.comments).joinedload(Comment.user),
        joinedload(Post.images),
        joinedload(Post.map_route).joinedload(MapRoute.markers),
        joinedload(Post.map_route).joinedload(MapRoute.routes).joinedload(RouteConnection.from_marker),
        joinedload(Post.map_route).joinedload(MapRoute.routes).joinedload(RouteConnection.to_marker),
    ).filter(Post.user_id == target_user_id).order_by(Post.created_at.desc()).all()

    posts_data = []
    for post in posts:
        comments = [
            {
                "id": c.id,
                "content": c.content,
                "created_at": c.created_at.isoformat() if c.created_at else None,
                "user": {
                    "id": c.user.id,
                    "name": c.user.name,
                    "avatar": c.user.avatar,
                    "followers": [
                        {"id": f.id, "name": f.name, "avatar": f.avatar}
                        for f in c.user.followers
                    ] if c.user and c.user.followers else [],
                } if c.user else None,
            }
            for c in post.comments
        ]

        route = None
        if post.map_route:
            marker_id_to_index = {m.id: i for i, m in enumerate(post.map_route.markers)}
            markers = [
                {
                    "point": {
                        "latitude": m.lat,
                        "longitude": m.lng,
                    },
                    "type": m.type,
                    "label": m.label,
                }
                for m in post.map_route.markers
            ]
            routes = [
                {
                    "from_index": marker_id_to_index.get(r.from_marker_id),
                    "to_index": marker_id_to_index.get(r.to_marker_id),
                }
                for r in post.map_route.routes
                if r.from_marker_id in marker_id_to_index and r.to_marker_id in marker_id_to_index
            ]
            route = {"markers": markers, "routes": routes}

        images = [
            {
                "url": img.url if img.url.startswith("http") else f"{base_url}{img.url}"
            }
            for img in post.images
        ]

        posts_data.append({
            "id": post.id,
            "title": post.title,
            "description": post.description,
            "created_at": post.created_at.isoformat() if post.created_at else None,
            "likes_count": post.likes_count,
            "comments_count": post.comments_count,
            "liked_by": post.liked_by or [],
            "liked": current_user.id in (post.liked_by or []),
            "images": images,
            "user": {
                "id": post.user.id,
                "name": post.user.name,
                "avatar": post.user.avatar,
                "followers": [
                    {"id": f.id, "name": f.name, "avatar": f.avatar}
                    for f in post.user.followers
                ] if post.user.followers else [],
            },
            "comments": comments,
            "route": route,
        })

    return {
        "id": user.id,
        "name": user.name,
        "avatar": user.avatar,
        "followers": [
            {"id": f.id, "name": f.name, "avatar": f.avatar} for f in user.followers
        ],
        "following": [
            {"id": f.id, "name": f.name, "avatar": f.avatar} for f in user.following
        ],
        "profile_description": user.profile_description,
        "isCurrentUser": is_current_user,
        "isFollowing": is_following,
        "posts": posts_data
    }


@router.post("/follow")
def follow_user(follow_data: FollowUserSchema, db: Session = Depends(get_db), current_user: User = Depends(get_current_user)):
    if follow_data.target_user_id == current_user.id:
        raise HTTPException(status_code=400, detail="Вы не можете подписаться на самого себя")

    user_to_follow = db.query(User).filter(User.id == follow_data.target_user_id).first()
    if not user_to_follow:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    if current_user in user_to_follow.followers:
        user_to_follow.followers.remove(current_user)
        message = "Отписка выполнена"
    else:
        user_to_follow.followers.append(current_user)
        message = "Подписка выполнена"
    
    db.add(user_to_follow)
    db.commit()
    db.refresh(user_to_follow)

    return {"message": message, "followers_count": len(user_to_follow.followers)}

@router.post("/edit")
def change_profile(
    name: str = Form(None),
    profile_description: str = Form(None),
    avatar: UploadFile = File(None),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    if name:
        current_user.name = name
    if profile_description:
        current_user.profile_description = profile_description
    if avatar:
        upload_dir = "static/avatars"
        os.makedirs(upload_dir, exist_ok=True)

        file_path = os.path.join(upload_dir, f"user_{current_user.id}_{avatar.filename}")
        with open(file_path, "wb") as buffer:
            shutil.copyfileobj(avatar.file, buffer)
        
        current_user.avatar = f"/{file_path.replace('\\', '/')}"
    
    db.commit()
    db.refresh(current_user)

    return {"message": "Профиль успешно обновлен"}
