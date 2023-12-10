import re
import sys


def main():
    print(convert(input("Hours: ")))


def convert(s):
    9:00 AM to 5:00 PM
    9 AM to 5 PM
    if match := re.search("^[0-12](:[0-5][0-9])? [ap]m+", s, re.IGNORECASE):



...


if __name__ == "__main__":
    main()
