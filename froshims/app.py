from flask import Flask, render_template, request

app = Flask(__name__)

REGISTRANTS = {}
SPORTS = ["Basketball", "Soccer", "Ultimate Frisbee"]
@app.route("/")
def index():
    return render_template("index.html")

@app.route("/register", methods=["POST"])
def register():
    name = request.form.get("Name")
    sport = request.form.get("sports")
    REGISTRANTS[name] = sport
    return render_template("success.html")

@app.route("/registrants")
def registrants():
    return render_template("registrants.html", registrants= REGISTRANTS)