select id , name, dpt_name, people_num,count(proj_name) as count_project
from employee, department, project
where employee.in_dpt = department.dpt_name and employee.in_dpt = project.of_dpt
group by name
order by id;
