from validator_collection import validators

try:
    email = validators.email(input("What's your email address? ").strip())
    print("Valid")
except ValueError:
    print("Invalid")
