#!/bin/bash
sdir=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
token=`cat "$sdir/config/token.txt"`
user=`cat "$sdir/config/user.txt"`
repo="${PWD##*/}"
url="https://${token}@github.com/${user}/${repo}.git"
git remote set-url origin "${url}"
echo "* Complete!"