#!/bin/bash

# This is a script for removing all local branches that has no corresponding
# remote branches anymore.

# To run this file, you need to do the following command manually first:
# chmod +x ./remove_stale_git_branches.sh
# Then run it with ./remove_stale_git_branches.sh
# Or here's a one-liner
# chmod +x ./remove_stale_git_branches.sh && ./remove_stale_git_branches.sh

# Fetch the latest branch information from the remote origin
# The -p or --prune removes any local references between local branches
# and the deleted remote branches
git fetch -p

# Get the list of local branches that have been deleted on the remote origin
# git branch -vv - displays verbose information of local branches
# grep ': gone' - finds the branches with no remote references
# awk '{print $1}' - grab only the the branch name from each line
branches_to_delete=$(git branch -vv | grep ': gone]' | awk '{print $1}')

# Delete each branch
for branch in $branches_to_delete; do
  git branch -D $branch
done
