price = 50
while price > 0:
    print(f"Amount Due: {price}")
    answer  = int(input("Insert Coin:"))
    if answer in [5, 10, 25]:
        price -= answer

print(f"Change Owed: {-1 *price}")

