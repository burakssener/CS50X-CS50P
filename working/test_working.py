from working import convert
import pytest
def test_convertionforpm():
    assert convert("5 AM to 9 PM") == ("05:00 to 21:00")
    assert convert("8 AM to 8 PM") == ("08:00 to 20:00")

def test_convertionforPmAmWithCorners():
    assert convert("12 AM to 9 PM") == ("00:00 to 21:00")
    assert convert("5 AM to 12 PM") == ("05:00 to 12:00")

def test_convertionforValueError():
    with pytest.raises(ValueError) as error:
        convert("5 AM to 9:60 PM")
    assert error.type is ValueError
    with pytest.raises(ValueError) as error:
        convert("13 AM to 9 PM")
    assert error.type is ValueError
    with pytest.raises(ValueError) as error:
        convert("13 AM 9 PM")
    assert error.type is ValueError



