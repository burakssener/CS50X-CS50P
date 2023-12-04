import inflect

p = inflect.engine()
names = []
while True:
    try:
        names.append(input("Name: ").strip().title())
    except EOFError:
        break
mylist = p.join(names, final_sep="")

print("\nAdieu, adieu, to", mylist)
