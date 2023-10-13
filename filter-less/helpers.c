#include "helpers.h"

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    average = (image[height][width].rgbtRed + image[height][width].rgbtGreen + image[height][width].rgbtBlue) / 3;
    for(a = 0; a < height; a = a + 1)
    {
        image[a][b].rgbtRed = average;
        image[a][b].rgbtGreen = average;
        image[a][b].rgbtBlue = average;

    }

    return;
}

// Convert image to sepia
void sepia(int height, int width, RGBTRIPLE image[height][width])
{
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
