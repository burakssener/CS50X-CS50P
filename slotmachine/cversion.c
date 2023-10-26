#include<stdio.h>
#include<stdlib.h>



int get_deposit(int num)
{
    int input;
    while(true)
    {
        printf("Determine the deposit please");
        scanf("%d", &input);
        if ( input > 0)
        {
            break;
        }
        else
        {
            printf("the deposit must be positive");
        }
    }
    return input;
}

int main (void)
{
    get_deposit();
}