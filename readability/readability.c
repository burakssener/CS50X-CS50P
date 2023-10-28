#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>

int main(void)
{
    double index, the_L, the_S;
    int i, words = 0, letters = 0, sentences = 0, grade;
    char *input = get_string("Text: ");

    for(i = 0; input[i] != '\0'; i++)
    {
        if(isblank(input[i]))
        {
            words += 1;
        }
        if(islower(input[i]) || isupper(input[i]))
        {
            letters += 1;
        }
        if(input[i] == '!' || input[i] == '.' || input[i] == '?')
        {
            sentences += 1;
        }

    }
    words += 1;
    the_L = 1.0 * letters / words * 100;
    the_S = 1.0 * sentences / words * 100;
    index = 0.0588 * the_L - 0.296 * the_S - 15.8;
    grade = round(index);
    if(grade <= 1)
    {
        printf("Grade 1 \n");
    }
    else if(grade >= 16)
    {
        printf("Grade 16 \n");
    }
    else
    {
        printf("Grade %d \n", grade);
    }



}