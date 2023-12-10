import re
import sys


def main():
    print(validate(input("IPv4 Address: ")))


def validate(ip):
    ip = ip.strip()
    match = re.search(r"^([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$", ip)
    try:
        group = int(group) for group in groups
    except:
        raise ValueError





if __name__ == "__main__":
    main()
