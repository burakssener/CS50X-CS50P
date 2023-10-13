// all pdfs first 4 byte are 37 80 68 70

#include<stdio.h>
#include <stdint.h>
#include<cs50.h>

int main(int argc, string argv[])
{



    if( argc != 2)
    {
        printf("improper usage!!");
        return 1;
    }

    //open file

    char *filename = argv[1]
    FILE *file = open(filename, "r")

    if (file == NULL)
    {

        printf("No Such a file ")
        return 1;

    }

    //unsigned integer 8 bits(single byte) and it it is its own type


    uint8_t =
}