#!/bin/sh
# 名称：HW状態確認ツール
# 仕様：/root/tools/esx_hostlist.txtに定義されたサーバに対して
#       ESXの状態確認コマンドを発行し、Statusを取得
# 備考：-

# 環境変数

# パスワード
PASSWD="xxx"

# 通知先メールアドレス
MAIL_ADDRESS_ESX="xxx"

# チェック先ホストリスト
ESX_CHK_HOST_LIST="/root/tools/esx_hostlist.txt"

# HWチェック結果格納テキスト
ESX_HW_CHK_TXT="/root/tools/esx_hw_checkresult.txt"

# 実処理
for line in `cat $ESX_CHK_HOST_LIST`
do
    echo "=====" >> $ESX_HW_CHK_TXT
    echo "$line:HW_check_start" >> $ESX_HW_CHK_TXT
    echo "-----" >> $ESX_HW_CHK_TXT
    echo "HW status check" >> $ESX_HW_CHK_TXT
    sshpass -p $PASSWD ssh $line vim-cmd hostsvc/hostsummary >> $ESX_HW_CHK_TXT
    echo "-----" >> $ESX_HW_CHK_TXT
    echo "HW status check" >> $ESX_HW_CHK_TXT
    echo "=====" >> $ESX_HW_CHK_TXT
    echo "" >> $ESX_HW_CHK_TXT
done

# メールの送信
mail -v -s "HWCheck_esx `date`" $MAIL_ADDRESS < $ESX_HW_CHK_TXT

# メール送信用テキストの削除
rm $ESX_HW_CHK_TXT
