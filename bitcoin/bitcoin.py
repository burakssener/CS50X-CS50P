import requests

try:
    response = requests.get("https://api.coindesk.com/v1/bpi/currentprice.json")
    print(response.json())
except requests.RequestException:
    ...
