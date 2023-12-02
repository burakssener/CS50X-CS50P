while True:
    try:
        x , slash, y = input("Fraction: ").strip().split()
        result = x / y * 100
        if result >= 99:
            print("F")
        elif result <= 1:
            print("E")
        else:
            print("%", result, sep="")
