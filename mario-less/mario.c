#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //prompt for input that controls if input is between 1 and 8
    int x;

    do
    {
          x = get_int("Please Provide me a number between 1 and 8: ");

    }
    while(x>=8 || x<=1);

    int i;
    int a;

    for (i=1; i<=x; i= i + 1)
{
        printf("#"*(x-i));
        printf("#"*x);

        printf("  ");

        for (a=i; a>0; a = a-1)
        {
            printf("#");

        }
        printf("\n");

    }

}
