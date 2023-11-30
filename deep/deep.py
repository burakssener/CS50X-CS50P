answer = input("What is the Answer to the Great Question of Life, the Universe, and Everything?")
if answer.isdigit():
    if int(answer) == 42:
        print("Yes")
    else:
        print("No")
else:
    if answer == "forty-two" or answer.lower() == "forty two":
        print("Yes")
    else:
        print("No")



