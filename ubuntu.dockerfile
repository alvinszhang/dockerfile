#拉取基础镜像
FROM ubuntu:22.04

#作者信息
LABEL MAINTAINER="venti"

#设置工作目录
WORKDIR /root

#更新源
RUN apt update && apt -y upgrade

#按照网络下载工具
RUN apt -y install wget curl git

# .config, github. zshrc_theme=ys

#下载使用ZSH
RUN apt -y install zsh \
    && sh -c "$(curl -fsSL https://gitee.com/mirrors/oh-my-zsh/raw/master/tools/install.sh)"

# 这里报错，wget的时候需要设置-p端口，这样才能访问外面的网络
RUN apt -y install python3 python3-dev python3-pip \
    && apt -y install cmake build-essential \
    && apt -y install ranger neofetch \
    && apt -y install nodejs

RUN pip3 install --upgrade pip \
    && pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple numpy pandas matplotlib

# vim 版本需要大于等于8.1
RUN apt -y install vim \
    && git clone http://github.com/theniceboy/.vim

apt -y install neovim
apt -y install python3-neovim
apt -y install localepurge

