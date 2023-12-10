import re
import sys


def main():
    print(convert(input("Hours: ")))


def convert(s):
    if match := re.search("^([0-9][0-2]?(?::[0-5][0-9])?) ([ap]m) to ([0-9][0-2]?(?::[0-5][0-9])?) ([ap]m)$", s, re.IGNORECASE):
        if match.group(2).endswith("pm"):
            try:
                hour, minute = match.group(1).split(":")
                hour = int(hour) + 12
            except ValueError:


    else:
        return match




if __name__ == "__main__":
    main()
