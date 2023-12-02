answer = input("Plate: ").strip()
status = 0
if not (6 >= len(answer) >=2):
    print("Invalid")
else:
    for letter in answer:
        if not (letter.isdigit() or letter.isalpha()):
            print("Invalid")


