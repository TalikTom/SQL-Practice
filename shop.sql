drop database if exists shop;
create database shop;
use shop;

CREATE TABLE  "AGENTS" 
(	
    id NOT NULL PRIMARY KEY auto_increment, 
	agent_name VARCHAR(40), 
	working_area VARCHAR(35), 
	commission NUMBER(10,2), 
	phone_number VARCHAR(15)
);
