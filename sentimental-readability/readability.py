input = input("Text:")
word , letter , sentence = 0, 0, 0
for c in input:
    if(c.isspace()):
        word += 1
    elif(c.isupper() or c.islower()):
        letter += 1
    elif(c == "!" or c == "." or c == "?"):
        sentence += 1

word += 1

the_L = letter / word * 100;
the_S = sentence / word * 100;
index = 0.0588 * the_L - 0.296 * the_S - 15.8;
grade = round(index)

if grade < 1:
    print("Before Grade 1")
elif grade >16:
    print("Grade 16+")
else:
    print(f"Grade {grade}")