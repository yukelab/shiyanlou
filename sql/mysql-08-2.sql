
drop database test;
create database test;
use test;
create table person 
( 
    id smallint unsigned not NULL auto_increment,
    name char(60) not NULL, 
    primary key (id)
);

create table shirt 
( 
    id smallint unsigned not NULL auto_increment,
    style ENUM ('t-shirt', 'polo','dress') not NULL,
    color ENUM ('red', 'blue', 'orange', 'white', 'black') not NULL,
    owner smallint unsigned not NULL references person(id),
    primary key (id)
);

insert into person values(NULL, 'antonio paz');
select @last := LAST_INSERT_ID();
insert into shirt values 
(NULL, 'polo','blue', @last),
(NULL, 'dress','white', @last),
(NULL, 't-shirt','blue', @last);


insert into person values(NULL, 'lilliana angelovsha');
select @last := LAST_INSERT_ID();
insert into shirt values 
(NULL, 'dress','orange', @last),
(NULL, 'polo','red', @last),
(NULL, 'dress','blue', @last),
(NULL, 't-shirt','blue', @last);
