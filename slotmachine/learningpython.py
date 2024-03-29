import random

MAX_LINES = 3
MIN_BET = 1
MAX_BET = 10000

ROWS = 3
COLS = 3

symbol_count = {
    "A": 6,
    "B": 6,
    "C": 10,
    "D": 10
}

symbol_value = {
    "A": 4,
    "B": 3,
    "C": 2,
    "D": 1.5
}


def check_winning(columns, lines, bet, values):
    winnings = 0
    winning_lines = []
    for line in range(lines):
        symbol = columns[0][line]
        for column in columns:
            if symbol != column[line]:
                break
        else:
            winnings += values[symbol] * bet
            winning_lines.append(line + 1)
    return winnings, winning_lines



def print_slot(columns):
    for row in range(len(columns[0])):
        for i, column in enumerate(columns):
            if i < len(columns) - 1:
                print(column[row], end =" | ")
            else:
                print(column[row], end="")
        print()






def get_slot(rows, cols, symbols):
    all_symbols = []
    for symbol, symbol_count in symbols.items():
        for _ in range(symbol_count):
            all_symbols.append(symbol)

    columns = []
    for _ in range(cols):
        current_symbols = all_symbols[:]
        column = []
        for _ in range(rows):
            value = random.choice(all_symbols)
            current_symbols.remove(value)
            column.append(value)
        columns.append(column)
    return columns





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



def spin(balance):
    line = get_line_num()
    while True:
        bet = get_bet() * line
        if bet > balance:
            print("You can't exceed your deposit.")
        else:
            break

    print(f"You bet on {line} lines. The total amount that you bet is ${bet}")
    slots = get_slot(ROWS, COLS, symbol_count)
    print_slot(slots)
    winnings, winning_lines = check_winning(slots, line, bet, symbol_value)
    print(f"You won {winnings}.")
    print(f"You won on lines:",*winning_lines)
    return winnings - bet


def main():
    balance = deposit()
    while True:
        print(f"Current Balance is ${balance}")
        answer = input("Press enter to play.(q to quit.)")
        if answer == "q":
            break
        balance += spin(balance)
    print(f"You left with {balance}", balance)


main()






"""def print_slot(columns):
    for row in range(len(columns[0])):
        for i, column in enumerate(columns):
            if i != len(columns) - 1:
                print(column[row], end =" | ")
            else:
                print (column[row], end="")
        print(" ")



def get_slot(rows, cols, symbols):
    all_symbols = []
    for symbol, symbol_count in symbols.items():
        for _ in range(symbol_count):
            all_symbols.append(symbol)

    columns = []
    for _ in range(cols):
        column = []
        current_symbols = all_symbols[:]
        for _ in range(rows):
            value = random.choice(current_symbols)
            current_symbols.remove(value)
            column.append(value)

        columns.append(column)

    return columns"""

