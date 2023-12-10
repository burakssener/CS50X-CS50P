import re
import sys


def main():
    print(convert(input("Hours: ")))


def convert(s):
    if match := re.search("^([0-9][0-2]?(?::[0-5][0-9])?) ([ap]m) to ([0-9][0-2]?(?::[0-5][0-9])?) ([ap]m)$", s, re.IGNORECASE):
        try:
            return f"{clock_converter(match.group(1), match.group(2))} to {clock_converter(match.group(3), match.group(4))}"
        except ValueError:
            raise ValueError
    else:
        return None

def clock_converter(time, specifier):
    #input types 9:30 or 9 and the function return 9 and 30 or 9 and 00 as a string and add 12 if the second parameter is 1
    if ':' in time:
        hour, minute = time.split(":")
    else:
        hour, minute = time, "00"

    if specifier.lower() == "pm":
         hour = int(hour) + 12

    return f"{hour}:{minute}"




if __name__ == "__main__":
    main()
