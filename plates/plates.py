answer = input("Plate: ").strip()
status = 1
if not (6 >= len(answer) >=2):
    print("Invalid")
else:
    if not (answer[0].isalpha() and answer[1].isalpha()):
         print("Invalid")
    else:
        digit = 0
        for letter in answer:
            if letter.isdigit():
                digit = 1
            if digit == 1 and letter.isalpha()):
                status = 0
                break
            if not (letter.isdigit() or letter.isalpha()):
                status = 0
                break
            if answer[-1].isalpha() and letter.isdigit():
                status = 0
                break
        if status == 0:
            print("Invalid")
        else:
            print("Valid")







