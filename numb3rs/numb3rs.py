import re
import sys


def main():
    print(validate(input("IPv4 Address: ")))

def validate(ip):
    ip = ip.strip()
    if match := re.search(r"^([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)$", ip):
        try:
            intgroups = [int(group) for group in match.groups()]
            validated = [group for group in intgroups if 255 >= group >= 0]
            return len(validated) == 4
        except ValueError:
            return False
    else:
        return False





if __name__ == "__main__":
    main()
