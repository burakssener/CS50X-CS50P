#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <math.h>

int main(void)
{
    double index, the_L, the_S;
    int i, words = 0, letters = 0, sentences = 0, grade;
    /*char *input = get_string("Text: ");*/
    char *input = "How are you? It was so nice to meet you last week in Sydney at the sales meeting. How was the rest of your trip? Did you see any kangaroos? I hope you got home to Mexico City OK.

Anyway, I have the documents about the new Berlin offices. We're going to be open in three months. I moved here from London just last week. They are very nice offices, and the location is perfect. There are lots of restaurants, cafés and banks in the area. There's also public transport; we are next to an U-Bahn (that is the name for the metro here). Maybe you can come and see them one day? I would love to show you Berlin, especially in the winter. You said you have never seen snow – you will see lots here!

Here's a photo of you and me at the restaurant in Sydney. That was a very fun night! Remember the singing Englishman? Crazy! Please send me any other photos you have of that night. Good memories.

Please give me your email address and I will send you the documents."

    for(i = 0; input[i] != '\0'; i++)
    {
        if(isblank(input[i]))
        {
            words += 1;
        }
        if(islower(input[i]) || isupper(input[i]))
        {
            letters += 1;
        }
        if(input[i] == '!' || input[i] == '.' || input[i] == '?')
        {
            sentences += 1;
        }

    }
    words += 1;
    the_L = 1.0 * letters / words * 100;
    the_S = 1.0 * sentences / words * 100;
    index = 0.0588 * the_L - 0.296 * the_S - 15.8;
    grade = round(index);
    if(grade < 1)
    {
        printf("Before Grade 1\n");
    }
    else if(grade > 16)
    {
        printf("Grade 16+\n");
    }
    else
    {
        printf("Grade %d\n", grade);
    }



}