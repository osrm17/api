from typing import Literal, Optional
from pydantic import BaseModel, EmailStr
from datetime import datetime


class UserCreate(BaseModel):
    email: EmailStr
    password: str

class UserResponse(BaseModel):
    id: int
    email: EmailStr
    created_at: datetime
    class Config:
        orm_model =True

## Pydantic Model
class PostBase(BaseModel):
    title: str
    content: str
    published: bool = True

class PostCreate(PostBase):
    pass


class Post(PostBase):
    id: int
    created_at: datetime
    user_id: int
    user : UserResponse
    class Config:
        orm_model =True


class PostOut(BaseModel):
    Post : Post
    votes : int

    class Config:
        orm_mode = True

class Token(BaseModel):
    access_token : str
    type : str

class TokenData(BaseModel):
    id : Optional[str] = None

class Vote(BaseModel):
    post_id : int
    dir: Literal[0,1]