import requests

try:
    response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
    print(response.json()["bpi"]["USD"]["rate"])
except requests.RequestException:
    ...
