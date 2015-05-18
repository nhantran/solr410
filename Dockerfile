FROM nhantran/oraclejdk17
MAINTAINER Nhan Tran<tranphanquocnhan@gmail.com>

RUN apt-get update
WORKDIR /opt
RUN wget http://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz
RUN tar xvf solr-4.10.4.tgz
RUN mv solr-4.10.4 solr && rm solr-4.10.4.tgz

ENV SOLR_HOME=/opt/solr/example/solr
WORKDIR /opt/solr/example
ADD schema.xml solr/conf/schema.xml

CMD ["java", "-jar", "start.jar"]
