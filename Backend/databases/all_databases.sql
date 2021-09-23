create database cradle;
use cradle;

create table DEVICE (

device_id INT primary key,
temperature float,
cry_analysis bool,
fan bool
);

create table USER (

user_name varchar(10) NOT NULL,
password varchar(15) NOT NULL,
address varchar(50) NOT NULL,
mobile_number varchar(10) NOT NULL,
device_id INT NOT NULL,

primary key(user_name,password),
foreign key (device_id) references DEVICE(device_id)

);


