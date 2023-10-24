// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <strings.h>


#include "dictionary.h"

// Represents a node in a hash table
typedef struct node
{
    char word[LENGTH + 1];
    struct node *next;
}
node;

// TODO: Choose number of buckets in hash table
const unsigned int N = 26;

// Hash table
node *table[N];

// Returns true if word is in dictionary, else false
bool check(const char *word)
{
    node *n = malloc(sizeof(node));
    int index = hash(word);
    n = table[index];
        while(n != NULL)
        {
         bool statement = strcasecmp(word, (n->word));

            if(statement == 0)
            {
                return true;
            }
        n = n->next;
        }
        free(n);
        return false;

}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    int thenumber = toupper(word[0]) - 'A';
    thenumber = thenumber % N;
    return (thenumber);
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{
    char newcomer[LENGTH + 1];
    node *n = malloc(sizeof(node));
    FILE *file = fopen(dictionary, "r");
    if(file == NULL)
    {
        return false;
    }


    while(fscanf(file, "%s", newcomer) != EOF)
    {
        fscanf(file, "%s", newcomer);
        int index = hash(newcomer) % N;
        if(table[index] == NULL)
        {
            table[index] = malloc(sizeof(node));
            strcpy(table[index]->word, newcomer);
        }
        else
        {
            strcpy(n->word, newcomer);
            n->next = table[index];
            table[index]= n;

        }

    }
    fclose(file);


    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    node *n = malloc(sizeof(node));
    int total = 0, i;


    for(i = 0; i < N; i++)
    {
        n = table[i]->next;
        while(n != NULL)
        {
            total += 1;
            n = n->next;
        }
    }
    free(n);
    return total;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    int i;
    node *n = malloc(sizeof(node));
    node *tmp = malloc(sizeof(node));
    for(i=0; i < N; i++)
    {
        tmp = table[i];
        n = tmp->next;
        while(n->next != NULL)
        {
            free(tmp);
            tmp = n;
            n = tmp->next;
        }
        free(tmp);

    }
    return true;

}
