# fxtz
在使用git进行版本控制的前提下。提交时，保证默认提交信息开头。需要自己push

## 如何使用 
#### 创建分支 && 指定提交信息开头(newBranch.sh)
`sh newBranch.sh "新分支名称" "信息开头"`

#### commit代码(newBranchCommit.sh)
`sh newBranchCommit.sh "后续详细日志"` 


#### 使用样例
```
# 创建新分支 myBranch
sh newBranch.sh myBranch "this is my branch. "

# 进行一些文件修改
...

# 提交自己的修改
sh newBranchCommit.sh "add my files into branch"

# 查看git log
git log -n 1
```
