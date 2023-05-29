#include <stdio.h>
#include <cs50.h>


int main(void)
{
    string name = get_string("Name of the person: ");
    int age = get_int("Age of the person: ");
    int phone = get_int("Phone number: ");
}

{
    printf("name=i%, age=i%, phone number=s%", name, age, phone);
}