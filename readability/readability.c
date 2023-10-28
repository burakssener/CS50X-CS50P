#include <cs50.h>
#include <stdio.h>
#include <ctype.h>

int main(void)
{
    double index;
    int i, word = 0, letter = 0, sentence = 0;
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

    /*index = 0.0588 * L - 0.296 * S - 15.8;*/
}