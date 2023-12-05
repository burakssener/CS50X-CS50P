from bank import value

def test_bank_h():
    assert value("HEY JOHNSON") == 20
    assert value("hi johnson") == 20

def test_bank_hello():
    assert value("HELLO JOHNSON") == 0
    assert value("hello johnson") == 0

def test_bank_different():
    assert value("Get out JOHNSON") == 100
    assert value("GET OUT johnson") == 100



