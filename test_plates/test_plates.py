from plates import is_valid

def test_twoletter():
    assert is_valid("as345") == 1
    assert is_valid("AS345") == 1
    assert is_valid("A4345") == 0
    assert is_valid("a4345") == 0
def test_length():
    assert is_valid("ASA3333") == 0
    assert is_valid("A") == 0
    assert is_valid("ASA333") == 1
def test_numbers():
    assert is_valid("C50C") == 0
    assert is_valid("85SDS") == 0
    assert is_valid("ASD80") == 1
    assert is_valid("ASD08") == 0
    assert is_valid("AS80d") == 0
def test_punctuation():
    assert is_valid("AS,DA8") == 0
    assert is_valid(",,SDS") == 0
    assert is_valid("ASSDS") == 1

