#!/bin/bash

commit=$1

# try to commit without message
if [ ! -n ${commit} ] ;then
    echo "how dare you!  o(≧口≦)o "
    exit 0
fi

# try to get baseLog
branchLog="branchLog"
if [ ! -e ${branchLog} ] ; then
    echo "file ${branchLog} not exist. exit"
    exit 0
fi

result=`git branch | grep "\*" | sed "s/*//"`
result=`echo ${result}`
# echo ${result}
baseLog=`cat ${branchLog} | grep "^${result}" | awk -F '-----' '{print $2}'`
# echo ${baseLog}

git add ./*
git commit -m "${baseLog} ${1}"
# print last git log
git log -n 1

echo "finish"