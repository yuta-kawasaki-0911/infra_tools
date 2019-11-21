#!/bin/sh
# 名称：Memory状態確認ツール
# 仕様：/root/tools/api_hostlist.txt,dbdn_hostlist.txtに定義されたサーバに対して
#       DellのMemory確認コマンドを発行し、Statusを取得
# 備考：OMSAの起動が必要（/opt/dell/srvadmin/sbin/srvadmin-services.sh start）

# 環境変数

# パスワード
PASSWD="xxx"

# 通知先メールアドレス
MAIL_ADDRESS="xxx"

# チェック先ホストリスト
# DELL機種用チェックリスト
DELL_CHK_HOST_LIST="/root/tools/hostlist.txt"
# HPE機種用チェックリスト
HPE_CHK_HOST_LIST="/root/tools/hostlist.txt"

# Memoryチェック結果格納テキスト
DELL_MEM_CHK_TXT="/root/tools/dell_mem_checkresult.txt"
HPE_MEM_CHK_TXT="/root/tools/hpe_mem_checkresult.txt"

# 実処理
for line in `cat $DELL_CHK_HOST_LIST`
do
    echo "=====" >> $DELL_MEM_CHK_TXT
    echo "$line:MEM_check_start" >> $DELL_MEM_CHK_TXT
    echo "-----" >> $DELL_MEM_CHK_TXT
    sshpass -p $PASSWD ssh $line /opt/dell/srvadmin/bin/omreport chassis memory | grep Status >> $DELL_MEM_CHK_TXT
    echo "-----" >> $DELL_MEM_CHK_TXT
    echo "$line:MEM_check_end" >> $DELL_MEM_CHK_TXT
    echo "=====" >> $DELL_MEM_CHK_TXT
    echo "" >> $DELL_MEM_CHK_TXT
done

for line in `cat $HPE_CHK_HOST_LIST`
do
    echo "=====" >> $HPE_MEM_CHK_TXT
    echo "$line:MEM_check_start" >> $HPE_MEM_CHK_TXT
    echo "-----" >> $HPE_MEM_CHK_TXT
    sshpass -p $PASSWD ssh $line hpasmcli -s '"SHOW DIMM"' >> $HPE_MEM_CHK_TXT
    echo "-----" >> $HPE_MEM_CHK_TXT
    echo "$line:MEM_check_end" >> $HPE_MEM_CHK_TXT
    echo "=====" >> $HPE_MEM_CHK_TXT
    echo "" >> $HPE_MEM_CHK_TXT
done

# メールの送信
mail -v -s "MemoryCheck_DELL `date`" $MAIL_ADDRESS < $DELL_MEM_CHK_TXT
mail -v -s "MemoryCheck_HPE `date`" $MAIL_ADDRESS < $HPE_MEM_CHK_TXT

# メール送信用テキストの削除
rm $DELL_MEM_CHK_TXT
rm $HPE_MEM_CHK_TXT
