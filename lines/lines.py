from sys import argv

if len(argv) > 3:
    exit("Too many command-line arguments ")

elif len(argv) < 3:
    exit("Too few command-line arguments ")

elif not argv[2].endswith(.py):
    exit("Not a Python file")

else:
    try:
        code_lines = 0
        with open(argv[2], "r") as file:
            for line in file:
                line = line.rstrip()
                if line and not line.startswith("#"):
                    code_lines += 1
        print(code_lines)

    except FileNotFoundError:
        exit("File does not exist")



