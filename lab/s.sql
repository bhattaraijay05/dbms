show databases;
create database dbtest;
use dbtest;

show tables;

create table plan(planid int primary key, plan_name varchar(20));
create table users( userid int primary key, name varchar(20), email varchar(30), password varchar(30),planid int, foreign key (planid) references plan(planid) );
-- create table studio;
-- create table genre;
-- create table trailer;
-- create table poster;
-- create table movie;

insert into plan (planid, plan_name) values
( 101, "Free"),
(102, "Premium");

select * from plan;

insert into users (userid, name, email, password, planid) values
( 111, "Taylor Swift", "tay@gmail.com", "123123123", 101),
( 112, "Katy Perry", "katy@gmail.com", "password", 102),
( 113, "Eddie ", "eddie@gmail.com", "netflix", 101);

select * from users;

select u.name from users u, plan p where u.planid = p.planid and p.plan_name="Premium";



