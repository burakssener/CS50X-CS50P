#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int BITS_IN_BYTE = 8;

void print_bulb(int bit);
char binary[BITS_IN_BYTE + 1] = {0};
int i, j;

int main(void)
{
    //get input from user
    string word = get_string("Word: ");
    // for loop to get strings characters
 for(i=0; i<strlen(word); i++)
 { // while loop inside for loop to get binary code of characters
    int digit = word[i];
    for(c = digit != 0)
        {

        if(digit % 2 == 0)
            {
            strcat(&binary[7] , "0");

            digit = digit / 2;

            }
            else if( digit % 2 == 1)
            {

            strcat(&binary[7] , "1");

            digit = digit / 2;
            }
        }
    for(j = 7; j >= 0; j--)
        {
        print_bulb(binary[j]);

        }





 }

 // printing these binary codes into display screen
}

void print_bulb(int bit)
{
    if (bit == 0)
    {
        // Dark emoji
        printf("\U000026AB");
    }
    else if (bit == 1)
    {
        // Light emoji
        printf("\U0001F7E1");
    }
}
