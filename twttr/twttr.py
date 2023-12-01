answer = input("Input: ").strip()
print("Output: ", end="")
for letter in answer:
    if letter.upper() in ['A', 'E', 'I', 'O', 'U']:
        continue
    else:
        print(letter, end="")

