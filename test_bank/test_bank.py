def main():
    ...


def value(greeting):
    ...


if __name__ == "__main__":
    main()



answer = input("Greeting: ").strip().lower()

if "hello" in answer:
    print("$0")
elif answer[0] == 'h':
    print("$20")
else:
    print("$100")


