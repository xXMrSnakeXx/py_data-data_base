-- CREATE TABLES
create table users(
    id serial primary key,
    fullname varchar(100) not null,
    email varchar(100) not null unique
);

create table status (
    id serial primary key,
    name varchar(50) not null unique
);

create table tasks(
    id serial primary key,
    title varchar(100) not null,
    description text,
    status_id integer not null,
    user_id integer not null,
    foreign key (status_id) references status (id),
    foreign key (user_id) references users (id) on delete cascade
);