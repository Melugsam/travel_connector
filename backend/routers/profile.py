from datetime import datetime
import os
import shutil
from fastapi import APIRouter, Depends, File, Form, Query, HTTPException, UploadFile
from sqlalchemy.orm import Session
from typing import List, Optional
from database import get_db
from models import Post, PostImage, User, Comment
from sqlalchemy.orm import joinedload
from schemas import AddCommentSchema, CommentResponseSchema, CommentSchema, FollowUserSchema, GetPostsRequest, LikePostSchema, PostCreateSchema, PostIdSchema, PostSchema, ProfileSchema, UserSchema, UserUpdateSchema

router = APIRouter()

@router.post("")
def get_user_profile(data: ProfileSchema, db: Session = Depends(get_db)):
    user = db.query(User).options(
        joinedload(User.followers),
        joinedload(User.following)
    ).filter(User.id == data.user_id).first()

    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    followers = [
        {
            "id": follower.id,
            "name": follower.name,
            "avatar": follower.avatar,
        }
        for follower in user.followers
    ]

    following = [
        {
            "id": followee.id,
            "name": followee.name,
            "avatar": followee.avatar,
        }
        for followee in user.following
    ]

    is_current_user = data.user_id == data.target_user_id
    current_user_following = data.user_id in (followers or [])

    result = {
        'id':user.id,
        'name':user.name,
        'avatar':user.avatar,
        'followers':followers,
        'following':following,
        "is_current_user": is_current_user,
        'profileDescription':user.profileDescription,
        "current_user_following":  current_user_following
    }

    return result
        

@router.post("/follow")
def follow_user(follow_data: FollowUserSchema, db: Session = Depends(get_db)):
    # Проверяем, пытается ли пользователь подписаться сам на себя
    if follow_data.user_id == follow_data.target_user_id:
        raise HTTPException(status_code=400, detail="Вы не можете подписаться на самого себя")

    user_to_follow = db.query(User).filter(User.id == follow_data.target_user_id).first()
    if not user_to_follow:
        raise HTTPException(status_code=404, detail="Пользователь для подписки не найден")

    user = db.query(User).filter(User.id == follow_data.user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    # Проверяем, есть ли пользователь уже в списке фолловеров
    if user in user_to_follow.followers:
        user_to_follow.followers.remove(user)
        message = "Отписка выполнена"
    else:
        user_to_follow.followers.append(user)
        message = "Подписка выполнена"

    db.add(user_to_follow)
    db.commit()
    db.refresh(user_to_follow)

    return {"message": message, "followers_count": len(user_to_follow.followers)}


@router.post("/edit", response_model=dict)
def change_profile(
    user_id: int = Form(...),
    name: str = Form(None),
    profileDescription: str = Form(None),
    avatar: UploadFile = File(None),
    db: Session = Depends(get_db)
):
    user = db.query(User).filter(User.id == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="Пользователь не найден")

    if name:
        user.name = name
    if profileDescription:
        user.profileDescription = profileDescription
    if avatar:
        upload_dir = "static/avatars"
        os.makedirs(upload_dir, exist_ok=True)

        file_path = os.path.join(upload_dir, f"user_{user_id}_{avatar.filename}")
        with open(file_path, "wb") as buffer:
            shutil.copyfileobj(avatar.file, buffer)

        # Сохраняем путь к аватарке
        user.avatar = f"/{file_path.replace('\\', '/')}"
    

    db.commit()
    db.refresh(user)

    return {
        "message": "Профиль успешно обновлен",
    }