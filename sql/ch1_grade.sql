drop database gradesystem;
create database gradesystem;
use gradesystem;

create table student 
(
	sid int(4) primary key,
	sname char(12),
	gender char(6)
);

create table course 
(
	cid int(4) primary key,
	cname char(12)
);

create table mark 
(
	mid int(4) primary key,
	contraint sid foreign key (in student) references student(sid),
	contraint cid foreign key (in class) references class(cid),
	score int(3)
);

insert into student(sid, snamem gender) values(1, 'Tom', 'male');
insert into student(sid, snamem gender) values(2, 'Jack', 'male');
insert into student(sid, snamem gender) values(3, 'Rose', 'female');


insert into course(cid, cname) values(1, 'math');
insert into course(cid, cname) values(2, 'physics');
insert into course(cid, cname) values(3, 'chemistry');


insert into mark(mid, sid, cid, mark) values(1,1,1,  80);
insert into mark(mid, sid, cid, mark) values(2,2,1,  85);
insert into mark(mid, sid, cid, mark) values(3,3,1,  90);
insert into mark(mid, sid, cid, mark) values(4,1,2,  60);
insert into mark(mid, sid, cid, mark) values(5,2,2,  90);
insert into mark(mid, sid, cid, mark) values(6,3,2,  75);
insert into mark(mid, sid, cid, mark) values(7,1,3,  95);
insert into mark(mid, sid, cid, mark) values(8,2,3,  75);
insert into mark(mid, sid, cid, mark) values(9,3,3,  85);

