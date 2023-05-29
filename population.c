#include <stdio.h>
#include <cs50.h>

int main(void)
{
    //prompting user for a starting point and goal
    int start = get_int("How many lamas do you have? ");
    int goal = get_int("How many Lamas do you want? ");

    //with loop find how many years user need
    for(i = start; i<goal; i=i+i/3)
    
    //give result
    printf("You need %i years to reach %i Lamas/n",i ,goal);
}