# TODO
# american express 15 digits starts with 34 or 37
#master card 16 digits, starts with 51, 52, 53, 54, or 55
# Visa 13 or 16 digits starts with 4

while True:
    input = input("Enter a Credit card number")
    if input.isdigit():
        two_digits = int(input[0:2])
        input = int(input)
        break
i, even, odd = 0, 0, 0
while (input != 0):
    digit = input % 10
    input = input // 10
    if i % 2 == 1:
        term = digit * 2
        if(term > 9):
            term = (term % 10) + 1
        even += term
    else:
        odd += digit
    i += 1

if (odd + even) % 10 != 0:
    print("INVALID")
    exit()
print(two_digits)
if ((i == 15) and (two_digits == 34 or two_digits == 37)):
    print("AMEX")
elif (i == 16 and (51 <= two_digits <= 55)):
    print("MASTERCARD")
elif (i == 14 and (two_digits // 10)  == 4):
    print("VISA")
else:
    print("INVALID")

"""while True:
    input = input("Enter a Credit card number")
    length = len(input)
    if input.isdigit():
        break

list = []
for num in range(length):
    list.append(int(input[num]))
even, odd = 0, 0
for i in range(length):
    if i % 2 == 1:
        term = int(input[i]) * 2
        if(term > 9):
            term = (term % 10) + 1
        even += term
    else:
        odd += int(input[i])

if (odd + even) % 10 != 0:
    print("INVALID")
    exit()

two_digits = int(input[0:2])

if length == 15 and (two_digits == 34 or two_digits == 37):
    print("AMEX")
elif length == 16 and (51 <= two_digits <= 55):
    print("MASTERCARD")
elif length == 14 and two_digits in range(40,49):
    print("VISA")
else:
    print("INVALID")"""

