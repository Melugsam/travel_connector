from datetime import datetime
import json
import os
import shutil
from typing import List, Optional
from fastapi import APIRouter, Depends, File, Form, HTTPException, UploadFile
from sqlalchemy.orm import Session, joinedload
from database import get_db
from models import CustomMarker, MapRoute, Post, PostImage, RouteConnection, User, Comment
from schemas import AddCommentSchema, CommentResponseSchema, CommentSchema, LikePostSchema, PostCreateSchema, PostIdSchema, PostSchema
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

@router.post("")
def get_posts(
    post_request: PostSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user),
    request: Request = None  # Добавлено!
):
    base_url = str(request.base_url).rstrip('/')  # http://127.0.0.1:8000 без "/"

    query = db.query(Post).options(
        joinedload(Post.user).joinedload(User.followers),
        joinedload(Post.comments).joinedload(Comment.user),
        joinedload(Post.images),
        joinedload(Post.map_route)
        .joinedload(MapRoute.markers),
        joinedload(Post.map_route)
        .joinedload(MapRoute.routes)
        .joinedload(RouteConnection.from_marker),
        joinedload(Post.map_route)
        .joinedload(MapRoute.routes)
        .joinedload(RouteConnection.to_marker),
    )

    # Добавлена сортировка
    query = query.order_by(Post.created_at.desc())

    if post_request.offset is not None:
        query = query.offset(post_request.offset)
    if post_request.limit is not None:
        query = query.limit(post_request.limit)


    posts = query.all()
    result = []

    for post in posts:
        comments = [
            {
                "id": comment.id,
                "content": comment.content,
                "created_at": comment.created_at.isoformat() if comment.created_at else None,
                "user": {
                    "id": comment.user.id,
                    "name": comment.user.name,
                    "avatar": comment.user.avatar,
                    "followers": [
                        {"id": f.id, "name": f.name, "avatar": f.avatar}
                        for f in comment.user.followers
                    ] if comment.user and comment.user.followers else [],
                } if comment.user else None,
            }
            for comment in post.comments
        ]

        liked = current_user.id in (post.liked_by or [])

        route = None
        if post.map_route:
            markers = [
                {
                    "point": {
                        "latitude": marker.lat,
                        "longitude": marker.lng,
                    },
                    "type": marker.type,
                    "label": marker.label,
                }
                for marker in post.map_route.markers
            ]

            marker_id_to_index = {m.id: i for i, m in enumerate(post.map_route.markers)}

            routes = [
                {
                    "from_index": marker_id_to_index.get(route.from_marker_id),
                    "to_index": marker_id_to_index.get(route.to_marker_id),
                }
                for route in post.map_route.routes
                if route.from_marker_id in marker_id_to_index and route.to_marker_id in marker_id_to_index
            ]

            route = {"markers": markers, "routes": routes}

        # 🔥 Важно: добавляем базовый URL к изображениям
        images = []
        for img in post.images:
            url = img.url
            full_url = url if url.startswith("http") else f"{base_url}{url}"
            images.append({"url": full_url})

        result.append({
            "id": post.id,
            "title": post.title,
            "description": post.description,
            "created_at": post.created_at.isoformat() if post.created_at else None,
            "likes_count": post.likes_count,
            "comments_count": post.comments_count,
            "liked_by": post.liked_by or [],
            "liked": liked,
            "user": {
                "id": post.user.id,
                "name": post.user.name,
                "avatar": post.user.avatar,
                "followers": [
                    {"id": f.id, "name": f.name, "avatar": f.avatar}
                    for f in post.user.followers
                ] if post.user.followers else [],
            },
            "images": images,
            "comments": comments,
            "route": route,
        })

    return result


@router.post("/create")
async def create_post(
    title: Optional[str] = Form(None),
    description: str = Form(...),
    map_route: Optional[str] = Form(None),
    images: Optional[List[UploadFile]] = File(None),
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    
    print("=== [POST /posts/create] ===")
    print(f"[Title] {title}")
    print(f"[Описание] {description}")
    print(f"[Маршрут передан] {map_route is not None}")
    print(f"[Файлов прислано] {len(images) if images else 0}")

    if images:
        for i, img in enumerate(images):
            print(f"  └─ [{i}] filename={img.filename}, content_type={img.content_type}")

    # 1. Создаём пост
    new_post = Post(
        title=title,
        user_id=current_user.id,
        description=description,
        created_at=datetime.utcnow()
    )
    db.add(new_post)
    db.commit()
    db.refresh(new_post)

    # 2. Сохраняем изображения
    if images:
        os.makedirs("static/posts", exist_ok=True)
        image_urls = []
        for image in images:
            filename = f"post_{new_post.id}_{image.filename}"
            file_path = os.path.join("static/posts", filename)

            with open(file_path, "wb") as buffer:
                shutil.copyfileobj(image.file, buffer)

            relative_url = f"/static/posts/{filename}"
            image_record = PostImage(post_id=new_post.id, url=relative_url)
            db.add(image_record)

        db.commit()

    # 3. Обрабатываем маршрут (если он есть)
    if map_route:
        from models import MapRoute, CustomMarker, RouteConnection
        parsed = json.loads(map_route)

        print(">>> Содержимое маршрута:")
        import pprint
        pprint.pprint(parsed, indent=2, width=120)

        map_route_record = MapRoute(post_id=new_post.id)
        db.add(map_route_record)
        db.commit()
        db.refresh(map_route_record)

        marker_objects = []
        for marker in parsed.get("markers", []):
            m = CustomMarker(
                route_id=map_route_record.id,
                lat=marker["point"]["latitude"],
                lng=marker["point"]["longitude"],
                type=marker["type"],
                label=marker.get("label")
            )
            db.add(m)
            db.commit()
            marker_objects.append(m)

        for conn in parsed.get("routes", []):
            from_idx = conn["from_index"]
            to_idx = conn["to_index"]
            route_conn = RouteConnection(
                route_id=map_route_record.id,
                from_marker_id=marker_objects[from_idx].id,
                to_marker_id=marker_objects[to_idx].id,
            )
            db.add(route_conn)

        db.commit()

    return {"message": "Пост успешно создан", "post_id": new_post.id}

@router.post("/comments")
def get_post_comments(
    post_id_schema: PostIdSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    post_id = post_id_schema.post_id
    post = db.query(Post).options(joinedload(Post.comments).joinedload(Comment.user)).filter(Post.id == post_id).first()

    if not post:
        raise HTTPException(status_code=404, detail="Пост не найден")

    comments = [
        {
            "id": comment.id,
            "content": comment.content,
            "created_at": comment.created_at.isoformat(),
            "user": {
                "id": comment.user.id,
                "name": comment.user.name,
                "avatar": comment.user.avatar,
            } if comment.user else None,
        }
        for comment in post.comments
    ]

    return {"post_id": post_id, "comments": comments}

@router.post("/addComment")
def add_comment(comment_data: AddCommentSchema, db: Session = Depends(get_db), current_user: User = Depends(get_current_user)):
    post = db.query(Post).filter(Post.id == comment_data.post_id).first()
    if not post:
        raise HTTPException(status_code=404, detail="Пост не найден")

    new_comment = Comment(
        post_id=comment_data.post_id,
        user_id=current_user.id,
        content=comment_data.content,
    )
    db.add(new_comment)
    post.comments_count += 1
    db.add(post)
    db.commit()
    db.refresh(post)
    db.refresh(new_comment)

    return {"message": "Комментарий добавлен", "comment_id": new_comment.id}

@router.post("/comments")
def get_post_comments(
    post_id_schema: PostIdSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    post_id = post_id_schema.post_id
    post = db.query(Post).options(joinedload(Post.comments).joinedload(Comment.user)).filter(Post.id == post_id).first()

    if not post:
        raise HTTPException(status_code=404, detail="Пост не найден")

    comments = [
        {
            "id": comment.id,
            "content": comment.content,
            "created_at": comment.created_at.isoformat(),
            "user": {
                "id": comment.user.id,
                "name": comment.user.name,
                "avatar": comment.user.avatar,
            } if comment.user else None,
        }
        for comment in post.comments
    ]

    return {"post_id": post_id, "comments": comments}

@router.post("/like")
def like_post(like_data: LikePostSchema, db: Session = Depends(get_db), current_user: User = Depends(get_current_user)):
    post = db.query(Post).filter(Post.id == like_data.post_id).first()
    if not post:
        raise HTTPException(status_code=404, detail="Пост не найден")

    liked_by = list(post.liked_by or [])  
    if current_user.id in liked_by:
        liked_by.remove(current_user.id)
        post.likes_count -= 1
        message = "Лайк удалён"
    else:
        liked_by.append(current_user.id)
        post.likes_count += 1
        message = "Лайк добавлен"
    
    post.liked_by = liked_by
    db.add(post)
    db.commit()
    db.refresh(post)

    return {"message": message, "likes_count": post.likes_count, "liked_by": post.liked_by}