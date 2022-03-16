drop database rubikdb;
create database rubikdb;

use rubikdb;

select * from roles;
select * from user_roles;
select * from users;



delete from user_roles where user_id = 7;
delete from users where id = 7;

-- truncate table user_roles;
-- set foreign_key_checks = 0;
-- truncate table roles;
-- truncate table users;



insert into roles values (1, 'manage everything', 'Admin');
insert into roles values(2, 'manage product price, customers, shipping, orders and sales report', 'Salesperson');
insert into roles values(3, 'manage categories, brands, products, articles and menus', 'Editor');
insert into roles values(4, 'view products, view orders and update order status', 'Shipper');
insert into roles values(5, 'manage questions and reviews','Assistant');

insert into users values (1,'anhduc@gmail.com',1,'Duc','Bach Tran Anh','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt45.jpg');
insert into users values (2,'vinhduong@gmail.com',1,'Vinh','Duong Chan Nhat','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt11.jpg');
insert into users values (3,'thaolan@gmail.com',0,'Lan','Pham Thi Thao','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt1.jpg');
insert into users values (4,'jotaro@gmail.com',1,'Jotaro','Joestar','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt31.jpg');
insert into users values (5,'hannabaki@gmail.com',1,'Baki','Hanna','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt5.jpg');
insert into users values (6,'juchiro@gmail.com',0,'Juchiro','Hanna','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt6.jpg');
insert into users values (7,'someone@gmail.com',1,'one','some','123456789','avt7.jpg');
insert into users values (8,'someone1@gmail.com',1,'one1','some','123456789','avt8.jpg');
insert into users values (9,'someone2@hotmail.com',1,'one2','some','123456789','avt9.jpg');
insert into users values (10,'someone3@gmail.com',1,'one3','some','123456789e','avt10.jpg');
insert into users values (11,'someone4@mail.ru',1,'one4','some','123456789S','avt4.jpg');
insert into users values (12,'someon5@hotmail.com',0,'one5','some','123456789','avt18.jpg');
insert into users values (13,'someone6@gmail.com',1,'one6','some','123456789','avt20.jpg');
insert into users values (14,'someone7@gmail.com',1,'one7','some','123456789','avt37.jpg');
insert into users values (15,'someone8@yahoo.com',1,'one8','some','123456789','avt16.jpg');
insert into users values (16,'someone9@gmail.com',1,'one9','some','123456789','avt17.jpg');
insert into users values (17,'someone10@hotmail.com',0,'one10','some','123456789','avt2.jpeg');
insert into users values (18,'someone11@gmail.com',1,'one11','some','123456789','avt4.jpeg');
insert into users values (19,'someone12@gmail.com',1,'one12','some','123456789','avt27.jpg');
insert into users values (20,'someone13@hotmail.com',1,'one13','some','123456789y','avt22.jpg');
insert into users values (21,'someone14@gmail.com',1,'one14','some','123456789','avt23.jpg');
insert into users values (22,'someone15@gmail.com',0,'one15','some','123456789','avt30.jpg');
insert into users values (23,'someone16@yahoo.com',1,'one16','some','123456789','avt3.jpg');
insert into users values (24,'someone17@yahoo.com',1,'one17','some','123456789','avt14.jpg');
insert into users values (25,'someone18@yahoo.com',1,'one18','some','123456789','avt19.jpg');
insert into users values (26,'someone19@yahoo.com',1,'one19','some','123456789','avt19.jpg');
-- insert into users values ();

insert into user_roles values (1, 1);
insert into user_roles values (2, 1);
insert into user_roles values (3, 2);
insert into user_roles values (9, 2);
insert into user_roles values (10, 2);
insert into user_roles values (12, 2);
insert into user_roles values (13, 2);
insert into user_roles values (20, 2);
insert into user_roles values (4, 3);
insert into user_roles values (5, 3);
insert into user_roles values (7, 3);
insert into user_roles values (8, 3);
insert into user_roles values (11, 3);
insert into user_roles values (15, 3);
insert into user_roles values (18, 3);
insert into user_roles values (20, 3);
insert into user_roles values (14, 4);
insert into user_roles values (16, 4);
insert into user_roles values (17, 4);
insert into user_roles values (5, 5);
insert into user_roles values (14, 5);
insert into user_roles values (20, 5);
insert into user_roles values (21, 5);
insert into user_roles values (22, 5);
insert into user_roles values (23, 5);