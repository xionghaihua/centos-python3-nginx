#base基础镜像
FROM centos:centos7.6.1810
#MAINTAINER 维护者信息
LABEL maintainer='xhaihua xionghaihua@distrii.com'

#设置环境变量

ENV  LANG en_US.UTF-8 
ENV  LC_ALL en_US.UTF-8
ENV  LANGUAGE en_US.UTF-8


#安装python环境

RUN  curl -so /etc/yum.repos.d/Centos-7.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
     && yum -y install python36 python3-devel openssl-devel gcc gcc-c++  pcre-devel zlib-devel make net-tools vim \
     && yum clean all  \
     && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#安装nginx

ADD nginx-1.18.0.tar.gz /opt
WORKDIR /opt/nginx-1.18.0

RUN  ./configure --prefix=/usr/local/nginx \
     && make   \
     && make install  \
     && ln -s /usr/local/nginx/sbin/nginx /usr/bin/nginx

