def deposit():
    while True:
        amount = input("What would you like to deposit? $")
        if amount.isdigit():
            amount = int(amount)
            if amount > 0:
                break
            else:
                printf("Amount Must be positive")
        else:
            print("Please print a number")
    return amount

deposit()

def main()
    balance = deposit()




main()