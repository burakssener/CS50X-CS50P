answer = input().strip()
words = answer.split(" ")
for word in words:
    if word == ":)":
        print("🙂", end="")
    elif word == ":(":
        print("🙁", end="")

    else:
        print(word, end="")
print()



