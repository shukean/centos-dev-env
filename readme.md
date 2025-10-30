# 离线安装

### 执行初始化脚本, 将依赖包对应的软件版本下载到本地.  
``` bash
git clone https://github.com/shukean/centos-dev-env.git
cd centos-dev-env
# 下载对应版本的依赖包
sh download.sh

# 将其进行压缩后上传到对应的开发机
cd ..
tar -zcf centos-dev-env.tar.gz centos-dev-env
```

### 上传 centos-dev-env 包到 $HOME 目录下.
``` bash
tar -xf centos-dev-env.tar.gz  -C ~/
cd ~/centos-dev-env
# 创建软件安装目录
mkdir local
# 按照对应的系统软件包, 需要 root 权限
sh yum.sh
```

### 开始编译和按照依赖
``` bash

# 编辑 cc.cfg  文件, 修改对应的 gcc 和 g++ 信息

# 编译 python 版本依赖
sh libffi-3.4.2.sh
sh bzip2-1.0.8.sh

# 编译 python
sh Python-3.8.11.sh

# 编译 fzf 查询文件相关的 vim 插件
sh the_silver_searcher-2.2.0.sh
sh fzf-0.56.3.sh

# 编译支持python的 vim
sh vim-8.1.2424.sh

# 编译 YouCompleteMe 依赖的 cmake 版本
sh cmake-3.14.7.sh

# 编译 YouCompleteMe
cd ~/centos-dev-env/vim-plugs
sh build_yacc.sh

# 部署软连信息
cd ~/centos-dev-env
sh install_links.sh

# 加载新的 bash 信息
source ~/.fzf.bash
source ~/.local/bashrc

```
