#!/bin/bash

# If a command fails then the deploy stops
set -e

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo -t tranquilpeak-sehan

# Go To Public folder
cd sehandev.github.io
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site $(date)"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
