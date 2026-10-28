


drop table if exists normal_table2;
create table normal_table2(id string, name string, country string) row format delimited fields terminated by '\t';


load data local inpath '/tmp/partition_test.txt' into table normal_table2;



SET hive.exec.dynamic.partition = true;          
SET hive.exec.dynamic.partition.mode = nonstrict;


drop table if exists dynamic_table2;
create table dynamic_table2(
	id string,
	name string)
	partitioned by (country string)
	row format delimited
	fields terminated by '\t';

insert overwrite table dynamic_table2 partition(country) select id,name,country from normal_table2; 
