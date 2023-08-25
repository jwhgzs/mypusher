#!/bin/bash
if [ ! -e "./package.json" ];
then
    echo "* You are in a wrong directory!"
    exit
fi
m=$1
if [[ $m -ne 1 && $m -ne 2 && $m -ne 3 ]];
then
    echo "* You must provide the increasing level of the version!"
    exit
fi
oldv=`cat ./package.json | grep "\"version" | sed -r "s/.*\"version\"\:\\ \"(.*)\".*/\1/g"`
IFS="." read -a arr <<< $oldv
arr_eid=$[${#arr[*]} - $m]
arr[$arr_eid]=$[10#${arr[$arr_eid]} + 1]
if [ $m -eq 2 ];
then
    arr[$arr_eid + 1]=0
    arr[$arr_eid - 1]=0
elif [ $m -eq 3 ];
then
    arr[$arr_eid + 1]=0
    arr[$arr_eid + 2]=0
fi
v=""
once=0
for each in ${arr[@]}
do
    if [ $once -eq 0 ];
    then
        v=$each
        once=1
    else
        v="${v}.${each}"
    fi
done
sed -i "s/\"version\"\:\\ \".*\"/\"version\"\:\\ \"${v}\"/" ./package.json
npm publish
git rm -r --cached .
git add . -A
git commit -m "v${v}"
git push
echo "* Complete: v${oldv} -> v${v}"