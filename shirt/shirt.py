from sys import argv
asd = "asdfgh"
if len(argv) > 3:
    exit("Too many command-line arguments ")

elif len(argv) < 3:
    exit("Too few command-line arguments ")

elif not argv[1].endswith(".jpg"):
    exit("Invalid inputNot a CSV file")
elif not argv[1][-3:] != argv[2][-3:]:
    exit("Input and output have different extensions")

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
