#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#define BLOCK_SIZE 512
int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        return 1;
    }

//open memory card
FILE *raw_file = fopen(argv[1], "r");
FILE *output_file = NULL;
// look for begginning of a jpeg
uint8_t buffer[BLOCK_SIZE];
int jpegcount = 0;
fread(buffer, 1, BLOCK_SIZE, raw_file);

if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff &&  ((buffer[3] & 0xf0) == 0xe0))
{
    while (fread(buffer, 1, BLOCK_SIZE, raw_file) == BLOCK_SIZE)
    {
        char *filename = malloc(10);
        sprintf(filename, "%03i.jpg", jpegcount);
        FILE *img = fopen(filename, "w");
        output_ file = fopen(filename, "w");
        fwrite(buffer, 1, BLOCK_SIZE, output_file);
        jpegcount = jpegcount + 1;

    }


}
// open a new jpeg file
// write 512 bytes until new jpeg is found


}
