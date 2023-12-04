from pyfiglet import Figlet
from sys import argv
from random import choice

figlet = Figlet()
text = input("Input: ").strip().lower()
if len(argv) == 1:
    f = choice(figlet.getFonts())
    figlet.setFont(font=f)
    print(figlet.renderText(text))

elif len(argv) == 3 and argv[1] in ["-f", "--font"]:
    if argv[2] in figlet.getFonts():
        figlet.setFont(font=argv[2])
        print(figlet.renderText(text))



