answer = str(input(""))
for letter in answer:
    if letter != ' ':
        print(letter, end="")
    else:
        print("...", end="")
print()
print(letter, sep="...")


