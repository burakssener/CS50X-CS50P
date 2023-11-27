#include <stdio.h>
int main(void)
{
    int table[2][5];

    for (int i = 0; i<10; i++)
    {
        table[0][i] = i;
    }
    for (int i = 0; i<2; i++)
    {
        for (int a = 0; a<5; a++)
    {
        printf("%d", table[i][a] );
    }

    }
}
