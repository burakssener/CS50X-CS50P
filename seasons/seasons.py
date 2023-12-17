from datetime import date


def main():
    birth = getter()
    birth = date.fromisoformat(birth)
    now = date.today()
    print(now - birth)

def getter():
    while True:
        try:
            return input("Date of Birth: ").strip().replace("-", "")
        except ValueError:
            pass



if __name__ == "__main__":
    main()
