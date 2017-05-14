---
title: Hexo——Next主题配置文件说明
date: 2017-03-30 21:04:04
tags: 
- Hexo
- Next
categories: 
- Learn
- Hexo

---


## 启用主题
cmd窗口输入
`hexo s`
浏览器输入 `http://localhost:4000` 

![Alt text](/images/1.png)

## 配置

### 站点配置文件
路径`C:\Users\Administrator\blog\_config.yml`
```
# Hexo Configuration
## Docs: https://hexo.io/docs/configuration.html
## Source: https://github.com/hexojs/hexo/
# Site 网站
title: 为学   #网站标题
subtitle: 天下事有难易乎？为之，则难者亦易矣；不为，则易者亦难矣。   #网站副标题
description: 天下事有难易乎？为之，则难者亦易矣；不为，则易者亦难矣。   #网站描述
author: willxue   #您的名字
language: zh-CN   #网站使用的语言
timezone:           #网站时区。Hexo 默认使用您电脑的时区

# URL 网址
## 如果您的网站存放在子目录中，例如 http://yoursite.com/blog，则请将您的 url 设为 http://yoursite.com/blog 并把 root 设为 /blog/。
url: http://willxue.top
permalink: :year/:month/:day/:title/    #生成文件名字的格式我改成blog/:title:year:month:day/
permalink_defaults:

# Directory 目录配置
source_dir: source   #源文件夹，这个文件夹用来存放内容。
public_dir: public   #公共文件夹，这个文件夹用于存放生成的站点文件。
tag_dir: tags   #标签文件夹
archive_dir: archives   #归档文件夹
category_dir: categories   #分类文件夹
code_dir: downloads/code    #nclude code 文件夹
i18n_dir: :lang   #国际化（i18n）文件夹
skip_render:   #跳过指定文件的渲染，您可使用 glob 表达式来匹配路径。

# Writing 文章
new_post_name: :title.md   # 新建文章默认文件名
default_layout: post   # 默认布局
titlecase: false   # Transform title into titlecase
external_link: true   # 在新标签中打开一个外部链接，默认为true
filename_case: 0   #转换文件名，1代表小写；2代表大写；默认为0，意思就是创建文章的时候，是否自动帮你转换文件名，默认就行，意义不大。
render_drafts: false   #是否渲染_drafts目录下的文章，默认为false
post_asset_folder: false   #启动 Asset 文件夹
relative_link: false   #把链接改为与根目录的相对位址，默认false
future: true   #显示未来的文章，默认false
highlight:   #代码块的设置 
  enable: true
  line_number: true
  auto_detect: false
  tab_replace:

# Category & Tag   分类和标签的设置
default_category: uncategorized   #默认分类
category_map:   #分类别名
tag_map:   #标签别名

# Date / Time format
## Hexo uses Moment.js to parse and display date
## You can customize the date format as defined in
## http://momentjs.com/docs/#/displaying/format/
date_format: YYYY-MM-DD
time_format: HH:mm:ss

# Pagination 分页
## Set per_page to 0 to disable pagination
per_page: 10   #每页显示的文章量 (0 = 关闭分页功能)
pagination_dir: page   #分页目录

# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next

feed:
  type: atom       #feed 类型 (atom/rss2)
  path: atom.xml   #rss 路径
  limit: 20        #在 rss 中最多生成的文章数(0显示所有)

# Deployment
## Docs: https://hexo.io/docs/deployment.html
deploy: 
type: git 
  repository: https://github.com/imwillxue/imwillxue.github.com.git 
  branch: master

```

### 主题配置文件
路径`C:\Users\Administrator\blog\themes\next\_config.yml`

```

# ---------------------------------------------------------------
# Site Information Settings
# ---------------------------------------------------------------

# Place your favicon.ico to /source directory.
favicon: /favicon.ico   #站标  可以放在hexo文件夹下的/source里

# Set default keywords (Use a comma to separate)
keywords: "为学,willxue,willxue.top"  #网站关键字

# Set rss to false to disable feed link.
# Leave rss as empty to use site's feed link.
# Set rss to specific value if you have burned your feed already.
rss:  #rss这里不设置 引文站点配置文件已经配置了 需要安装插件

# Specify the date when the site was setup
since: 1990  #网站时间 从xx开始 类似 1990-2016


# ---------------------------------------------------------------
# Menu Settings
# ---------------------------------------------------------------

# When running hexo in a subdirectory (e.g. domain.tld/blog)
# Remove leading slashes ( "/archives" -> "archives" )
menu: #菜单路径设置 如果hexo在二级目录放置要去掉/
  home: /
  archives: /archives #归档
  tags: /tags #标签
  categories: /categories  #分类
  about: /about #关于我
  commonweal: /404.html  #公益404


# Enable/Disable menu icons.
# Icon Mapping:
#   Map a menu item to a specific FontAwesome icon name.
#   Key is the name of menu item and value is the name of FontAwsome icon.
#   When an question mask icon presenting up means that the item has no mapping icon.
menu_icons:  #icon图标
  enable: true
  # Icon Mapping.
  home: home
  about: user
  categories: th
  tags: tags
  archives: archive
  commonweal: heartbeat




# ---------------------------------------------------------------
# Scheme Settings
# ---------------------------------------------------------------

# Schemes  #next的三个scheme
#scheme: Muse
#scheme: Mist
scheme: Pisces



# ---------------------------------------------------------------
# Sidebar Settings
# ---------------------------------------------------------------


# Social links   #社交链接
social:
  GitHub: 
  Weibo:
  Others:

# Social Icons  #社交的图标
social_icons:
  enable: true
  # Icon Mappings
  GitHub: github
  Twitter: twitter
  Weibo: weibo


# Sidebar Avatar
# in theme directory(source/images): /images/avatar.jpg
# in site  directory(source/uploads): /uploads/avatar.jpg
# default : /images/default_avatar.jpg
avatar: http://7xrz9n.com1.z0.glb.clouddn.com/logo.png #头像


# TOC in the Sidebar  #文章自动显示目录
toc:
  enable: true

  # Automatically add list number to toc.  #目录是否自动显示数字序号
  number: false


# Creative Commons 4.0 International License.
# http://creativecommons.org/  #自由协议
# Available: by | by-nc | by-nc-nd | by-nc-sa | by-nd | by-sa | zero
#creative_commons: by-nc-sa
#creative_commons:

sidebar:
  # Sidebar Position, available value: left | right
  position: left
  #position: right

  # Sidebar Display, available value:
  #  - post    expand on posts automatically. Default.
  #  - always  expand for all pages automatically
  #  - hide    expand only when click on the sidebar toggle icon.
  #  - remove  Totally remove sidebar including sidebar toggle icon.
  display: post
  #display: always
  #display: hide
  #display: remove



# ---------------------------------------------------------------
# Misc Theme Settings
# ---------------------------------------------------------------

# Custom Logo.
# !!Only available for Default Scheme currently.
# Options:
#   enabled: [true/false] - Replace with specific image
#   image: url-of-image   - Images's url
custom_logo:
  enabled: false
  image:


# Code Highlight theme
# Available value:
#    normal | night | night eighties | night blue | night bright
# https://github.com/chriskempson/tomorrow-theme
highlight_theme: night

# Automatically scroll page to section which is under <!-- more --> mark.
scroll_to_more: true

# Automatically Excerpt
auto_excerpt:
  enable: false
  length: 150

# Use Lato font
use_font_lato: true



# ---------------------------------------------------------------
# Third Party Services Settings
# ---------------------------------------------------------------

# MathJax Support
mathjax:


# Swiftype Search API Key
#swiftype_key:

# Baidu Analytics ID
#baidu_analytics:

# Duoshuo ShortName
duoshuo_shortname: imwillxue

# Disqus
#disqus_shortname:

# Baidu Share
# Available value:
#    button | slide
#baidushare:
##  type: button

# Share
#jiathis:
#add_this_id:

# Share
duoshuo_share: true

# Google Webmaster tools verification setting
# See: https://www.google.com/webmasters/
#google_site_verification:


# Google Analytics
#google_analytics:

# CNZZ count
#cnzz_siteid:


# Make duoshuo show UA
# user_id must NOT be null when admin_enable is true!
# you can visit http://dev.duoshuo.com get duoshuo user id.
duoshuo_info:
  ua_enable: true
  admin_enable: true
  user_id: 6262178932196377345
  admin_nickname: 神


# Facebook SDK Support.
# https://github.com/iissnan/hexo-theme-next/pull/410
facebook_sdk:
  enable: false
  app_id:       #<app_id>
  fb_admin:     #<user_id>
  like_button:  #true
  webmaster:    #true


# Show number of visitors to each article.
# You can visit https://leancloud.cn get AppID and AppKey.
leancloud_visitors:
  enable: true
  app_id: QImiFijLSOHYufsazlBVlwLg-gzGzoHsz
  app_key: AMcYaNHy9Y5OdH42k0d4uSED


# Tencent analytics ID
# tencent_analytics:

# Enable baidu push so that the blog will push the url to baidu automatically which is very helpful for SEO
baidu_push: true

## 文章末尾是否显示打赏按钮
donate: 
  enable: true
  text: Enjoy it ? Donate me !  欣赏此文？求鼓励，求支持！
  alipay: 
  wechat: 


#! ---------------------------------------------------------------
#! DO NOT EDIT THE FOLLOWING SETTINGS
#! UNLESS YOU KNOW WHAT YOU ARE DOING
#! ---------------------------------------------------------------

# Motion
use_motion: true

# Fancybox
fancybox: true

# Static files
vendors: vendors
css: css
js: js
images: images

# Theme version
version: 0.5.0

```
