from datetime import datetime
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session, joinedload
from database import get_db
from models import Post, PostImage, User, Comment
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

@router.post("")
def get_posts(
    post_request: PostSchema,
    db: Session = Depends(get_db),
    current_user: User = Depends(get_current_user)
):
    query = db.query(Post).options(
        joinedload(Post.user).joinedload(User.followers),
        joinedload(Post.comments).joinedload(Comment.user)
    )

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
                        {"id": follower.id, "name": follower.name, "avatar": follower.avatar}
                        for follower in comment.user.followers
                    ] if comment.user and comment.user.followers else [],
                } if comment.user else None,
            }
            for comment in post.comments
        ]

        liked = current_user.id in (post.liked_by or [])

        result.append({
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
                "followers": [
                    {"id": follower.id, "name": follower.name, "avatar": follower.avatar}
                    for follower in post.user.followers
                ] if post.user.followers else [],
            },
            "images": [{"url": img.url} for img in post.images],
            "comments": comments,
        })

    return result


@router.post("/create")
def create_post(post: PostCreateSchema, db: Session = Depends(get_db), current_user: User = Depends(get_current_user)):
    new_post = Post(
        user_id=current_user.id,
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

    return {"message": "Пост успешно добавлен"}

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
