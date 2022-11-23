drop database if exists shop;
create database shop;
use shop;

CREATE TABLE agents
(	
    id NOT NULL PRIMARY KEY auto_increment, 
	agent_name VARCHAR(40), 
	working_area VARCHAR(35), 
	commission NUMBER(10,2), 
	phone_number VARCHAR(15)
);

insert into agents (agent_name, working_area, commission, phone_number)
values
('Adam Adamovic', 'Slavonija', '0.20','098643317'),
('Berko Bajramovic', 'Istra', '0.14','098645317'),
('Cibi Civic', 'Dalmacija', '0.10','098543317'),
('Duje Dandamovic', 'Zagreb', '0.11','098642317'),
('Erslan Eronet', 'Medjimurje', '0.16','091643317');