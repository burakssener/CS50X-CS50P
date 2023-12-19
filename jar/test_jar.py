from jar import Jar
import pytest

def test_init():
    jar = Jar(15)

def test_str():
    jar = Jar()
    assert str(jar) == ""
    jar.deposit(1)
    assert str(jar) == "🍪"
    jar.deposit(11)
    assert str(jar) == "🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪🍪"


def test_deposit():
    jar = Jar(2)
    with pytest.raises(ValueError) as error:
        jar.deposit(18)
    assert error.type is ValueError



def test_withdraw():
    with pytest.raises(ValueError) as error:
        jar.withdraw(5)
    assert error.type is ValueError
