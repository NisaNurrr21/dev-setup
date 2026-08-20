import uvicorn
from fastapi import FastAPI

app = FastAPI(title="Dev Setup API")


@app.get("/")
def read_root():
    return {"mesaj": "Tebrikler! Docker ve FastAPI kusursuz calisiyor! 🚀"}


if __name__ == "__main__":
    uvicorn.run("src.main:app", host="0.0.0.0", port=8000)
