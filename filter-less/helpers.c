#include "helpers.h"
#include <math.h>

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    int average, a, b;
    for(a = 0; a < height; a = a + 1)
    {

        for (b = 0; b < width; b = b + 1)
        {
            average = round((image[a][b].rgbtRed + image[a][b].rgbtGreen + image[a][b].rgbtBlue) / 3.0);
            image[a][b].rgbtRed = average;
            image[a][b].rgbtGreen = average;
            image[a][b].rgbtBlue = average;
        }

    }

    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{


    int average, a, b;
    for(a = 0; a < height; a = a + 1)
    {

        for (b = 0; b < width; b = b + 1)
        {
            sepiared= 0.393*image[a][b].rgbtRed + 0.769*image[a][b].rgbt;
            sepiagreen =
            sepiablue =
            image[a][b].rgbtRed = average;
            image[a][b].rgbtGreen = average;
            image[a][b].rgbtBlue = average;
        }

    }
    return;



}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    return;
}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    return;
}
