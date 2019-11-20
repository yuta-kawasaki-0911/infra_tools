## 本領域の説明
* サーバのメモリの状態チェックを行うツールを管理する領域。

## 前提条件
* 本ツールは`DELL機種`と`HPE機種`に対応している。
	* DELL機種の場合、`OMSA`のインストールが必要
	* HPE機種の場合、`hpasmcli`コマンドのインストールが必要
* 本ツールは`sshpass`コマンドを利用する。
	* チェック対象のサーバへssh接続できる必要がある

## ツール説明
* MemoryCheck.sh
	* メモリの状態チェックを行うツール。
* dell_hostlist.txt
	* メモリの状態をチェックしたいDELL機種のサーバのホスト名を定義する。
* hpe_hostlist.txt
	* メモリの状態をチェックしたいHPE機種のサーバのホスト名を定義する。

## 通知結果サンプル
* DELL機種の場合

```
=====
xxx:MEM_check_start
-----
Status : Ok
Status : Ok
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Ok
Status : Ok
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
Status : Unknown
-----
xxx:MEM_check_end
=====

```

* HPE機種の場合

```
=====
xxx:MEM_check_start
-----

DIMM Configuration
------------------
Processor #: 1
Module #: 4
Present: Yes
Form Factor: 9h
Memory Type: DDR3(18h)
Size: 8192 MB
Speed: 1866 MHz
Supports Lock Step: No
Configured for Lock Step: No
Status: Ok

Processor #: 1
Module #: 9
Present: Yes
Form Factor: 9h
Memory Type: DDR3(18h)
Size: 8192 MB
Speed: 1866 MHz
Supports Lock Step: No
Configured for Lock Step: No
Status: Ok

Processor #: 1
Module #: 12
Present: Yes
Form Factor: 9h
Memory Type: DDR3(18h)
Size: 16384 MB
Speed: 1866 MHz
Supports Lock Step: No
Configured for Lock Step: No
Status: Ok

Processor #: 2
Module #: 4
Present: Yes
Form Factor: 9h
Memory Type: DDR3(18h)
Size: 8192 MB
Speed: 1866 MHz
Supports Lock Step: No
Configured for Lock Step: No
Status: Ok

Processor #: 2
Module #: 9
Present: Yes
Form Factor: 9h
Memory Type: DDR3(18h)
Size: 8192 MB
Speed: 1866 MHz
Supports Lock Step: No
Configured for Lock Step: No
Status: Ok

Processor #: 2
Module #: 12
Present: Yes
Form Factor: 9h
Memory Type: DDR3(18h)
Size: 16384 MB
Speed: 1866 MHz
Supports Lock Step: No
Configured for Lock Step: No
Status: Ok

-----
xxx:MEM_check_end
=====
```