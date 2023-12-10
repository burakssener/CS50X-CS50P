import re
import sys


def main():
    print(convert(input("Hours: ")))


def convert(s):
    if match := re.search("^[0-12](:[0-5][0-9])? [ap]m to [0-12](:[0-5][0-9])? [ap]m$", s, re.IGNORECASE):
        return match.groups()
    else:
        return match



if __name__ == "__main__":
    main()
