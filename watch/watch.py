import re
import sys


def main():
    print(parse(input("HTML: ")))


def parse(s):
    s = s.strip()
    if match := re.search(r'^.*"https?://(www)?\.youtube\.com/embed/(.+)".*$', s):
        return f"https://youtu.be/{match.group(2)}"
    else:
        return match




if __name__ == "__main__":
    main()
