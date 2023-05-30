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
    for(i=0; i<length; i++)
    {
        if (word[i] < word[i + 1])
        return 0;
        else;
        printf("The word is not alphebitical");
        break;
    }
    printf("The word is alphebitical");

}