FROM ubuntu:bionic

MAINTAINER Lionel Fleury <lionel@sqooba.io>

ARG version=v2.1.1

RUN apt-get update && apt-get install --no-install-recommends -y wget && \
  mkdir -p /tmp/gohdfs && \
  wget --no-check-certificate https://github.com/colinmarc/hdfs/releases/download/$version/gohdfs-$version-linux-amd64.tar.gz -O /tmp/gohdfs/gohdfs.tar.gz && \
  tar -xf /tmp/gohdfs/gohdfs.tar.gz -C /tmp/gohdfs && \
  mv -f /tmp/gohdfs/gohdfs-$version-linux-amd64/hdfs /bin/hdfs && \
  rm -rf /tmp/gohdfs && \
  apt-get autoremove -y wget && \
  rm -rf /var/lib/apt/lists/*

ENV HADOOP_NAMENODE=localhost:8020
ENV HADOOP_USER_NAME=hadoop

ENTRYPOINT [ "/bin/hdfs" ]
