#include <cs50.h>
#include <stdio.h>
#include <string.h>

int main(void)
{
    //get word from user
    string word = get_string("Write the word that you want to check: ");
    //determine if the word is alphebatical or not
    int length = strlen(word);
    int i;
    for(i=0; i<length-1; i++) //I have i+1 at the end so add -1 (if not the last letter is compared with null)
    {
        if (word[i] > word[i + 1])
        {
            printf("The word is not alphebitical\n");
            return 0; //makes program finished
        }


    }
    printf("The word is alphebitical\n");
}