![paralite](docs/logo.png)

# Machine Learning Platform Based on PS-Lite

This project is based on [DMLC](http://github.com/dmlc/)'s ps-lite to deliver several kinds of general purpose machine learning libraries.

# How to build
```sh
# 安装依赖
# ZMQ
yum install cppzmq-devel.x86_64
# Protobuf
yum install -y protobuf-devel
# LZ4
yum install -y lz4-devel
# Glog
yum install -y glog-devel

# build
mkdir build
cd build
cmake ..
make
```
# Testing

## Local

## Distribute

