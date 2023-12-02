while True:
    try:
        x ,y = input("Fraction: ").strip().split("/")
        result = int(x) / int(y) * 100
        if result >= 99:
            print("F")
        elif result <= 1:
            print("E")
        else:
            print(f"{result:.0f}%", sep="")
    except ValueError and ZeroDivisionError:
        pass