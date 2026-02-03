TEST_PROJECT_DIR=rootpkg
TEST_PROJECT_NAME=testpkg

.PHONY: create-tmp-project-no-input
create-tmp-project-no-input:
	rm -rf $(TEST_PROJECT_DIR)
	uv run cookiecutter ./ \
		--no-input \
		project_name="$(TEST_PROJECT_NAME)" \
		project_dir="$(TEST_PROJECT_DIR)" \
		description="This is a test description." \
		include_gh_cicd=False \
		include_vscode_settings=False \
		include_pre_commit=True

.PHONY: create-tmp-project
create-tmp-project:
	rm -rf $(TEST_PROJECT_DIR)
	uv run cookiecutter ./