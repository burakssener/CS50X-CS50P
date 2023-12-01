answer = input("camelCase: ").strip()
print("snake_case: ", end="")
for letter in answer:
    if not letter.isupper():
        print(letter, end="")
    else:
        print("_"+letter.lower(), end="")
print()

