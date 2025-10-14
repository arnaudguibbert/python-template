TEST_PROJECT_DIR=rootpkg
TEST_PROJECT_NAME=testpkg

.PHONY: create-tmp-project-no-input
create-tmp-project-no-input:
	uv run cookiecutter ./ \
		--no-input \
		project_name="$(TEST_PROJECT_NAME)" \
		project_dir="$(TEST_PROJECT_DIR)" \
		description="This is a test description."

.PHONY: create-tmp-project
create-tmp-project:
	uv run cookiecutter ./