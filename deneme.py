roman = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000}
s = "MDCL"
total = 0
for i in range(len(s)):
    if roman[s[i+1]] <= roman[s[i]]:
        total += roman[s[i]]
    else:
        total += roman[s[i+1]] - roman[s[i]]
print(total)

