from sys import argv
from PIL import Image, ImageOps

if len(argv) > 3:
    exit("Too many command-line arguments ")

elif len(argv) < 3:
    exit("Too few command-line arguments ")

elif not (argv[1][-4:] and argv[2][-4:] in [".jpg", ".png", "jpeg"]):
    exit("Invalid input")

elif argv[1][-3:] != argv[2][-3:]:
    exit("Input and output have different extensions")
else:
    person = Image.open(argv[1])
    shirt = Image.open("shirt.png")
    (width, height) = (shirt.width * 2, shirt.height * 2)
    shirt = shirt.resize((width, height))
    size = shirt
    person.paste(shirt, mask = shirt)
    person.save(argv[2])

