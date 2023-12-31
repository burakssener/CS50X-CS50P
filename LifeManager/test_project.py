import pytest
from project import get_digit

def test_valid_input(monkeypatch):
    monkeypatch.setattr('builtins.input', lambda _: '5')

    result = get_digit("Enter a digit: ", bot=1, top=10)
    assert 1 <= result <= 10

def test_valid_input_without_top(monkeypatch):
    monkeypatch.setattr('builtins.input', lambda _: '3')

    result = get_digit("Enter a digit: ", bot=1)
    assert result >= 1
