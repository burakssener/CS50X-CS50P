import random


def main():
    score = 0
    level = get_level()
    for i in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        answer = input(f"{x} + {y} = ", end="")
        i = 0
        while not str(x + y) == answer and i < 3:
            print("EEE")
            answer = input(f"{x} + {y} = ", end="")
            i += 1
            if answer == str(x + y):
                score += 1
                break

def get_level():
    while True:
        input("Level: ")
        if input in [1, 2, 3]:
            return input


def generate_integer(level):
    return random.randrange(level*10)



if __name__ == "__main__":
    main()
