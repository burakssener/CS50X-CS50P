import pytest
from project import get_digit

def test_valid_input():
    result = get_digit("Enter a digit: ", bot=1, top=10)
    assert 1 <= result <= 10

def test_valid_input_without_top():
    # Test when the input is a valid integer without the top limit
    result = get_digit("Enter a digit: ", bot=1)
    assert result >= 1

def test_invalid_input():
    # Test when the input is not a digit
    with pytest.raises(ValueError, match="You entered not integer value. Time must be in a minute format"):
        get_digit("Enter a digit: ", bot=1)

def test_below_bot():
    # Test when the input is below the specified bottom limit
    with pytest.raises(ValueError, match="input needs to be above or equal to 5"):
        get_digit("Enter a digit: ", bot=5, top=10)

def test_above_top():
    # Test when the input is above the specified top limit
    with pytest.raises(ValueError, match="input needs to be below or equal to 10"):
        get_digit("Enter a digit: ", bot=1, top=10)
