from pyfiglet import Figlet
from sys import argv
from random import choice

if len(argv) == 1:
    figlet = Figlet()
    text = input("Input: ").strip().lower()
    f = choice(figlet.getFonts())
    figlet.setFont(font=f)
    print(figlet.renderText(text))

elif len(argv) == 3:
    print()

else:
    print()

