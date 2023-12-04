import random

def main():
    level = take_digit("Level: ")
    number = random.randrange(level)
    while True:
        answer = take_digit("Guess: ")
        if (answer == number):
            print("Just right!")
            break
        elif (answer <= number):
            print("Too small!")
        else:
            print("Too large!")



def take_digit(prompt):
    digit = input(prompt)
    while True:
        if not digit.isdigit():
            digit = input(prompt)
        else:
            if int(digit) > 0:
                return int(digit)




if __name__ == '__main__':
    main()



