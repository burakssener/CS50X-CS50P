#define MAX_LINES 3
#define MIN_BET 1
#define MAX_BET 100
#include<stdio.h>
#include<stdlib.h>

int get_deposit(void);
int get_line_num(void);
int get_bet(void);

int main (void)
{
    int deposit, line, bet;

    deposit = get_deposit();
    line = get_line_num();
    bet = get_bet() * line;
    printf("You bet on %d lines. The total amount that you bet is $ %d", line, bet);
}

int get_deposit(void)
{
    int input;
    while(1)
    {
        printf("Determine the deposit please: ");
        scanf("%d", &input);
        if ( input > 0)
        {
            break;
        }
        else
        {
            printf("the deposit must be positive \n");
        }
    }
    return input;
}
int get_line_num(void)
{
    int input;
    while(1)
    {
        printf("What is the number of lines that you want to bet on between 1 to %d lines?: ", MAX_LINES);
        scanf("%d", &input);
        if ( input >= 1 && input <= MAX_LINES)
        {
            break;
        }
        else
        {
            printf("the line num should be between 1 to 3! \n");
        }
    }
    return input;
}

int get_bet(void)
{
    int bet;
    while(1)
    {
        printf("What is the amount of the money you want to bet for each line between %d to %d?", MIN_BET, MAX_BET);
        scanf("%d", &bet);
        if(bet >= MIN_BET && bet <= MAX_BET)
        {
            break;
        }
        else
        {
            printf("You are exceeded limit or under thee limit");
        }
    }
    return bet;

}