FROM tomcat:8.5.20-jre8
ADD apigw.war /usr/local/tomcat/webapps/
RUN mkdir /home/admin && mkdir /home/admin/api && mkdir /home/admin/xslt
ADD demo-api.jar /home/admin/api/
RUN apt-get update && apt-get install -y vim