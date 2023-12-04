import requests
from sys import argv, exit

if len(argv) != 2:
    print("Missing command-line argument")
    exit(1)
if not argv[1].isdigit():
    print("Command-line argument is not a number")
    exit(1)

try:
    response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
    amount = float((response.json()["bpi"]["USD"]["rate"]).replace(",",""))
    amount *= float(argv[1])
    print(f"${amount:,.4f}")
except requests.RequestException:
    print("request error occured")



