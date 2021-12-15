#!/bin/bash

branchName=${1}
baseLog=${2}
branchLog="branchLog"

if [ ! -n "${branchName}" ] ;then
    echo "without branch name. exit"
    exit 0
fi

if [ ! -n "${baseLog}" ] ; then
    echo "without base log detail. exit"
    exit 0
fi

# checkout to branch master first
git checkout master
git pull
git status

# if already exist current branch
branchExist=`git branch | grep ${branchName} | wc -l`
if [ ${branchExist} != "0" ] ;then
    echo "${branchName} already exist. exit"
    exit 0
fi


# echo "检查日志"
# add branchName && baseLog into branchLog file
baseLogExist=`cat ${branchLog} | grep ${branchName} | wc -l`
if [ ${baseLogExist} != "0" ] ;then
    echo "${branchName} base log already exist. want to replace ? [y/Y/N/n]"
    read op
    if [ ${op} != "y" -a ${op} != "Y" ] ;then
        echo "exit"
        exit 0
    else
        sed -i '' "/^${branchName}/d" ${branchLog}
    fi
fi


# echo "add base log"

grep -n "^\s*${branchName}" ${branchLog}
# 创建本地分支
git checkout -b ${branchName}
echo "${branchName}-----${baseLog}" >> ${branchLog}

echo "finish"

