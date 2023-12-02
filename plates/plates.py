answer = input("Plate: ").strip()
status = 1
if not (6 >= len(answer) >=2):
    print("Invalid")
else:
    for letter in answer[0:2]:
        if not letter.isalpha():
            status = 0
    if status == 0:
        print("Invalid")
    else:
        for letter in answer:
            if not (letter.isdigit() or letter.isalpha()):
                status = 0
        if status == 0:
            print("Invalid")
        else:
            if answer[-1].isalpha():
                for letter in answer:
                        if letter.isdigit():
                            status = 0
                if status == 0:
                    print("Invalid")
                else:
                    print("Valid")




