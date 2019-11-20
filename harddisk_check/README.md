## 本領域の説明
* サーバのハードディスクの状態チェックを行うツールを管理する領域。

## 前提条件
* 本ツールは`DELL機種`と`HPE機種`に対応している。
	* DELL機種の場合、`OMSA`のインストールが必要
	* HPE機種の場合、`hpacucli`コマンドのインストールが必要
* 本ツールは`sshpass`コマンドを利用する。
	* チェック対象のサーバへssh接続できる必要がある

## ツール説明
* HardDiskCheck.sh
	* ハードディスクの状態チェックを行うツール。
* dell_hostlist.txt
	* ハードディスクの状態をチェックしたいDELL機種のサーバのホスト名を定義する。
* hpe_hostlist.txt
	* ハードディスクの状態をチェックしたいHPE機種のサーバのホスト名を定義する。

## 通知結果サンプル
* DELL機種の場合

```
=====
xxx:HDD_check_start
-----
RAID status check
State : Ready
Associated Fluid Cache State : Not Applicable
-----
HDD status check
State : Online
State : Online
State : Online
State : Online
-----
xxx:HDD_check_end
=====
```

* HPE機種の場合

```
=====
xxx:HDD_check_start
-----
RAID status check

Smart Array P420i in Slot 0 (Embedded) (sn: 001438028346B10)

array A (SATA, Unused Space: 0 MB)

logicaldrive 1 (1.8 TB, RAID 1+0, OK)

physicaldrive 1I:1:1 (port 1I:box 1:bay 1, SATA, 1 TB, OK)
physicaldrive 1I:1:2 (port 1I:box 1:bay 2, SATA, 1 TB, OK)
physicaldrive 1I:1:3 (port 1I:box 1:bay 3, SATA, 1 TB, OK)
physicaldrive 1I:1:4 (port 1I:box 1:bay 4, SATA, 1 TB, OK)

SEP (Vendor ID PMCSIERA, Model SRCv8x6G) 380 (WWID: 5001438028346B1F)

-----
xxx:HDD_check_end
=====
```