def main():
     answer = int(input("What time is it?").strip().split(":"))
     match(answer):
          case x if 800 >= x >= 700: print("breakfast time")
          case x if 1300 >= x >= 1200: print("lunch time")
          case x if 1900 >= x >= 1800: print("dinner time")




if __name__ == "__main__":
    main()
