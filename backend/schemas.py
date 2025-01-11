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

class  UserResponse(BaseModel):
    id: int
    email: str
    name: str 

    class Config:
        from_attributes = True

class FollowerSchema(BaseModel):
    id: int
    name: str
    avatar: Optional[str]

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
    followers: List[dict]
    following: List[dict]
    profileDescription: str

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
    user_id: int
    offset: Optional[int]
    limit: Optional[int]

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

class GetPostsRequest(BaseModel):
    user_id: int

class CommentSchema(BaseModel):
    id: int
    content: str
    created_at: Optional[str] = None
    user: Optional[UserSchema] = None

    class Config:
        from_attributes = True

class PostIdSchema(BaseModel):
    post_id: int

class FollowUserSchema(BaseModel):
    user_id: int
    target_user_id: int

class ProfileSchema(BaseModel):
    user_id: int
    target_user_id: int

class UserUpdateSchema(BaseModel):
    user_id: int
    name: str
    profileDescription: Optional[str] = None