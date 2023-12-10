from working import convert

def test_convertionforpm():
    assert convert("5 AM to 9 PM") = ("05.00 to 21.00")
    assert convert("8 AM to 8 PM") = ("8.00 to 16.00")

def test_convertionforPmAmWithCorners():
    assert convert("12 AM to 9 PM") = ("00.00 to 21.00")
    assert convert("5 AM to 12 PM") = ("05.00 to 12.00")

def test_convertionforValueError():
    assert convert("5 AM to 9.60 PM")
    assert convert("13 AM to 9 PM")

