import emoji

answer = input("Input: ").strip()

list = answer.split()
for letter in answer:
    if letter != ':':
        print(letter, end="")
    else:
#answer = input("Input: ").strip().lower().replace("_", "")
#print(emoji.emojize(answer ,language='alias'))
