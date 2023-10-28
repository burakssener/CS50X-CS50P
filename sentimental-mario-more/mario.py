height = 0
while !(height>= 1 and height<= 8):
    height = int(input("Height: "))
for i in range(height):
    print(" " * (height-i-1), end="")
    print("#" * (i+1), end="  ")
    print("#" * (i+1))