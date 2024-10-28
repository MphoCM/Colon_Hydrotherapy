#!/bin/bash

# Variables
$BRANCH="gh-pages"
$REMOTE="origin"

# add files to git
git add .
git commit -m "second push to github"

# Push to the gh-pages repository
git checkout gh-pages
git merge master
git add .
git push gh-pages
git checkout master

# Deployment successful
echo "Deployment successful!"