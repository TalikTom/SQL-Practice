drop database if exists blog;
create database blog;
use blog;

create table posts(
    id INT auto_increment primary key
);

create table comments(
    id INT auto_increment primary key
);