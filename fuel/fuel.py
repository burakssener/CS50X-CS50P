while True:
    try:
        x ,y = input("Fraction: ").strip().split("/")
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
    except ValueError or ZeroDivisionError:
        pass
