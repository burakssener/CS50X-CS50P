def main():
     time= input("What time is it?")
     total = convert(time)
     match(total):
          case x if 8 >= x >= 7: print("breakfast time")
          case x if 13 >= x >= 12: print("lunch time")
          case x if 19 >= x >= 18: print("dinner time")


def convert(time):
     hour, minute = time.strip().split(":")
     return int(hour) + int(minute) / 60 * 100



if __name__ == "__main__":
    main()
