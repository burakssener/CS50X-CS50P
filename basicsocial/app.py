from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required

# Configure application
app = Flask(__name__)

# Custom filter
# app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///social.db")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    if request.method == "GET":
        return render_template("register.html")

    elif request.method == "POST":

        if not request.form.get("username"):
            return apology("must provide username", 400)
        else:
            username = request.form.get("username")
            if not request.form.get("password") or not request.form.get("confirmation"):
                return apology("must provide password", 400)
            else:
                password = request.form.get("password")
                crpassword = request.form.get("confirmation")
                users = db.execute("SELECT username FROM users WHERE username= ? ", username)
                if  password != crpassword:
                    return apology("must provide password", 400)
                for user in users:
                    if username == user["username"]:
                        return apology("This username is taken", 400)
                birthday = request.form.get("birthday")
                if not birthday:
                    return apology("No birthday entered", 400)
                db.execute("INSERT INTO users (username, hash, birthday) VALUES (?, ?, ?)", username, generate_password_hash(password), birthday)
                return render_template("login.html")



@app.route("/login", methods=["GET", "POST"])
def login():
    """Log user in"""

    # Forget any user_id
    session.clear()

    # User reached route via POST (as by submitting a form via POST)
    if request.method == "POST":

        # Ensure username was submitted
        if not request.form.get("username"):
            return apology("must provide username", 403)

        # Ensure password was submitted
        elif not request.form.get("password"):
            return apology("must provide password", 403)

        # Query database for username
        rows = db.execute("SELECT * FROM users WHERE username = ?", request.form.get("username"))

        # Ensure username exists and password is correct
        if len(rows) != 1 or not check_password_hash(rows[0]["hash"], request.form.get("password")):
            return apology("invalid username and/or password", 403)

        # Remember which user has logged in
        session["user_id"] = rows[0]["id"]

        # Redirect user to home page
        return redirect("/")

    # User reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template("login.html")

@app.route("/logout")
def logout():
    """Log user out"""

    # Forget any user_id
    session.clear()

    # Redirect user to login form
    return redirect("/")



@app.route("/")
@login_required
def feed():
    return render_template("homepage.html")



@app.route("/groups", methods=["GET", "POST"])
@login_required
def group():
    return render_template("groups.html")




@app.route("/quote", methods=["GET", "POST"])
@login_required
def buasdy():
    return apology





@app.route("/sell", methods=["GET", "POST"])
@login_required
def buy():
    return apology



