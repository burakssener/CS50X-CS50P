import random


def main():
    input(f"{x} + {y} = ", end="")



def get_level():
    while True:
        input("Level: ")
        if input in [1, 2, 3]:
            return input


def generate_integer(level):
    x = random.randrange(level*10)



if __name__ == "__main__":
    main()
