#!/usr/bin/env python
# encoding: utf-8

import os

name = 'RedFalsh.github.io'
# 查询文件是否存在
if os.path.exists('%s'%name):
    print('%s is exists'%name)
else:
    os.system('git clone git@github.com:RedFalsh/RedFalsh.github.io.git')

# 复制source文件夹
print('cp -r source/ %s/source/'%name)
os.system('cp -r source/ %s/source/'%name)
# 复制_config.yml文件
print('cp _config.yml %s/_config.yml'%name)
os.system('cp _config.yml %s/_config.yml'%name)

# 复制主题文件
themes_files = os.listdir('themes/')
for theme in themes_files:
    if os.path.exists('%s/themes/%s'%(name,theme)):
        print('cp themes/%s/_config.yml %s/themes/%s/_config.yml'%(theme,name,theme))
        os.system('cp themes/%s/_config.yml %s/themes/%s/_config.yml'%(theme,name,theme))
    else:
        print('mkdir -p %s/themes/%s'%(name,theme))
        os.system('mkdir -p %s/themes/%s'%(name,theme))
        print('cp themes/%s/_config.yml %s/themes/%s/_config.yml'%(theme,name,theme))
        os.system('cp themes/%s/_config.yml %s/themes/%s/_config.yml'%(theme,name,theme))

# 提交到github上面
os.chdir(r'%s'%name)
os.system('git add ./')
os.system('''git commit -m "备份blog文件"''')
os.system('git push origin blog')


