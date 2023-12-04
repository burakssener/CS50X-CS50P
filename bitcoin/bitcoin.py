import requests
from sys import argv, exit

if len(argv) != 2:
    print("Missing command-line argument")
    exit(1)
try:
    number = float(argv[1])
except:
    print("Command-line argument is not a number")
    exit(1)

try:
    response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
    amount = float((response.json()["bpi"]["USD"]["rate"]).replace(",",""))
    amount *= number
    print(f"${amount:,.4f}")
except requests.RequestException:
    print("request error occured")



