#include <stdio.h>
#include <stdlib.h>
#define BLOCK_SIZE 512;
int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        return 1;
    }

//open memory card
FILE *file = fopen(argv[1], "r");
// look for begginning of a jpeg
uint8_t buffer[BLOCK_SIZE];
if (buffer[0] == "0xff" && buffer[1] == "0xd8" && buffer[2] == "0xff" &&  ((buffer[3] & "0xf0") == "0xe0"))
{


}
// open a new jpeg file
// write 512 bytes until new jpeg is found


}

sprintf(filename, "%03i.jpg", 2);

FILE *img = fopen(filename, "w");

while (fread(buffer, 1, BLOCK_SIZE, raw_file) == BLOCK_SIZE)
{


}

fwrite()