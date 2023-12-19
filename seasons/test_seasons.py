from seasons import getter
import datetime
import pytest

def test_textCheck():
    assert getter("2022--12-12") == datetime.date(2022, 12, 12)
    assert getter("--2022--12-12-- ") == datetime.date(2022, 12, 12)


    with pytest.raises(SystemExit) as error_code:
        getter("14 January, 2022")

    assert error_code.value.code == 1

