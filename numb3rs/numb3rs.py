import re
import sys


def main():
    print(validate(input("IPv4 Address: ")))


def validate(ip):
    ip = ip.strip()
    re.search(r"0-9")


...


if __name__ == "__main__":
    main()
