# user-repo-cleanup-script
- > **! IMPORTANT**: This script prompts you (yes or no) before deleting each repository. It fetches user repository only, not organization repository.

- This repository contains a shell script that allows you to delete your GitHub repositories after confirming each one. The script fetches both public and private repositories associated with your GitHub account and prompts you for confirmation before deletion.

## Prerequisites

- **jq**: A command-line JSON processor. Install it using your package manager:
  - On Ubuntu/Debian: `sudo apt-get install jq`
  - On macOS: `brew install jq`
  
- **curl**: A command-line tool to transfer data from or to a server. Most systems come with `curl` pre-installed.

## Setup

1. Clone this repository:

    ```bash
    git clone https://github.com/ArunkumarSelvaraj-M/user-repo-cleanup-script.git
    cd repo-deleter
    ```

2. Open the script file (`delete_repos.sh`) and set the following variables:

    - `GITHUB_USERNAME`: Your GitHub username.
    - `AUTH_TOKEN`: Your GitHub Personal Access Token. Make sure to generate a token with the necessary permissions to delete repositories. 

    ```bash
    GITHUB_USERNAME="your-github-username"
    AUTH_TOKEN="your-github-token"
    ```

3. Save the file.

## Usage

1. Run the script:

    ```bash
    bash delete_repos.sh
    ```

2. The script will list all your public and private repositories and ask if you want to delete each one.

    ```bash
    Do you want to delete the repository 'user/repo-name'? (yes/no)(y/n):
    ```

3. Enter `yes` or `y` to delete the repository, or `no` or `n` to skip it.

4. If the repository is successfully deleted, you will see a confirmation message:

    ```bash
    Repository 'user/repo-name' has been deleted.
    ```

## Important Notes

- **Personal Access Token**: Be careful with your Personal Access Token. Do not share it publicly or commit it to a public repository.
- **Script Scope**: This script only deletes repositories under your personal GitHub account. It does not affect repositories under organizations.

## License

This project is licensed under the MIT License.

