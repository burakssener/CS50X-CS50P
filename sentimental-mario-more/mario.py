height = int(input("Height: "))
for i in range(height):
    print(" " * (height - i), end="")
    print("#" * i, end="  ")
    print("#" * i)