from pyfiglet import Figlet
from sys import argv, exit
from random import choice

figlet = Figlet()
if not len(argv) in [1, 3]:
    exit(1)
elif len(argv) == 1:
    text = input("Input:").strip()
    f = choice(figlet.getFonts())
    figlet.setFont(font=f)
    print(figlet.renderText(text))

elif len(argv) == 3 and argv[1] in ["-f", "--font"] and argv[2] in figlet.getFonts():
    text = input("Input:").strip()
    figlet.setFont(font=argv[2])
    print(figlet.renderText(text))

else:
    exit(1)



