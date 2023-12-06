def main():
    while True:
        try:
            fraction = input("Fraction: ").strip()
            print(f"{gauge(convert(fraction))}")
            break
        except ValueError or ZeroDivisionError:
            pass


def convert(fraction):
    try:
        x , y = fraction.split("/")
        x , y = int(x), int(y)
        if not x <= y:
            raise ValueError
        return round(x / y * 100)
    except ValueError:
        raise ValueError
    except ZeroDivisionError:
        raise ZeroDivisionError





def gauge(percentage):
    if percentage >= 99:
        return "F"
    elif percentage <= 1:
        return "E"
    else:
        return f"{percentage:.0f}%"


if __name__ == "__main__":
    main()
