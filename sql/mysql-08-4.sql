
drop database test;
create database test;
use test;
create table animals 
( 
    id  mediumint not NULL auto_increment,
    name char(30) not NULL, 
    primary key (id)
);

alter table animals auto_increment = 100;
insert into animals(name) values 
('dog'),
('cat'),
('penguin'),
('lax'),
('whale'),
('ostrich');
