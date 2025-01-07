from fastapi import FastAPI, HTTPException, Request
from fastapi.exceptions import RequestValidationError
from fastapi.responses import JSONResponse
from fastapi.staticfiles import StaticFiles
from database import Base, engine
from routers import auth, posts

Base.metadata.create_all(bind=engine)

app = FastAPI()

@app.exception_handler(HTTPException)
async def http_exception_handler(request: Request, exc: HTTPException):
    return JSONResponse(
        status_code=exc.status_code,
        content={
            "errorCode": exc.status_code,
            "details": exc.detail
        },
    )

@app.exception_handler(RequestValidationError)
async def validation_exception_handler(request: Request, exc: RequestValidationError):
    return JSONResponse(
        status_code=422,
        content={
            "errorCode": 422,
            "details": "Неверные данные",
        },
    )

@app.exception_handler(Exception)
async def global_exception_handler(request: Request, exc: Exception):
    return JSONResponse(
        status_code=500,
        content={
            "errorCode": 500,
            "details": "Произошла непредвиденная ошибка"
        },
    )

app.include_router(auth.router, prefix="/auth")
app.include_router(posts.router, prefix="/posts")
app.mount("/static", StaticFiles(directory="static"), name="static")
