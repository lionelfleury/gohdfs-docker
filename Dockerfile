FROM ubuntu:bionic

MAINTAINER Lionel Fleury <lionel@sqooba.io>

ARG version=gohdfs-v2.1.1-linux-amd64

RUN apt-get update && apt-get install --no-install-recommends -y wget && \
  mkdir -p /tmp/gohdfs && \
  wget --no-check-certificate https://github.com/colinmarc/hdfs/releases/download/v2.1.1/$version.tar.gz -O /tmp/gohdfs/gohdfs.tar.gz && \
  tar -xf /tmp/gohdfs/gohdfs.tar.gz -C /tmp/gohdfs && \
  mv -f /tmp/gohdfs/$version/hdfs /bin/hdfs && \
  rm -rf /tmp/gohdfs && \
  apt-get autoremove -y wget && \
  rm -rf /var/lib/apt/lists/*

ENV HADOOP_NAMENODE=localhost:8020
ENV HADOOP_USER_NAME=hadoop

ENTRYPOINT [ "/bin/hdfs" ]
