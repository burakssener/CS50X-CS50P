price = 50
while price > 0:
    print(f"Amount Due: {price}")
    price -= int(input("Insert Coin:"))

print(f"Change Owed: {-1 *price}")

