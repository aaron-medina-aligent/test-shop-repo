#!/bin/bash

# Define repository details
USER="aaron-medina-aligent"         # Replace with the GitHub username or organization
REPO="test-shop-repo"       # Replace with the repository name
BRANCH="main"           # Replace with the branch name, e.g., "main" or "master"

# GitHub API URL to fetch all files in the repository
API_URL="https://api.github.com/repos/$USER/$REPO/git/trees/$BRANCH?recursive=1"

# Base URL for raw content from GitHub
BASE_URL="https://raw.githubusercontent.com/$USER/$REPO/$BRANCH"

# Fetch the list of files from the GitHub API
echo "Fetching file list from $USER/$REPO..."
FILES=$(curl -s $API_URL | jq -r '.tree[] | select(.type == "blob") | .path')

# Check if jq command was successful
if [ $? -ne 0 ] || [ -z "$FILES" ]; then
    echo "Error: Unable to fetch file list. Please check your repository details and API rate limits."
    exit 1
fi

# Download each file in the repository
echo "Downloading files from $USER/$REPO..."
for FILE in $FILES; do
    echo "Downloading $FILE..."
    # Create directories as needed and download the file
    mkdir -p "$(dirname "$FILE")"
    curl -s -O "$BASE_URL/$FILE" --create-dirs
done

echo "All files downloaded successfully."
