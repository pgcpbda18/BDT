#!/bin/bash 

cd ~/trash/hdfs_api
mvn clean
mvn package
cd ~/hdp/pigandhive/labs/labs1.2/
[ -f "*.jar" ] && rm -r ~/hdp/pigandhive/labs/labs1.2/*.jar
cd ~/test/hdfs_api/ 
cp target/*.jar ~/hdp/pigandhive/labs/labs1.2/
cd ~/hdp/pigandhive/labs/labs1.2/

yarn jar *.jar hdfs.InputCounties
cd ~
