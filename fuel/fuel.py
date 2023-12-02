while True:
    try:
        x ,y = input("Fraction: ").strip().split("/")
        if not (int(x) in [1,3] and int(y) in [2,4]):
            pass
        result = int(x) / int(y) * 100
        if result >= 99:
            print("F")
        elif result <= 1:
            print("E")
        else:
            print(f"{result:.0f}%", sep="")
        break
    except ValueError and ZeroDivisionError:
        pass
