// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>


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
        n = table[index]->next;
        while(n != NULL)
        {
         bool statement = strcasecmp(word, (n->word));

            if(statement == 0)
            {
                return true;
            }
        n = n->next;
        }
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
    char word[50];
    FILE *file = fopen(dictionary, "r");

    if(file == NULL)
    {
        return 0;
    }

    while(fscanf(file, "%s", word) != EOF)
    {
        fscanf(file, "%s", word);
        int index = hash(word) % N;
        node *n = malloc(sizeof(node));
        strcpy(n->word, table[index]);
        n->next = table[index];
        table[index]= n;
    }
    close(file);

    return false;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    node *n = malloc(sizeof(node));
    total = 0;


    for(i = 0; i < N; i++)
    {
        n = table[i]->next;
        while(n != NULL)
        {
            total += 1;
            n = n->next;
        }
    }
    return 0;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    node *n = malloc(sizeof(node));
    node *tmp = malloc(sizeof(node));
    for(i=0, i < N; i++)
    {
        tmp = table[i]->next;
        n = tmp->next;
        while(n->next != NULL)
        {
            free(tmp)
            tmp = n;
            n = tmp->next;
        }
        free(tmp);

    }

    // TODO
    return false;
}
