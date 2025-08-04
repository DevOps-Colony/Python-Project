FROM python:3.11-slim

WORKDIR /app

COPY backend/requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY backend backend
COPY frontend backend/templates

WORKDIR /app/backend

ENV FLASK_APP=app.py

EXPOSE 5000
CMD ["flask", "run", "--host=0.0.0.0"]
