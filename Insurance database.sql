show databases;
create database insurances;
use insurances;
create table car(reg_num varchar(10),model varchar(10),year int, primary key(reg_num));

create table accident(report_num int, accident_date date, location varchar(20),primary key(report_num));

create table person (driver_id varchar(10),name varchar(20), address varchar(30), primary key(driver_id));

drop table owns;
drop table participated;

create table owns(driver_id varchar(10),reg_num varchar(10),
primary key(driver_id, reg_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num));

create table participated(driver_id varchar(10),
reg_num varchar(10), report_num int, damage_amount int,
primary key(driver_id, reg_num, report_num , damage_amount),
foreign key(driver_id) references person(driver_id)on delete cascade,
foreign key(reg_num) references car(reg_num)on delete cascade,
foreign key(report_num) references accident(report_num)on delete cascade);

show tables;

desc accident;
desc car;
desc owns;
desc participated;
desc person;

insert into accident values(11,'2003-01-01', 'Mysore Road');
insert into accident values(12, '2004-02-02', 'South end Circle');
insert into accident values(13,'2003-01-21', 'Bull temple Road');
insert into accident values(14,'2008-02-17', 'Mysore Road');
insert into accident values(15,'2004-03-05', 'Kanakpura Road');

select * from accident;

insert into car values('KA052250', 'Indica', 1990);
insert into car values('KA031181', 'Lancer', 1957);
insert into car values('KA095477', 'Toyota', 1998);
insert into car values('KA053408', 'Honda', 2008);
insert into car values('KA041702', 'Audi', 2005);

Select * from car;

insert into person values('IND12345KA', 'Tushar', 'Srinivas nagar');
insert into person values('IND98356KA', 'Richard', 'Rajaji nagar');
insert into person values('IND24386KA', 'Smith', 'Ashok nagar');
insert into person values('IND09427KA', 'Yash', 'N R Colony');
insert into person values('IND64566KA', 'Tanisha','Hanumanth nagar');

Select * from person;

insert into owns values('IND12345KA','KA052250');
insert into owns values('IND98356KA','KA031181');
insert into owns values('IND24386KA','KA095477');
insert into owns values('IND09427KA','KA053408');
insert into owns values('IND64566KA','KA041702');

select * from owns;

insert into participated values('IND12345KA','KA052250',11,100000);
insert into participated values('IND98356KA','KA031181',12,150000);
insert into participated values('IND24386KA','KA095477',13,200000);
insert into participated values('IND09427KA','KA053408',14,120000);
insert into participated values('IND64566KA','KA041702',15,175000);

select * from participated;

select accident_date,location from accident;

update participated set damage_amount=25000 where reg_num='KA095477' and report_num=13;

select driver_id from participated where damage_amount>25000;

select * from participated order by damage_amount desc;

select avg(damage_amount) from participated;

select max(damage_amount) from participated;

