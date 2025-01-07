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

class PostSchema(BaseModel):
    id: int
    description: Optional[str]
    created_at: datetime
    likes_count: int
    comments_count: int
    user: UserSchema
    images: List[PostImageSchema]

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

