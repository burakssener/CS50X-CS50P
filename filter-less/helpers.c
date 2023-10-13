#include "helpers.h"

// Convert image to grayscale
void grayscale(int height, int width, RGBTRIPLE image[height][width])
{
    average = (image[height][width].rgbtRed + image[height][width].rgbtGreen + image[height][width].rgbtBlue) / 3;
    for(height = 0, )
    image[height][width].rgbtRed = average;
    image[height][width].rgbtGreen = average;
    image[height][width].rgbtBlue = average;
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
