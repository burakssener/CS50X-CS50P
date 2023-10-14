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
    RGBTRIPLE image2[height][width];
    int avgblue, avgred, avggreen, a, b, i, j, division_num;

    for(a = 0; a < height; a++)
    {
        for(b = 0; b < width; b++)
        {
            avgblue = 0, avgred = 0, avggreen = 0, division_num = 0;
            for(i = -1; i < 2; i++)
            {
                for(j = -1; j < 2; j++)
                {
                    if(a+i >= 0 && a+i < height && b+j>= 0 && b+j< width)
                    {
                        avgblue += image[a + i][b + j].rgbtBlue;
                        avggreen += image[a + i][b + j].rgbtGreen;
                        avgred += image[a + i][b + j].rgbtRed;
                        division_num += 1;
                    }


                }
            }
            image2[a][b].rgbtBlue = round(avgblue / division_num);
            image2[a][b].rgbtGreen = round(avggreen / division_num);
            image2[a][b].rgbtRed = round(avgred / division_num);



        }



    }





    return;
}
/* SOLVING ATTEMP1
RGBTRIPLE image2[height][width];
    int averagered, averagegreen, averageblue;


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
            averagered = round((image[a - 1][b - 1].rgbtRed + image[a - 1][b].rgbtRed + image[a - 1][b + 1].rgbtRed  image[a][b - 1].rgbtRed  + image[a][b].rgbtRed  + image[a][b + 1].rgbtRed  + image[a + 1][b - 1].rgbtRed  image[a + 1][b].rgbtRed  + image[a + 1][b + 1].rgbtRed) / 9)
            averagegreen = round((image[a - 1][b - 1].rgbtGreen + image[a - 1][b].rgbtGreen + image[a - 1][b + 1].rgbtGreen image[a][b - 1].rgbtGreen  + image[a][b].rgbtGreen  + image[a][b + 1].rgbtGreen  + image[a + 1][b - 1].rgbtGreen  image[a + 1][b].rgbtGreen + image[a + 1][b + 1].rgbtGreen) / 9)
            averageblue = round((image[a - 1][b - 1].rgbtBlue + image[a - 1][b].rgbtBlue + image[a - 1][b + 1].rgbtBlue  image[a][b - 1].rgbtBlue  + image[a][b].rgbtBlue  + image[a][b + 1].rgbtBlue  + image[a + 1][b - 1].rgbtBlue  image[a + 1][b].rgbtBlue  + image[a + 1][b + 1].rgbtBlue) / 9)


            }
            //find all pixels values in image and copy to image2
            // copy image2 to image1
        }


SOLVING ATTEMPT 2

 for(int a = 0; a < height; a++)
    {
        int avgblue, avgred, avggreen, b, i, j, division_num;

        for(b = 0; b < width; b++)
        {

            if((a=0 && b=0) || (a=height - 1 && b=width -  1) || (a=0 && b=width - 1) || (a=height - 1 && b=0) )
            {



            }
            else if(a=0 || a = height - 1 || b = 0 ||b = width - 1)
            {




            }



            else if(a > 0 && a < height - 1 && b > 0  && b < width - 1)
            {
                for(i = -1; i < 2; i++)
                {
                    for(j = -1, division_num = 0, avgblue = 0, avgred = 0, avggreen = 0; j < 2; j++)
                    {
                        avgblue += image[a + i][b + j].rgbtBlue;
                        avggreen += image[a + i][b + j].rgbtGreen;
                        avgred += image[a + i][b + j].rgbtRed;
                        division_num += 1;
                    }
                }

            }

            image2[a][b].rgbtBlue = round(avgblue / division_num);
            image2[a][b].rgbtGreen = round(avggreen / division_num);
            image2[a][b].rgbtRed = round(avgred / division_num);
        }
    }

     for(int a = 0; a < height; a++)
    {

        for(int b = 0; b < width; b++)
        {
            image[a][b] = image2[a][b];
        }

    }
*/