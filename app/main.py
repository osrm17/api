from fastapi import FastAPI, Response, status, HTTPException, Depends
from typing import List
from fastapi.params import Body
from . import models, schemas, utils
from .database import get_db
from sqlalchemy.orm import Session
from .routers import post, user, auth

app = FastAPI()

app.include_router(post.router)
app.include_router(user.router)
app.include_router(auth.router)

@app.get("/")
def root():
    return {}

