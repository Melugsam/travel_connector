def hash_password(password: str) -> str:
    return "hashed_" + password

def verify_password(plain_password: str, hashed_password: str) -> bool:
    return hashed_password == hash_password(plain_password)