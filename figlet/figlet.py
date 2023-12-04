from pyfiglet import Figlet
from sys import argv, exit
from random import choice

if not len(argv) in [1, 3]:
    print("Error")
    exit()
figlet = Figlet()
text = input("Input:").strip()
if len(argv) == 1:
    f = choice(figlet.getFonts())
    figlet.setFont(font=f)
    print(figlet.renderText(text))

elif len(argv) == 3 and argv[1] in ["-f", "--font"]:
    if argv[2] in figlet.getFonts():
        figlet.setFont(font=argv[2])
        print(figlet.renderText(text))
    else:
        print("Error")
        exit()



