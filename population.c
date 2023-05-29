#include <stdio.h>
#include <cs50.h>

int main(void)
{
    //starting point and goal

    int lama;
    do
    {
        lama = get_int("How many lamas do you have? ");
    }
    while (lama<9);

    int goal;
    do
    {
        goal = get_int("How many Lamas do you want? ");
    }
    while (lama>goal);

    int plus;
    int opposite;
    int year;

    //with loop find how many years user need

    for(year = 0; lama<goal; year = year+1)
    {
        plus = lama/3;
        opposite = lama/4;
        lama = lama + plus - opposite;
    }

    //give result
    printf("You need %i years to reach %i Lamas\n",year ,lama);
}