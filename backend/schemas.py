from pydantic import BaseModel, EmailStr
from typing import Any, Optional
from pydantic import BaseModel
from datetime import datetime
from typing import List, Optional

class UserCreate(BaseModel):
    email: EmailStr
    password: str
    name: str 

    class Config:
        from_attributes = True

class UserLogin(BaseModel):
    email: EmailStr
    password: str

class UserResponse(BaseModel):
    id: int
    email: str
    name: str 

    class Config:
        from_attributes = True


class UserOut(BaseModel):
    id: int
    email: EmailStr

    class Config:
        from_attributes = True
        
class PostImageSchema(BaseModel):
    url: str

    class Config:
        from_attributes = True

class UserSchema(BaseModel):
    id: int
    name: str
    avatar: Optional[str]

    class Config:
        from_attributes = True

class CommentResponseSchema(BaseModel):
    id: int
    content: str
    user: UserSchema
    created_at: str

    class Config:
        from_attributes = True

class AddCommentSchema(BaseModel):
    post_id: int
    user_id: int
    content: str

class PostSchema(BaseModel):
    id: int
    description: Optional[str]
    created_at: str  # Поле для строки даты
    likes_count: int
    comments_count: int
    liked_by: List[int]  # Список ID пользователей
    user: UserSchema
    images: List[PostImageSchema]
    comments: List[CommentResponseSchema]

    class Config:
        from_attributes = True


class PostImageCreateSchema(BaseModel):
    url: str

class PostCreateSchema(BaseModel):
    user_id: int
    description: Optional[str]
    images: Optional[List[PostImageCreateSchema]] = []

    class Config:
        from_attributes = True

class LikePostSchema(BaseModel):
    post_id: int
    user_id: int
