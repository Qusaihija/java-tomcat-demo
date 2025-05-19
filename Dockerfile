FROM tomcat:9.0
WORKDIR /usr/local/tomcat
COPY src/main/webapp/WEB-INF/web.xml /usr/local/tomcat/webapps/ROOT/WEB-INF/web.xml
COPY src/main/java/com/example/HelloServlet.java /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/com/example/HelloServlet.java
RUN apt-get update && apt-get install -y openjdk-11-jdk && \
    javac -classpath /usr/local/tomcat/lib/servlet-api.jar -d /usr/local/tomcat/webapps/ROOT/WEB-INF/classes /usr/local/tomcat/webapps/ROOT/WEB-INF/classes/com/example/HelloServlet.java
EXPOSE 8080
CMD ["catalina.sh", "run"]