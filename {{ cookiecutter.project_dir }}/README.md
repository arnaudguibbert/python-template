# {{ cookiecutter.project_name }}

[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![ty](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ty/main/assets/badge/v0.json)](https://github.com/astral-sh/ty)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
{%- if cookiecutter.include_pre_commit|lower == 'true' %}
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
{%- endif %}

---

{{ cookiecutter.description }}

# Installation

We are using the [`uv`](https://docs.astral.sh/uv/) package manager to set up the library.

## Venv

To set up the virtual environment, run the following commands from this [directory](./):

```bash
uv venv --relocatable
uv sync --all-groups
```

This will create a virtual environment inside the `.venv` folder and install every dependency group. Run all subsequent commands within this virtual environment.

> [!TIP]
> Refer to the [uv project workflow documentation](https://docs.astral.sh/uv/guides/projects/) for more details and how to manage dependencies.

# Quick Start

**Add a quick start guide to your project here.**

# Local development

## Folder structure

```
├── LICENSE                                         -> Apache V2 LICENSE
├── Makefile                                        -> make commands
├── pyproject.toml                                  -> python library configuration file
├── README.md                                       -> Documentation
├── uv.lock                                         -> cross-platform lockfile for project dependencies
├── {{ cookiecutter.project_name }}/                -> {{ cookiecutter.project_name }} library source code
└── tests/                                          -> test folder
```

## Make commands

For local development, we are providing a list of make command to streamline the recurent operations.

> [!NOTE]
> All make commands should be run from the [root directory](./).


### `py-` make commands

- **`py-format`** – Runs `ruff format` to format the Python code according to the specified style.
- **`py-format-check`** – Checks if the Python code is formatted correctly without making changes.
- **`py-lint`** – Runs `ruff check` to perform linting on the code and automatically fix issues.
- **`py-lint-check`** – Runs `ruff check` to lint the code without making automatic fixes.
- **`py-structure`** – Runs both the `py-format` and `py-lint` commands to ensure code style and linting compliance.
- **`py-analyze`** – Runs `ty check` to perform static type analysis on the Python code.
- **`py-unit-test`** – Runs unit tests with `pytest`, including coverage for the project.
