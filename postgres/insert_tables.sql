-- INSERT STATUS
insert into status (name)
values ( %s);

--INSERT USERS
insert into users (fullname, email)
values (%s, %s);

--INSERT TASKS
insert into tasks (title, description, status_id, user_id)
values (%s, %s, %s, %s);