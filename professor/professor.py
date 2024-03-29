import random


def main():
    score = 0
    level = get_level()
    for _ in range(10):
        x = generate_integer(level)
        y = generate_integer(level)
        for _ in range(3):
            score_before = score
            print(f"{x} + {y} = ", end="")
            answer = input()
            if answer == str(x + y):
                score += 1
                break
            else:
                print("EEE")
        if score_before == score:
            print(f"{x} + {y} = {x+y}")


    print("Score:", score)

def get_level():
    while True:
        lvl = input("Level: ")
        try:
            if int(lvl) in [1, 2, 3]:
                return int(lvl)
        except ValueError:
            pass


def generate_integer(level):
    match level:
        case 1: return random.randrange(0, 10)
        case 2: return random.randrange(10, 100)
        case 3: return random.randrange(100, 1000)





if __name__ == "__main__":
    main()
