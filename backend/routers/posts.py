from datetime import datetime
from fastapi import APIRouter, Depends, Query, HTTPException
from sqlalchemy.orm import Session
from typing import List, Optional
from database import get_db
from models import Post, PostImage, User, Comment
from sqlalchemy.orm import joinedload
from schemas import AddCommentSchema, CommentResponseSchema, CommentSchema, GetPostsRequest, LikePostSchema, PostCreateSchema, PostIdSchema, PostSchema

router = APIRouter()

@router.post("", response_model=List[PostSchema])
def get_posts(request: GetPostsRequest, db: Session = Depends(get_db)):
    posts = db.query(Post).options(
        joinedload(Post.user),
        joinedload(Post.images),
        joinedload(Post.comments)
    ).all()

    result = []
    for post in posts:
        comments = []
        for comment in post.comments:
            comments.append({
                "id": comment.id,
                "content": comment.content,
                "created_at": comment.created_at.isoformat() if comment.created_at else None,
                "user": {
                    "id": comment.user.id,
                    "name": comment.user.name,
                    "avatar": comment.user.avatar,
                } if comment.user else None,
            })

        liked = request.user_id in (post.liked_by or [])

        post_data = {
            "id": post.id,
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
            } if post.user else None,
            "images": [{"url": img.url} for img in post.images],
            "comments": comments,
        }
        result.append(post_data)

    return result


@router.post("/create", response_model=PostSchema)
def create_post(post: PostCreateSchema, db: Session = Depends(get_db)):
    user = db.query(User).filter(User.id == post.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    new_post = Post(
        user_id=post.user_id,
        description=post.description,
        created_at=datetime.utcnow(),
    )
    db.add(new_post)
    db.commit()
    db.refresh(new_post)

    if post.images:
        images = [PostImage(post_id=new_post.id, url=image.url) for image in post.images]
        db.bulk_save_objects(images)
    db.commit()

    response_data = {
        "id": new_post.id,
        "description": new_post.description,
        "created_at": new_post.created_at.isoformat(),
        "likes_count": new_post.likes_count,
        "comments_count": new_post.comments_count,
        "liked_by": new_post.liked_by or [],
        "user": {
            "id": user.id,
            "name": user.name,
            "avatar": user.avatar,
        },
        "images": [{"url": img.url} for img in new_post.images],
        "comments": [],
    }

    return response_data

@router.post("/like")
def like_post(like_data: LikePostSchema, db: Session = Depends(get_db)):
    post = db.query(Post).filter(Post.id == like_data.post_id).first()
    if not post:
        raise HTTPException(status_code=404, detail="Пост не найден")

    user = db.query(User).filter(User.id == like_data.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    liked_by = list(post.liked_by or [])  

    if like_data.user_id in liked_by:
        liked_by.remove(like_data.user_id)
        post.likes_count -= 1
        message = "Лайк удалён"
    else:
        liked_by.append(like_data.user_id)
        post.likes_count += 1
        message = "Лайк добавлен"

    post.liked_by = liked_by

    db.add(post)
    db.commit()
    db.refresh(post)

    return {
        "message": message,
        "likes_count": post.likes_count,
        "liked_by": post.liked_by,
    }

@router.post("/addComment")
def add_comment(comment_data: AddCommentSchema, db: Session = Depends(get_db)):
    post = db.query(Post).filter(Post.id == comment_data.post_id).first()
    if not post:
        raise HTTPException(status_code=404, detail="Пост не найден")

    user = db.query(User).filter(User.id == comment_data.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    new_comment = Comment(
        post_id=comment_data.post_id,
        user_id=comment_data.user_id,
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
def get_post_comments(post_id_schema: PostIdSchema, db: Session = Depends(get_db)):
    post_id = post_id_schema.post_id
    post = db.query(Post).filter(Post.id == post_id).first()

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

