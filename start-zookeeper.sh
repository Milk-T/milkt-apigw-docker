#! /bin/sh

echo "dash dash/sh boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
/usr/share/zookeeper/bin/zkServer.sh start