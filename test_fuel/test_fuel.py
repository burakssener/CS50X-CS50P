from fuel import convert, gauge
import pytest

def test_gauge():
    assert gauge(99.5) == "F"
    assert gauge(1) == "E"
    assert gauge(99) == "F"
    assert gauge(70) == "70%"

def test_convert():
    assert convert("5/10") == 50
    assert convert("9/9") == 100
    assert convert("0/9") == 0
def test_convert_exceptions():
    with pytest.raises(ZeroDivisionError) as error:
        convert("5/0")
    assert error.type is ZeroDivisionError
    with pytest.raises(ValueError) as error:
        convert("cat/cat")
    assert error.type is ValueError
    with pytest.raises(ValueError) as error:
        convert("10/8")
    assert error.type is ValueError
    with pytest.raises(ValueError) as error:
        convert("3.5/8")
    assert error.type is ValueError


