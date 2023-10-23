// Implements a dictionary's functionality

#include <ctype.h>
#include <stdbool.h>

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
    // TODO
    return false;
}

// Hashes word to a number
unsigned int hash(const char *word)
{
    // TODO: Improve this hash function
    thenumber = toupper(word[0]) - 'A';
    thenumber = thenumber % N;
}

// Loads dictionary into memory, returning true if successful, else false
bool load(const char *dictionary)
{

    FILE *file = fopen(*dictionary, "r");

    if(file = NULL)
    {
        return 0;
    }

    while(fscanf(file, "%s", word) != "E0F")
    {
        char word[50];
        fscanf(file, "%s", word);
        int index = hash(word) % N;
        node *n = malloc(sizeof(node));
        strcpy(n->word, word[index]);
        n->next = table[N];
        table[N]= n;
    }
    close(file);

    return false;
}

// Returns number of words in dictionary if loaded, else 0 if not yet loaded
unsigned int size(void)
{
    for(i = 0; i < N; i++)
    {
        for(j = 0; j <  N; j++)
        {
            
        }
    }
    return 0;
}

// Unloads dictionary from memory, returning true if successful, else false
bool unload(void)
{
    // TODO
    return false;
}
