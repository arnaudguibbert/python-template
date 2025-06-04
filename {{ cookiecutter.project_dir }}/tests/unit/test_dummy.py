import pytest

from {{ cookiecutter.project_name }}.dummy import dummy_fn


@pytest.mark.dummy
@pytest.mark.parametrize("str_input", ["test", ""])
def test_dummy_fn(str_input: str) -> None:
    assert dummy_fn(str_input) == str_input
