#include <stdio.h>
#include <cs50.h>


int main(void)
{
    string name = get_string("Name of the person: ");
    int age = get_int("Age of the person: ");
    double phone = get_int("Phone number: ");


    printf("name= %s, age= %i, phone number= %f", name, age, phone);
}