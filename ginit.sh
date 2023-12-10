#!/bin/bash
sdir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
token=`cat "$sdir/config/token.txt"`
user=`cat "$sdir/config/user.txt"`
read -p "* Please enter your repo name: " repo
url="https://${token}@github.com/${user}/${repo}.git"
git init
git remote add origin "${url}"
git rm -r --cached .
git add . -A
git commit -m "upload"
git push -u origin master
echo "* Complete!"