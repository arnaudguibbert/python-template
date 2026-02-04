
# About the template structure

This doc describes the structure of the template and goes through each file of the template and explains how to work with it. 

In this doc, for the sake of simplicity, we will assume that we created a project named `theproject` using the template. This has been done with the following command:
```console
foo@bar:~$ cookiecutter https://github.com/arnaudguibbert/python-template.git
[1/3] project_name (): theproject
[2/3] project_dir (): source
[3/3] description (): This is a project demo for the documentation
```

# Folder structure

After cloning the template with cookiecutter, one will end up with the following structure:

```
source
├── .github[Optional]                             
│   └── workflows                       -> Github CICD workflows 
│       ├── call                        -> workflow_call
│       │   ├── build.yml               -> build workflow
│       │   └── publish.yml             -> publish workflow
│       └── cicd.yml                    -> CICD workflow
├── .vscode[Optional]
│   └── settings.json                   -> VSCode workspace settings
├── makefiles                                   
│   ├── env.Makefile                    -> Python environment makefile commands
│   └── python.Makefile                 -> Python makefile commands 
├── tests                               -> tests folder
│   ├── unit                            -> unit tests folder
│   │   ├── __init__.py                 
│   │   └── test_dummy.py               -> dummy test to test dummy.py file
│   └── __init__.py
├── theproject                          -> theproject source code
│   ├── __init__.py
│   └── dummy.py                        -> a dummy file containing a dummy function
├── .gitignore                          -> gitignore file
├── .python-version                     -> Python version lock file
├── Makefile                            -> main Makefile wrapping up commands in makefiles folder
├── .pre-commit-config.yaml[Optional]   -> pre-commit file invoked before every commit
├── pyproject.toml                      -> theproject metadata and build configuration
├── README.md                           -> Documentation
└── VERSION                             -> Version of the package
```

This can seem a lot of files at first sight but we will go through each file and folder. Also you will notice that most of the files won't be touched along your projects.

# Files description

For every file specified above we will describe its content and give insights on how to use it. We recommend to follow the order in which we are presenting the files but if you're only interested in a specific file, just click on the link below.

- `source`
  - [`.github`](#github)
    - `workflows`
      - `call`
        - [`build.yml`](#buildyml)
      - [`cicd.yml`](#cicdyml)
  - [`.vscode`](#vscode)
    - [`settings.json`](#settingsjson)
  - [`makefiles`](#makefiles)
    - [`env.Makefile`](#envmakefile)
    - [`python.Makefile`](#pythonmakefile)
  - [`tests`](#tests)
    - `unit`
      - `__init__.py`
      - [`test_dummy.py`](#test_dummypy)
    - `__init__.py`
  - [`theproject`](#theproject)
    - `__init__.py`
    - [`dummy.py`](#dummypy)
  - [`.gitignore`](#gitignore)
  - [`.python-version`](#python-version)
  - [`Makefile`](#makefile)
  - [`.pre-commit-config.yaml`](#pre-commit-configyaml)
  - [`pyproject.toml`](#pyprojecttoml)
  - [`README.md`](#readmemd)
  - [`VERSION`](#version)

## `theproject`

The `theproject` folder contains the **main source code** of the Python package created using this template. It is the core of the project. The folder structure adheres to best practices for Python packaging, promoting clean code organization and easy distribution.

### Usage in the Template
- Add all your core modules, sub-packages, and logic inside this folder.
- Include an `__init__.py` file in every subfolder to mark it as a package and modules.

### `dummy.py`

> [!NOTE]
> This is a placeholder file. Remove it once you start writing real source code.

`dummy.py` is a placeholder file included in the template to demonstrate how to structure source files and implement basic functions with docstrings and type hints.

**File Content Overview:**
```python
def dummy_fn(str_input: str) -> str:
    """Returns the input string. This function should be removed
    before pushing your package to production.

    Args:
        str_input (str): input string.

    Returns:
        str: input string.
    """
    return str_input
```

The function dummy_fn takes a string input and returns it unchanged. It serves as a basic example to ensure your testing infrastructure and CI pipeline are functioning correctly.

---

## `tests`

The `tests` folder contains all unit tests for the `theproject` package. It follows a standard testing layout using [`pytest`](https://docs.pytest.org/). Each module or feature in `theproject` should have a corresponding test module under `tests/unit`.

### Usage in the Template
- Add your unit tests inside `tests/unit` following the structure of your source code.
- Include `__init__.py` files to ensure test discovery in all Python versions.
- Run tests using `pytest` directly or through the provided `Makefile`. See [makefiles](#makefiles) section

### `test_dummy.py`

> [!NOTE]
> This is a placeholder test file. Remove it once you start writing real tests.

This file tests the example function `dummy_fn` from `theproject.dummy`. It uses two features of `pytest`:
- `@pytest.mark.parametrize` to test the function with multiple inputs.
- A custom marker `@pytest.mark.dummy` to optionally group or filter these tests.

**File Content Overview:**
```python
import pytest

from theproject.dummy import dummy_fn


@pytest.mark.dummy
@pytest.mark.parametrize("str_input", ["test", ""])
def test_dummy_fn(str_input: str) -> None:
    assert dummy_fn(str_input) == str_input
```

This test verifies that `dummy_fn` correctly returns the input string. It serves as a basic example to ensure your testing infrastructure and CI pipeline are functioning correctly.

---

## `pyproject.toml`

The `pyproject.toml` file defines the build system, project metadata, dependency management, and tool configurations for `theproject`. It centralizes all project-level configurations in a single, standardized file.

This template uses [`setuptools`](https://setuptools.pypa.io/en/latest/) as the build backend, and supports [PEP 621](https://peps.python.org/pep-0621/) for project metadata.

### Usage in the Template
- Defines `theproject` metadata (name, version, description).
- Dynamically reads the version and README from [`VERSION`](#VERSION) and [`README.md`](#READMEmd).
- Lists dev dependencies using [`uv`](https://github.com/astral-sh/uv) under `[dependency-groups]`.

### `ruff`

> [!NOTE]
> [`ruff`](https://docs.astral.sh/ruff/) is a fast Python linter and code formatter.

Ruff helps maintain a consistent code style and catch common issues by enforcing linting rules and formatting. In this template, it's used to ensure clean, readable, and standardized Python code across the project.

📘 **Config reference:** [Ruff Configuration](https://docs.astral.sh/ruff/configuration/)


### `ty`

> [!NOTE]
> [`ty`](https://docs.astral.sh/ty/) is an extremely fast Python type checker and language server, written in Rust, by Astral.

ty checks that your code adheres to the type hints you've written. It helps catch bugs early by ensuring type correctness before runtime. The template includes `ty` for type safety across both the application and tests.

📘 **Config reference:** [ty Configuration](https://docs.astral.sh/ty/reference/configuration/)


### `pytest`

> [!NOTE]
> [`pytest`](https://docs.pytest.org/en/latest/) is a powerful testing framework for Python.

Pytest is used in the template to run unit tests. It supports fixtures, parameterized testing, and rich plugin integration.

📘 **Config reference:** [Pytest Configuration](https://docs.pytest.org/en/stable/reference/customize.html#pytest-ini)

---

## `README.md`

The `README.md` file is the main entry point for understanding and using `theproject`. It provides setup instructions, a quick start section, and developer documentation to help contributors get started quickly.
- Introduces the project and its dependencies.
- Guides users through setting up a virtual environment with [`uv`](https://github.com/astral-sh/uv).
- Documents folder structure and local development workflows.
- Provides Makefile command documentation for common development tasks.

---

## `VERSION`

The `VERSION` file defines the current version of `theproject`. It is read dynamically by the [`pyproject.toml`](#pyprojecttoml) configuration to set the project version during build and packaging.
- Stores the version number in a plain text format.
- Keeps versioning separate from source code for easier automation and updates.
- Used by tools like [`setuptools`](https://setuptools.pypa.io/en/latest/) to populate metadata fields during packaging.

### Usage in the Template

- Update this file manually as you increment your project’s version (e.g., `0.1.0`, `1.0.0`).
- The version is automatically picked up by the `[tool.setuptools.dynamic]` section in [`pyproject.toml`](#pyprojecttoml):
```toml
[tool.setuptools.dynamic]
version = { file = "VERSION" }
```

---

## `.python-version`

The `.python-version` file specifies the Python version to be used for the project. This is primarily used by [`uv`](https://github.com/astral-sh/uv) Python package managers.

### Usage in the Template

- Ensures consistency across development environments by pinning the Python version to `3.13`.
- `uv` automatically uses this version when you create a virtual environment:
    ```
    uv venv
    ```

---

## `.gitignore`

The `.gitignore` file specifies which files and folders Git should exclude from version control. It prevents unnecessary or sensitive files—such as caches, virtual environments, logs, and local settings—from being committed.

### Usage in the Template

- Covers Python-specific patterns (e.g., `__pycache__`, `.venv/`).
- Excludes tool-generated files (e.g., `.ruff_cache/`, `.pytest_cache/`, `uv.lock`).
- Safe to extend with project-specific exclusions as needed.

📘 **Reference:** [GitHub gitignore templates](https://github.com/github/gitignore)

---

## `makefiles`

The `makefiles` folder contains modular `Makefile` components used to automate and streamline routine development tasks. Splitting concerns across `env.Makefile` and `python.Makefile` helps keep the main `Makefile` organized and maintainable.

Using `make` provides a clean way to **wrap complex or repetitive commands** into named targets, allowing developers to easily execute common operations with a simple and consistent CLI interface.

### Example Usage

From the root of the project, you can run any command like:

```bash
make <make_target_name>
```

Replace `<make_target_name>` with the name of the target you want to run. Targets are detailed below.

### `env.Makefile`

This Makefile contains targets for setting up and managing the Python virtual environment using [`uv`](https://github.com/astral-sh/uv).

### Usage in the Template

- Used to initialize, sync, lock, and remove the virtual environment.
- Abstracts complex or multi-step `uv` operations into single commands.

| Make Target        | Description                                                                 |
|--------------------|-----------------------------------------------------------------------------|
| `env-init`         | Creates a relocatable virtual environment using `uv venv`.                  |
| `env-sync`         | Syncs the environment dependencies for the default group.                   |
| `env-sync-all`     | Syncs dependencies for all groups (e.g., `dev`, `test`, etc.).              |
| `env-setup`        | Runs both `env-init` and `env-sync`.                                        |
| `env-setup-dev`    | Runs both `env-init` and `env-sync-all` for full development setup.         |
| `env-lock`         | Locks the dependencies, generating or updating the `uv.lock` file.          |
| `env-delete`       | Deletes the `.venv` directory to clean up the environment.                  |

📘 **Reference:** [uv Documentation](https://github.com/astral-sh/uv)

### `python.Makefile`

This Makefile defines targets for code quality, testing, formatting, and analysis. It integrates tools like `ruff`, `ty`, `pytest`, and `genbadge`.

### Usage in the Template

- Automates linting, formatting, and testing with unified commands.
- Simplifies CI/CD and local development workflows with reusable targets.

| Make Target         | Description                                                                                     |
|---------------------|-------------------------------------------------------------------------------------------------|
| `py-format`         | Formats the codebase using `ruff format`.                                                       |
| `py-format-check`   | Checks formatting with `ruff format` without modifying files.                                                      |
| `py-lint`           | Lints the code using `ruff check` and fixes issues automatically.                               |
| `py-lint-check`     | Runs `ruff check` without making changes.                                                       |
| `py-structure`      | Runs both `py-format` and `py-lint` to enforce code standards.                                   |
| `py-analyze`        | Runs static type checks using `ty`.                                                             |
| `py-unit-test`      | Runs unit tests with coverage, generates a coverage badge using `genbadge`.                    |
| `py-doclint`        | Lints docstrings using `pydoclint` with a specified style (`DOCTSTRING_STYLE` env variable).    |

📘 **References:**
- [Ruff](https://docs.astral.sh/ruff/)
- [ty](https://docs.astral.sh/ty/)
- [Pytest](https://docs.pytest.org/en/latest/)
- [Genbadge](https://github.com/csparpa/genbadge)
- [pydoclint](https://github.com/PyCQA/pydocstyle)

---

## `.pre-commit-config.yaml`

This file defines the configuration for [`pre-commit`](https://pre-commit.com/), a framework for managing and running automated checks before each commit. It helps enforce code quality and consistency by catching issues early in the development cycle.

> [!NOTE]
> This file is **optional** and is not created by default. Set `include_pre_commit` to `True` when generating the project with Cookiecutter to include it, or add your own `.pre-commit-config.yaml` later if you prefer.

### Usage in the Template

- Runs Python-specific checks (tests, formatting, type checks, doc lints) using local `make` commands.
- Includes built-in hooks for YAML validation, whitespace cleanup, and conflict detection.

To enable pre-commit hooks locally, run:
```bash
pre-commit install
```

📘 **Reference**: [pre-commit Documentation](https://pre-commit.com/)

---

## `.github`

The `.github` folder contains GitHub Actions workflows that define automated CI/CD pipelines for the project. These workflows help ensure code quality by running checks like linting, formatting, type analysis, and unit tests on push or pull request events.

> [!NOTE]
> This folder is **optional** and can be not created by setting `include_gh_cicd` to `False` or safely deleted if you're not using GitHub CI/CD. It's intended for users who want to integrate automated pipelines directly with GitHub.

### `_build.yml`

This is a reusable workflow designed to be called by other GitHub workflows. It performs the following tasks:

- Sets up the environment using `uv`
- Runs formatting (`ruff format`), linting (`ruff check`), type checks (`ty`)
- Executes unit tests and generates a coverage badge
- Optionally performs documentation linting with `pydoclint`

It supports a configurable working directory through the `package_dir` input.

📘 **Reference:** [GitHub Actions - Reusable Workflows](https://docs.github.com/en/actions/using-workflows/reusing-workflows)


### `cicd.yml`

This is the main CI/CD workflow. It triggers on:
- Manual dispatch (`workflow_dispatch`)
- Pushes (excluding Markdown files)
- Pull requests targeting the `master` branch

It calls the `_build.yml` workflow to execute all quality checks, providing a consistent and automated feedback loop for each commit or PR.

📘 **Reference:** [GitHub Actions - Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)

--- 

## `.vscode`

The `.vscode` folder contains editor-specific configuration files for [Visual Studio Code](https://code.visualstudio.com/). It helps standardize development experience across team members using VS Code.

> [!NOTE]
> This folder is **optional** and can be not created by setting `include_vscode_settings` to `False` or be safely deleted if you're not using VS Code. It exists to enhance convenience for developers using that editor.

### `settings.json`

This file customizes VS Code behavior for the project. In this template, it sets the default docstring format for the `autoDocstring` extension to **Google-style**:

```json
{
    "autoDocstring.docstringFormat": "google"
}
```

This ensures consistency in generated docstrings when using auto-completion tools in the editor.

📘 **Reference**: [autoDocstring - VS Code Marketplace](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)



