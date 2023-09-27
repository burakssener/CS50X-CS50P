#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>

// Points assigned to each letter of the alphabet
int points[] = {1, 3, 3, 2, 1, 4, 2, 4, 1, 8, 5, 1, 3, 1, 1, 3, 10, 1, 1, 1, 1, 4, 4, 8, 4, 10};

int compute_score(string word);
int total = 0, i, input;
char char_value;

int main(void)
{
    // Get input words from both players
    string word1 = get_string("Player 1: ");
    string word2 = get_string("Player 2: ");

    // Score both words
    int score1 = compute_score(word1);
    int score2 = compute_score(word2);

    // TODO: Print the winner

    if(score1 > score2)
    {
        printf("Player 1 wins!");
    }
    else if(score1 == score2)
    {
        printf("Tie!");
    }
    else if(score2 > score1)
    {
        printf("Player 2 wins!");
    }
}

int compute_score(string word)
{

    i = 0;

    while(word[i]!='\0')
    {
        word[i] = tolower(word[i]);
        input = (word[i] - 97);
        char_value = points[input];
        total = total + char_value;
        i = i + 1;

    }

    //int len = strlen(word);
    //char lowered[len+1] = word;  This is not working because I can't assign strings to arrays like that I need to use loops to assign each and every element
    /* for(i=0; lowered[i]!='\0'; i++)
    {
        lowered[i] = tolower(lowered[i]);
        input = (lowered[i] - 97);
        char_value = points[input];
        total = total + char_value;

    } */
    return total;
    // TODO: Compute and return score for string
}



