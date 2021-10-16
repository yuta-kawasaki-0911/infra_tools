## はじめに
* 本領域は業務中に自作したインフラ関連のツールを一般化したものを公開することで、DevOpsエンジニア / SREエンジニアを中心に利活用してもらうことを目的とする。
* 対象はオンプレミス環境を想定する。

## 本リポジトリの構成

```
.
├── README.md
├── domain_ssl_checker
│   ├── DomainSSLChecker.sh
│   ├── Domain_pid_list.txt
│   ├── README.md
│   └── SSL_pid_list.txt
├── harddisk_check
│   ├── HardDiskCheck.sh
│   ├── README.md
│   ├── dell_hostlist.txt
│   └── hpe_hostlist.txt
├── hardware_check
│   ├── HardWareCheck.sh
│   ├── README.md
│   └── esx_hostlist.txt
└── memory_check
    ├── MemoryCheck.sh
    ├── README.md
    ├── dell_hostlist.txt
    └── hpe_hostlist.txt
```

## 前提条件
* コマンドを実行したいサーバへrootユーザ等でログイン可能なサーバから実行すること。
* コマンドを実行したいサーバへのログインパスワードが同じであること。
* ホスト名を指定する場合、コマンド実行元サーバから名前解決が可能なこと。
* `sshpass`コマンドが利用可能なこと。

## 本リポジトリの詳細
### domain_ssl_checker
* 定義したドメインとSSL証明書の有効期限を確認するツール。
* [domain_ssl_checkerの説明](domain_ssl_checker/README.md)

### harddisk_check
* ハードディスクの状態確認をするツール。
* [harddisk_checkの説明](harddisk_check/README.md)

### hardware_check
* ハードウェアの状態確認をするツール。
* [hardware_checkの説明](hardware_check/README.md)

### memory_check
* メモリの状態確認をするツール。
* [memory_checkの説明](memory_check/README.md)

