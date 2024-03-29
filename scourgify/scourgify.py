from sys import argv
import csv
from tabulate import tabulate

if len(argv) > 3:
    exit("Too many command-line arguments ")

elif len(argv) < 3:
    exit("Too few command-line arguments ")

elif not (argv[1].endswith(".csv") and argv[2].endswith(".csv")):
    exit("Not a CSV file")

else:
    try:
        data = []
        with open(argv[1], "r") as file:
            reader = csv.DictReader(file)
            for row in reader:
                data.append({"name": row["name"], "house": row["house"]})
        with open(argv[2], "w") as outp:
            fieldnames = [ "first", "last", "house"]
            writer = csv.DictWriter(outp, fieldnames = fieldnames)
            writer.writeheader()
            for row in data:
                last, first = row["name"].split(", ")
                writer.writerow({"first": first ,"last": last, "house": row["house"]})

    except FileNotFoundError:
        exit("Could not read 1.csv")
