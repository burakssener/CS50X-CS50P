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
        pizzas = []
        with open(argv[1], "r") as file:
            reader = csv.DictReader(file)
            for line in reader:
                print(line)

    except FileNotFoundError:
        exit("File does not exist")
