from datetime import date
import inflect
import sys

p = inflect.engine()

def main():
    birth = getter(input("Date of Birth: "))

    minute = round((date.today() - birth).total_seconds() / 60)
    words = p.number_to_words(minute, andword="")
    print(words.capitalize() + " minutes")

def getter(birth):
    birth = birth.strip().replace("-", "")
    try:
        return date.fromisoformat(birth)
    except ValueError:
        print("Invalid date ")
        sys.exit(1)



if __name__ == "__main__":
    main()
