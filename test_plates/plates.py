


def main():
    answer = input("Plate: ").strip()
    if is_valid(answer):
        print("Valid")
    else:
        print("Invalid")


def is_valid(answer):
    status = 1
    if not (6 >= len(answer) >=2):
        return False
    else:
        if not (answer[0].isalpha() and answer[1].isalpha()):
            return False
        else:
            digit = 0
            for letter in answer:
                if letter.isdigit() and digit == 0:
                    if letter == '0':
                        status = 0
                        break
                    digit = 1

                if digit == 1 and letter.isalpha():
                    status = 0
                    break
                if not (letter.isdigit() or letter.isalpha()):
                    status = 0
                    break
                if answer[-1].isalpha() and letter.isdigit():
                    status = 0
                    break
            if status == 0:
                return False
            else:
                return True


if __name__ == "__main__":
    main()





