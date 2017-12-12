
delimiter |
create trigger trigger_modify before update on mark
for each row begin
insert into modifymark value (NULL,new.sid, new.cid, new.score,curtime());
end
| 
delimiter ; 
update mark set score = score + 3 where sid = (select sid from student where sname = 'Tom') and cid = (select cid from course where cname = 'chemistry');
