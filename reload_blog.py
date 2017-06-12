#!/usr/bin/env python
# encoding: utf-8

import os
import sys, getopt
url = 'git@github.com:RedFalsh/RedFalsh.github.io.git'
name = 'RedFalsh.github.io'
def pull():
    # 查询文件是否存在
    if os.path.exists('%s'%name):
        print('%s is exists'%name)
        os.chdir('%s'%name)
        os.system('git pull origin blog')
        os.chdir('..')
    else:
        os.system('git clone %s'%url)

    # 复制source文件夹
    print('cp -r %s/source/* source/'%name)
    os.system('cp -r %s/source/* source/'%name)
    # 复制_config.yml文件
    print('cp %s/_config.yml _config.yml'%name)
    os.system('cp %s/_config.yml _config.yml'%name)

    # 复制主题文件
    # themes_files = os.listdir('%s/themes/'%name)
    theme_name = 'hexo-theme-next'
    if not os.path.exists('themes/%s'%theme_name):
        print('git clone https://github.com/iissnan/%s.git themes/%s'%(theme_name,theme_name))
        os.system('git clone https://github.com/iissnan/%s.git themes/%s'%(theme_name,theme_name))
    print('cp %s/themes/%s/_config.yml themes/%s/_config.yml'%(name,theme_name,theme_name))
    os.system('cp %s/themes/%s/_config.yml themes/%s/_config.yml'%(name,theme_name,theme_name))

def push():
    # 查询文件是否存在
    if os.path.exists('%s'%name):
        print('%s is exists'%name)
    else:
        os.system('git clone git@github.com:RedFalsh/RedFalsh.github.io.git')

    # 删除source文件夹
    print('sudo rm -r %s/source/'%name)
    os.system('sudo rm -r %s/source/'%name)
    # 复制source文件夹
    print('cp -r source/ %s/source/'%name)
    os.system('cp -r source/ %s/source/'%name)
    # 复制_config.yml文件
    print('cp _config.yml %s/_config.yml'%name)
    os.system('sudo cp _config.yml %s/_config.yml'%name)
    print('cp reload_blog.py %s/reload_blog.py'%name)
    os.system('cp reload_blog.py %s/reload_blog.py'%name)

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
    os.system('sudo git add ./')
    os.system('''git commit -m "备份blog文件"''')
    os.system('git push origin blog')


def help():
    try:
        opts, args = getopt.getopt(sys.argv[1:], "h", ["help","push","pull","hexo"])
    except getopt.GetoptError:
        print('error')
    for o, a in opts:
        print(o)
        print(a)
        if o in ("-h", "--help"):
            print('\t%-20s%s'%('-h or --help','help information'))
            print('\t%-20s%s'%('--push','push the blog to Github'))
            print('\t%-20s%s'%('--pull','pull the the blog from Github'))
        if o in ('','--pull'):
            print('正在同步博客分支blog到本地......')
            print('git clone %s'%url)
            pull()
        if o in ('','--push'):
            print('正在上传到博客分支blog到github......')
            print('git clone %s'%url)
            push()
        if o in ('','--hexo'):
            print('正在同步hexo到github......')
            os.system('hexo clean')
            os.system('hexo g -d')

if __name__=="__main__":
    help()




