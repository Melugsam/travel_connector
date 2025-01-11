from database import Base
from sqlalchemy import ARRAY, JSON, Column, Integer, String, ForeignKey, DateTime, Table
from sqlalchemy.orm import relationship
from datetime import datetime

class Follower(Base):
    __tablename__ = 'followers'

    follower_id = Column(Integer, ForeignKey('users.id'), primary_key=True)
    followed_id = Column(Integer, ForeignKey('users.id'), primary_key=True)
    created_at = Column(DateTime, default=datetime.utcnow)

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    email = Column(String, unique=True, index=True, nullable=False)
    hashed_password = Column(String, nullable=False)
    avatar = Column(String, nullable=True)
    name = Column(String, nullable=True)
    profileDescription = Column(String, nullable=True)

    posts = relationship("Post", back_populates="user")

    followers = relationship(
        'User',
        secondary='followers',
        primaryjoin=id == Follower.followed_id,
        secondaryjoin=id == Follower.follower_id,
        backref='following',
    )

class Comment(Base):
    __tablename__ = "comments"

    id = Column(Integer, primary_key=True, index=True)
    post_id = Column(Integer, ForeignKey("posts.id"), nullable=False)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    content = Column(String, nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)

    post = relationship("Post", back_populates="comments")
    user = relationship("User")

class Post(Base):
    __tablename__ = "posts"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"), nullable=False)
    description = Column(String, nullable=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    likes_count = Column(Integer, default=0)
    comments_count = Column(Integer, default=0)
    liked_by = Column(JSON, default=list)

    user = relationship("User", back_populates="posts")
    images = relationship("PostImage", back_populates="post")
    comments = relationship("Comment", back_populates="post", cascade="all, delete-orphan")



class PostImage(Base):
    __tablename__ = "post_images"

    id = Column(Integer, primary_key=True, index=True)
    post_id = Column(Integer, ForeignKey("posts.id"), nullable=False)
    url = Column(String, nullable=False)

    post = relationship("Post", back_populates="images")
