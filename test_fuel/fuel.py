while True:
    try:
        fraction = input("Fraction: ").strip()
        x , y = int(x), int(y)
        if not (x <= y):
            continue
        result = x / y * 100
        if result >= 99:
            print("F")
        elif result <= 1:
            print("E")
        else:
            print(f"{result:.0f}%", sep="")
        break



def main():
    ...


def convert(fraction):
    if not (x <= y):
        raise ValueError
    x , y = fraction.split("/")
    x , y = int(x), int(y)
    return round(x / y * 100)




def gauge(percentage):
    if percentage >= 99:
        print("F")
    elif result <= 1:
        print("E")
    else:
        print(f"{result:.0f}%", sep="")


if __name__ == "__main__":
    main()
