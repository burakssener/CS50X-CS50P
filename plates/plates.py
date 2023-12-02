answer = input("Plate: ").strip()

if not (6 >= len(answer) >=2):
    print("Invalid")
for letter in answer:
    if not (letter.isdigit() or letter.isalpha()):
        print("Invalid")

