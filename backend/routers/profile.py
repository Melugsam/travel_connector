from datetime import datetime
import os
import shutil
from fastapi import APIRouter, Depends, File, Form, HTTPException, Query, UploadFile
from sqlalchemy.orm import Session, joinedload
from database import get_db
from models import Post, User
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

@router.post("")
def get_user_profile(
    profile_data: ProfileSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    target_user_id = profile_data.target_user_id if profile_data.target_user_id is not None else current_user.id
    
    user = db.query(User).options(
        joinedload(User.followers), 
        joinedload(User.following)
    ).filter(User.id == target_user_id).first()
    
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")
    
    is_current_user = current_user.id == user.id
    is_following = any(follower.id == current_user.id for follower in user.followers)
    
    posts = db.query(Post).options(joinedload(Post.images)).filter(Post.user_id == target_user_id).all()
    
    posts_data = [
        {
            "id": post.id,
            "description": post.description,
            "created_at": post.created_at.isoformat() if post.created_at else None,
            "likes_count": post.likes_count,
            "comments_count": post.comments_count,
            "liked": current_user.id in (post.liked_by or []),
            "images": [{"url": img.url} for img in post.images]
        }
        for post in posts
    ]
    
    return {
        'id': user.id,
        'name': user.name,
        'avatar': user.avatar,
        'followers': [{'id': follower.id, 'name': follower.name, 'avatar': follower.avatar} for follower in user.followers],
        'following': [{'id': followee.id, 'name': followee.name, 'avatar': followee.avatar} for followee in user.following],
        'profile_description': user.profile_description,
        'isCurrentUser': is_current_user,
        'isFollowing': is_following,
        'posts': posts_data
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
