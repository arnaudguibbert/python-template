# {{ cookiecutter.project_name }}

[![uv](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/uv/main/assets/badge/v0.json)](https://github.com/astral-sh/uv)
[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)
[![Mypy Latest Version](https://img.shields.io/badge/mypy-checked-blue)](https://github.com/python/mypy)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Coverage Status](./reports/coverage/badge.svg?dummy=8484744)]()

---

{{ cookiecutter.description }}

# Installation

We are using the `uv` package manager to set up the library.

## Venv

To setup the virtual environment, run the following make command inside this [directory](./):

```make
make env-setup-dev
```

This will create a virtual environment inside the `.venv` folder. Run all next commands within this virtual environment.

# Quick Start

**Add a quick start guide to your project here.**

# Local development

## Folder structure

```
├── LICENSE                                         -> Apache V2 LICENSE
├── Makefile                                        -> Main makefile
├── pyproject.toml                                  -> python library configuration file
├── README.md                                       -> Documentation
├── uv.lock                                         -> cross-platform lockfile for project dependencies
├── {{ cookiecutter.project_name }}/                -> {{ cookiecutter.project_name }} library source code
├── makefiles/
│   ├── env.Makefile                                -> env- make commands
│   └── python.Makefile                             -> py- make commands
└── tests/                                          -> test folder
```

## Make commands

For local development, we are providing a list of make command to streamline the recurent operations.

> [!NOTE]
> All make commands should be run from the [root directory](./).

### `env-` make commands

- **`env-init`** – Initializes a Python virtual environment and makes it relocatable.
- **`env-sync-all`** – Syncs all groups in the virtual environment.
- **`env-sync`** – Syncs the virtual environment.
- **`env-setup-dev`** – Sets up the development environment by initializing the virtual environment and syncing all groups.
- **`env-lock`** – Locks the virtual environment's dependencies.
- **`env-delete`** – Deletes the `.venv` directory, effectively removing the virtual environment.
- **`env-install`** – Installs a specified package (`$(PACKAGE)`).
- **`env-export`** – Exports the environment’s dependencies to a `requirements.txt` file, installs the required packages, creates a zip of the project and dependencies, and cleans up temporary files.

### `py-` make commands

- **`py-format`** – Runs `ruff format` to format the Python code according to the specified style.
- **`py-format-check`** – Checks if the Python code is formatted correctly without making changes.
- **`py-lint`** – Runs `ruff check` to perform linting on the code and automatically fix issues.
- **`py-lint-check`** – Runs `ruff check` to lint the code without making automatic fixes.
- **`py-structure`** – Runs both the `py-format` and `py-lint` commands to ensure code style and linting compliance.
- **`py-analyze`** – Runs `mypy` to perform static type analysis on the Python code.
- **`py-unit-test`** – Runs unit tests with `pytest`, including coverage for the project.
