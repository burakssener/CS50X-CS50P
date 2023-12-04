from twttr import shorten

def test_shorten():
    assert shorten("12321ada") == ("12321d")

def test_shorten():
    assert shorten("12321ede") == ("12321d")
