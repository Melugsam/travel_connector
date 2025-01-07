from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from database import get_db
from models import Post, PostImage, User
from schemas import PostCreateSchema, PostSchema

router = APIRouter()

@router.get("/", response_model=List[PostSchema])
def get_posts(
    user_id: Optional[int] = Query(None, description="ID пользователя для фильтрации постов"),
    offset: int = Query(0, ge=0, description="Смещение для пагинации"),
    limit: int = Query(10, ge=1, le=100, description="Количество постов для возврата"),
    db: Session = Depends(get_db),
):
    query = db.query(Post).order_by(Post.created_at.desc())

    if user_id:
        query = query.filter(Post.user_id == user_id)

    posts = query.offset(offset).limit(limit).all()

    return posts

@router.post("/create", response_model=PostSchema)
def create_post(post: PostCreateSchema, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id == post.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    new_post = Post(
        user_id=post.user_id,
        description=post.description,
    )
    db.add(new_post)
    db.commit()
    db.refresh(new_post)

    for image in post.images:
        new_image = PostImage(
            post_id=new_post.id,
            url=image.url
        )
        db.add(new_image)

    db.commit()
    db.refresh(new_post)

    return new_post
