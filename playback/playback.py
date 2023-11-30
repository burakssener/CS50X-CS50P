answer = str(input(""))
sentence = []
for letter in answer:
    if letter != ' ':
        sentence.append(letter)
    else:
        sentence.append("...")
print(answer)

