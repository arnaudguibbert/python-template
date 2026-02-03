import os
import shutil

GH_FOLDER = "./.github"
VSCODE_FOLDER = "./.vscode"
PRE_COMMIT_CONFIG = "./.pre-commit-config.yaml"

if __name__ == "__main__":

    keep_gh_folder = {{ cookiecutter.include_gh_cicd }}
    keep_vscode_folder = {{ cookiecutter.include_vscode_settings }}
    keep_pre_commit = {{ cookiecutter.include_pre_commit }}

    if not keep_gh_folder:
        shutil.rmtree(GH_FOLDER)
    if not keep_vscode_folder:
        shutil.rmtree(VSCODE_FOLDER)
    if not keep_pre_commit:
        os.remove(PRE_COMMIT_CONFIG)