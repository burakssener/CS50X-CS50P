#include <cs50.h>
#include <stdio.h>
#include <string.h>

const int BITS_IN_BYTE = 8;

void print_bulb(int bit);

int main(int argc, char *argv[])
{

    string word = get_string("Word: ");
    int i;

}

get_binary(string word)
{

    for(i=0; word[i] != '\0' ; i++)
    {
        char binary[100];
        int digit = word[i];
        while(digit != 0)
        {

            if(digit % 2 != 0)
            {
                strcat(binary, "0");
                digit = digit / 2;

            }
            else if( digit % 2 != 1)
            {

                strcat(binary, "1");
                digit = digit / 2;
            }
            
            print_bulb(binary);
            return 0;


        }




    }

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

/*for(i=0; word[i] != '\0' ; i++)
    {

        int digit = word[i];
        while(digit != 0)
        {

            if(digit % 2 != 0)
            {
                strcat(binary, "0");
                digit = digit / 2;

            }
            else if( digit % 2 != 1)
            {

                strcat(binary, "1");
                digit = digit / 2;
            }
            return 0; /*