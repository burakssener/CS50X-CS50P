#include <stdio.h>
#include <cs50.h>


int main(void)
{
    string name = get_string("Name of the person: ");
    int age = get_int("Age of the person: ");
    string phone = get_string("Phone number: ");

    printf("name= %s, age= %i, phone number= %s", name, age, phone);
}