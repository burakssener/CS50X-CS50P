from datetime import date
import inflect

p = inflect.engine()

def main():
    birth = getter()

    minute = round((date.today() - birth).total_seconds() / 60)
    words = p.number_to_words(minute, andword="")
    print(words + " minutes")

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
