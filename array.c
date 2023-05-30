#include <stdio.h>
#include <cs50.h>

int main(void)
{
    //prompts the user for a size

    int n;
    do
    {
        n = get_int("Size of an array: ");
    }
    while(n < 1);


    //create an aray of that size each elemnents power of 2 from 1 and print with loop

    int array[n];
    int i;
    int element=1;
    for(i = 0; i<n; i++)
    {
        array[i] = element;
        element = 2*element;
        printf("%i\n", array[i]);
    }
}