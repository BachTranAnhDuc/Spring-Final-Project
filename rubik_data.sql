drop database rubikdb;
create database rubikdb;

use rubikdb;

select * from roles;
select * from user_roles;
select * from users;
select * from categories;



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



insert into categories values (1, 'rubik_2x2x2', null, 1, '2x2x2.png', '2x2x2', null);
insert into categories values (2, 'rubik_3x3x3', null, 0, '3x3x3.png', '3x3x3', null);
insert into categories values (3, 'rubik_4x4x4', null, 1, '4x4x4.png', '4x4x4', null);
insert into categories values (4, 'rubik_5x5x5', null, 0, '5x5x5.png', '5x5x5', null);
insert into categories values (5, 'rubik_6x6x6', null, 1, '6x6x6.png', '6x6x6', null);
insert into categories values (6, 'rubik_7x7x7', null, 1, '7x7x7.png', '7x7x7', null);
insert into categories values (7, 'rubik_8x8x8', null, 1, '8x8x8.png', '8x8x8', null);
insert into categories values (8, 'rubik_9x9x9', null, 1, '9x9x9.png', '9x9x9', null);
insert into categories values (9, 'rubik_10x10x10', null, 1, '10x10x10.png', '10x10x10', null);
insert into categories values (10, 'rubik_11x11x11', null, 1, '11x11x11.png', '11x11x11', null);
insert into categories values (11, 'rubik_12x12x12', null, 1, '12x12x12.png', '12x12x12', null);
insert into categories values (12, 'rubik_gear', null, 1, '12x12x12.png', 'Gear', null);
insert into categories values (13, 'rubik_megaminx', null, 1, '12x12x12.png', 'Megaminx', null);
insert into categories values (14, 'rubik_mirror', null, 1, '12x12x12.png', 'Mirror', null);
insert into categories values (15, 'rubik_pyraminx', null, 1, '12x12x12.png', 'Pyraminx', null);
insert into categories values (16, 'rubik_skewb', null, 1, '12x12x12.png', 'Skewb', null);
insert into categories values (17, 'rubik_square-1', null, 1, '12x12x12.png', 'Square-1', null);

insert into categories values (18, 'rubik_3x3_gan_m_pro', null, 1, '3x3.png', 'Rubik 3x3 Gan 11 M Pro', 1);
insert into categories values (19, 'rubik_2x2_gan_m_pro', null, 1, '2x2.png', 'Rubik 2x2 Gan 11 M Pro', 18);
insert into categories values (25, 'kkk', null, 1, '2x2.png', 'kkk', 18);

