import random


def main():
    score = 0
    level = get_level()
    for _ in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        for _ in range(3):
            answer = input(f"{x} + {y} = ", end="").strip()
            if answer == str(x + y):
                score += 1
                break
            else:
                print("EEE")

def get_level():
    while True:
        lvl = input("Level: ")
        try:
            if int(lvl) in [1, 2, 3]:
                return lvl
        except ValueError:
            pass


def generate_integer(level):
    return random.randrange(level*10)



if __name__ == "__main__":
    main()
