
height = 0
while True:
    height = input("Height: ")
    if height.isdigit():
        height = int(height)
        if (height>= 1 and height<= 8):
            break
for i in range(height):
    print(" " * (height-i-1), end="")
    print("#" * (i+1), end="  ")
    print("#" * (i+1))