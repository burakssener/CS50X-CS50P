#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //prompt for input
    int x;

    do
    {
          x = get_int("Please Provide me a number between 1 and 8: ");

    }
    while(x>=8 && x<=1);
    //controls input is between 1 and 8

}