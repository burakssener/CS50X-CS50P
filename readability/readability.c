#include <cs50.h>
#include <stdio.h>
#include <ctype.h>

int main(void)
{
    double index, the_L, the_S;
    int i, word = 0, letter = 0, sentence = 0, grade;
    char *input = get_string("Text: ");

    for(i = 0; input[i] != '\0'; i++)
    {
        if(isblank(input[i]))
        {
            word += 1;
        }
        if(islower(input[i]) || isupper(input[i]))
        {
            letter += 1;
        }
        if(input[i] == '!' || input[i] == '.' || input[i] == '?')
        {
            sentence += 1;
        }

    }
    word = word + 1;
    the_L = 1.0 * letter / words * 100;
    the_S = 1.0 * sentence / words * 100;
    index = 0.0588 * the_L - 0.296 * the_S - 15.8;
    grade = round(index);
    if(grade <= 1)
    {
        printf("Grade 1";)
    }
    else if(grade >= 16)
    {
        printf("Grade 16")
    }
}