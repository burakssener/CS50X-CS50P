#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int BITS_IN_BYTE = 8;

void print_bulb(int bit);
void binary_get(string word);

int main(void)
{

    string word = get_string("Word: ");



    int i;
    for(i=0; word[i] != '\0' ; i++)
    {
        
        printf("\n");
    }
}

void print_bulb(int bit)
{
    string dark = "\U000026AB";
    string light = "\U0001F7E1";
    if (bit == 0)
    {
        // Dark emoji
        printf("%-1s", dark);
    }
    else if (bit == 1)
    {
        // Light emoji
        printf("%-1s", light);
    }
}

