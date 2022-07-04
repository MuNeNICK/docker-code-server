# Code-Server build by Docker
Code-ServerのDocker-composeファイルです。

このリポジトリでは、product.jsonを編集しており、拡張機能を公式Marketplaceからインストールできます。

# 使用方法
- このリポジトリをクローン
- 以下のコマンドを実行し、コンテナを起動
```
docker-compose up -d --build
```

# 拡張機能のインストール
~~拡張機能を従来どおりインストールするとコンテナ停止後に消えてしまう。
そこで、Dockerfileに必要な拡張機能を記述する必要がある。
また、Live Shareを使用する場合は、Dockerfileの該当場所のコメントを解除する必要がある。~~

コンテナ停止後も拡張機能が消えないように修正。
→　Code－Serverから拡張機能をインストール可能に

従来どおり、Dockerfileから拡張機能をインストールしたい場合は以下の手順に従う。
- Dockerfileに拡張機能のインストールを記述。
- docker-composeの以下の行をコメントアウト
 https://github.com/MuNeNICK/docker-code-server/blob/dbb975cf49b18822f9495561df7aa200a75beb93/docker-compose.yml#L15
- 起動
```
docker-compose up -d --build
```

- 必要ファイルのコピー
```
docker-compose cp code:${HOME}/.local/share/code-server ./app
```

- コンテナの停止
```
docker-compose down
```

- docker-compose.ymlのコメントアウト解除
https://github.com/MuNeNICK/docker-code-server/blob/dbb975cf49b18822f9495561df7aa200a75beb93/docker-compose.yml#L15

- 再度コンテナの起動
```
docker-compose up -d
```
