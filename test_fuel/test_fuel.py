from fuel import convert, gauge

def test_gauge():
    assert gauge(99.5) == "F"
    assert gauge(0.5) == "E"
    assert gauge(99) == "F"
    assert gauge(70) == "%70"

def test_conver():
    assert convert("cat") ==
