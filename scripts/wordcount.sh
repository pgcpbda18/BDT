#!/bin/bash

hdfs dfs -test -f constitution.txt

if [ $? -eq 0 ] then
hdfs dfs -rm constitution.txt
fi

hdfs dfs -put ~/hdp/pigandhive/labs/wordcount/constitution.txt

cd ~/trash/wordcount_v1
mvn clean
mvn package

yarn jar ~/trash/wordcount_v1/target/*.jar wordcount.WordCountJob constitution.txt wordcount_output
