import os

from cs50 import SQL
from flask import Flask, flash, redirect, render_template, request, session
from flask_session import Session
from werkzeug.security import check_password_hash, generate_password_hash

from helpers import apology, login_required, lookup, usd

# Configure application
app = Flask(__name__)

# Custom filter
app.jinja_env.filters["usd"] = usd

# Configure session to use filesystem (instead of signed cookies)
app.config["SESSION_PERMANENT"] = False
app.config["SESSION_TYPE"] = "filesystem"
Session(app)

# Configure CS50 Library to use SQLite database
db = SQL("sqlite:///finance.db")


@app.after_request
def after_request(response):
    """Ensure responses aren't cached"""
    response.headers["Cache-Control"] = "no-cache, no-store, must-revalidate"
    response.headers["Expires"] = 0
    response.headers["Pragma"] = "no-cache"
    return response


@app.route("/")
@login_required
def index():
    """Show portfolio of stocks"""
    return apology("TODO")

@app.route("/buy", methods=["GET", "POST"])
@login_required
def buy():
    """Buy shares of stock"""
    if request.method == "GET":
        return render_template("buy.html")

    elif request.method == "POST":
        symbol = lookup(request.form.get("stock_name"))
        if not symbol:
            return apology("must provide username", 403)
        else:
            stock_name = symbol["symbol"]
            if not request.form.get("stock_num"):
                return apology("must provide password", 403)
            else:
                stock_num = int(request.form.get("stock_num"))
                user_data = db.execute("SELECT id, cash FROM users WHERE id = ?", session['user_id'])[0]
                if (user_data["cash"] >= symbol["price"] * stock_num):
                    stock_data = db.execute("SELECT stock_num, stock_name FROM users_balance WHERE user_id = ? ", session['user_id'])
                    db.execute("UPDATE users SET cash = ? WHERE id = ?", user_data["cash"] - symbol["price"] * stock_num, session['user_id'] )
                    updated = False
                    for stock in stock_data:
                        if stock_name == stock["stock_name"]:
                            db.execute("UPDATE users_balance stock_num = ?, stock_name = ?, user_id = ? WHERE user_id = ?", stock["stock_num"] + stock_num, stock_name, session['user_id'], session['user_id'] )
                            updated = True
                            break
                    if updated == False:
                        db.execute("INSERT INTO users_balance (stock_num, stock_name, user_id) VALUES (?, ?, ?)", stock_num, stock_name, session['user_id'] )

                    user_data = db.execute("SELECT users.id, users.cash, users_balance.stock_num, users_balance.stock_name FROM users JOIN users_balance ON users_balance.user_id = users.id WHERE id = ?", session['user_id'])[0]
                    return render_template("basket.html", user_data=user_data )






@app.route("/history")
@login_required
def history():
    """Show history of transactions"""
    return apology("TODO")


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


@app.route("/quote", methods=["GET", "POST"])
@login_required
def quote():
    if request.method == "GET":
        return render_template("quote.html")

    elif request.method == "POST":
        symbol = lookup(request.form.get("symbol"))
        return render_template("quoted.html", symbol = symbol)


@app.route("/register", methods=["GET", "POST"])
def register():
    """Register user"""
    if request.method == "GET":
        return render_template("register.html")

    elif request.method == "POST":

        if not request.form.get("r_username"):
            return apology("must provide username", 403)
        else:
            username = request.form.get("r_username")
            if not request.form.get("r_password") or not request.form.get("cr_password"):
                return apology("must provide password", 403)
            else:
                password = request.form.get("r_password")
                crpassword = request.form.get("cr_password")
                users = db.execute("SELECT username FROM users WHERE username= ? ", username)
                if  password != crpassword or username in users:
                    return apology("must provide password", 403)
                else:
                    db.execute("INSERT INTO users (username, hash) VALUES (?, ?)", username, generate_password_hash(password))
                    rows = db.execute("SELECT * FROM users WHERE username = ?", request.form.get("username"))
                    session["user_id"] = rows[0]["id"]
                    return render_template("login.html")














@app.route("/sell", methods=["GET", "POST"])
@login_required
def sell():
    """Sell shares of stock"""
    return apology("TODO")
