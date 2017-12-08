drop database test;
create database test;
use test;
create table pet ( name varchar(20), owner varchar(20), species varchar(20),sex char(1), birth date, death date);

create table event (name varchar(20), date date, type varchar(15), remark varchar(255));


load data infile '/home/shiyanlou/shiyanlou/sql/7_pet.txt' into table pet;
load data infile '/home/shiyanlou/shiyanlou/sql/7_event.txt' into table event;
