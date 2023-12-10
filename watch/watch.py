import re
import sys


def main():
    print(parse(input("HTML: ")))


def parse(s):
    if match := re.search(r"^.+https://www\.youtube\.com/embed/(.+)'.+$"):
        return match.group(1)




if __name__ == "__main__":
    main()
