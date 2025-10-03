import shutil

GH_FOLDER = "./.github"
VSCODE_FOLDER = "./.vscode"

if __name__ == "__main__":

    keep_gh_folder = {{ cookiecutter.include_gh_cicd }}
    keep_vscode_folder = {{ cookiecutter.include_vscode_settings }}

    if not keep_gh_folder:
        shutil.rmtree(GH_FOLDER)
    if not keep_vscode_folder:
        shutil.rmtree(VSCODE_FOLDER)