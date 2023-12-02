items = {}
while True:
    try:
        new_item = input().strip().upper()
        if new_item in items:
            items[new_item] += 1
        else:
            items[new_item] = 1
    except EOFError:
        for item in (items.keys()).sort():
            print(items[item], item)
        break

