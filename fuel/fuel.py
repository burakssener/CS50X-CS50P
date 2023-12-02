while True:
    try:
        expression = input("Fraction: ").strip()
        result = int(expression[0]) / int(expression[2]) * 100
        if result >= 99:
            print("F")
        elif result <= 1:
            print("E")
        else:
            print("%", result, sep="")
    except ValueError and ZeroDivisionError:
        pass
