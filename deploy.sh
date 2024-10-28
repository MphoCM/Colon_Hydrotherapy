#!/bin/bash

# Variables
$BRANCH="gh-pages"
$REMOTE="origin"

# add files to git
git add .
git commit -m "second push to github"

# 
echo "gh-pages branch does not exist on the remote. Creating the branch..."
# Create the branch locally if it doesn't exist, and push it to remote
git checkout -b gh-pages
git merge master
git push origin gh-pages
git checkout master

# Deploy by pushing to the gh-pages branch
echo "Deploying to $BRANCH..."
git add .
git commit -m "Deploying to GitHub Pages"
echo "Deployment successful!"