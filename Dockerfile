FROM ubuntu:latest

# Install vim
RUN apt-get update && apt-get install -y vim

WORKDIR /workspace

# 日本語化
RUN apt-get update \
  && apt-get install -y locales \
  && locale-gen ja_JP.UTF-8 \
  && echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

RUN apt-get update && apt-get install -y curl wget
RUN curl -fsSL https://code-server.dev/install.sh | sh

#Live Share必要パッケージ 必要に応じてコメントアウト解除
#RUN wget -O ~/vsls-reqs https://aka.ms/vsls-linux-prereq-script && chmod +x ~/vsls-reqs && ~/vsls-reqs

#コンフィグ書き換え
ADD config/product.json /usr/lib/code-server/lib/vscode

#以下拡張機能のインストール　必要に応じて書き換え
RUN code-server \
  --install-extension ms-ceintl.vscode-language-pack-ja
