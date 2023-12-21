create database Car_rental_system;
use Car_rental_system;

create table vehicle(
vehicleid int primary key,
make varchar(50) not null,
model varchar(50) not null,
year int not null,
dailyrate decimal(10,2) not null,
status bit not null,
passengerCapacity int not null,
engineCapacity int not null,
);

create table customer(
customerid int primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
email varchar(50) unique,
phonenumber char(15) unique,
);

create table lease(
leaseid int primary key,
vehicleid int foreign key(vehicleid) references vehicle(vehicleid) on delete cascade,
customerid int foreign key(customerid) references customer(customerid) on delete cascade,
startdate date,
enddate date,
type varchar(50) check (type IN ('Daily', 'Monthly')),
);

create table payment(
paymentid int primary key,
leaseid int foreign key(leaseid) references lease(leaseid) on delete cascade,
paymentdate date not null,
paymentamount decimal(10,2) not null,
);
