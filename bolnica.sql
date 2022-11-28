drop database if exists bolnica;
create database bolnica charset utf8mb4;
use bolnica;

create table odjel (
    odjel_id int not null auto_increment primary key,
    naziv varchar(50) not null,
    broj_soba int
);

