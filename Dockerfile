FROM tomcat:9.0.80-jdk8-corretto-al2
ADD ./webapp /usr/local/tomcat/webapps/webapp

CMD ["catalina.sh", "run"]
