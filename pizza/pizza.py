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
        with open(arv[2], "r") as outp:
            fieldnames = ["first", "last", "house"]
            writer = csv.DictWriter(file, fieldnames = fieldnames)
            for row in data:
                first, last = row["name"].strip(" ,")
                writer.writerow({"first": first ,"last": last, "house": row["house"]})

    except FileNotFoundError:
        exit("File does not exist")
