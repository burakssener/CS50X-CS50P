from jar import Jar


def test_init():
    jar = Jar(15)
    assert capacity(jar) == 15

def test_str():
    jar = Jar()
    assert str(jar) == ""
    jar.deposit(1)
    assert str(jar) == "🍪"
    jar.deposit(11)
    assert str(jar) == "🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪"


def test_deposit():

    jar.deposit(1)
    assert str(jar) == "🍪"


def test_withdraw():
    ...
