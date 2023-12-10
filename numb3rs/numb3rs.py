import re
import sys


def main():
    print(validate(input("IPv4 Address: ")))


def validate(ip):
    ip = ip.strip()
    match = re.search(r"(^[0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$")
    try:
        match.groups(1), match.groups(2), match.groups(3) = 



...


if __name__ == "__main__":
    main()
