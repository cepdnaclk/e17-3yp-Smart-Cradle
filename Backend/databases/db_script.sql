create database cradle;
use cradle;

create table DEVICE (

device_id INT primary key,
temperature float,
cry_analysis bool default false,
fan bool default false
);

create table USER (

user_name varchar(10) NOT NULL,
password varchar(150) NOT NULL,
email varchar(50) NOT NULL,
mobile_number varchar(10) NOT NULL,

primary key(user_name)

);

create table OWNERSHIP (

device_id INT NOT NULL,
user_name varchar(10) NOT NULL,

primary key(device_id),
foreign key (user_name) references USER(user_name)

);





