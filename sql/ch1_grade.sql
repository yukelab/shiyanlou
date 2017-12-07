drop database gradesystem;
create database gradesystem;
use gradesystem;

create table student 
(
	sid int(4) primary key,
	sname char(12),
	gender char(12)
);

create table course 
(
	cid int(4) primary key,
	cname char(12)
);

create table mark 
(
	mid int(4) primary key,
	sid int(4),
	cid int(4),
	score int(3),
	constraint emp_fk1 foreign key (sid) references student(sid),
	constraint emp_fk2 foreign key (cid) references course(cid)
);

insert into student(sid, sname, gender) values(1, 'Tom', 'male');
insert into student(sid, sname, gender) values(2, 'Jack', 'male');
insert into student(sid, sname, gender) values(3, 'Rose', 'female');


insert into course(cid, cname) values(1, 'math');
insert into course(cid, cname) values(2, 'physics');
insert into course(cid, cname) values(3, 'chemistry');


insert into mark(mid, sid, cid, score) values(1,1,1,  80);
insert into mark(mid, sid, cid, score) values(2,2,1,  85);
insert into mark(mid, sid, cid, score) values(3,3,1,  90);
insert into mark(mid, sid, cid, score) values(4,1,2,  60);
insert into mark(mid, sid, cid, score) values(5,2,2,  90);
insert into mark(mid, sid, cid, score) values(6,3,2,  75);
insert into mark(mid, sid, cid, score) values(7,1,3,  95);
insert into mark(mid, sid, cid, score) values(8,2,3,  75);
insert into mark(mid, sid, cid, score) values(9,3,3,  85);

