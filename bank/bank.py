answer = input("Greeting: ").strip().lower()

if answer == "hello":
    print("$0")
elif answer[0] == 'h':
    print("$20")
else:
    print("$100")


