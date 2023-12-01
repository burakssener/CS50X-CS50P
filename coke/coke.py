price = 50
while price > 0:
    print(f"Amount Due: {price}")
    if int(input("Insert Coin:")) in [5, 10, 25]:
        price -= int(input("Insert Coin:"))

print(f"Change Owed: {-1 *price}")

