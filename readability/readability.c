#include <cs50.h>
#include <stdio.h>
#include <ctype.h>

int main(void)
{
    double index;
    int word = 0;
    char *input = get_string("Text: ");

    for(i = 0; i!= '/0'; i++)
    {
        if(isblank(input[i]))
        {
            word+=1;
        }


    }

    index = 0.0588 * L - 0.296 * S - 15.8;
}