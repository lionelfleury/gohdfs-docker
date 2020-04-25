# HDFS GO client docker image

Light weight docker container with a go hdfs client.

see: https://github.com/colinmarc/hdfs for more information.

## Usage example:

`$ alias gohdfs='docker run -it -e HADOOP_NAMENODE=<your-hadoop-namenode> -e HADOOP_USER_NAME=<your-username> -v $(pwd):/data lionelfleury/gohdfs`

Then:

`$ gohdfs ls -l /`

Here you go ;)