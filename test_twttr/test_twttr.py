from twttr import shorten



def test1_shorten():
    assert shorten("12321ede") == ("12321d")

def test2_shorten():
    assert shorten("12321ada") == ("12321d")

def test3_shorten():
    assert shorten("12321aDa") == ("12321D")

def test3_shorten():
    assert shorten("12321a,d,a") == ("12321,d,")
