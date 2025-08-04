import os
import pymysql
from flask import Flask, render_template, request, redirect, url_for, session, flash

app = Flask(__name__)
app.secret_key = os.getenv('SECRET_KEY', 'defaultsecretkey')

# Only connect to DB if not in test environment
if os.environ.get("FLASK_ENV") != "test":
    db = pymysql.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", ""),
        database=os.getenv("DB_NAME", "test_db")
    )

    cursor = db.cursor()

@app.route('/')
def home():
    return 'Welcome to Flask App!'

@app.route('/login')
def login():
    return 'Login Page'

@app.route('/register')
def register():
    return 'Register Page'

# You can add more routes here
