import re
import sys


def main():
    print(count(input("Text: ")))


def count(s):
    if matches := re.findall("[^a-zA-Z0-9_]um[^a-zA-Z0-9_]", s):
        return matches
    else:
        return None


if __name__ == "__main__":
    main()
