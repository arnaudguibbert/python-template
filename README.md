# Python template for UV

This repository contains a **cookie cutter** template for python projects using the astral suite, namely uv, ruff and, in the future, ty tools.

# Dependencies

- Python >= 3.10
- cookiecutter

# Getting started

## Installing the template

### From Github

To clone the template on your local machine simply run the following commands:

```bash
cookiecutter https://github.com/arnaudguibbert/python-template.git
```

You will asked to enter some settings for your project such as the `project_name`, `project_directory`... A full list of inputs can be found in the [Template inputs](#template-inputs) section.

Additionnally, if you want to download a specific version of the template you can add the checkout argument and add the version.

```bash
cookiecutter https://github.com/arnaudguibbert/python-template.git --checkout v0.1.0
```

## Working with the template

### Understanding the structure of the project

If you are not familiar with standard python project structure or if it is your first time using this template, we recommend you to first read the [About the template structure]() documentation. It goes through each file of the template and explains how to work with it. 

### Make commands

### Common operations

# Template inputs

| Input           | Description | Default | Required |
| --------        | -------     | -------- | ------- |
| `project_name`  | Name of your project, this will be the name of the python library                | `null` | **Yes** |
| `project_dir`   | Name of the directory where the files will be copied in                          | `null` | **Yes** |
| `description`   | A description of your project. Will be added to the `README.md` and `pyproject.toml` | `null` | **Yes** |
