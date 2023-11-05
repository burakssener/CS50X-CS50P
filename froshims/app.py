from flask import Flask, render_template_ request

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")