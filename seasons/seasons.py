from datetime import date


def main():
    birth = getter()

    minute = (date.today() - birth).total_seconds() / 60

    print(round(minute))

def getter():
    while True:
        try:
            birth = input("Date of Birth: ").strip().replace("-", "")
            return date.fromisoformat(birth)
        except ValueError:
            print("Invalid date ")
            pass



if __name__ == "__main__":
    main()
