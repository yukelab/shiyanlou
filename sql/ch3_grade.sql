
delimiter |
create trigger trigger_modify before update on mark
for each row begin
insert into modifymark value (NULL,new.sid, new.cid, new.score,now());
end
| 
delimiter ; 

update mark set score = score + 3 where sid = (select sid from student where sname = 'Tom') and cid = (select cid from course where cname = 'chemistry');


delimiter |
create procedure math_proc () 
begin
select 'math', sname, score 
from  student, mark 
where mark.cid = (select cid from course where cname = 'math') and student.sid = mark.sid
order by score desc;
end
| 
delimiter ; 

call math_proc();

