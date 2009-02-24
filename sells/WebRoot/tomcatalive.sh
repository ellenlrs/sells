#!/bin/bash
# Check Tomcat service
# by davide

PATH=/bin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin
JAVA_HOME=/usr/java/jre1.5.0_10
LANG=zh_TW.BIG5
KEY=Server1
TOMCAT_HOME=/opt/tomcat
export PATH LANG JAVA_HOME TOMCAT_HOME

TOMCATROOT=/opt/tomcat
MAIL=/bin/mail

/bin/date > $TOMCATROOT/tomcat.state
/usr/bin/lynx localhost/Sells/server.jsp -dump | \
grep $KEY >> $TOMCATROOT/tomcat.state &
sleep 15
TOMCATALIVE=`grep $KEY $TOMCATROOT/tomcat.state`
if [ ! "$TOMCATALIVE" ]; then
  echo "Tomcat can't work! restarting....."

  /opt/tomcat/bin/shutdown.sh

  sleep 3

  /bin/kill `/usr/bin/pgrep java`

  /opt/tomcat/bin/startup.sh

  MAIL=/bin/mail

  echo "Tomcat(`hostname`). "|
  $MAIL -s "Tomcat restart" service@icart.tw
fi
