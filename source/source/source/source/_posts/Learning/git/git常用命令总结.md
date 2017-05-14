---
title: Git常用命令总结
date: 2017-03-21 13:53:48
tags: 
- Git 
- Github
categories: 
- Learn
- Git

---



# git常用命令总结

## 创建

复制一个已创建的仓库:

`$ git clone ssh://haorooms@domain.com/blog.git`

创建一个新的本地仓库:

`$ git init`

本地修改显示工作路径下已修改的文件：

`$ git status`

显示与上次提交版本文件的不同：

`$ git diff`

把当前所有修改添加到下次提交中：

`$ git add`

把对某个文件的修改添加到下次提交中：

`$ git add -p <file>`

提交本地的所有修改：

`$ git commit -a`

提交之前已标记的变化：

`$ git commit`

附加消息提交：

`$ git commit -m 'message here'`

提交，并将提交时间设置为之前的某个日期:

```git commit --date="`date --date='n day ago'`" -am "Commit Message"```

修改上次提交：请勿修改已发布的提交记录!

`$ git commit --amend`

把当前分支中未提交的修改移动到其他分支

`git stash`

`git checkout branch2`

`git stash pop`

## 搜索

从当前目录的所有文件中查找文本内容：

`$ git grep "Hello"`

在某一版本中搜索文本：

`$ git grep "Hello" v2.5`

## 提交历史

从最新提交开始，显示所有的提交记录（显示hash， 作者信息，提交的标题和时间）：

`$ git log`

显示所有提交（仅显示提交的hash和message）：

`$ git log --oneline`

显示某个用户的所有提交：

`$ git log --author="username"`

显示某个文件的所有修改：

`$ git log -p <file>`

谁，在什么时间，修改了文件的什么内容：

`$ git blame <file>`

## 分支与标签

列出所有的分支：

`$ git branch`

切换分支：

`$ git checkout <branch>`

创建并切换到新分支:

`$ git checkout -b <branch>`

基于当前分支创建新分支：

`$ git branch <new-branch>`

基于远程分支创建新的可追溯的分支：

`$ git branch --track <new-branch> <remote-branch>`

删除本地分支:

`$ git branch -d <branch>`

给当前版本打标签：

`$ git tag <tag-name>`

## 更新与发布

列出当前配置的远程端：

`$ git remote -v`

显示远程端的信息：

`$ git remote show <remote>`

添加新的远程端：

`$ git remote add <remote> <url>`

下载远程端版本，但不合并到HEAD中：

`$ git fetch <remote>`

下载远程端版本，并自动与HEAD版本合并：

`$ git remote pull <remote> <url>`

将远程端版本合并到本地版本中：

`$ git pull origin master`

将本地版本发布到远程端：

`$ git push remote <remote> <branch>`

删除远程端分支：

`$ git push <remote> :<branch> (since Git v1.5.0)`

或

`git push <remote> --delete <branch> (since Git v1.7.0)`

发布标签:

`$ git push --tags`

## 合并与重置

将分支合并到当前HEAD中：

`$ git merge <branch>`

将当前HEAD版本重置到分支中:请勿重置已发布的提交!

`$ git rebase <branch>`

退出重置:

`$ git rebase --abort`

解决冲突后继续重置：

`$ git rebase --continue`

使用配置好的merge tool 解决冲突：

`$ git mergetool`

在编辑器中手动解决冲突后，标记文件为已解决冲突

`$ git add <resolved-file>`

`$ git rm <resolved-file>`

## 撤销
放弃工作目录下的所有修改：

`$ git reset --hard HEAD`

移除缓存区的所有文件（i.e. 撤销上次git add）:

`$ git reset HEAD`

放弃某个文件的所有本地修改：

`$ git checkout HEAD <file>`

重置一个提交（通过创建一个截然不同的新提交）

`$ git revert <commit>`

将HEAD重置到指定的版本，并抛弃该版本之后的所有修改：

`$ git reset --hard <commit>`

将HEAD重置到上一次提交的版本，并将之后的修改标记为未添加到缓存区的修改：

`$ git reset <commit>`

将HEAD重置到上一次提交的版本，并保留未提交的本地修改：

`$ git reset --keep <commit>`

## git submodule的使用
开发过程中，经常会有一些通用的部分希望抽取出来做成一个公共库来提供给别的工程来使用，这样就用到了git的git submodule命令。

### 添加

为当前工程添加submodule，命令如下：

`git submodule add 仓库地址 路径`

例如：

`git submodule add helloworld.git`

`git commit -m "Add submodules helloworld.git"`

其他人协同

`git clone /path/to/repos/helloworld_parent.git`

`git submodule init`

`git submodule update`

## 移除


1.删除git cache和物理文件夹

2.删除.gitmodules的内容（或者整个文件） 因为本例只有两个子模块，直接删除文件

3.删除.git/config的submodule配置 源文件

4.提交更改

github中fork了别人的项目，时时更新原项目代码

1、首先新建一个远程分支haorooms（名字可以随便取）

`git remote add haorooms git@github.com:confidence68/loupan_select.git`

2、然后fetch下haorooms的代码

`git fetch haorooms`

3、最后就可以把haorooms上的代码合并到你自己的分支上了

`git merge haorooms/master`

