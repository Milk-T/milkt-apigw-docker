FROM tomcat:8.5.20-jre8
ADD apigw.war /usr/local/tomcat/webapps/
RUN mkdir /home/admin && mkdir /home/admin/api && mkdir /home/admin/xslt
ADD demo-api.jar /home/admin/api/
RUN sed -i 's/http:\/\/archive\.ubuntu\.com\/ubuntu\//http:\/\/mirrors\.163\.com\/ubuntu\//g' /etc/apt/sources.list
RUN apt-get update \
&& apt-get install -y zookeeper \
&& apt-get install -y sysv-rc-conf \
&& echo "dash dash/sh boolean false" | debconf-set-selections \
&& DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
ADD zookeeper /etc/init.d/
RUN chmod +x /etc/init.d/zookeeper \
&& sysv-rc-conf zookeeper on
CMD ["service", "zookeeper", "start"]
