from numb3rs import validate

def test_num():
    assert validate("255.255.255.256") == False
    assert validate("255.255.255.-1") == False
    assert validate("1.0.0.0") == True

def test_string():
    assert validate("adam.255.255.256") == False
    assert validate("255.ada.255.-1") == False
    assert validate("1.0.a.0") == False

def test_numberofelements():
    assert validate("255.255.255") == False
    assert validate("255.255.255.12.12") == False
    assert validate("1.0.0..0") == False
