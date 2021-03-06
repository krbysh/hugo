# !/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project. 
hugo

# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Fetch git
git pull origin/gh-pages
# Push source and build repos.
git push origin master
sleep 5
# git push https://github.com/krbysh/hugo.git `git subtree split --prefix=public --onto=https://github.com/krbysh/hugo.git/gh-pages`:gh-pages --force
# git subtree push --prefix=public https://github.com/krbysh/hugo.git gh-pages
git subtree split --prefix=public --rejoin --branch temp
git push origin temp:gh-pages
