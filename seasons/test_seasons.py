from seasons import getter

def test_textCheck():
    assert getter("  2022-12-12 ") == "2022-12-12"
    assert getter("  2022--12-12 ") == "2022-12-12"

