FROM centos:7 as junk
RUN yum install java-1.8.0 -y
RUN yum install git -y
RUN yum -y install maven
WORKDIR /JavaWeb
COPY . .
RUN mvn clean package
#RUN mvn package


FROM amazon/aws-cli
COPY --from=junk /JavaWeb/target/*.war /usr/local/bin
RUN ls /usr/local/bin/
