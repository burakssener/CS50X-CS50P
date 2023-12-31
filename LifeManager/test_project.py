import pytest
from project import get_digit

def test_valid_input():
    result = get_digit("Enter a digit: ", bot=1, top=10)
    assert 1 <= result <= 10

def test_valid_input_without_top():
    result = get_digit("Enter a digit: ", bot=1)
    assert result >= 1
