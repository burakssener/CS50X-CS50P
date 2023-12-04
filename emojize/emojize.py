import emoji

answer = input("Input: ").strip()

print(emoji.emojize(answer ,language='alias'))

#answer = input("Input: ").strip().lower().replace("_", "")
#print(emoji.emojize(answer ,language='alias'))
