
height = 0
while not (height>= 1 and height<= 8):
    height = input("Height: ")
    if height isdigit():
        height = int(height)
for i in range(height):
    print(" " * (height-i-1), end="")
    print("#" * (i+1), end="  ")
    print("#" * (i+1))