FROM ubuntu:latest

# Install vim
RUN apt-get update && apt-get install -y vim

WORKDIR /workspace

# 日本語化
RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

#インストール
RUN apt-get update && apt-get install -y curl git
RUN curl -fsSL https://code-server.dev/install.sh | sh

#コンフィグ書き換え
ADD config/product.json /usr/lib/code-server/lib/vscode

