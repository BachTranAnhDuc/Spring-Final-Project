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



insert into categories values (1, 'standard_rubik', null, 1, null, 'rubik standard', null);
insert into categories values (2, 'variant_rubik', null, 1, null, 'rubik variant', null);
insert into categories values (3, 'accessory', null, 1, null, 'accessory', null);


insert into categories values (4, 'rubik_2x2x2', '-1-', 1, '2x2.jpg', '2x2x2', 1);
insert into categories values (5, 'rubik_3x3x3', '-1-', 0, '3x3.jpg', '3x3x3', 1);
insert into categories values (6, 'rubik_4x4x4', '-1-', 1, '4x4.jpg', '4x4x4', 1);
insert into categories values (7, 'rubik_5x5x5', '-1-', 0, '5x5.jpg', '5x5x5', 1);
insert into categories values (8, 'rubik_6x6x6', '-1-', 1, '6x6.png', '6x6x6', 1);
insert into categories values (9, 'rubik_7x7x7', '-1-', 1, '7x7.jpg', '7x7x7', 1);
insert into categories values (10, 'rubik_8x8x8', '-1-', 1, '8x8.jpg', '8x8x8', 1);
insert into categories values (11, 'rubik_9x9x9', '-1-', 1, '9x9.jpg', '9x9x9', 1);
insert into categories values (12, 'rubik_10x10x10', '-1-', 1, '10x10.jpg', '10x10x10', 1);
insert into categories values (13, 'rubik_11x11x11', '-1-', 1, '11x11.jpg', '11x11x11', 1);
insert into categories values (14, 'rubik_12x12x12', '-1-', 1, '12x12.jpg', '12x12x12', 1);

insert into categories values (15, 'rubik_gear', '-2-', 1, 'gear.jpg', 'Gear', 2);
insert into categories values (16, 'rubik_megaminx', '-2-', 1, 'megaminx.jpg', 'Megaminx', 2);
insert into categories values (17, 'rubik_mirror', '-2-', 1, 'mirror.jpg', 'Mirror', 2);
insert into categories values (18, 'rubik_pyraminx', '-2-', 1, 'pyraminx.jpg', 'Pyraminx', 2);
insert into categories values (19, 'rubik_skewb', '-2-', 1, 'skewb.jpg', 'Skewb', 2);
insert into categories values (20, 'rubik_square-1', '-2-', 1, 'square_1.jpg', 'Square-1', 2);

insert into categories values (21, 'cubible_sticker', '-3-', 1, null, 'Sticker', 3);
insert into categories values (22, 'cubible_lube', '-3-', 1, null, 'Lube', 3);
insert into categories values (23, 'core', '-3-', 1, null, 'Core', 3);
insert into categories values (24, 'bag', '-3-', 1, null, 'Bag', 3);
insert into categories values (25, 'time_clock', '-3-', 1, null, 'Time Clock', 3);

insert into brands values (1, 'yongjun.png', 'YongJun');
insert into brands values (2, 'qiyi.jpg', 'QiYi');
insert into brands values (3, 'moyu.jpg', 'MoYu');
insert into brands values (4, 'gan.jpg', 'GAN');
insert into brands values (5, 'dayan.jpg', 'DaYan');
insert into brands values (6, 'diansheng.jpg', 'DianSheng');
insert into brands values (7, 'eastsheen.jpg', 'EastSheen');
insert into brands values (8, 'fanxin.jpg', 'Fanxin');
insert into brands values (9, 'gocube.png', 'GoCube');
insert into brands values (10, 'mofang.jpg', 'MoFang');
insert into brands values (11, 'monstergo.jpg', 'Monstergo');
insert into brands values (12, 'mscube.png', 'MsCube');
insert into brands values (13, 'valk.jpg', 'Valk');
insert into brands values (14, 'xmandesign.jpg', 'X-man Design');
insert into brands values (15, 'yuxin.png', 'Yuxin');

insert into brands_categories values (1, 4);
insert into brands_categories values (1, 5);
insert into brands_categories values (1, 6);
insert into brands_categories values (1, 7);
insert into brands_categories values (1, 8);
insert into brands_categories values (1, 9);
insert into brands_categories values (1, 16);
insert into brands_categories values (1, 18);
insert into brands_categories values (1, 20);
insert into brands_categories values (2, 4);
insert into brands_categories values (2, 5);
insert into brands_categories values (2, 6);
insert into brands_categories values (2, 7);
insert into brands_categories values (2, 8);
insert into brands_categories values (2, 9);
insert into brands_categories values (2, 16);
insert into brands_categories values (2, 18);
insert into brands_categories values (2, 19);
insert into brands_categories values (2, 20);
insert into brands_categories values (3, 4);
insert into brands_categories values (3, 5);
insert into brands_categories values (3, 6);
insert into brands_categories values (3, 7);
insert into brands_categories values (3, 8);
insert into brands_categories values (3, 9);
insert into brands_categories values (3, 18);
insert into brands_categories values (3, 19);
insert into brands_categories values (4, 4);
insert into brands_categories values (4, 5);
insert into brands_categories values (4, 6);
insert into brands_categories values (4, 16);
insert into brands_categories values (4, 18);
insert into brands_categories values (4, 19);
insert into brands_categories values (5, 4);
insert into brands_categories values (5, 5);
insert into brands_categories values (5, 16);
insert into brands_categories values (5, 19);
insert into brands_categories values (6, 5);
insert into brands_categories values (6, 6);
insert into brands_categories values (6, 7);
insert into brands_categories values (6, 8);
insert into brands_categories values (6, 9);
insert into brands_categories values (7, 5);
insert into brands_categories values (7, 6);
insert into brands_categories values (7, 7);
insert into brands_categories values (8, 5);
insert into brands_categories values (9, 4);
insert into brands_categories values (9, 5);
insert into brands_categories values (10, 4);
insert into brands_categories values (10, 5);
insert into brands_categories values (10, 6);
insert into brands_categories values (10, 7);
insert into brands_categories values (10, 8);
insert into brands_categories values (10, 9);
insert into brands_categories values (10, 16);
insert into brands_categories values (10, 18);
insert into brands_categories values (10, 19);
insert into brands_categories values (10, 20);
insert into brands_categories values (11, 4);
insert into brands_categories values (11, 5);
insert into brands_categories values (11, 18);
insert into brands_categories values (12, 5);
insert into brands_categories values (13, 5);
insert into brands_categories values (13, 6);
insert into brands_categories values (13, 7);
insert into brands_categories values (14, 4);
insert into brands_categories values (14, 5);
insert into brands_categories values (14, 6);
insert into brands_categories values (14, 8);
insert into brands_categories values (14, 9);
insert into brands_categories values (14, 16);
insert into brands_categories values (14, 18);
insert into brands_categories values (14, 19);
insert into brands_categories values (14, 20);
insert into brands_categories values (15, 4);
insert into brands_categories values (15, 5);
insert into brands_categories values (15, 6);
insert into brands_categories values (15, 7);
insert into brands_categories values (15, 8);
insert into brands_categories values (15, 9);
insert into brands_categories values (15, 16);
insert into brands_categories values (15, 18);
insert into brands_categories values (15, 19);
insert into brands_categories values (15, 20);

insert into products values (1, 'YJ MGC 2x2', 'YJ_MGC_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YJ MGC 2x2 is a fast and flexible magnetic 2x2 speed cube. A relatively strong magnetic feel coupled with smooth, light turning make this cube a favorite for beginners and professional solvers alike. The MGC 2x2 is&nbsp;a shining example of YJ's well-respected design philosophy: high performance, exceptional value.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Dry, fast turning</li><li>Flexible, stable mechanism</li><li>Controllable</li></ul><h4>Accessories included</h4><ul><li>Springs</li><li>Washers</li><li>Magnets</li></ul>", null, null, 1, 1, 7.00, 9.99, 5, 'main_yj_mgc_2x2_magnetic.jpg', 1, 1, 1, 1, 1, 4);

insert into products values (2, 'YJ YuPo V2 Magnetic 2x2', 'YJ_YuPo_V2_Magnetic_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YJ YuPo 2x2 V2 M is a fantastic budget friendly magnetic 2x2 speed cube. This puzzle turns well right out of the box and features a medium magnetic feel that is sure to please beginners and professional solvers alike.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Dry, fast turning</li><li>Flexible, stable mechanism</li><li>Controllable</li></ul><h4>Accessories included</h4><ul><li>Springs</li><li>Washers</li><li>Magnets</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'YJ-YuPo-V2-Magnetic-2x2-Black_Main.jpg', 1, 1, 1, 1, 1, 4);

insert into products values (3, 'YJ MGC2 Elite 2x2', 'YJ_MGC2_Elite_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MGC Elite 2x2 is the second 2x2 speed cube in the MGC Elite line. It features an innovative, first of its kind on a 2x2, center/edge magnetic mechanism that offers great control and stability.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li> and eco-friendly ABS material, which mean no fading, peeling or cheating!<li></li><li></li><li></li></ul>", null, null, 1, 1, 17, 19.99, 5, 'YJ-MGC-Elite-Magnetic-2x2-Black-2-Main.jpg', 1, 1, 1, 1, 1, 4);

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
insert into products values (17, 'Valk 21', 'valk-21', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 1, 6);
insert into products values (18, 'Valk 22', 'valk-22', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 2, 6);
insert into products values (19, 'Valk 23', 'valk-23', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 3, 6);
insert into products values (20, 'Valk 24', 'valk-24', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 4, 6);
insert into products values (21, 'Valk 25', 'valk-25', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 1, 6);
insert into products values (22, 'Valk 26', 'valk-26', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 2, 6);
insert into products values (23, 'Valk 27', 'valk-27', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 3, 6);
insert into products values (24, 'Valk 28', 'valk-28', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 4, 6);
insert into products values (25, 'Valk 29', 'valk-29', 'some text short description', 'some text full description', null, null, 1, 1, 1, 100, 120, 2, 1, 1, 1, 1, 1, 6);

insert into products values (3, 'YJ MGC2 Elite 2x2', 'YJ_MGC2_Elite_2x2', "<div><h3><b>Product Description</b></h3></div><span>&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li><li></li><li></li><li></li></ul>", null, null, 1, 1, 17, 19.99, 5, 'YJ-MGC-Elite-Magnetic-2x2-Black-2-Main.jpg', 1, 1, 1, 1, 1, 4);


-- INSERT INTO product_images

-- product id = 1
insert into product_images value (1, 'extras_yj_mgc_2x2_magnetic_1.jpg', 1);
insert into product_images value (2, 'extras_yj_mgc_2x2_magnetic_2.jpg', 1);
insert into product_images value (3, 'extras_yj_mgc_2x2_magnetic_3.jpg', 1);
insert into product_images value (4, 'extras_yj_mgc_2x2_magnetic_4.jpg', 1);

-- product id = 2
insert into product_images value (1, 'YJ-YuPo-V2-Magnetic-2x2-Extras-2.jpg', 2);
insert into product_images value (2, 'YJ-YuPo-V2-Magnetic-2x2-Stickerless-Bright-Extras-1.jpg', 2);

-- product id = 3
insert into product_images value (1, 'YJ-MGC-Elite-Magnetic-2x2-Stickerless-Bright-3-extras-1.jpg', 3);
insert into product_images value (2, 'YJ-MGC-Elite-Magnetic-2x2-4-extras-2.jpg', 3);
insert into product_images value (3, 'YJ-MGC-Elite-Magnetic-2x2-extras-3.jpg', 3);
insert into product_images value (4, 'YJ-MGC-Elite-Magnetic-2x2-extras-4.jpg', 3);
insert into product_images value (5, 'YJ-MGC-Elite-Magnetic-2x2-extras-5.jpg', 3);

-- INSERT INTO product_detailsb

-- product id = 1
insert into product_details value (1, 'Brand', 'YJ', 1);
insert into product_details value (2, 'Type', '2x2', 1);
insert into product_details value (3, 'Magnets', 'Magnetic', 1);
insert into product_details value (4, 'Gross Weight', '142g', 1);
insert into product_details value (5, 'Item Weight', '66.7g', 1);
insert into product_details value (5, 'Dimensions', '50.0mm', 1);

-- product id = 2
insert into product_details value (1, 'Brand', 'YJ', 2);
insert into product_details value (2, 'Type', '2x2', 2);
insert into product_details value (3, 'Magnets', 'Magnetic', 2);
insert into product_details value (4, 'Gross Weight', '77g', 2);
insert into product_details value (5, 'Item Weight', '65.0g', 2);
insert into product_details value (5, 'Dimensions', '50.0mm', 2);

-- product id = 3
insert into product_details value (1, 'Brand', 'YJ', 3);
insert into product_details value (2, 'Type', '2x2', 3);
insert into product_details value (3, 'Magnets', 'Magnetic', 3);
insert into product_details value (4, 'Gross Weight', '140g', 3);
insert into product_details value (5, 'Item Weight', '65.0g', 3);
insert into product_details value (5, 'Dimensions', '50.0mm', 3);
