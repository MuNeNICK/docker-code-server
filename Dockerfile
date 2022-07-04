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
RUN apt-get update && apt-get install -y curl wget
RUN curl -fsSL https://code-server.dev/install.sh | sh

#Live Share必要パッケージ 必要に応じてコメントアウト解除
RUN apt-get update && apt-get -y install wget libkrb5-3 zlib1g libicu[0-9][0-9] gnome-keyring libsecret-1-0 desktop-file-utils x11-utils
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
RUN dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb

#コンフィグ書き換え
ADD config/product.json /usr/lib/code-server/lib/vscode

#以下拡張機能のインストール
#RUN code-server \
#  --install-extension ms-ceintl.vscode-language-pack-ja
#RUN code-server \
#  --install-extension MS-vsliveshare.vsliveshare-pack
