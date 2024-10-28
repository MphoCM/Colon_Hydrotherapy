#!/bin/bash

# Define variables
BRANCH="gh-pages"
REMOTE="origin"

# Check if the gh-pages branch exists on the remote
if git ls-remote --exit-code --heads $REMOTE $BRANCH > /dev/null; then
  echo "$BRANCH branch exists on the remote. Proceeding with deployment..."
else
  echo "$BRANCH branch does not exist on the remote. Creating the branch..."
  # Create the branch locally if it doesn't exist, and push it to remote
  git checkout -b $BRANCH
  git push -u $REMOTE $BRANCH
  git checkout main
fi

# Deploy by pushing to the gh-pages branch
echo "Deploying to $BRANCH..."
git add .
git commit -m "Deploying to GitHub Pages"
if git push $REMOTE `git subtree split --prefix dist main`:$BRANCH --force; then
  echo "Deployment successful!"
else
  echo "Error during deployment. Forcing remote $BRANCH to match local branch."
  # Force push local branch to remote gh-pages
  git push $REMOTE $BRANCH --force
  echo "Forced deployment completed successfully."
fi
