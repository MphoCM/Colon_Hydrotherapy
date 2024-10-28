#!/bin/bash

# add files to git
git add .
git commit -m "checking the deployment"

# Push to the gh-pages repository
git checkout gh-pages
git merge main
git add .
git push gh-pages
git checkout main

# Deployment successful
echo "Deployment successful!"