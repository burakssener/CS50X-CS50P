from sys import argv
import csv

if len(argv) > 2:
    exit("Too many command-line arguments ")

elif len(argv) < 2:
    exit("Too few command-line arguments ")

elif not argv[1].endswith(".csv"):
    exit("Not a CSV file")

else:
    try:

        with open(argv[1], "r") as file:
            reader = csv.DictReader(file)

        print(tabulate(reader, tablefmt="plain"))

    except FileNotFoundError:
        exit("File does not exist")
