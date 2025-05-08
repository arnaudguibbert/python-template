# Silence the command display
MAKEFLAGS += -s

# Variables definition
PROJECT_NAME=$(shell grep '^name =' pyproject.toml | cut -d '"' -f2)
DOCTSTRING_STYLE=$(shell grep '^convention =' pyproject.toml | cut -d '"' -f2)

# include ./makefiles/utils.Makefile
include ./makefiles/python.Makefile
include ./makefiles/env.Makefile