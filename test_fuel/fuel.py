def main():
    fraction = input("Fraction: ").strip()
    try:
        print(f"{gauge(convert(fraction))}")
    except ValueError or ZeroDivisionError:


def convert(fraction):
    if not (x <= y):
        raise ValueError
    x , y = fraction.split("/")
    x , y = int(x), int(y)
    return round(x / y * 100)




def gauge(percentage):
    if percentage >= 99:
        return "F"
    elif result <= 1:
        return "E"
    else:
        return f"{result:.0f}%"


if __name__ == "__main__":
    main()
