
drop database test;
create database test;
use test;
create table t1 
(
    year YEAR(4),
    month INT(2) UNSIGNED ZEROFILL,
    day INT(2) UNSIGNED ZEROFILL
);

insert into t1 values 
(2000, 1, 1),
(2000, 1, 20),
(2000, 1, 30),
(2000, 2, 2),
(2000, 2, 23),
(2000, 2, 23);


select year, month, bit_count(bit_or(1<<day)) as days from t1 group by year,month;
