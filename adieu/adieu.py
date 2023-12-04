import inflect

p = inflect.engine()
names = []
while True:
    try:
        names.append(input("Name: ").strip().title())
    except EOFError:
        mylist = p.join(names, final_sep="")
        print("Adieu, adieu, to", mylist)
        break

