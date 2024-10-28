#!/bin/bash

# Variables
$BRANCH="gh-pages"
$REMOTE="origin"

# add files to git
git add .
git commit -m "second push to github"

# 
if git ls-remote --exit-code --heads master gh-pages > /dev/null; then
  echo "gh-pages branch exists on the remote. Proceeding with deployment..."
  wait 5
else
  echo "gh-pages branch does not exist on the remote. Creating the branch..."
  # Create the branch locally if it doesn't exist, and push it to remote
  git checkout -b gh-pages
  git merge master
  git push origin gh-pages
  git checkout master
fi

# Deploy by pushing to the gh-pages branch
echo "Deploying to $BRANCH..."
git add .
git commit -m "Deploying to GitHub Pages"
  echo "Deployment successful!"
else
  echo "Error during deployment. Forcing remote $BRANCH to match local branch."
  # Force push local branch to remote gh-pages
  git push $REMOTE $BRANCH --force
  echo "Forced deployment completed successfully."
fi
