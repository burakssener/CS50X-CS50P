MAX_LINES = 3
MIN_BET = 1
MAX_BET = 100

ROWS = 3
COLS = 3

symbol_count = {
    "A": 2,
    "B": 4,
    "C": 6,
    "D": 8
}
def get_slot(rows, cols, symbols):





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

def get_line_num():
    while True:
        line = input(f"What is the number of lines that you want to bet on between 1 to {MAX_LINES} lines? ")
        if line.isdigit():
            line = int(line)
            if line >= 1 and line <= MAX_LINES:
                break
            else:
                print("A line must be between 1 and 3")
    return line


def get_bet():
    while True:
        bet = input(f"What is the amount of the money you want to bet for each line between {MIN_BET} to {MAX_BET}? $")
        if bet.isdigit():
            bet = int(bet)
            if (bet >= MIN_BET and bet<= MAX_BET):
                break
            else:
                print("You are exceeded limit or under thee limit")
        else:
            print("Please Enter a number")
    return bet


def main():
    balance = deposit()
    line = get_line_num()
    while True:
        bet = get_bet() * line
        if bet > balance:
            print("You can't exceed your deposit.")
        else:
            break



    print(f"You bet on {line} lines. The total amount that you bet is ${bet}")

main()






