from seasons import getter

def test_textCheck():
    assert getter("  2022-12-12 ") == "2022-12-12"
    with pytest.raises(SystemExit) as error_code:
        function_that_may_exit()

    assert error_code.value.code == 1

