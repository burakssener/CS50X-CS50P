#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#define BLOCK_SIZE 512
int main(int argc, char *argv[])
{
    if(argc != 2)
    {
        printf("Wrong Usage!");
        return 1;
    }

//open memory card
FILE *raw_file = fopen(argv[1], "r");
FILE *output_file = NULL;
// look for begginning of a jpeg
uint8_t buffer[BLOCK_SIZE];
int jpegcount = 0;
fread(buffer, 1, BLOCK_SIZE, raw_file);
char *filename = malloc(8);


    while (fread(buffer, malloc(sizeof(char)), BLOCK_SIZE, raw_file) == BLOCK_SIZE)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff &&  ((buffer[3] & 0xf0) == 0xe0))
        {
            sprintf(filename, "%03i.jpg", jpegcount);
            output_file = fopen(filename, "w");
            jpegcount = jpegcount + 1;

        }

        if(output_file != NULL)
        {
            fwrite(buffer, malloc(sizeof(char)), BLOCK_SIZE, output_file);
        }
        /*FILE *img = fopen(output_file, "w");
        fwrite(buffer, 1, BLOCK_SIZE, img); */

    }
    free(filename);
    fclose(raw_file);
    fclose(output_file);



// open a new jpeg file
// write 512 bytes until new jpeg is found


}
