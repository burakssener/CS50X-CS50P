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
            int sepiared= round(0.393*image[a][b].rgbtRed + 0.769*image[a][b].rgbtGreen + 0.189*image[a][b].rgbtBlue);
            int sepiagreen = round(0.349*image[a][b].rgbtRed + 0.686*image[a][b].rgbtGreen + 0.168*image[a][b].rgbtBlue);
            int sepiablue = round(0.272*image[a][b].rgbtRed + 0.534*image[a][b].rgbtGreen + 0.131*image[a][b].rgbtBlue);
            image[a][b].rgbtRed = sepiared;
            image[a][b].rgbtGreen = sepiagreen;
            image[a][b].rgbtBlue = sepiablue;
            if(sepiared > 255)
            {
                image[a][b].rgbtRed = 255;

            }
            if(sepiagreen > 255)
            {
                image[a][b].rgbtGreen = 255;

            }
            if(sepiablue > 255)
            {
                image[a][b].rgbtBlue = 255;

            }
        }

    }
    return;



}

// Reflect image horizontally
void reflect(int height, int width, RGBTRIPLE image[height][width])
{
    int a, b;
    RGBTRIPLE tmp;
    for(a = 0; a < height; a = a + 1)
    {
        if(width % 2 == 0)
        {
            for (b = 0; b < width / 2; b = b + 1)
        {
            tmp = image[a][b];
            image[a][b] = image[a][width-1-b];
            image[a][width-1-b] = tmp;


        }
        }

        else{

            for (b = 0; b != (width + 1) / 2; b = b + 1)
        {
            tmp = image[a][b];
            image[a][b] = image[a][width-1-b];
            image[a][width-1-b] = tmp;

        }


        }


    }

    return;

}

// Blur image
void blur(int height, int width, RGBTRIPLE image[height][width])
{
    //find all pixels values in image and copy to image2
    RGBTRIPLE image2[height][width];
    int average;

    for(a = 0; a < height; a++)
    {
        for(b = 0; b < width; b++)
        {
            if((a=0 && b=0) || (a=height - 1 && b=width -  1) || (a=0 && b=width - 1) || (a=height - 1 && b=0) )
            // for the corner squares there is 4 different bit to calculate average
            {
                image[a][b] + image

            }
            else if(a=0 || a = height - 1 || b = 0 ||b = width - 1)
            // for the edge squares there is 6 different bit to calculate average
            {

            }
            else
            // for the inside squares there is 9 different bit to calculate average
            {


            }
        }

    }

    // copy image2 to image1
    return;
}
