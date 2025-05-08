TEST_PROJECT_SLUG=rootpkg
TEST_PROJECT_NAME=testpkg

.PHONY: create-tmp-project
create-tmp-project:
	uv run cookiecutter ./ \
		--no-input \
		project_name="$(TEST_PROJECT_NAME)" \
		project_slug="$(TEST_PROJECT_SLUG)" \
		description="This is a test description."