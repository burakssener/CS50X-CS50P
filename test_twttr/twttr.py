def main():
    answer = input("Input: ").strip()
    print(f"Output: {shorten(answer)}")


def shorten(word):
    for letter in word:
        if letter.upper() in ['E', 'I', 'O', 'U']:
            word = word.replace(letter, "")
    return word


if __name__ == "__main__":
    main()

