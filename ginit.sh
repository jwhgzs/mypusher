#!/bin/bash
token=`cat ./config/token.txt`
user=`cat ./config/user.txt`
repo="${PWD##*/}"
url="https://${token}@github.com/${user}/${repo}.git"
git init
git remote add origin "${url}"
git rm -r --cached .
git add . -A
git commit -m "upload"
git push -u origin master
echo "* Complete!"