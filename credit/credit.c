#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int digit[], i = 0, luhns_1 = 0, luhns_2 = 0 ;
    long input = get_long("Please provide a credit number");
    while(!(input / 10 == 0))
    {
        digit[i] = input % 10;
        input = input / 10;
        i += 1;
    }
    digit[i] = input;

    for(digit_num = 1; digit_num <= i; digit_num+=2 )
    {
        luhns_1 += digit[digit_num] * 2;
        luhns_2 += digit[digit_num - 1]
    }
    if()

    if ((i + 1) == 15)
    {

    }
    else if ((i + 1) == 16)
    {

    }
    else if ((i + 1) == 13 && (i + 1) == 16)
    {

    }


}