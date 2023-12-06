from sys import argv

if len(argv) > 2:
    exit("Too many command-line arguments ")

elif len(argv) < 2:
    exit("Too few command-line arguments ")

elif not argv[1].endswith(.py):
    exit("Not a Python file")

else:
    try:
        with open(argv[1], "r") as file:
            i = 0
            for line in file:

    except FileNotFoundError:
        exit("File does not exist")


