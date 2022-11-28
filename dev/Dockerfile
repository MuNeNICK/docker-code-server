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

#Live Share必要パッケージ 必要に応じてコメントアウト解除
RUN apt-get update && apt-get -y install wget libkrb5-3 zlib1g libicu[0-9][0-9] gnome-keyring libsecret-1-0 desktop-file-utils x11-utils
RUN wget http://archive.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.0g-2ubuntu4_amd64.deb
RUN dpkg -i libssl1.1_1.1.0g-2ubuntu4_amd64.deb

# Marp動作に必要なGoogle Chromeのインストール
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt-get update && apt-get install ./google-chrome-stable_current_amd64.deb -y

#日本語フォントの導入
RUN curl -L https://moji.or.jp/wp-content/ipafont/IPAexfont/IPAexfont00401.zip  > IPAexfont00401.zip
RUN apt-get update && apt-get install unzip -y
RUN unzip IPAexfont00401.zip && rm -rf IPAexfont00401.zip
RUN mkdir /usr/share/fonts/ipa
RUN mv IPAexfont00401/*.ttf /usr/share/fonts/ipa/
RUN fc-cache -fv


# C言語のインストール
RUN apt-get update && apt-get install build-essential -y

#コンフィグ書き換え
RUN sed  -i -e '$ s|}|,\n    "extensionsGallery": {\n        "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",\n        "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",\n        "itemUrl": "https://marketplace.visualstuidio.com/items"\n    }\n}|g' /usr/lib/code-server/lib/vscode/product.json
