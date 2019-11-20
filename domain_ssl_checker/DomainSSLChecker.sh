#!/bin/sh

# DomainSSLChecker.sh
# ver 0.2
#0 12 1 * * /root/tools/DomainSSLChecker.sh >/dev/null 2>&1



#VAR_GRPLIST="pid opt"
VAR_GRPLIST="pid"

#Cicle
for VAR_Grp in $VAR_GRPLIST
do

   VAR_DOM_Ser=`cat /root/tools/Domain_"$VAR_Grp"_list.txt | egrep -v '#|^$'`
   VAR_SSL_Ser=`cat /root/tools/SSL_"$VAR_Grp"_list.txt | egrep -v '#|^$'`

   #VAR_DOM_Ser=`cat /root/tools/Domain_list.txt | egrep -v '#|^$'`
   #VAR_SSL_Ser=`cat /root/tools/DomainSSLChecker/SSL_list.txt | egrep -v '#|^$'`

   if test $VAR_Grp = pid ;then
      VAR_Mail="送信したいメールアドレス"
   elif test $VAR_Grp = opt ;then
      VAR_Mail="送信したいメールアドレス"
   fi


   VAR_Txt="/root/tools/DomainSSLChecker_log.txt"

   VAR_Date1=`date`
   VAR_Date2=`date +"%y%m%d"`

   #make temp file
   /bin/rm -fr $VAR_Txt
   /bin/touch $VAR_Txt

   #Hedder
   echo "This is "$VAR_Grp" Domain/SSL Expire Check Program." >> $VAR_Txt
   echo "`/bin/hostname` reported (/root/tools/DomainSSLChecker.sh)" >> $VAR_Txt
   echo "" >> $VAR_Txt

   echo "Domain Expire Check" >> $VAR_Txt

   #Cicle
   for VAR_1 in $VAR_DOM_Ser
   do

      case $VAR_1 in
         *.ne.jp)
            VAR_DOM_Expir=`/usr/bin/whois $VAR_1 |grep State`;;
         *)
            VAR_DOM_Expir=`/usr/bin/whois $VAR_1 |grep Expir`;;
      esac

      echo $VAR_1 $VAR_DOM_Expir >> $VAR_Txt
      echo >> $VAR_Txt

      # sleep 3second
      sleep 3s

      # Cicle End.
   done

   echo >> $VAR_Txt
   echo "SSL Expire Check" >> $VAR_Txt

   #Cicle
   for VAR_1 in $VAR_SSL_Ser
   do

      #VAR_SSL_Expir=`/bin/echo "" | /usr/bin/openssl s_client -connect $VAR_1:443 | /usr/bin/openssl x509 -enddate -noout|sed 's/notAfter\=//' >/dev/null 2>&1`
      VAR_SSL_Expir=`/bin/echo "" | /usr/bin/openssl s_client -connect $VAR_1:443 | /usr/bin/openssl x509 -enddate -noout|sed 's/notAfter\=//'`

      echo $VAR_1 $VAR_SSL_Expir >> $VAR_Txt
      echo >> $VAR_Txt

      #sleep 3second
      sleep 3s

      # Cicle End.
   done

   echo "EOF" >> $VAR_Txt

   #mail to admin
   mail -v -s "Domain SSL $VAR_Grp Expire Check $VAR_Date2" $VAR_Mail < $VAR_Txt

   #delete log
   rm $VAR_Txt

# Cicle End.
done
