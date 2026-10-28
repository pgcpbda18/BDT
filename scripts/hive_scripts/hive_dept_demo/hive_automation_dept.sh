#Author 	kartik singh 	kunal bhamoriya
#Creation date 	24/10/2026
#MODIFIED	24/10/2026
#DESCRIPTION	automation for dept_loc.txt file and creating dynamic partitioning


#!/bin/bash
if [ -f  "/tmp/dept_loc.txt" ]; then
	 echo "file exists"
else 
	cp ~/shared/dept_loc.txt /tmp/
	echo "file copied"
fi

hive -f ddl.hive
hive -f load.hive
hive -e "select * from departments limit 10;"
hive -e "select * from dept_loc limit 10;"
