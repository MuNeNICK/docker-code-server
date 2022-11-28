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

# コンフィグ書き換え
RUN sed -i -e '$ s|}|,\n    "extensionsGallery": {\n        "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",\n        "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",\n        "itemUrl": "https://marketplace.visualstuidio.com/items"\n    }\n}|g' /usr/lib/code-server/lib/vscode/product.json
