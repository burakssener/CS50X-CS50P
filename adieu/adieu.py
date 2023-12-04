import inflect

p = inflect.engine()
names = []
while True:
    try:
        answer = input("Name: ").strip().title()
        names.append(answer)
    except EOFError:
        break

mylist = p.join(names, final_sep="")
print("\nAdieu, adieu, to", mylist)
