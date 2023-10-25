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
unsigned int word_number = 0;

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
    unsigned long the_hash = 0;
    for(int i = 0; i < strlen(word); i++)
    {
        the_hash += tolower(word[i]);

    }
    return (the_hash % N);
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
        /**pword_number += 1;*/
        fscanf(file, "%s", newcomer);
        int index = hash(newcomer) % N;
        if(table[index] == NULL)
        {
            table[index] = malloc(sizeof(node));
            strcpy(table[index]->word, newcomer);
            table[index]->next = NULL;
            word_number++;
        }
        else
        {
            strcpy(n->word, newcomer);
            n->next = table[index];
            table[index]= n;
            word_number++;

        }

    }
    fclose(file);


    return true;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    if(!(word_number > 0))
    {
        return 0;
    }
    return word_number;
    /*node *n = malloc(sizeof(node));
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
    return total;*/

}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    int i;


    for(i=0; i < N; i++)
    {
        node *n = table[i];
        while(n != NULL)
        {
            node *tmp = n;
            n = n->next;
            free(tmp);

        }
        if(n == NULL)

    }
    return true;

}
