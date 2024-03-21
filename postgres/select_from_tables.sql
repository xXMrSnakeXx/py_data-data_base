--SELECT ALL TASKS BY USER_ID
select * from tasks where user_id = %s ;

--SELECT TASKS WHERE STATUS NEW
select * from tasks
where status_id = (select id from status where name = 'new') ;

--UPDATE STATUS
update tasks set status_id = %s where status_id = %s;

--SELECT USER LIST WICH DONT HAVE TASKS
select id, fullname, email from users
where id not in (select distinct user_id from tasks);

--ADD TASK FOR USER
insert into tasks (title, description, status_id, user_id)
values (%s, %s, %s, %s);

--SELECT TASKS WICH NOT COMPLETED
select * from tasks
where status_id !=(select id from status where name = 'completed');

--DELETE TASK
delete from tasks where id = %s;

--SELECT USER BY EMAIL
select * from users where email like '%example.org%';

--UPDATE USER NAME
update users set fullname = 'John Dou'
where fullname = 'Kevin Nichols';

--COUNT TASKS BY STATUS
select count(status_id) as total_count, status_id 
from tasks group by status_id;

--SELECT TASKS BY USER EMAIL
select * from tasks as t join users as u on t.user_id = u.id
where email like '%example.com%';

--SELECT TASKS WICH DONT HAVE DESCRIPTION
select * from tasks where description is null or description='';

--SELECT USERS AND TASKS WITH STATUS IN PROGRESS
select * from users as u inner join tasks as t on t.user_id = u.id 
where status_id = (select id from status where name = 'in progress');

--SELECT USERS AND TOTAL TASKS
select u.id, u.fullname, count(t.id) as total_tasks
from users as u
left join tasks as t on u.id = t.user_id
group by u.id, u.fullname;