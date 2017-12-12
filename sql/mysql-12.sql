create table articles
(
    id int unsigned auto_increment not NULL primary key,
    title varchar(200),
    body text,
    fulltext(title, body)
)
engine = MyISAM;

insert into articles (title, body) values
('mysql tutorial', 'dbms stands for database'),
('how to use mysql well', 'after you went through a...'),
('optimizing mysql','in this tutorial we will show ...'),
('1001 mysql tricks', '1. Never run mysqld as root. 2....'),
('mysql vs. yoursql', 'In the following database comparison ...'),
('mysql security', 'when configred properly, mysql...');

