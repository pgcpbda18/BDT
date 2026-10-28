#!/bin/bash
#Author 	KARTIK 		KUNAL
#USAGE		source hive_automation.sh
# DESCRPTION	ddl commands and load commands for hive 

if [ -f "/tmp/partition_test.txt" ]; then
    echo "File exists"
else
   cp partition_test.txt /tmp/
    echo "file copied"
fi   
hive -f hive_dp.hql
cd /tmp
rm partition_test.txt
