.PHONY: env-init
env-init:
	uv venv --relocatable

.PHONY: env-sync-all
env-sync-all:
	uv sync --all-groups

.PHONY: env-sync
env-sync:
	uv sync

.PHONY: env-setup-dev
env-setup-dev:
	$(MAKE) env-init
	$(MAKE) env-sync-all

.PHONY: env-lock
env-lock:
	uv lock

.PHONY: env-delete
env-delete:
	rm -rf .venv

.PHONY: env-install
env-install:
	uv add $(PACKAGE)

.PHONY: env-export
env-export:
	rm -f package.zip
	uv export --frozen --no-dev --no-editable -o requirements.txt
	uv pip install \
		--no-installer-metadata \
		--no-compile-bytecode \
		--python-platform aarch64-manylinux2014 \
		--python 3.13 \
		--target packages \
		-r requirements.txt
	cp -r $(PROJECT_NAME) packages/
	cd packages && uv run deterministic_zip ../package.zip .
	rm -rf packages
	rm requirements.txt
