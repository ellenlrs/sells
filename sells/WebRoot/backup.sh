#!/bin/sh
echo tar -zcvf /home/davide/`date "+Sells-src-D%u"`.tar.gz /home/davide/Sells
tar -zcPf /home/davide/`date "+Sells-src-D%u"`.tar.gz /home/davide/Sells

echo mysqldump -u mysql Sells > /home/davide/`date "+Sells-D%u"`.sql
mysqldump -u mysql Sells > /home/davide/`date "+Sells-D%u"`.sql

echo tar -zcvf /home/davide/`date "+Sells-db-D%u"`.tar.gz /home/davide/`date "+Sells-D%u"`.sql
tar -zcPf /home/davide/`date "+Sells-db-D%u"`.tar.gz /home/davide/`date "+Sells-D%u"`.sql

ncftpput -u jinweilin -p 856069 ftp.myweb.hinet.net / /home/davide/`date "+Sells-db-D%u"`.tar.gz
ncftpput -u jinweilin2 -p 856069 ftp.myweb.hinet.net / /home/davide/`date "+Sells-src-D%u"`.tar.gz
