answer = str(input(""))

for space in answer:
    if space.isspace():
        space = '...'

print(answer)

