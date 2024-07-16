FROM amazonlinux:2
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz /opt
RUN yum install -y git wget
RUN yum install tar -y 
RUN tar -xvzf apache-tomcat-9.0.91.tar.gz
RUN chmod +x apache-tomcat-9.0.91/bin/*
RUN mv apache-tomcat-9.0.91 /opt/tomcat
RUN amazon-linux-extras install java-openjdk11 -y

RUN wget https://dlcdn.apache.org/maven/maven-3/3.9.8/binaries/apache-maven-3.9.8-bin.tar.gz
RUN tar -xvzf apache-maven-3.9.8-bin.tar.gz
RUN mv apache-maven-3.9.8 /opt/maven

RUN git clone https://bitbucket.org/dptrealtime/java-login-app.git /opt/java-login-app
WORKDIR /opt/java-login-app
RUN /opt/maven/bin/mvn package
CMD ["/opt/tomcat/bin/catalina.sh", "run"]


