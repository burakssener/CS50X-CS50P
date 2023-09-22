#include <cs50.h>
#include <stdio.h>

int main(void)
{
    //prompt for input

    do
    {
          int x = get_int("Please Provide me a number");
          printf("Error: The number should be in the range of 1 to 8! \n")

    }
    while(8<=x && x<=1)
    //controls input is between 1 and 8

}