drop database rubikdb;
create database rubikdb;

use rubikdb;

select * from roles;
select * from user_roles;
select * from users;
select * from categories;
select * from brands;
select * from brands_categories;
select * from products;
select * from product_images;
select * from product_details;




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



insert into categories values (1, 'standard_rubik', null, 1, 'standard.png', 'rubik standard', null);
insert into categories values (2, 'variant_rubik', null, 1, 'standard.png', 'rubik variant', null);
insert into categories values (3, 'accessory', null, 1, 'standard.png', 'accessory', null);


insert into categories values (4, 'rubik_2x2x2', null, 1, '2x2x2.png', '2x2x2', 1);
insert into categories values (5, 'rubik_3x3x3', null, 0, '3x3x3.png', '3x3x3', 1);
insert into categories values (6, 'rubik_4x4x4', null, 1, '4x4x4.png', '4x4x4', 1);
insert into categories values (7, 'rubik_5x5x5', null, 0, '5x5x5.png', '5x5x5', 1);
insert into categories values (8, 'rubik_6x6x6', null, 1, '6x6x6.png', '6x6x6', 1);
insert into categories values (9, 'rubik_7x7x7', null, 1, '7x7x7.png', '7x7x7', 1);
insert into categories values (10, 'rubik_8x8x8', null, 1, '8x8x8.png', '8x8x8', 1);
insert into categories values (11, 'rubik_9x9x9', null, 1, '9x9x9.png', '9x9x9', 1);
insert into categories values (12, 'rubik_10x10x10', null, 1, '10x10x10.png', '10x10x10', 1);
insert into categories values (13, 'rubik_11x11x11', null, 1, '11x11x11.png', '11x11x11', 1);
insert into categories values (14, 'rubik_12x12x12', null, 1, '12x12x12.png', '12x12x12', 1);

insert into categories values (15, 'rubik_gear', null, 1, '12x12x12.png', 'Gear', 2);
insert into categories values (16, 'rubik_megaminx', null, 1, '12x12x12.png', 'Megaminx', 2);
insert into categories values (17, 'rubik_mirror', null, 1, '12x12x12.png', 'Mirror', 2);
insert into categories values (18, 'rubik_pyraminx', null, 1, '12x12x12.png', 'Pyraminx', 2);
insert into categories values (19, 'rubik_skewb', null, 1, '12x12x12.png', 'Skewb', 2);
insert into categories values (20, 'rubik_square-1', null, 1, '12x12x12.png', 'Square-1', 2);

insert into categories values (21, 'cubible_sticker', null, 1, '12x12x12.png', 'Sticker', 3);
insert into categories values (22, 'cubible_lube', null, 1, '12x12x12.png', 'Lube', 3);
insert into categories values (23, 'core', null, 1, '12x12x12.png', 'Core', 3);
insert into categories values (24, 'bag', null, 1, '12x12x12.png', 'Bag', 3);
insert into categories values (25, 'time_clock', null, 1, '12x12x12.png', 'Time Clock', 3);

insert into brands values (1, 'yong_jun.png', 'YongJun');
insert into brands values (2, 'qiyi.png', 'QiYi');
insert into brands values (3, 'moyu.png', 'MoYu');
insert into brands values (4, 'gan.png', 'GAN');
insert into brands values (5, 'dayan.png', 'DaYan');

insert into brands_categories values (1, 5);
insert into brands_categories values (2, 5);
insert into brands_categories values (3, 5);
insert into brands_categories values (4, 5);
insert into brands_categories values (1, 6);
insert into brands_categories values (2, 6);
insert into brands_categories values (3, 6);
insert into brands_categories values (4, 6);

insert into products values (1, 'Valk 5', 'valk-5', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (2, 'Valk 6', 'valk-6', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (3, 'Valk 7', 'valk-7', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (4, 'Valk 8', 'valk-8', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (5, 'Valk 9', 'valk-9', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (6, 'Valk 10', 'valk-10', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (7, 'Valk 11', 'valk-11', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (8, 'Valk 12', 'valk-12', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (9, 'Valk 13', 'valk-13', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (10, 'Valk 14', 'valk-14', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (11, 'Valk 15', 'valk-15', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (12, 'Valk 16', 'valk-16', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (13, 'Valk 17', 'valk-17', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (14, 'Valk 18', 'valk-18', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (15, 'Valk 19', 'valk-19', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
insert into products values (16, 'Valk 20', 'valk-20', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 5, 4);
