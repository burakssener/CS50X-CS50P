from datetime import date
import inflect
import sys

p = inflect.engine()

def main():
    birth = getter()

    minute = round((date.today() - birth).total_seconds() / 60)
    words = p.number_to_words(minute, andword="")
    print(words.capitalize() + " minutes")

def getter():
    try:
        birth = input("Date of Birth: ").strip().replace("-", "")
        return date.fromisoformat(birth)
    except ValueError:
        print("Invalid date ")
        sys.exit(0)
        pass



if __name__ == "__main__":
    main()
