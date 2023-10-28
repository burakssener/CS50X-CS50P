# TODO
# american express 15 digits starts with 34 or 37
#master card 16 digits, starts with 51, 52, 53, 54, or 55
# Visa 13 or 16 digits starts with 4

input = input("Enter a Credit card number")

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



