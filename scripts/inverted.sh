#!/bin/bash

hdfs dfs -test -d inverted

if [ $? -eq 0 ]; then
hdfs dfs -rm -R inverted
fi

hdfs dfs -mkdir inverted
hdfs dfs -put ~/hdp/pigandhive/labs/InvertedIndex/hortonworks.txt inverted/

cd ~/trash/inverted_index

mvn clean
mvn package

unzip -p target/*.jar META-INF/MANIFEST.MF

yarn jar target/*jar inverted/ inverted/output

echo "its done"
