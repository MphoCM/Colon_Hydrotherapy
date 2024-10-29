#!/bin/bash

# add files to git
git add .
git commit -m "checking the deployment"

# Push to the gh-pages repository
git checkout gh-pages
git reset --hard main
git push --force origin gh-pages
git checkout main

# Deployment successful
echo "Deployment successful!"