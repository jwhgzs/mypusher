#!/bin/bash
if [ ! -e "./.git" ];
then
    echo "* You are in a wrong directory!"
    exit
fi
git rm -r --cached .
git add . -A
git commit -m "upload"
git push --force
echo "* Complete!"