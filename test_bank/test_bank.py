def main():
    answer = input("Greeting: ").strip().lower()
    print(value(answer))

def value(answer):
    if "hello" in answer:
        return 0
    elif answer[0] == 'h':
        return 20
    else:
        return 100


if __name__ == "__main__":
    main()








