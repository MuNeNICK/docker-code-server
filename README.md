# Code-Server build by Docker
Code-ServerのDocker-composeファイルです。

このリポジトリでは、product.jsonを編集しており、拡張機能を公式Marketplaceからインストールできます。

#　使用方法
- このリポジトリをクローン
- 以下のコマンドを実行し、コンテナを起動
```
docker-compose up -d
```

# 拡張機能のインストール
拡張機能を従来どおりインストールするとコンテナ停止後に消えてしまう。
そこで、Dockerfileに必要な拡張機能を記述する必要がある。
また、Live Shareを使用する場合は、Dockerfileの該当場所のコメントを解除する必要がある。
