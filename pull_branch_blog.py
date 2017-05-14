#!/usr/bin/env python
# encoding: utf-8

import os

name = 'RedFalsh.github.io'
# 查询文件是否存在
if os.path.exists('%s'%name):
    print('%s is exists'%name)
    os.chdir('%s'%name)
    os.system('git pull origin blog')
    os.chdir('..')
else:
    os.system('git clone git@github.com:RedFalsh/RedFalsh.github.io.git')

# 复制source文件夹
print('cp -r %s/source/ source/'%name)
os.system('cp -r %s/source/ source/'%name)
# 复制_config.yml文件
print('cp %s/_config.yml _config.yml'%name)
os.system('cp %s/_config.yml _config.yml'%name)

# 复制主题文件
themes_files = os.listdir('%s/themes/'%name)
for theme in themes_files:
    if os.path.exists('themes/%s'%theme):
        print('cp %s/themes/%s/_config.yml themes/%s/config.yml'%(name,theme,theme))
        os.system('cp %s/themes/%s/_config.yml themes/%s/config.yml'%(name,theme,theme))
    else:
        print('the %s dir is not exists!!!'%theme)

# 提交到github上面
# os.chdir(r'%s'%name)
# os.system('git add ./')
# os.system('''git commit -m "备份blog文件"''')
# os.system('git push origin blog')


