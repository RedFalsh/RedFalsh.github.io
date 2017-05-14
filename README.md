# RedFalsh.github.io
hexo

## 同步步骤:

1. 从git仓库中获取

`git clone git@github.com:RedFalsh/RedFalsh.github.io.git`

2. 复制python脚本
push_branch_blog.py用于更新修改的博客上传到blog分支中

`cp RedFalsh.github.io/push_branch_blog ` 

pull_branch_blog.py用于同步github上的blog分支到本地

`cp RedFalsh.github.io/pull_branch_blog `

3. 运行

`python3 push_branch_blog.py`

`python3 pull_branch_blog.py`
