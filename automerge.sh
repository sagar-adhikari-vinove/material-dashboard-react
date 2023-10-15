#!/bin/bash

# Define the branches
dev_branch="dev"
master_branch="master"

# Navigate to your Git repository directory
#cd /path/to/your/repo

# Check out the master branch
git checkout $master_branch

# Pull the latest changes from the remote repository
git pull

# Check out the dev branch
git checkout $dev_branch

if ! git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null; then
  git push --set-upstream origin $dev_branch
fi
# Merge the dev branch into the master branch
git merge $master_branch

# Push the changes to the remote repository
git push

# Check out the master branch again (optional)
git checkout $master_branch
