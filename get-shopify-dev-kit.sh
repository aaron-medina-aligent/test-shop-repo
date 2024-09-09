#!/bin/bash

# GitHub repository URL
REPO_URL="https://raw.githubusercontent.com/aaron-medina-aligent/test-shop-repo/main"

# List of files and folders to download
FILES_TO_DOWNLOAD=(
    "folder1/file1.txt"
    "folder1"  # If you need to download the whole folder, you'd typically need a zip URL or use Git clone.
)

# Download each file/folder specified in FILES_TO_DOWNLOAD
for FILE in "${FILES_TO_DOWNLOAD[@]}"; do
    FILE_URL="${REPO_URL}/${FILE}"
    echo "Downloading ${FILE_URL}..."
    curl -O "$FILE_URL"
done
