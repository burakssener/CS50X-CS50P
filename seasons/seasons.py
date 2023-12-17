from datetime import date


def main():
    getter()


def getter():
    while True:
        try:
            birth = int(input("Date of Birth: ").strip().replace(" ", ""))
            break
        except ValueError:
            pass

    birth = birth.date.fromisoformat('20191204')
    print(date.today())

if __name__ == "__main__":
    main()
