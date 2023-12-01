def main():
     hour, minute = input("What time is it?").strip().split(":")
     total = convert(hour, minute)
     match(total):
          case x if 8*60 >= x >= 7*60: print("breakfast time")
          case x if 13*60 >= x >= 12*60: print("lunch time")
          case x if 19*60 >= x >= 18*60: print("dinner time")


def convert(hour, minute):
     return int(hour)*60 + int(minute)



if __name__ == "__main__":
    main()
