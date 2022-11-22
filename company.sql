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