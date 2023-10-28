# TODO
# american express 15 digits starts with 34 or 37
#master card 16 digits, starts with 51, 52, 53, 54, or 55
# Visa 13 or 16 digits starts with 4

while True:
    input = input("Enter a Credit card number")
    if input.isdigit():
        input = int(input)
        break

list = []
for num in range(len(input)):
    list.append(int(num))
for i in range(input):
    if i % 2 == 1:
        term = input[i] * 2
        if(term > 9):
            term = (term % 10) + 1
        even += term
    else:
        odd += input[i]

if (odd + even) % 10 != 0:
    print("INVALID")
    exit()

item_num = len(input)
print(input[0:1])

"""if item_num == 15 and (input[0:1] == 34 or input[0:1]== 37):
    print("AMEX")
elif item_num == 16 and """


