#include<stdio.h>
#include<stdlib.h>

int get_deposit(int num);



int main (void)
{
    get_deposit();
}

int get_deposit(int num)
{
    int input;
    while(1)
    {
        printf("Determine the deposit please");
        scanf("%d", &input);
        if ( input > 0)
        {
            return input;
        }
        else
        {
            printf("the deposit must be positive");
        }
    }
    return input;
}