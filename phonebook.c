#include <stdio.h>
#include <cs50.h>


int main(void)
{
    string name = get_string("Name of the person: ");
    int age = get_int("Age of the person: ");
    long phone = get_int("Phone number: ");


    printf("name= %s, age= %i, phone number= %li", name, age, phone);
}