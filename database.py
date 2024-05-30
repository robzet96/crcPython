from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base
import os


if os.getenv("CONNECTION_STRING"):
    SQLALCHEMY_DATABASE_URL = os.getenv("CONNECTION_STRING")
else:
    SQLALCHEMY_DATABASE_URL = "postgresql://postgres:test1234@172.17.0.2:5432/FASTAPIDB"

engine = create_engine(
    SQLALCHEMY_DATABASE_URL
)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()