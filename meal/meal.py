def main():
     answer = input("What time is it?").strip().split("#")
     match(answer):
          case 800 >= answer >= 700: print("breakfast time")
          case 1300 >= answer >= 1200: print("lunch time")
          case 1900 >= answer >= 1800: print("dinner time")


def convert(time):



if __name__ == "__main__":
    main()
