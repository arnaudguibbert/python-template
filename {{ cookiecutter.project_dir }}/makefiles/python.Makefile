OUTPUT_BADGE_PATH=./reports/coverage/badge.svg

.PHONY: py-format
py-format:
	uv run ruff format

.PHONY: py-format-check
py-format-check:
	uv run ruff format --check

.PHONY: py-lint
py-lint:
	uv run ruff check --fix

.PHONY: py-lint-check
py-lint-check:
	uv run ruff check

.PHONY: py-structure
py-structure:
	$(MAKE) -k py-format py-lint

.PHONY: py-analyze
py-analyze:
	uv run mypy

.PHONY: py-debug-test
py-debug-test:
	uv run pytest -s tests -m debug

.PHONY: py-unit-test
py-unit-test:
	uv run pytest --cov=$(PROJECT_NAME) \
		--cov-report term-missing \
		--cov-report xml:reports/coverage/coverage.xml \
		tests/unit
	uv run genbadge coverage --output-file $(OUTPUT_BADGE_PATH)

.PHONY: py-test
py-test:
	uv run pytest --cov=$(PROJECT_NAME) --cov-report term-missing tests

.PHONY: py-doclint
py-doctlint:
	pydoclint --style $(DOCTSTRING_STYLE) $(PROJECT_NAME)