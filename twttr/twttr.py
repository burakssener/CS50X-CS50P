answer = input("Input: ").strip()
print("Output: ", end="")
for letter in answer:
    if letter.upper() in ['A', 'E', 'I', 'O', 'U']:
        continue
    print(letter, end="")

if __main__


