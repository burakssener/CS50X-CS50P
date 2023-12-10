from um import count

def test_case():
    assert count("UM Ahahah") == 1
    assert count("Um Ahahah") == 1
    assert count("uM Ahahah") == 1


def test_number():
    assert count("UM ,um Ahahah") == 2
    assert count("Um Ahahah ,um ,um") == 3
    assert count("uM Ahahah um... Um.") == 3
