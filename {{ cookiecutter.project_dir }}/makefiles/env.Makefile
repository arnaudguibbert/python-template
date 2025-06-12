.PHONY: env-init
env-init:
	uv venv --relocatable

.PHONY: env-sync-all
env-sync-all:
	uv sync --all-groups

.PHONY: env-sync
env-sync:
	uv sync

.PHONY: env-setup
env-setup:
	$(MAKE) env-init
	$(MAKE) env-sync

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