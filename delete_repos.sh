# Define the GitHub username and the authorization token
GITHUB_USERNAME="<ENTER YOUR USERNAME>"
AUTH_TOKEN="<ENTER YOUR TOKEN>"

# Fetch public repositories
public_repos=$(curl -s "https://api.github.com/users/$GITHUB_USERNAME/repos?per_page=100&page=1" | jq -r '.[] | .full_name')

# Fetch private repositories
private_repos=$(curl -s -H "Authorization: token $AUTH_TOKEN" "https://api.github.com/user/repos?visibility=private" | jq -r '.[].full_name')

# Combine public and private repositories into an array
IFS=$'\n' read -rd '' -a all_repos <<<"$public_repos"$'\n'"$private_repos"

# Iterate over each repository and ask for confirmation before deleting
for repo in "${all_repos[@]}"; do
    if [[ -n "$repo" ]]; then
        read -p "Do you want to delete the repository '$repo'? (yes/no)(y/n): " confirm
        if [[ "$confirm" == "yes" || "$confirm" == "y" ]]; then
            response=$(curl -s -o /dev/null -w "%{http_code}" -X DELETE -H "Authorization: token $AUTH_TOKEN" "https://api.github.com/repos/$repo")
            if [[ "$response" == "204" ]]; then
                echo "Repository '$repo' has been deleted."
            else
                echo "Failed to delete repository '$repo'. HTTP response code: $response"
            fi
        else
            echo "Repository '$repo' not deleted."
        fi
    fi
done
