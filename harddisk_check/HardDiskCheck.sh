#!/bin/sh
# 名称：HDD状態確認ツール
# 仕様：/root/tools/api_hostlist.txt,dbdn_hostlist.txt,hp_api_hostlist.txt
#       esxi_hostlist.txtに定義されたサーバに対してHDD確認コマンドを発行し、
#       Statusを取得
# 備考：dellの場合、OMSAの起動が必要（/opt/dell/srvadmin/sbin/srvadmin-services.sh start）

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

# HDDチェック結果格納テキスト
DELL_HDD_CHK_TXT="/root/tools/dell_hdd_checkresult.txt"
HPE_HDD_CHK_TXT="/root/tools/hpe_hdd_checkresult.txt"

# 実処理
for line in `cat $DELL_CHK_HOST_LIST`
do
    echo "=====" >> $DELL_HDD_CHK_TXT
    echo "$line:HDD_check_start" >> $DELL_HDD_CHK_TXT
    echo "-----" >> $DELL_HDD_CHK_TXT
    echo "RAID status check" >> $DELL_HDD_CHK_TXT
    sshpass -p $PASSWD ssh $line /opt/dell/srvadmin/bin/omreport storage vdisk controller=0 | grep State >> $DELL_HDD_CHK_TXT
    echo "-----" >> $DELL_HDD_CHK_TXT
    echo "HDD status check" >> $DELL_HDD_CHK_TXT
    sshpass -p $PASSWD ssh $line /opt/dell/srvadmin/bin/omreport storage pdisk controller=0 | grep State >> $DELL_HDD_CHK_TXT
    echo "-----" >> $DELL_HDD_CHK_TXT
    echo "$line:HDD_check_end" >> $DELL_HDD_CHK_TXT
    echo "=====" >> $DELL_HDD_CHK_TXT
    echo "" >> $DELL_HDD_CHK_TXT
done

for line in `cat $HPE_CHK_HOST_LIST`
do
    echo "=====" >> $HPE_HDD_CHK_TXT
    echo "$line:HDD_check_start" >> $HPE_HDD_CHK_TXT
    echo "-----" >> $HPE_HDD_CHK_TXT
    echo "RAID status check" >> $HPE_HDD_CHK_TXT
    sshpass -p $PASSWD ssh $line hpacucli ctrl all show config >> $HPE_HDD_CHK_TXT
    echo "-----" >> $HPE_HDD_CHK_TXT
    echo "$line:HDD_check_end" >> $HPE_HDD_CHK_TXT
    echo "=====" >> $HPE_HDD_CHK_TXT
    echo "" >> $HPE_HDD_CHK_TXT
done

# メールの送信
mail -v -s "HDDCheck_DELL `date`" $MAIL_ADDRESS < $DELL_HDD_CHK_TXT
mail -v -s "HDDCheck_HPE `date`" $MAIL_ADDRESS < $HPE_HDD_CHK_TXT

# メール送信用テキストの削除
rm $DELL_HDD_CHK_TXT
rm $HPE_HDD_CHK_TXT
