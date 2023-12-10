import re
import sys


def main():
    print(convert(input("Hours: ")))


def convert(s):
    if match := re.search("^([0-9][0-2]?(?::[0-5][0-9])?) ([ap]m) to ([0-9][0-2]?(?::[0-5][0-9])?) ([ap]m)$", s, re.IGNORECASE):
        if match.group(2).endswith("pm"):
            try:
                hour, minute = match.group(1).split(":")
                hour, minute = int(hour) + 12, int(minute)
            except ValueError:
        if match.group(4).endswith("pm"):
            try:
                hour, minute = match.group(3).split(":")
                hour, minute = int(hour) + 12, int(minute)
            except ValueError:
                int(match.group(3)) + 12


    else:
        return match




if __name__ == "__main__":
    main()
