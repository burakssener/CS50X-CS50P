from fuel import convert, gauge
import pytest

def test_gauge():
    assert gauge(99.5) == "F"
    assert gauge(0.5) == "E"
    assert gauge(99) == "F"
    assert gauge(70) == "%70"

def test_convert():
    assert convert("5/10") == "50"
    assert convert("9/9") == "100"
    assert convert("0/9") == "0"
def test_convert_exceptions():
    
