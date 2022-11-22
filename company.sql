drop database if exists company;
create database company;
use company;

create table employees(
    id int not null auto_increment primary key,
    birth_date date,
    first_name varchar(50),
    last_name varchar(50),
    hire_date date
);

create table departments(
    id int not null auto_increment primary key,
    dept_name varchar(50)
);

create table salaries(
    id int not null auto_increment primary key,
    salary decimal(13,2),
    from_date date,
    to_date date
);

create table title(
    id int not null auto_increment primary key,
    title varchar(50),
    from_date date,
    to_date date
)