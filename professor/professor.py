import random


def main():
    ...


def get_level():
    ...


def generate_integer(level):
    x = random.randrange(level*10)
    y = random.randrange(level*10)
    return f"{x} + {y} = "


if __name__ == "__main__":
    main()
