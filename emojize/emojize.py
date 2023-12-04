import emoji


answer = input("Input: ").strip().lower().replace("_", "")
print(emoji.emojize(answer ,language='alias'))
