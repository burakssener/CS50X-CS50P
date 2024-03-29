from sys import argv
import csv
from tabulate import tabulate

if len(argv) > 2:
    exit("Too many command-line arguments ")

elif len(argv) < 2:
    exit("Too few command-line arguments ")

elif not argv[1].endswith(".csv"):
    exit("Not a CSV file")

else:
    try:
        data = []
        with open(argv[1], "r") as file:
            reader = csv.DictReader(file)
            for row in reader:
                data.append(row)

        print(tabulate(data, headers="keys", tablefmt="grid"))

    except FileNotFoundError:
        exit("File does not exist")
