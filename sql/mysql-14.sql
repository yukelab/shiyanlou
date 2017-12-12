# drop database test_db;
create database test_db;
use test_db;

create table test1(a1 int);
create table test2(a2 int);
create table test3(a3 int not NULL auto_increment primary KEY);
create table test4
(
    a4 int not NULL auto_increment primary key,
    b4 int default 0
);

DELIMITER |
create trigger testref before insert on test1
for each row begin
    insert into test2 set a2 = NEW.a1;
    delete from test3 where a3 = NEW.a1;
    update test4 set b4 = b4 + 1 where a4 = NEW.a1;
end
|
DELIMITER ;

 insert into test3 (a3) values
 (NULL),(NULL),(NULL),(NULL),(NULL),
 (NULL),(NULL),(NULL),(NULL),(NULL);

insert into test4 (a4) values
(0),(0),(0),(0),(0),(0),(0),(0),(0),(0);
