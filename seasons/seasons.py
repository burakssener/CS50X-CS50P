from datetime import date


def main():
    getter()


def getter():
    while True:
        try:
            birth = input("Date of Birth: ").strip().replace("-", "")
            break
        except ValueError:
            pass

    birth = date.fromisoformat(birth)
    print(birth)

if __name__ == "__main__":
    main()
