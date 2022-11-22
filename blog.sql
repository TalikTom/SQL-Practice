drop database if exists blog;
create database blog;
use blog;

create table posts(
    id INT auto_increment primary key not null,
    title varchar(50) not null
);

create table comments(
    id INT auto_increment primary key not null,
    body text,
    post_id int not null
);