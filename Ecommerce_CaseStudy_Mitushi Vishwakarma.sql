create database ecommerce;
use ecommerce;

create table customer(
customer_id int primary key,
firstname varchar(50),
lastname varchar(50),
email varchar(50),
address varchar(50),
password varchar(50)
);

create table product(
product_id int primary key,
name varchar(50),
description text,
price decimal(10,2),
stockQuantity int
);

create table orders(
orderid int primary key,
customerid int foreign key(customerid) references customer(customer_id) on delete cascade,
orderdate date,
totalamount decimal(10,2),
shippingaddress varchar(255)
);

create table cart(
cart_id int primary key,
customerid int foreign key(customerid) references customer(customer_id) on delete cascade,
product_id int foreign key(product_id) references product(product_id) on delete cascade,
quantity int
);

create table orderitem(
order_item_id int primary key,
orderid int foreign key(orderid) references orders(orderid) on delete cascade,
product_id int foreign key(product_id) references product(product_id) on delete cascade,
quantity int,
itemAmount decimal(10, 2)
);
