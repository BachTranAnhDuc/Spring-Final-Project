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
select * from settings;
select * from currencies;
select * from customers;



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
insert into users values (3,'thaolan@gmail.com',1,'Lan','Pham Thi Thao','$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi','avt1.jpg');
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
insert into categories values (5, 'rubik_3x3x3', '-1-', 1, '3x3.jpg', '3x3x3', 1);
insert into categories values (6, 'rubik_4x4x4', '-1-', 1, '4x4.jpg', '4x4x4', 1);
insert into categories values (7, 'rubik_5x5x5', '-1-', 1, '5x5.jpg', '5x5x5', 1);
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

insert into categories values (21, 'Timer&Mats', '-3-', 1, null, 'Timer&Mats', 3);
insert into categories values (22, 'Timer&Skin', '-3-', 1, null, 'Timer&Skin', 3);
insert into categories values (23, 'Store&Display', '-3-', 1, null, 'Store&Display', 3);

insert into categories values (26, 'lubricant', null, 1, null, 'Lubricant', null);
insert into categories values (27, 'cosmic_lub', '-26-', 1, null, 'Cosmic Lub', 26);
insert into categories values (28, 'speed_lub', '-26-', 1, null, 'Speed Lub', 26);

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

insert into products values (1, 'YJ MGC 2x2', 'YJ_MGC_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YJ MGC 2x2 is a fast and flexible magnetic 2x2 speed cube. A relatively strong magnetic feel coupled with smooth, light turning make this cube a favorite for beginners and professional solvers alike. The MGC 2x2 is&nbsp;a shining example of YJ's well-respected design philosophy: high performance, exceptional value.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Dry, fast turning</li><li>Flexible, stable mechanism</li><li>Controllable</li></ul><h4>Accessories included</h4><ul><li>Springs</li><li>Washers</li><li>Magnets</li></ul>", null, null, 1, 1, 7.00, 9.99, 5, 'main_yj_mgc_2x2_magnetic.jpg', null, null, 1, 4);
insert into products values (2, 'YJ YuPo V2 Magnetic 2x2', 'YJ_YuPo_V2_Magnetic_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YJ YuPo 2x2 V2 M is a fantastic budget friendly magnetic 2x2 speed cube. This puzzle turns well right out of the box and features a medium magnetic feel that is sure to please beginners and professional solvers alike.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Dry, fast turning</li><li>Flexible, stable mechanism</li><li>Controllable</li></ul><h4>Accessories included</h4><ul><li>The YJ YuPo 2x2 V2 M is a budget friendly magnetic 2x2 from YJ. This puzzle turns well right out of the box.</li><li>It features a medium magnetic feel that is sure to please beginners and professional solvers alike. products</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'YJ-YuPo-V2-Magnetic-2x2-Black_Main.jpg', null, null, 1, 4);
insert into products values (3, 'YJ MGC2 Elite 2x2', 'YJ_MGC2_Elite_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MGC Elite 2x2 is the second 2x2 speed cube in the MGC Elite line. It features an innovative, first of its kind on a 2x2, center/edge magnetic mechanism that offers great control and stability.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MGC Elite 2x2 is the second speed cube in the MGC Elite line. It features an innovative, first of its kind on a 2x2, center/edge magnetic mechanism that offers great control and stability.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory. Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids. </li><li>Great corner cutting ,Tension adjustable. It doesn't corner twist as often nor does it lock up. Difficult to pop, good control of the cubes, comes pre-lubricated and tensioned.</li><li>No one falls out of love with the puzzle cubes. Perfect Christmas / Birthday / Children’s Day Gift Idea. This classic puzzle game will never go out of style. GIFT BOX PACKING Gift box packing makes it a perfect gift for your kids.</li></ul>", null, null, 1, 1, 17, 19.99, 5, 'YJ-MGC-Elite-Magnetic-2x2-Black-2-Main.jpg', null, null, 1, 4);
insert into products values (4, 'Angstrom MGC2 Elite 2x2', 'Angstrom_MGC2_Elite_2x2', "<div><h3><b>Product Description</b></h3></div><span>The Angstrom MGC2 Elite 2x2 features an innovative center/edge magnetic mechanism that offers great control and stability. This puzzle is lubed with Angstrom Gravitas, Angstrom Dignitas, and DNM-37. This a fast and long-lasting mixture that is superior to a traditional silicone setup.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Original puzzle made by YJ. It features an Angstrom Research logo on the red side.</li><li>Angstrom MGCElite 2x2</li><li>Cubicle Cube Stand (assorted color)</li><li>Angstrom Research Collectible Card</li></ul>", null, null, 1, 1, 17, 19.99, 5, 'MGCPicture2_Main.jpg', null, null, 1, 4);
insert into products values (5, 'GAN 249 V2 M', 'GAN_249_V2_M', "<div><h3><b>Product Description</b></h3></div><span>The GAN 249 V2 M the magnetized version of the GAN 249 V2. This 2x2 speed cube features a honeycomb design on the corner contact points and an overall smooth feel. The Stickerless version features a bright stickerless color scheme, primary plastic internals, while the black plastic version features the GAN Full Bright color scheme and black plastic internals.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The GAN249v2M has perfectly match of magnetic forces with elastic forces. Precisely placed 48 3*1.5 magnets inside. Easier to control the power of the cube with magnetic forces.</li><li>The GAN 249 V2 M the magnetized version of the GAN 249 V2. It features a honeycomb design on the corner contact points and an overall smooth feel. </li><li>The Stickerless version features a bright stickerless color scheme, primary plastic internals, while the black plastic version features the GAN Full Bright color scheme and black plastic internals. It is packaged inside a special GAN box with a plastic tensioning tool and GAN CFOP pamphlet </li><li>This 2x2 just glides its way to perfection. I'm really used to the buttery feel of GAN cubes, and this gives buttery a whole different meaning. It's smooth, but at the same time its not. If you turn it slowly, you can both feel and hear sort of a sandy and bumpy feeling from the honey-comb design and the magnets, but once you start scrambling and playing with it, it's so smooth but somehow has a dry feeling.</li><li>I won't say its the best on the market, but to my preferences, it's amazing. Nice job for a version 2 GAN! </li></ul>", null, null, 1, 1, 17, 19.99, 5, 'gan_249_v2_m_main.jpg', null, null, 4, 4);
insert into products values (6, 'GAN251 M Explorer', 'GAN251_M_Explorer', "<div><h3><b>Product Description</b></h3></div><span>The GAN251 M Explorer is the newest 2x2 speed cube from GAN. This cube features all of the same characteristics of the 249 V2 M like great corner cutting, matte finish, a light/airy feel, and a medium magnetic strength. This small increase in size (2mm), although seemingly insignificant, is definitely noticeable and gives the solver much more control over the puzzle and ultimately leads to a better solving experience!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>GAN 251 M UPGRADED - 3 versions available from the menu: Air, Pro and Leap. With magnetic core inside, new GAN 251 series has smoother turning feel and lighter body.</li><li>WHAT MAKES THE DIFFERENCE - GAN 251 M Air has unadjustable corner magnets but no magnet in the core. That reduces the weight and the cube turns very straightforward. Both Pro and Leap have the same corner core adjustable magnet system, and Leap has much bigger mangets in the core. Overall, two versions perform consistently good, Pro has better stability and Leap has faster speed.</li><li>VARIOUS TUNING - Tuning versatility is always GAN's prominent feature, and GAN 251 M remain so. It is equipped with 2 kinds of nut distances, 4 levels elasticity, and optional 3 settings of magnets(Pro & Leap). All 24 configurations can be achieved within seconds, only a tool and alternative GES nut needed. Have more styles to tune but cost less time to explore.</li><li>FINE CRAFTMANSHIP - The mechanism of GAN251 M series supports adjustable magnet strength(Pro & Leap) and tension tuning individually, with great corner cutting and rounded slide track. All features combined together are less than 60 grams in total, serving as buttery smooth in your hands.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 27, 29.99, 5, 'GAN251_M_Explorer_Main.jpg', null, null, 4, 4);
insert into products values (7, 'GAN 251 M Pro', 'GAN_251_M_Pro', "<div><h3><b>Product Description</b></h3></div><span>The GAN251 M Explorer is the newest 2x2 speed cube from GAN. This cube features all of the same characteristics of the 249 V2 M like great corner cutting, matte finish, a light/airy feel, and a medium magnetic strength. This small increase in size (2mm), although seemingly insignificant, is definitely noticeable and gives the solver much more control over the puzzle and ultimately leads to a better solving experience!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>GAN 251 M UPGRADED - 3 versions available from the menu: Air, Pro and Leap. With magnetic core inside, new GAN 251 series has smoother turning feel and lighter body.</li><li>WHAT MAKES THE DIFFERENCE - GAN 251 M Air has unadjustable corner magnets but no magnet in the core. That reduces the weight and the cube turns very straightforward. Both Pro and Leap have the same corner core adjustable magnet system, and Leap has much bigger mangets in the core. Overall, two versions perform consistently good, Pro has better stability and Leap has faster speed.</li><li>VARIOUS TUNING - Tuning versatility is always GAN's prominent feature, and GAN 251 M remain so. It is equipped with 2 kinds of nut distances, 4 levels elasticity, and optional 3 settings of magnets(Pro & Leap). All 24 configurations can be achieved within seconds, only a tool and alternative GES nut needed. Have more styles to tune but cost less time to explore.</li><li>FINE CRAFTMANSHIP - The mechanism of GAN251 M series supports adjustable magnet strength(Pro & Leap) and tension tuning individually, with great corner cutting and rounded slide track. All features combined together are less than 60 grams in total, serving as buttery smooth in your hands.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 31, 32.99, 5, 'GAN251_M_Explorer_Main.jpg', null, null, 4, 4);
insert into products values (8, 'The GAN 251 M Leap', 'The_GAN_251_M_Leap', "<div><h3><b>Product Description</b></h3></div><span>Product Description</b></h3></div><span>The GAN 251 M Leap is an updated 2x2 mechanism which features corner/core and traditional magnets just like the GAN 11 M Pro. This version also utilizes large angle magnetic alignment technology, an internal magnet design that helps the cube snap into place easier and faster.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>GAN 251 M UPGRADED - 3 versions available from the menu: Air, Pro and Leap. With magnetic core inside, new GAN 251 series has smoother turning feel and lighter body.</li><li>WHAT MAKES THE DIFFERENCE - GAN 251 M Air has unadjustable corner magnets but no magnet in the core. That reduces the weight and the cube turns very straightforward. Both Pro and Leap have the same corner core adjustable magnet system, and Leap has much bigger mangets in the core. Overall, two versions perform consistently good, Pro has better stability and Leap has faster speed.</li><li>VARIOUS TUNING - Tuning versatility is always GAN's prominent feature, and GAN 251 M remain so. It is equipped with 2 kinds of nut distances, 4 levels elasticity, and optional 3 settings of magnets(Pro & Leap). All 24 configurations can be achieved within seconds, only a tool and alternative GES nut needed. Have more styles to tune but cost less time to explore.</li><li>FINE CRAFTMANSHIP - The mechanism of GAN251 M series supports adjustable magnet strength(Pro & Leap) and tension tuning individually, with great corner cutting and rounded slide track. All features combined together are less than 60 grams in total, serving as buttery smooth in your hands.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 37, 39.99, 5, 'GAN_251_M_Leap_Main.jpg', null, null, 4, 4);
insert into products values (9, 'MoYu WeiPo 2x2 WR M', 'MoYu_WeiPo_2x2_WR_M', "<div><h3><b>Product Description</b></h3></div><span>The WeiPo 2x2 WRS from MoYu is a leap forward in 2x2 design from the famous company. This 2x2 has a magnetic adjustment system as well as a spring compression adjustment so you can find your perfect setup!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The WeiPo 2x2 WRS from MoYu is a leap forward in 2x2 design from the famous company. This 2x2 has a magnetic adjustment system as well as a spring compression adjustment so you can find your perfect setup!</li></ul>", null, null, 1, 1, 17, 19.99, 5, 'The_GAN_251_M_Leap_Main.jpg', null, null, 3, 4);
insert into products values (10, 'MoYu RS2 M 2x2', 'MoYu_RS2_M_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MoYu RS2 M 2x2 is the latest puzzle in the RS line. It features frosted plastic, medium/strong magnetic strength, and smooth turning right out of the box.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu RS2 M 2x2 is the latest puzzle in the RS line. It features frosted plastic, medium/strong magnetic strength, and smooth turning right out of the box.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating! The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves </li><li>Magnetic Positioning Technology - magnets inside the cube improve the hand feel, magnet slots ensure the magnets placed accurately.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 5, 7.99, 5, 'MoYu_RS2_M_2x2_Main.jpg', null, null, 3, 4);
insert into products values (11, 'Qiyi QiDi S 2x2 - Jelly', 'Qiyi_QiDi_S_2x2_Jelly', "<div><h3><b>Product Description</b></h3></div><span>The Qiyi QiDi S 2x2 - Jelly is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi QiDi S 2x2 is the latest 2x2 from QiYi/MoFangGe. It features a frosted, scratch-resistant surface, and symmetrical positioning technology -- all at a very economical price </li><li>The Qiyi QiDi S 2x2 - Jelly is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.</li></ul>", null, null, 1, 1, 4, 5.99, 5, 'Qiyi_QiDi_S_2x2_Jelly_Main.jpg', null, null, 2, 4);
insert into products values (12, 'QiYi MS 2x2', 'QiYi_MS_2x2', "<div><h3><b>Product Description</b></h3></div><span>The QiYi MS 2x2 is a magnetic 2x2 speed cube built for performance and economy. Part of QiYi’s new economy “MS” line, this 2x2 has an unbelievably light and quick feel. This puzzle is sure to please beginners and advanced solvers alike.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi QiDi S 2x2 is the latest 2x2 from QiYi/MoFangGe. It features a frosted, scratch-resistant surface, and symmetrical positioning technology -- all at a very economical price </li><li>The Qiyi QiDi S 2x2 - Jelly is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'QiYi_MS_2x2_Main.jpg', null, null, 2, 4);
insert into products values (13, ' QiYi MP 2x2 M', ' QiYi_MP_2x2_M', "<div><h3><b>Product Description</b></h3></div><span>The QiYi MP 2x2 M is a magnetic 2x2 with a smooth feel. The magnets on this cube are on the stronger side, but feel good when turning. This cube features a glossy outer finish and vibrant stickerless bright shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi QiDi S 2x2 is the latest 2x2 from QiYi/MoFangGe. It features a frosted, scratch-resistant surface, and symmetrical positioning technology -- all at a very economical price </li><li>The QiYi MP 2x2 M is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.</li></ul>", null, null, 1, 1, 14, 15.99, 5, 'QiYi_MP_2x2_M_Main.jpg', null, null, 2, 4);
insert into products values (14, 'YuXin Little Magic 2x2', 'YuXin_Little_Magic_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YuXin Little Magic 2x2 feel, that so many people have come to enjoy, is now available with factory magnets! This is a great magnetic speed cube for any skill level from beginner to professional.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Yuxin Little Magic 2x2 is a fast, sandy feeling 2x2 that retains the feel of its 3x3 counterpart. It is definitely a competitor for best budget 2x2 on the market.</li><li>Super light, super fast. All I did was loosen it a few turns to unlock better corner cutting. Great for people who like light and fast cubes</li><li>It has a lot of grooves which are great for speed, and they fit nicely together giving it a stable feel. The frosted plastic is subtle. The turning feels smooth and a little scratchy.</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'YuXin_Little_Magic_2x2_Main.jpg', null, null, 15, 4);
insert into products values (15, 'Little Magic 2x2 V2 M', 'Little_Magic_2x2_V2_M', "<div><h3><b>Product Description</b></h3></div><span>The Little Magic 2x2 V2 M is a new magnetic 2x2 from YuXin. This puzzle has a medium/strong magnetic feel, black internals, and features vibrant stickerless bright shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Yuxin Little Magic 2x2 is a fast, sandy feeling 2x2 that retains the feel of its 3x3 counterpart. It is definitely a competitor for best budget 2x2 on the market.</li><li>Super light, super fast. All I did was loosen it a few turns to unlock better corner cutting. Great for people who like light and fast cubes</li><li>It has a lot of grooves which are great for speed, and they fit nicely together giving it a stable feel. The frosted plastic is subtle. The turning feels smooth and a little scratchy.</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'Little_Magic_2x2_V2_M_Main.jpg', null, null, 15, 4);
insert into products values (16, 'MFJS MeiLong 2x2 M', 'MFJS_MeiLong_2x2_M', "<div><h3><b>Product Description</b></h3></div><span>The MFJS MeiLong 2x2 M is a budget friendly magnetic 2x2 speed cube from MFJS. It offers great performance and a medium/light magnetic feel at a fraction of the cost of other magnetic 2x2s!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MFJS MeiLong 2x2 M is a budget friendly magnetic 2x2 speed cube from MFJS. It offers great performance and a medium/light magnetic feel at a fraction of the cost of other magnetic 2x2s!</li><li>So ootb this cube does not feel cheap, kinda like the 251 it has a nice hollow feeling and crunchy turning, the corner cutting is amazing and its a really fast cube, it out preforms a fully setup gan 251 M, holy this cube is amazing </li><li>This puzzle is sure to be a challenge for beginners and seasoned puzzlers alike. It comes in vibrant stickerless bright shades </li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 5.00, 6.99, 5, 'MFJS_MeiLong_2x2_M_Main.jpg', null, null, 10, 4);
insert into products values (17, 'Moyu MoFang JiaoShi Macaron Meilong 2x2 stickerless', 'MFJS_MeiLong_2x2_Macaron', "<div><h3><b>Product Description</b></h3></div><span>The MFJS MeiLong 2x2 - Macaron is a budget friendly 2x2 speed cube from MoFang JiaoShi. This puzzle features smooth turning right out of the box, and light pastel shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MFJS MeiLong 2x2 M is a budget friendly magnetic 2x2 speed cube from MFJS. It offers great performance and a medium/light magnetic feel at a fraction of the cost of other magnetic 2x2s!</li><li>So ootb this cube does not feel cheap, kinda like the 251 it has a nice hollow feeling and crunchy turning, the corner cutting is amazing and its a really fast cube, it out preforms a fully setup gan 251 M, holy this cube is amazing </li><li>This puzzle is sure to be a challenge for beginners and seasoned puzzlers alike. It comes in vibrant stickerless bright shades </li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 6.00, 7.99, 5, 'MFJS_MeiLong_2x2_Macaron_Main.jpg', null, null, 10, 4);
insert into products values (18, 'DaYan TengYun 2x2 M', 'DaYan_TengYun_2x2_M', "<div><h3><b>Product Description</b></h3></div><span>The TengYun M is the newest 2x2 from DaYan. This puzzle is factory magnetized with medium/strong magnets and has wavy ridges on the inside of the pieces to ensure smooth turning. This puzzle takes the smooth, quiet feel from the TengYun 3x3 M and puts it in a very exciting 2x2.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The TengYun M is the newest 2x2 from DaYan. This puzzle is factory magnetized with medium/strong magnets and has wavy ridges on the inside of the pieces to ensure smooth turning.</li><li>This puzzle takes the smooth, quiet feel from the TengYun 3x3 M and puts it in a very exciting 2x2.</li><li>Environmental material, Using the original ABS material: no stickers, non-poisonous material, the color will never fade. Smooth and fast ,solve it when each side matches.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul></ul>", null, null, 1, 1, 17.00, 18.99, 5, 'DaYan_TengYun_2x2_M_Main.jpg', null, null, 5, 4);
insert into products values (19, 'GoCube 2x2', 'GoCube_2x2', "<div><h3><b>Product Description</b></h3></div><span>The GoCube 2x2 is a smart 2x2x2 puzzle that works with the GoCube app! This puzzle is pillowed with colorful tiles surrounded by transparent plastic in the style of the original GoCube. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>SMART & CONNECTED - This smart cube wirelessly connects to your phone or tablet and allows everyone to LEARN how to solve the iconic puzzle Cube. THE PERFECT WAY TO GET INTO CUBING! And don’t be fooled by it, the GoCube 2x2 is still VERY challenging ;) LEARN, IMPROVE & PLAY!</li><li>EVERYONE CAN SOLVE IT! - Use the mobile FREE application to learn how to solve the cube. Track your electronic cube progress, Get accurate stats to improve your solve time, challenge yourself and get better! Sharpen your skills and join our global leaderboard.</li><li>INNOVATIVE & EDUCATIONAL - The GoCube 2x2 is the perfect STEM toy, it is educational and fun, and adds tons of value to screen time! Learn the fundamentals of Problem Solving in a fun and interactive way, develop your child’s memorization skills as well as hand & eye coordination. Proven to build Self-Esteem and Confidence. Oh, the look in their eyes when they solve it for the first time…</li><li>THE PERFECT GIFT FOR THE HOLIDAYS - The GoCube 2x2 is FUN, EDUCATIONAL and TECHIE. EVERYONE would love it! This is the best brain teaser, and a perfect gift for the holidays, especially when Covid is around and everyone is looking for new innovative toys to entertain their family! FITS ALL AGES & CAPABILITIES !!</li><li>1 YEAR WARRANTY, SUPERB CUSTOMER SERVICE - A family-friendly game, perfect for Family Saturday Nights, while on-the-go, flights and road trips. The GoCube 2x2 comes with a travel pouch, it is light and durable and will entertain your family for hours!! Oh, and you have a 1-year-warranty on your cube and superb customer support! </li></ul>", null, null, 1, 1, 47, 49.99, 5, 'GoCube_2x2_Main.jpg', null, null, 9, 4);
insert into products values (20, 'MonsterGO 2x2', 'MonsterGO_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MonsterGO 2x2 is a non-magnetic 2x2 that features frosted plastic, vibrant stickerless bright shades, and GES nuts installed for tensioning.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>That is a perfect product</li></ul>", null, null, 1, 1, 10.00, 1.99, 5, 'MonsterGO_2x2_Main.jpg', null, null, 11, 4);
insert into products values (21, 'X-MAN FLARE 2X2 M', 'X-MAN_FLARE_2X2_M', "<div><h3><b>Product Description</b></h3></div><span>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style</li></ul></ul>", null, null, 1, 1, 15.00, 16.99, 5, 'X-MAN_FLARE_2X2_M_Main.jpg', null, null, 14, 4);
insert into products values (22, 'ANGSTROM X-MAN FLARE 2X2 M', 'ANGSTROM_X-MAN_FLARE_2X2_M', "<div><h3><b>Product Description</b></h3></div><span>The Angstrom X-Man Flare 2x2 M is one of our premium versions of QiYi’s flagship 2x2 in the X-Man series featuring adjustable magnets. It is set up with Angstrom Gravitas, Angstrom Dignitas, and DNM-37 on the pieces, creating a smooth and controllable turing experience, especially after breaking it in.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style</li></ul></ul>", null, null, 1, 1, 25.00, 26.99, 5, 'ANGSTROM_X-MAN_FLARE_2X2_M_Main.jpg', null, null, 14, 4);
insert into products values (23, 'PRO SHOP X-MAN FLARE 2X2 M', 'PRO_SHOP_X-MAN_FLARE_2X2_M', "<div><h3><b>Product Description</b></h3></div><span>The Pro Shop X-Man Flare 2x2 M is one of our premium versions of QiYi’s flagship 2x2 in the X-Man series featuring adjustable magnets. It is set up with Traxxas-30k, Lubicle Speedy, and DNM-37 on the pieces, creating a fast and controllable turing experience.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.</li></ul></ul>", null, null, 1, 1, 22.00, 23.99, 5, 'ANGSTROM_X-MAN_FLARE_2X2_M_Main.jpg', null, null, 14, 4);
insert into products values (24, 'YUXIN HUANGLONG 3X3 M', 'YUXIN_HUANGLONG_3X3_M', "<div><h3><b>Product Description</b></h3></div><span>The latest flagship 3x3 speed cube from Yuxin is a light and airy puzzle that offers fast, snappy turning with a very stable feel. All of this at what we consider to be a relatively low price point. This magnetic version has a stronger magnet feel than most other factory magnetized puzzles.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The latest flagship 3x3 from Yuxin is a light and airy puzzle that offers fast, snappy turning with a very stable feel. All of this at what we consider to be a relatively low price point.</li><li>This speedcube is AMAZING!! I just got it in stickerless, With lubicle Black, and I love it so much!! It’s extremly fast(almost too fast, but I’ll get used to it) and quiet. I love this thing and I recommend it to anyone!</li><li>Great out of the box, but dry. Tensioned evenly too. When I took it apart to 'Lubicle Black' the core, I found each center piece spring set to contain 3x washers! There are 2x washers at the base of the spring and a washer at the screw head surface. Lubing it still helped a little. After hitting it with Angstrom Gravitas and Dignitas, I tensioned for 45 degree corner cutting with slight effort and broke it in. Finally some dnm-37, and wow! After lube, I can really feel the magnetic strength. I t</li><li>I think that this cube is now my main. This is one of the greatest cubes I’ve ever felt and I’ve felt a lot. This flagship cube has great inner pieces that help the cube go smoothly when solving. It is very fast right out of the box which is really good. I like fast and uncontrollable cubes so this one is for me. I’ve heard that the Angstrom Reasearch lube has worked really nice on this too. I really have enjoyed this cube. It is affordable and reliable.</li><li>This magnetic version has a stronger magnet feel than most other factory magnetized puzzles.</li></ul></ul>", null, null, 1, 1, 23.00, 24.99, 5, 'YUXIN_HUANGLONG_3X3_M_Main.jpg', null, null, 15, 5);
insert into products values (25, 'GoCube-X 3x3', 'GoCube_X_3x3', "<div><h3><b>Product Description</b></h3></div><span>The GoCube-X 3x3 is a new, less expensive smart cube from the famous brand. This one is non-magnetic, but still has all of the tracking of the original GoCube!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>SMART & CONNECTED - LEARN how to solve the iconic puzzle Cube - FINALLY EVERYONE CAN DO IT!! IMPROVE your game, PLAY & BATTLE online with other cubers from all over the world. The GoCube is the perfect STEM toy, it is educational and fun, and adds tons of value to screen time! It fits all ages and capabilities and is the perfect gift.</li><li>AWARD-WINNING - Awarded by the Parent’s Choice and the Tillywig Toy (Brain Toy). One of the “BEST TECHY Gifts” (WSJ) and “Best STEM Toys” two yeras in a row (WIRED). 4.6 stars with over 2,000 reviews!, Superb customer service! Full with technology, 3D real-time tracking, smart sensors, IMU, lighting system, comes with the full set of accessories! 1 YEAR WARRANTY!</li><li>LEARN & IMPROVE - Use the mobile application to learn how to solve the cube, and track your electronic cube progress. Get accurate stats to improve your solve time, challenge yourself and get better! Sharpen your skills and join our global leaderboard.</li><li>CONNECT WITH FRIENDS - Play classic games like simon or CubeHero, Join our global community of cubers and battle with friends and players from all over the world!!</li><li>INNOVATIVE & EDUCATIONAL - The GoCube teaches the fundamentals of Problem Solving and develops Spatial Awareness, Memorization Skills and Hand & Eye Coordination. It helps to build Self-Esteem and Confidence. Oh, the look in their eyes when they solve it for the first time… The GoCube is an amazing brain-teaser gadget - Get it for yourself and for others!</li></ul>", null, null, 1, 1, 37.00, 39.99, 5, 'GoCube_X_3x3_Main.jpg', null, null, 9, 5);
insert into products values (26, 'GoCube The Connected Electronic Bluetooth Cube', 'GoCube_Edge_3x3', "<div><h3><b>Product Description</b></h3></div><span>One of the first smart cubes ever released, The GoCube Edge is a magnetic 3x3 equipped with Bluetooth 5.0. This model features a novel pillowed design, giving it a cool, futuristic appearance. GoCube’s accompanying app allows you to race with cubers around the world, play mini-games, learn, and compete in speedcubing events.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>SMART & CONNECTED - LEARN how to solve the iconic puzzle Cube - FINALLY EVERYONE CAN DO IT!! IMPROVE your game, PLAY & BATTLE online with other cubers from all over the world. The GoCube is the perfect STEM toy, it is educational and fun, and adds tons of value to screen time! It fits all ages and capabilities and is the perfect gift.</li><li>AWARD-WINNING - Awarded by the Parent’s Choice and the Tillywig Toy (Brain Toy). One of the “BEST TECHY Gifts” (WSJ) and “Best STEM Toys” two yeras in a row (WIRED). 4.6 stars with over 2,000 reviews!, Superb customer service! Full with technology, 3D real-time tracking, smart sensors, IMU, lighting system, comes with the full set of accessories! 1 YEAR WARRANTY!</li><li>LEARN & IMPROVE - Use the mobile application to learn how to solve the cube, and track your electronic cube progress. Get accurate stats to improve your solve time, challenge yourself and get better! Sharpen your skills and join our global leaderboard.</li><li>CONNECT WITH FRIENDS - Play classic games like simon or CubeHero, Join our global community of cubers and battle with friends and players from all over the world!!</li><li>INNOVATIVE & EDUCATIONAL - The GoCube teaches the fundamentals of Problem Solving and develops Spatial Awareness, Memorization Skills and Hand & Eye Coordination. It helps to build Self-Esteem and Confidence. Oh, the look in their eyes when they solve it for the first time… The GoCube is an amazing brain-teaser gadget - Get it for yourself and for others!</li></ul>", null, null, 1, 1, 77.00, 79.99, 5, 'GoCube_Edge_3x3_Main.jpg', null, null, 9, 5);
insert into products values (27, 'Monster Go 3Ai, 3x3 Speed Cube MG356 Smart Cube', 'MonsterGO_AI_3x3', "<div><h3><b>Product Description</b></h3></div><span>The MonsterGO AI 3x3 is a smart cube designed for kids and beginners. Featuring a sturdy mechanism and support from the CubeStation App, this is a cube that will have you or the budding cuber in your life solving in no time!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>LONG-LASTING EDUCATIONAL SMART TOY: Monster Go Smart Cube is the 3x3 cube with compatible app that helps you solve it as a beginner and improve yourself as a cuber. With inside replaceable battery, it offers a 280-hour play time. Awesome STEM toy!</li><li>EASY TO PICK UP, HARD TO PUT DOWN: With in-app video tutorial and 7-step solving instruction, even a beginner can quickly learn to solve individually. Get one and you'll soon be attracted and addicted to this smart cube.</li><li>TRACKING AND BATTLE, AS ALWAYS: Monster Go Smart Cube measures and saves your solve in 4 parameters: Time/Move/TPS/Fluency. Online battle is also available in MG3 Ai. Match same level opponent within seconds, anytime, anywhere!</li><li>ALSO A GOOD CUBE FOR SPEED CUBING: Intelligence and performance are perfectly combined in MG3 Ai. Weight only 81g while adopting sensors, battery, circuit board iniside, and still keeps great handfeel and excellent corner cutting. Turns smoothly!</li><li>SATISFACTION GUARANTEED OR YOUR MONEY BACK - The cube goes through strict testing and comes in exquisite package. If for any reason you are not happy with this 3x3 speed cube, just tell us and a replacement or a full refund will be applied. Go get this little puzzle and start exploring the world of cubing!</li></ul>", null, null, 1, 1, 27.00, 29.99, 5, 'MonsterGO_AI_3x3_Main.jpg', null, null, 11, 5);
insert into products values (28, 'Eastsheen 3x3x3 Cube with Wall Stickers', 'Eastsheen_3x3x3_Cube', "<div><h3><b>Product Description</b></h3></div><span>That is a perfect rubik!!!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Eastsheen 3x3x3 Cube with Wall Stickers is a standard Eastsheen 3x3 with stickers applied that have a marble texture look to them.</li></ul>", null, null, 1, 1, 12.00, 14.99, 5, 'Eastsheen_3x3x3_Cube_Main.jpg', null, null, 7, 5);
insert into products values (29, 'Cuberspeed YJ MGC evo Magnetic stickerless 3x3', 'YJ_MGC_Evo_3x3', "<div><h3><b>Product Description</b></h3></div><span>The YJ MGC Evo is the latest 3x3 in the MGC line. This cube features 6 magnetic adjustments and 10 compression adjustments. All of these can be changed with just your hand and this small screwdriver that comes with the puzzle.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The YJ MGC Evo is the latest 3x3 in the MGC line. This cube features 6 magnetic adjustments and 10 compression adjustments. All of these can be changed with just your hand and this small screwdriver that comes with the puzzle.</li></ul>", null, null, 1, 1, 24.00, 25.99, 5, 'YJ_MGC_Evo_3x3_Main.jpg', null, null, 1, 5);
insert into products values (30, 'Cubelelo MsCube Ms3-v1 3x3 Stickerless Standard', 'MsCube_MS3_V1_M', "<div><h3><b>Product Description</b></h3></div><span>The MsCUBE Ms3-v1 is a new magnetic speedcube by up-and-coming MsCUBE. Designed by a former GAN designer, the Ms3-v1 has a crunchy, tactile feel with a high degree of flex. The Enhanced edition features a dual magnetic positioning system. If you’re curious about a speedcube made by a brand new manufacturer, give this one a try!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>PREMIUM MAGNETIC BUDGET CUBE: The MsCube Ms3-v1 3x3 is the new and latest flagship 3x3 by up-coming manufacturer MsCUBE, designed by a former GAN designer. The Ms3-v1 includes all new magnetic core design and spider web design. This puzzle features a smooth, soft feel and it comes in two versions Standard & Enhanced.</li><li>SPECIFICATIONS: Size (in mm) – 55.5 x 55.5 x 55.5 | Product Weight (in grams) - 79 | Package Weight (in grams) – 218 | Package Contents - 1 Unit Cube, Cube Pouch, Cube stand, Manual, Card, Extra Springs and Alternative Shaft | Recommended Age Group (in years) : 3 + | Suitable for : Kids, Men, Women, Girls, Boys, College and school students, Office goers.</li><li>EASY TO ASSEMBLE AND LUBRICATE: Don't worry if the cube pops out (dis-assembles)while solving, it's very easy and a fun learning experience to assemble it back; Use proper lubrication to avoid any spring noise or lock-ups during solves and increases the smoothness of your cube, giving it longer life; Cubes normally become smoother after a few solves, so do not worry if it is turning a bit rough out of the box;If you face any difficulty in operating the cube let us know,we will be happy to help</li><li>BENEFITS-GET RID OF SCREEN ADDICTION: Give your child more playtime and reduce their addiction to mobile gaming and excessive screen-time; Helps in enhancing concentration, analytical and problem solving skills,memory and mind;Builds better hand-eye coordination,patience in solving real life problems and handling anxiety; It's a brain exercise for all ages to help increase the intelligence of kids, release work pressure of the adults, to help prevent a decline in memory of the elderly</li><li>PERFECT GIFT IDEA: No one falls out of love with the magic puzzle cube. Perfect Festive gift, Valentines, Friendship day,Holi, Diwali, Rakshabandhan (rakhi),Christmas Gift,Birthday Gift for kids, students, friends, college goers, adults, men, women, girls, boys, school students; Amaze everyone with your cubing skills; keep it on office desk as decorative item, ; This classic magic cube puzzle game will never go out of style, gift your loved ones today </li></ul>", null, null, 1, 1, 32.00, 34.99, 5, 'MsCube_MS3_V1_M_Main.jpg', null, null, 12, 5);
insert into products values (31, 'Valk 3 Elite M Magnetic 3x3x3 Stickerless', 'Valk_3_Elite_M', "<div><h3><b>Product Description</b></h3></div><span>The Valk 3 is one of the most-anticipated cubes ever. Personally endorsed and used by renowned speedcuber Mats Valk himself, the Valk 3 has been touted as the premier speedcube from popular cube manufacturer QiYi/MoFangGe.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Valk 3 Elite is the long-awaited flagship from the famous Valk line by QiYi MoFangGe.</li><li>This cube features a brand new magnetic system with three different levels of strength. The moderate and strong versions features a 'twin-magnetic' scheme and uses 'center-edge' plus 'corner-edge' magnetism for positioning </li><li>The Valk 3 Elite comes with a variety of accessory packs that include magnetic center caps, spring accessories, cleaning cloth, extra logos, and a Mats Valk signature card.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style</li></ul>", null, null, 1, 1, 47.00, 49.99, 5, 'Valk_3_Elite_M_Main.jpg', null, null, 13, 5);
insert into products values (32, 'MoYu WeiLong AI Bluetooth 3x3', 'MoYu_WeiLong_AI_3x3', "<div><h3><b>Product Description</b></h3></div><span>The WeiLong AI is a new smart cube from MoYu. The mechanism is based on the WR M 2020, so its performance is not compromised like all previous smart cubes. This puzzle also features a gyroscope to track rotations.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu WeiLong AI Bluetooth 3x3 is MoYu's first smart cube release! What immediately sets the WeiLong AI apart from other smart cubes is the cube itself.</li><li>The cube is essentially a WR M 2020 with a gyroscope which means that you will be able to speed cube without any limitations!</li><li>The free downloadable app contains many features that will help you not only improve your times but also have tons of fun!</li><li></li>Disclaimer: Make sure the bottom of the charging base is set to 'C'. Only use setting 'D' if the cube is not charging normally. For more information, refer to the included documentation.</ul>", null, null, 1, 1, 63.00, 64.99, 5, 'MoYu_WeiLong_AI_3x3_Main.jpg', null, null, 3, 5);
insert into products values (33, 'The Yoo Cube Deluxe 3x3', 'The_Yoo_Cube_Deluxe_3x3', "<div><h3><b>Product Description</b></h3></div><span>The Yoo Cube Deluxe is the ultimate Yoo Cube. This custom built magnetic core WeiLong WR M 2021 MagLev has a smooth, creamy texture from the Cubicle Labs Mystic, Angstrom Dignitas, Weight 5, and DNM-37 on the pieces and Weight 5 in the core. Out of the box, it has a strong magnetic setting and medium spring compression.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li><li></li><li></li></ul>", null, null, 1, 1, 57.00, 59.99, 5, 'The_Yoo_Cube_Deluxe_3x3_Main.jpg', null, null, 3, 5);
insert into products values (34, 'Cuberspeed Moyu Weilong WR M 2021 3x3 stickerless', 'MAX_WeiLong_WR_M_3x3', "<div><h3><b>Product Description</b></h3></div><span>The MAX Weilong WR M is a smooth, controllable 3x3 with excellent turning. This puzzle features moderately strong factory-installed magnets, a ridgeless design, and dual-adjustment tensioning system.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The WeiLong WR M 2021 is the latest flagship 3x3 from MoYu. This updated design now features adjustable magnets along with the standard MoYu spring compression/tension system. The WR M 2021 offers a softer feel and more customization at a lower price!</li><li>Dual-adjustment system (9 levels of elasticity) and 5 levels of magnet strengths give you more choices of adjusting.</li><li>The Weilong WRM2021 has a size of 55mm, smaller than conventional cubes, more controllable, easier to hold and grip. This promotes better competition and practice results and speed!</li><li>48 pcs magnets are properly placed in order to provide a good turning experience, making the cube more controllable and stable!</li><li>Unique 9-level dual adjustment design on the tensioning, you can adjust the elasticity on your own preference.</li></ul>", null, null, 1, 1, 50.00, 51.99, 5, 'MAX_WeiLong_WR_M_3x3_Main.jpg', null, null, 3, 5);
insert into products values (35, 'ROWE’S WEILONG WR M 3X3 LITE', 'ROWE_WEILONG_WR_M_3X3_LITE', "<div><h3><b>Product Description</b></h3></div><span>Rowe’s Weilong WR M 3x3 Lite is a fast and reliable 3x3. This puzzle is custom magnetized with lite magnets and is lubed with a balanced mixture of Weight 5 and Weight 1 silicone. Gear compression comes preset at the fourth setting. This setup, created by Cubicle Pro Shop manager Rowe Hessler, is designed specifically for 3x3 Blindfolded, and is an exact replica of his multiple blindfolded mains. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu WeiLong WR M 2021 Lite is just like the WeiLong WR M 2021 except this one comes with fewer accessories. If you want the cube without all of the extras, this is what you're looking for.</li><li>Dual-adjustment system (9 levels of elasticity) and 5 levels of magnet strengths give you more choices of adjusting.</li><li>The Weilong WRM2021 has a size of 55mm, smaller than conventional cubes, more controllable, easier to hold and grip. This promotes better competition and practice results and speed!</li><li>48 pcs magnets are properly placed in order to provide a good turning experience, making the cube more controllable and stable!</li></ul>", null, null, 1, 1, 43.00, 44.99, 5, 'ROWES_WEILONG_WR_M_3X3_LITE_Main.jpg', null, null, 3, 5);
insert into products values (36, 'TOMMY CHERRYS WEILONG GTS3 M', 'TOMMY_CHERRYS_WEILONG_GTS3_M', "<div><h3><b>Product Description</b></h3></div><span>Rowe’s Weilong WR M 3x3 Lite is a fast and reliable 3x3. This puzzle is custom magnetized with lite magnets and is lubed with a balanced mixture of Weight 5 and Weight 1 silicone. Gear compression comes preset at the fourth setting. This setup, created by Cubicle Pro Shop manager Rowe Hessler, is designed specifically for 3x3 Blindfolded, and is an exact replica of his multiple blindfolded mains. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu WeiLong WR M 2021 Lite is just like the WeiLong WR M 2021 except this one comes with fewer accessories. If you want the cube without all of the extras, this is what you're looking for.</li><li>Dual-adjustment system (9 levels of elasticity) and 5 levels of magnet strengths give you more choices of adjusting.</li><li>The Weilong WRM2021 has a size of 55mm, smaller than conventional cubes, more controllable, easier to hold and grip. This promotes better competition and practice results and speed!</li><li>48 pcs magnets are properly placed in order to provide a good turning experience, making the cube more controllable and stable!</li></ul>", null, null, 1, 1, 47.00, 48.99, 5, 'TOMMY_CHERRYS_WEILONG_GTS3_M_Main.jpg', null, null, 3, 5);
insert into products values (37, 'MOYU WEILONG WR M 3X3', 'MOYU_WEILONG_WR_M_3X3', "<div><h3><b>Product Description</b></h3></div><span>Rowe’s Weilong WR M 3x3 Lite is a fast and reliable 3x3. This puzzle is custom magnetized with lite magnets and is lubed with a balanced mixture of Weight 5 and Weight 1 silicone. Gear compression comes preset at the fourth setting. This setup, created by Cubicle Pro Shop manager Rowe Hessler, is designed specifically for 3x3 Blindfolded, and is an exact replica of his multiple blindfolded mains. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu WeiLong WR M 2021 Lite is just like the WeiLong WR M 2021 except this one comes with fewer accessories. If you want the cube without all of the extras, this is what you're looking for.</li><li>Dual-adjustment system (9 levels of elasticity) and 5 levels of magnet strengths give you more choices of adjusting.</li><li>The Weilong WRM2021 has a size of 55mm, smaller than conventional cubes, more controllable, easier to hold and grip. This promotes better competition and practice results and speed!</li><li>48 pcs magnets are properly placed in order to provide a good turning experience, making the cube more controllable and stable!</li></ul>", null, null, 1, 1, 37.00, 38.99, 5, 'MOYU_WEILONG_WR_M_3X3_Main.jpg', null, null, 3, 5);
insert into products values (38, 'MOYU WEILONG GTS2 M 3X3', 'MOYU_WEILONG_GTS2_M_3X3', "<div><h3><b>Product Description</b></h3></div><span>Rowe’s Weilong WR M 3x3 Lite is a fast and reliable 3x3. This puzzle is custom magnetized with lite magnets and is lubed with a balanced mixture of Weight 5 and Weight 1 silicone. Gear compression comes preset at the fourth setting. This setup, created by Cubicle Pro Shop manager Rowe Hessler, is designed specifically for 3x3 Blindfolded, and is an exact replica of his multiple blindfolded mains. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu WeiLong WR M 2021 Lite is just like the WeiLong WR M 2021 except this one comes with fewer accessories. If you want the cube without all of the extras, this is what you're looking for.</li><li>Dual-adjustment system (9 levels of elasticity) and 5 levels of magnet strengths give you more choices of adjusting.</li><li>The Weilong WRM2021 has a size of 55mm, smaller than conventional cubes, more controllable, easier to hold and grip. This promotes better competition and practice results and speed!</li><li>48 pcs magnets are properly placed in order to provide a good turning experience, making the cube more controllable and stable!</li></ul>", null, null, 1, 1, 22.00, 25.99, 5, 'MOYU_WEILONG_GTS2_M_3X3_Main.jpg', null, null, 3, 5);
insert into products values (39, 'CELERITAS RS3 M 2020+ 3X3', 'CELERITAS_RS3_M_2020_3X3', "<div><h3><b>Product Description</b></h3></div><span>Rowe’s Weilong WR M 3x3 Lite is a fast and reliable 3x3. This puzzle is custom magnetized with lite magnets and is lubed with a balanced mixture of Weight 5 and Weight 1 silicone. Gear compression comes preset at the fourth setting. This setup, created by Cubicle Pro Shop manager Rowe Hessler, is designed specifically for 3x3 Blindfolded, and is an exact replica of his multiple blindfolded mains. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu WeiLong WR M 2021 Lite is just like the WeiLong WR M 2021 except this one comes with fewer accessories. If you want the cube without all of the extras, this is what you're looking for.</li><li>Dual-adjustment system (9 levels of elasticity) and 5 levels of magnet strengths give you more choices of adjusting.</li><li>The Weilong WRM2021 has a size of 55mm, smaller than conventional cubes, more controllable, easier to hold and grip. This promotes better competition and practice results and speed!</li><li>48 pcs magnets are properly placed in order to provide a good turning experience, making the cube more controllable and stable!</li></ul>", null, null, 1, 1, 17.00, 19.99, 5, 'CELERITAS_RS3_M_2020_3X3_Main.jpg', null, null, 3, 5);
insert into products values (40, 'Cuberspeed QY Toys mp 3x3 Magnetic Speed Cube MP', 'QiYi_MP_3x3_M', "<div><h3><b>Product Description</b></h3></div><span>The QiYi MP 3x3 M seems like a slightly simplified X-Man Tornado V2. This 3x3 features soft turning and a medium magnetic feel. This is a fantastic puzzle at a reasonable price. Definitely give this one a shot.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi MP 3x3 M seems like a slightly simplified X-Man Tornado V2. This 3x3 features soft turning and a medium magnetic feel. This is a fantastic puzzle at a reasonable price. Definitely give this one a shot.</li></ul>", null, null, 1, 1, 17.00, 17.99, 5, 'QiYi_MP_3x3_M_Main.jpg', null, null, 2, 5);
insert into products values (41, 'Cubelelo Dayan ZhanChi PRO M 3x3 Stickerless', 'DaYan_ZhanChi_Pro_M_3x3', "<div><h3><b>Product Description</b></h3></div><span>The DaYan ZhanChi Pro M is the newest iteration of the legendary ZhanChi, a cube that dominated the cubing scene nearly a decade ago. This new version of the ZhanChi is lightweight, and has adjustable magnets, elasticities, and tensions.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>A new take on an old favorite, meet the brand new Zhanchi Pro M 3x3 from Dayan! The DaYan ZhanChi is the fifth cube of the DaYan series and is quickly becoming one of the most popular in the market.</li><li>Aside from mechanism updates to improve turning and stability, the ZhanChi Pro is highly customizable as it borrows the magnet, tension, and elasticity system from the TengYun V2 which is great to see! Here are the top features.</li><li>Fast with lightweight design Tunable magnets on a Rotatable Magnetic Insert (Weak, Moderate, Strong) Adjustable tension and elasticity systems Wavy-pattern tracks on corner pieces Rounded corners for improve corner cut performance Seamless corner and edge piece design to reduce friction</li></ul>", null, null, 1, 1, 33.00, 34.99, 5, 'DaYan_ZhanChi_Pro_M_3x3_Main.jpg', null, null, 5, 5);
insert into products values (42, 'Dayan TengYun M 3x3x3 Magnetic Speed Cube Stickerless', 'DaYan_TengYun_M_3x3', "<div><h3><b>Product Description</b></h3></div><span>The DaYan TengYun M is a smooth, 55 mm 3x3 speed cube that is one of the quietest 3x3’s on the market. It has a unique design and feel that sets it apart from other modern 3x3's.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The DaYan TengYun M 3x3 is a smooth, 55mm 3x3 that is possibly one of the quietest puzzles on the market. It has a unique design and feel that set it apart from other modern 3x3s.</li><li>Out of the box the puzzle is a little scratchy, but after some light breaking in the turning is fantastic. This is definitely the best release from DaYan in recent times</li><li>I was pleasantly surprised OOTB that this cube performs just as good as my gan354 and is actually quieter then any other cube I own. I think I might be making this my main. Good job Dayan for making a comeback with this one. I own the stickerless version if you want to know. Just wow!</li><li>my new main, the Dayan Tengyun has an amazing feel to it, and when you break it in, the turning is VERY fast and controllable. I use this cube in school because its SO quiet. I think its better than all moyu, qiyi, and other very good puzzle brands' 3x3s. I recommend this to anyone as it fits most people's opinions just like the gan x.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 24.00, 25.99, 5, 'DaYan_TengYun_M_3x3_Main.jpg', null, null, 5, 5);
insert into products values (43, 'X-Man Tornado V2 3x3 (Magnetic Core)', 'X_Man_Tornado_V2_3x3', "<div><h3><b>Product Description</b></h3></div><span>X-Man Tornado V2 3x3 (Magnetic Core) is packed full of high-end features but at a fraction of the price.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Added stability & improved feel through corner/core magnets</li><li></li><li>Easy-to-use customization system</li><li>Smooth, controllable turning</li></ul><h4>Accessories included</h4><ul><li>Leather storage bag ($3 value)</li><li>Adjustment tool</li><li>Cleaning cloth</li><li>Hard-shell case</li></ul>", null, null, 1, 1, 47.00, 49.99, 5, 'X_Man_Tornado_V2_3x3_Main.jpg', null, null, 14, 5);
insert into products values (44, 'LiangCuber QY Toys Tornado V2 M 3x3 Speed Cube', 'Tornado_V2_M_3x3', "<div><h3><b>Product Description</b></h3></div><span>The MAX Tornado V2 3x3 is one of our premium versions of X-Man Design’s 2021 flagship 3x3. It is more stable than many other flagships and features a robust adjustment system with 125 total setting combinations.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>QY Toys latest flagship 3x3 cube in 2021, with adjustable magnetic positioning, low price and high cost performance</li><li>The new surface feel, similar to the appearance of the matte surface (between the smooth surface and the matte surface), which greatly reduces the probability of the cube being released while reducing surface scratches</li><li>Made of environmentally friendly ABS material, black core design, exquisite appearance, weighs only 72 grams</li><li>Adhesive design-cube corner block mesh contact surface + magnetic storage position auxiliary anti-sticking, cube edge block magnetic storage position + magnet stall mark auxiliary anti-sticking</li><li>Magnetic adjustment system — 5 magnetic gears, adjustable at any time, the magnetic compartment is designed with red and yellow contrasting colors. Dual adjustment system-5 gears with adjustable elasticity + 5 gears with adjustable wheelbase, having it is equivalent to having 125 kinds of hand feelings<li></ul>", null, null, 1, 1, 25.00, 25.99, 5, 'Tornado_V2_M_3x3_Main.jpg', null, null, 14, 5);
insert into products values (45, 'GAN12 M MagLev 3x3', 'GAN12_M_MagLev_3x3', "<div><h3><b>Product Description</b></h3></div><span>GAN 12 M 3x3 is here to refine the way that you speed solve. With two different versions to choose from (Leap or MagLev), the GAN 12 includes lots of new features.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Enhanced core positioning 2.0 auto aligning technology</li><li>Frosted exterior</li><li>64 magnets</li><li>Numerical GTN tensioning system</li><li>6 corner magnet settings</li></ul>", null, null, 1, 1, 89.00, 90.99, 5, 'GAN12_M_MagLev_3x3_Main.jpg', null, null, 4, 5);
insert into products values (46, 'QiYi Valk 4 M 4x4', 'QiYi_Valk_4_M_4x4', "<div><h3><b>Product Description</b></h3></div><span>This version of the Valk 4 M features lighter magnets over the strong magnetic version.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The insanely popular 'The Valk' lineup continues to grow with the QiYi Valk 4 M 4x4! QiYi has succeeded with transferring the signature feel of 'The Valk' speedcubes into this 4x4 and the result is impressive. Buttery turning, incredible corner cutting, and a compact design all make the Valk 4 M a hit that you are sure to love!</li></ul>", null, null, 1, 1, 37.00, 39.99, 5, 'QiYi_Valk_4_M_4x4_Main.jpg', null, null, 13, 6);
insert into products values (47, 'QiYi MP 4x4 Magnetic', 'QiYi_MP_4x4_Magnetic', "<div><h3><b>Product Description</b></h3></div><span>QiYi MP 4x4 Magnetic is part of QiYi's new mid-range series.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Light, quick turning</li><li>Unique turning feel</li><li>Semi-gloss exterior finish</li></ul><h4>Accessories included</h4><ul><li>Hard-shell case</li></ul>", null, null, 1, 1, 21.00, 22.99, 5, 'QiYi_MP_4x4_Magnetic_Main.jpg', null, null, 2, 6);
insert into products values (48, 'Moyu AoSu WR M 4x4 Magnetic Speed Cube stickerless Aosu WRM 4x4', 'MoYu_AoSu_WR_M_4x4', "<div><h3><b>Product Description</b></h3></div><span>The MoYu AoSu WR M 4x4 is MoYu's new flagship featuring some key features. Some of our favorites are the new compact size, upgraded positioning system, new half-bright stickerless shades (Stickerless model only) and moderate strength magnets.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Controllable59mm --- Size The Aosu WR has the 59mm size, which is smaller than regular 4x4s, making it morecontrollable and speed up your solves.</li><li>Accurate MagnetsLayout 96 pcs magnets are properly placed in order to provide a good turning experience making the cube more controllable and stable! Magnets size:4x1.5mm(corners), 4x1mm(edges). AoSuWR/WRM Mhas magnet slots inside,OnlyAosu WRM is placed with magnets.</li><li>Optimized contactsurfaces --- Fully optimized antisticky slots on the contact surfaces, which can reducestiction eficiently and bring atighter feeling. This improvement can keep thetotiginal feeling after long-time practice!</li><li>Upgrade positioningsystem --- optimized positioning system makes the core attached to the center pieces tightly,solving the lockup problem.New Color Shade, We adjust some colors of the original half-bright stickerless shaded, providinga better speedcubing feel.</li><li>Cubic Wide Outer Layer --- Cubic exteror and wide outer layer makes theturning more controllable and prevents thecube from slipping out of your hands. Safe and envurenmenital ABSplastic applied on the cube,makng itsoftishatter proof and flexible. </li></ul>", null, null, 1, 1, 41.00, 42.99, 5, 'MoYu_AoSu_WR_M_4x4_Main.jpg', null, null, 3, 6);
insert into products values (49, 'X Man Ambition 4x4 M Stickerless', 'X_Man_Ambition_Magnetic_4x4', "<div><h3><b>Product Description</b></h3></div><span>The X-Man Ambition Magnetic 4x4 is the 2021 flagship and is a welcomed refresh from X-Man Designs!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Ambition 4x4 M is a magnetic 4x4 designed by Jim Zhang of X-Man Design. Compact and light, the Ambition feels smooth and soft to turn while retaining high stability</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating! This is a Frosted Surface Cube.Feels more texture and avoid the scratches after the long-time using.Whole new vivid color work more effectively and more easier to recognize </li><li>The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style </li></ul>", null, null, 1, 1, 27.00, 29.99, 5, 'X_Man_Ambition_Magnetic_4x4_Main.jpg', null, null, 14, 6);
insert into products values (50, 'GAN 460 M Speed Cube, 4x4 Magnetic Master Cube', 'GAN_460_M_4x4', "<div><h3><b>Product Description</b></h3></div><span>This speedcube does not need an introduction... The GAN 460 M is a groundbreaking new release from GAN Cube and features an all-new magnetic positioning system. The 460 is most recognized for its outer layers that turn almost identically to any modern 3x3.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>SEE THE FORCE, SPEED WITH YOU - GAN 460M features revolutionary GMC (GAN magnet capsule) technology to show all 96 magnets noticeably. Magnets are tightly locked into each capsule so no longer missing/falling out.</li><li>TOTAL SYMMETRY, TOTAL STRENGTHENED - The GAN460M is endowed with total symmetric clips, high-strength feets and unbreakable blocks. Pieces & blocks are all locked up by clips perfectly and firmly.</li><li>ASSEMBLED WITH GANSCORE - GAN460M comes with new 4x4 IPG built by merging iron and plastic and based on the 3x3 IPG design. Higher perpendicularity, bigger inner space, longer hidden edge piece, resulting stronger anti-POP abilities.</li><li>YOUR PB RENEWER WITH THIS BUTTERY SMOOTH CUBE - Inner honeycomb surface reduces friction and endures lubrication; 40°/25° corner-cutting ability is optimized to the best degree. Gan 460 M has all latest features a 4x4 speed cube can have to be your record breaker.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 54.00, 55.99, 5, 'GAN_460_M_4x4_Main.jpg', null, null, 4, 6);
insert into products values (51, 'YJ MGC 5X5 M stickerless Speed Cube MGC Magnetic', 'YJ_MGC_5X5_M', "<div><h3><b>Product Description</b></h3></div><span>The MGC Magnetic 5x5 is the continuation of the popular MGC series! In true MGC fashion, the MGC 5x5 performs so well, it is hard to believe that it is so inexpensive!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MGC 5x5 is the newest puzzle in the MGC series from YJ.</li><li>This magnetic 5x5 features a strong magnetic feel and performs great out of the box. If you're a speedcuber on a budget, but still want fantastic performance, this is the 5x5 you've been waiting for!</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>No one falls out of love with the puzzle cubes. Perfect Christmas / Birthday / Children’s Day Gift Idea. This classic puzzle game will never go out of style. GIFT BOX PACKING Gift box packing makes it a perfect gift for your kids.</li></ul>", null, null, 1, 1, 24.00, 25.99, 5, 'YJ_MGC_5X5_M_Main.jpg', null, null, 1, 7);
insert into products values (52, 'Moyu Aochuang WR M 5X5 stickerless', 'MoYu_AoChuang_WR_M_5x5', "<div><h3><b>Product Description</b></h3></div><span>The MoYu AoChuang WR M 5x5 is a major update to MoYu's 5x5 lineup! The buttery, fast, turning is very controllable and is complimented by factory-installed moderate strength magnets. The AoChuang WR M's confidence-inspiring, stable design makes speedsolving a breeze -- your records won't stand a chance!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The AoChuang WR M is the latest in the record-breaking WR series from MoYu.</li><li>This 5x5 is a fantastically smooth, quick, and very high-performance flagship puzzle.</li></ul>", null, null, 1, 1, 37.00, 39.99, 5, 'MoYu_AoChuang_WR_M_5x5_Main.jpg', null, null, 3, 7);
insert into products values (53, 'QiYi MP 5x5 Magnetic', 'QiYi_MP_5x5', "<div><h3><b>Product Description</b></h3></div><span>QiYi MP 5x5 Magnetic is part of QiYi's new mid-range series.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Light, super-fast turning</li><li>Unique turning feel</li><li>Semi-gloss exterior finish</li></ul>", null, null, 1, 1, 24.00, 25.99, 5, 'QiYi_MP_5x5_Main.jpg', null, null, 2, 7);
insert into products values (54, 'QiYi Valk 5 M 5x5 ', 'QiYi_Valk_5_M_5x5 ', "<div><h3><b>Product Description</b></h3></div><span>The QiYi Valk 5 M 5x5 is quickly being recognized as the top 5x5 on the market. After Max Park's immediate world record after obtaining the Valk 5 M it is clear that this speedcube gets results. The smooth, effortless turning and forgiving corner cutting make this 5x5 versatile for any turning style. Strong magnets are installed at the factory to aid with turning accuracy and feel!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Valk 5 M is a fast, smooth 5x5 from QiYi, famous for setting the current 5x5 single and average world records.</li><li>The first magnetic 5x5 by QiYi, this puzzle features medium/strong magnets, primary internals, and fantastic corner cutting </li><li>We expect this to be one of the top choices for top 5x5 solvers. If you're serious about this event, the Valk 5 M is a must.</li><li>We expect this to be one of the top choices for top 5x5 solvers. If you're serious about this event, the Valk 5 M is a must.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 47.00, 49.99, 5, 'QiYi_Valk_5_M_5x5_Main.jpg', null, null, 13, 7);
insert into products values (55, 'X-Man Shadow V2 M 6x6', 'X_Man_Shadow_V2_M_6x6', "<div><h3><b>Product Description</b></h3></div><span>The X-Man Shadow V2 M 6x6 is the new and improved version of the once ground-breaking, Shadow V1.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>This speed cube features fast turning throughout all of the layers along with moderate strength magnets to assist with turning accuracy and smoothness. We were very happy with this upgrade and expect this to be the favorite of many!</li></ul>", null, null, 1, 1, 43.00, 44.99, 5, 'X_Man_Shadow_V2_M_6x6_Main.jpg', null, null, 14, 8);
insert into products values (56, 'GAN Megaminx M, Pentagonal Magnetic Speed Cube, Stickerless', 'GAN_Megaminx', "<div><h3><b>Product Description</b></h3></div><span>The GAN Megaminx is a light weight, factory magnetic megaminx which utilizes GAN's popular GES spring system. This item comes with four different GES spring options which are easily interchangeable and offer a different feel. Same as other GAN cubes, this item features exposed moderate strength magnets to improve performance and feel.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>4oz/113g LIGHTWEIGHT - The first Megaminx of GAN is a product with less weight. It is even 15% lighter than other megaminx on the market. Your fingers will remain energetic after hundreds of solving.</li><li>INNER STRUCTURE MATTERS - To keep it light and stable, GAN Megaminx features 12-axis IPG core inside, made from carbon steel and high-strength plastic. It's also tunable with interchangeable GES nuts.</li><li>GOT EVERYTHING TO BE SMOOTH - Your every single move is aligned and positioned by 120 magnets; And your long-term progress is secured by lubricant long-lasting honeycomb touchface.</li><li>DETAILS YOU'D LIKE TO KNOW - 42°/25° corner cutting; small arc design on every tile of corner pieces; frosted stickerless surface; anti-POP & anti-corner twist.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 56.00, 57.99, 5, 'GAN_Megaminx_Main.jpg', null, null, 4, 16);
insert into products values (57, 'DaYan Megaminx V2 Magnetic', 'DaYan_Megaminx_V2', "<div><h3><b>Product Description</b></h3></div><span>The DaYan Megaminx V2 Magnetic is the revival of the once-popular DaYan Megaminx. This version features 120 factory-installed magnets to assist with stability and control and the sculpted exterior helps improve grip which is incredibly important for megamix solvers. This lightweight design is already loved by many!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>MAGNETIC MEGAMINX: The DaYan MegaMinx v2 M is the upgraded version of its previous version. Compared to the v1, the v2 features a more compact design, lower weight, improved corner-cutting, and an overall more stable feel. The optimized weight of 99g combined with reduced side length provides more relaxing turning experience and makes it capable for speed solving.</li><li>SPECIFICATIONS: Size (in mm) – 30 x 30 x 30 | Product Weight (in grams) – 99 | Package Weight (in grams) – 174 | Package Contents 1 Unit Cube, 1 Cube Pouch, Screwdriver, Extra springs| Recommended Age Group (in years) : 3+ | Suitable for: Kids, Men, Women, Girls, Boys, College and school students, Office goers.</li><li>EASY TO ASSEMBLE AND LUBRICATE: Don't worry if the cube pops out (dis-assembles)while solving, it's very easy and a fun learning experience to assemble it back; Use proper lubrication to avoid any spring noise or lock-ups during solves and increases the smoothness of your cube, giving it longer life; Cubes normally become smoother after a few solves, so do not worry if it is turning a bit rough out of the box;If you face any difficulty in operating the cube let us know,we will be happy to help</li></ul>", null, null, 1, 1, 31.00, 32.99, 5, 'DaYan_Megaminx_V2_Main.jpg', null, null, 5, 16);
insert into products values (58, 'Galaxy V2 M Magnetic Sculpture Stickerless X-Man Galaxy Megaminx V2 M', 'X_Man_Galaxy_Megaminx_V2_M', "<div><h3><b>Product Description</b></h3></div><span>The X-Man Galaxy Megaminx V2 (Sculpted) is the updated version of the world-famous X-Man Galaxy Megaminx (Sculpted).&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Galaxy Megaminx V2 M (Sculpted) is the QiYi magnetized version of the X-Man Galaxy Megaminx V2.</li><li>The puzzle has medium strength magnets that provide a very tactile feedback when the layers align. This version has sculpted ridges on each piece to aid turning and grip.</li><li>This is a fantastic Megaminx. It is a more stable version of the Galaxy v2, which was the intent. Unlike many other mass-produced magnetic puzzles, the magnets are fairly strong. Personally, I would have preferred very slightly weaker magnets, but I also don't have a problem with how they are. The strength just makes it slightly more tiring to do many solves in a row compared to a non-magnetic puzzle or a puzzle with weaker magnets. Out of the box, it was very tight and dry. After adding a varie</li></ul>", null, null, 1, 1, 28.00, 29.99, 5, 'X_Man_Galaxy_Megaminx_V2_M_Main.jpg', null, null, 14, 16);
insert into products values (59, 'GAN Skewb, Magnetic Speed Cube Gans Skweb', 'GAN_Magnetic_Skewb', "<div><h3><b>Product Description</b></h3></div><span>The GAN Skewb is a massive advancement in Skewb mechanism! This Skewb features a lot of GAN's innovative features that put them on the map such as their GES tensioning system and the new Core/Corner Magnet system that was recently introduced!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>LIGHTWEIGHT AND REINVENTED - Only 81 grams, GAN Skewb is the most lightweight skewb puzzle in the market. Meanwhile it is first time with built-in magnets in the core. Total 2 versions available and you're viewing the one with 32 magnets.</li><li>MAGNETIC CORE POSITIONING - Introducing the new GAN Magnetic Core-Positioning System. In this system, GAN’s core has one side of the magnets, and edge pieces the other. Like an upgraded engine, it provides new sense of positioning with low starting resistance and better aligning. You'll feel super fast and super smooth in the very first turns!</li><li>EASILY TUNED DUAL ADJUSTMENT - Don't know which handfeel suits you best? Try our GES PRO design to explore easy tuning! Each axis has 4 kinds of nut distances and 6 levels elasticity. Altogether 24 configurations can be achieved using our accessories. Step-by-step instruction included!</li><li>DETAILS YOU'D LIKE TO KNOW - Includes lots of technology to give you the best skewb solving experience: 90° corner cutting; smooth tracks and round curves; scratch-proof stickerless surface; honeycomb touchface; all-symmetry lock up tiles; and more.</li></ul>", null, null, 1, 1, 30.00, 31.99, 5, 'GAN_Magnetic_Skewb_Main.jpg', null, null, 4, 19);
insert into products values (60, 'MoYu AoYan Magnetic Skewb', 'MoYu_AoYan_Magnetic_Skewb', "<div><h3><b>Product Description</b></h3></div><span>The MoYu AoYan Magnetic Skewb is a new design featuring interchangeable center caps that have a large dimple that can improve grip and comfort for some speedcubers (stickerless version only). Additionally the AoYan features magnets to improve grip and improved corner cutting.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Accessories: display case, concave caps (stickerless version only) and screwdriver</li></ul>", null, null, 1, 1, 17.00, 18.99, 5, 'MoYu_AoYan_Magnetic_Skewb_Main.jpg', null, null, 3, 19);
insert into products values (61, 'GAN Pyraminx 60 Magnets, Speed Magnetic Pyramid', 'GAN_Magnetic_Pyraminx', "<div><h3><b>Product Description</b></h3></div><span>The GAN Magnetic Pyraminx is a ground-breaking release from GAN! GAN's of the pyraminx features an all-new core-edge magnetic positioning system which greatly improves the feel and performance!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>LIGHTWEIGHT AND REINVENTED - Only 64 grams, GAN Pyraminx is the most lightweight pyramid puzzle in the market. Meanwhile it is first time with built-in magnets in the core. Total 3 versions available and you're viewing the one with 60 magnets(corner/center 24, edge/core 12, edge/center 24) and 4 sets of GES.</li><li>MAGNETIC CORE POSITIONING - Introducing the new GAN Magnetic Core-Positioning System. In this system, GAN’s core has one side of the magnets, and edge pieces the other. Like an upgraded engine, it provides new sense of positioning with low starting resistance and better aligning. You'll feel super fast and super smooth in the very first turns!</li><li>EASILY TUNED GES NUTS - Don't know which handfeel suits you best? Try our GES+ (GAN Elastic System) design to explore easy tuning! Each nut has 2 distance slots to be tuned by simply push and twist. The larger the distance and the weaker the elastic force, makes the cube looser. Certain versions have 4 types of elastic nuts to change tensions.</li></ul>", null, null, 1, 1, 27.00, 28.99, 5, 'GAN_Magnetic_Pyraminx_Main.jpg', null, null, 4, 18);
insert into products values (62, 'X-Man Volt Square-1 V2 M UD (Fully Magnetic) stickerless Black Squre one', 'X_Man_Volt_Square_1_V2', "<div><h3><b>Product Description</b></h3></div><span>&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Volt Square-1 V2 M (Fully MagneThe X-Man Volt Square-1 V2 M (Fully Magnetic) is an updated design of the original X-Man Volt Square-1.tic) is an updated design of the original X-Man Volt Square-1.</li><li>This version features a more robust design for durability, and magnets in each of the pieces to aid turning accuracy.</li><li>Perfect Christmas Gift / Birthday Gift for kids. This classic puzzle game will never go out of style</li></ul>", null, null, 1, 1, 18.00, 19.99, 5, 'X_Man_Volt_Square_1_V2_Main.jpg', null, null, 14, 20);
insert into products values (63, 'JPerm Mini Mat 2022', 'JPerm_Mini_Mat', "<div><h3><b>Product Description</b></h3></div><span>Made for true JPerm fans, the JPerm Mini Mat 2022 is the perfect way to support the JPerm YouTube Channel! Our mini mat is a great desk decoration and is designed to provide a soft surface to absorb the impact of your puzzle!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Mini mats are super easy to roll up and take with you on the go!</li><li>Size: 13.7' x 7'</li></ul>", null, null, 1, 1, 6.00, 7.99, 5, 'JPerm_Mini_Mat_Main.jpg', null, null, 14, 21);
insert into products values (64, 'GAN Smart Timer (Bluetooth)', 'GAN_Smart_Timer', "<div><h3><b>Product Description</b></h3></div><span>Introducing the GAN Smart Timer with Bluetooth compatibility! Designed by cubers, for cubers, the Smart Timer includes many useful features that you will love!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Smart Timer buttons will 'freeze' for 1 second after a solve is completed to prevent accidental resets.</li><li>Smart Timer will automatically record a rolling average of 5</li><li>Solves can automatically sync to your Cube Station app to be accessed across multiple devices</li><li>Durable, 'non-sticky' buttons</li><li>2.5mm auxilary output</li></ul>", null, null, 1, 1, 27.00, 28.99, 5, 'GAN_Smart_Timer_Main.jpg', null, null, 4, 22);
insert into products values (65, 'GAN Cube Bag', 'GAN_Cube_Bag', "<div><h3><b>Product Description</b></h3></div><span>Keep your cubes protected with a GAN Cube Bag! These bags are made of a plush felt material that will keep your cubes protected from exterior damage.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li><li></li></ul>", null, null, 1, 1, 2.00, 3.99, 5, 'GAN_Cube_Bag_Main.jpg', null, null, 4, 23);
insert into products values (66, 'Vortex Lubricant', 'Vortex_Lubricant', "<div><h3><b>Product Description</b></h3></div><span>Lubricating the hardware of your speed cube is a lost art but offers great performance increases and will substantially dampen that pesky spring noise.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Vortex's thick formulation makes it easy to apply, is stain-free, and will never need to be re-applied if applied properly.</li><li>Being that Vortex is designed specifically for hardware, we do not recommend that it be used on plastic surfaces.</li></ul>", null, null, 1, 1, 9.00, 9.99, 5, 'Vortex_Lubricant_Main.jpg', null, null, 4, 27);
insert into products values (67, 'Speed Lube Weight 1', 'Speed_Lube_Weight', "<div><h3><b>Product Description</b></h3></div><span>Speed Lube is a popular lubricant option among speed cubers who are looking to achieve a longer-lasting and specific feel.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Speed Lube is offered in 8 different weights, each 'weight' being a different viscosity or 'thickness'.</li><li>The larger the number, the thicker or less viscous the lubricant. This will in turn create a smoother, more controllable feel.</li><li>We find that many cubers will mix different Speed Lubes. A common example would be a higher weight on the core and a lower weight on the pieces to create a quick, smooth feel.</li></ul>", null, null, 1, 1, 4.00, 5.99, 5, 'Speed_Lube_Weight_Main.jpg', null, null, 4, 28);






insert into products values (1, '', '', "<div><h3><b>Product Description</b></h3></div><span>&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li><li></li></ul>", null, null, 1, 1, 31.00, 32.99, 5, '.jpg', 1, 1, 1, 1, 5, 19);

-- INSERT INTO product_images
-- product id = 1
insert into product_images value (1, 'extras_yj_mgc_2x2_magnetic_1.jpg', 1);
insert into product_images value (2, 'extras_yj_mgc_2x2_magnetic_2.jpg', 1);
insert into product_images value (3, 'extras_yj_mgc_2x2_magnetic_3.jpg', 1);
insert into product_images value (4, 'extras_yj_mgc_2x2_magnetic_4.jpg', 1);
-- product id = 2
insert into product_images value (5, 'YJ-YuPo-V2-Magnetic-2x2-Extras-2.jpg', 2);
insert into product_images value (6, 'YJ-YuPo-V2-Magnetic-2x2-Stickerless-Bright-Extras-1.jpg', 2);
-- product id = 3
insert into product_images value (7, 'YJ-MGC-Elite-Magnetic-2x2-Stickerless-Bright-3-extras-1.jpg', 3);
insert into product_images value (8, 'YJ-MGC-Elite-Magnetic-2x2-4-extras-2.jpg', 3);
insert into product_images value (9, 'YJ-MGC-Elite-Magnetic-2x2-extras-3.jpg', 3);
insert into product_images value (10, 'YJ-MGC-Elite-Magnetic-2x2-extras-4.jpg', 3);
insert into product_images value (11, 'YJ-MGC-Elite-Magnetic-2x2-extras-5.jpg', 3);
-- product id = 4
insert into product_images value (12, 'YJMGCElite2x2_extras.jpg', 4);
-- product id = 5
insert into product_images value (13, 'gan_249_v2_m_extras_1.jpg', 5);
insert into product_images value (14, 'gan_249_v2_m_extras_2.jpg', 5);
insert into product_images value (15, 'gan_249_v2_m_extras_3.jpg', 5);
insert into product_images value (16, 'gan_249_v2_m_extras_4.jpg', 5);
insert into product_images value (17, 'gan_249_v2_m_extras_5.jpg', 5);
insert into product_images value (18, 'gan_249_v2_m_extras_6.jpg', 5);
-- product id = 6
insert into product_images value (19, 'GAN251_M_Explorer_Extras.jpg', 6);
insert into product_images value (20, 'GAN251_M_Explorer_Extras_1.jpg', 6);
insert into product_images value (21, 'GAN251_M_Explorer_Extras_2.jpg', 6);
insert into product_images value (22, 'GAN251_M_Explorer_Extras_3.jpg', 6);
insert into product_images value (23, 'GAN251_M_Explorer_Extras_4.jpg', 6);
insert into product_images value (24, 'GAN251_M_Explorer_Extras_5.jpg', 6);
insert into product_images value (25, 'GAN251_M_Explorer_Extras_6.jpg', 6);
-- product id = 7
insert into product_images value (26, 'GAN251_M_Explorer_Extras.jpg', 7);
insert into product_images value (27, 'GAN251_M_Explorer_Extras_1.jpg', 7);
insert into product_images value (28, 'GAN251_M_Explorer_Extras_2.jpg', 7);
insert into product_images value (29, 'GAN251_M_Explorer_Extras_3.jpg', 7);
insert into product_images value (30, 'GAN251_M_Explorer_Extras_4.jpg', 7);
insert into product_images value (31, 'GAN251_M_Explorer_Extras_5.jpg', 7);
insert into product_images value (32, 'GAN251_M_Explorer_Extras_6.jpg', 7);
-- product id = 8
insert into product_images value (33, 'GAN_251_M_Leap_Extras_1.jpg', 8);
insert into product_images value (34, 'GAN_251_M_Leap_Extras_2.jpg', 8);
insert into product_images value (35, 'GAN_251_M_Leap_Extras_3.jpg', 8);
insert into product_images value (36, 'GAN_251_M_Leap_Extras_4.jpg', 8);
insert into product_images value (37, 'GAN_251_M_Leap_Extras_5.jpg', 8);
insert into product_images value (38, 'GAN_251_M_Leap_Extras_6.jpg', 8);
insert into product_images value (39, 'GAN_251_M_Leap_Extras_7.jpg', 8);
-- product id = 9
insert into product_images value (40, 'The_GAN_251_M_Leap_Extras_1.jpg', 9);
insert into product_images value (41, 'The_GAN_251_M_Leap_Extras_2.jpg', 9);
insert into product_images value (42, 'The_GAN_251_M_Leap_Extras_3.jpg', 9);
-- product id = 10
insert into product_images value (43, 'MoYu_RS2_M_2x2_Extras_1.jpg', 10);
insert into product_images value (44, 'MoYu_RS2_M_2x2_Extras_2.jpg', 10);
-- product id = 11
insert into product_images value (45, 'Qiyi_QiDi_S_2x2_Jelly_Extras_1.jpg', 11);
insert into product_images value (46, 'Qiyi_QiDi_S_2x2_Jelly_Extras_2.jpg', 11);
insert into product_images value (47, 'Qiyi_QiDi_S_2x2_Jelly_Extras_3.jpg', 11);
insert into product_images value (48, 'Qiyi_QiDi_S_2x2_Jelly_Extras_4.jpg', 11);
-- product id = 12
insert into product_images value (49, 'QiYi_MS_2x2_Extras_1.jpg', 12);
insert into product_images value (50, 'QiYi_MS_2x2_Extras_2.jpg', 12);
insert into product_images value (51, 'QiYi_MS_2x2_Extras_3.jpg', 12);
insert into product_images value (52, 'QiYi_MS_2x2_Extras_4.jpg', 12);
-- product id = 13
insert into product_images value (53, 'QiYi_MP_2x2_M_Extras.jpg', 13);
-- product id = 14
insert into product_images value (54, 'YuXin_Little_Magic_2x2_Extras_1.jpg', 14);
insert into product_images value (55, 'YuXin_Little_Magic_2x2_Extras_2.jpg', 14);
-- product id = 15
insert into product_images value (56, 'Little_Magic_2x2_V2_M_Extras_1.jpg', 15);
insert into product_images value (57, 'Little_Magic_2x2_V2_M_Extras_2.jpg', 15);
insert into product_images value (58, 'Little_Magic_2x2_V2_M_Extras_3.jpg', 15);
insert into product_images value (59, 'Little_Magic_2x2_V2_M_Extras_4.jpg', 15);
insert into product_images value (60, 'Little_Magic_2x2_V2_M_Extras_5.jpg', 15);
-- product id = 16
insert into product_images value (61, 'MFJS_MeiLong_2x2_M_Extras_1.jpg', 16);
insert into product_images value (62, 'MFJS_MeiLong_2x2_M_Extras_2.jpg', 16);
insert into product_images value (63, 'MFJS_MeiLong_2x2_M_Extras_3.jpg', 16);
insert into product_images value (64, 'MFJS_MeiLong_2x2_M_Extras_4.jpg', 16);
-- product id = 17
insert into product_images value (65, 'MFJS_MeiLong_2x2_Macaron_Extras_1.jpg', 17);
insert into product_images value (66, 'MFJS_MeiLong_2x2_Macaron_Extras_2.jpg', 17);
-- product id = 18
insert into product_images value (67, 'DaYan_TengYun_2x2_M_Extras_1.jpg', 18);
insert into product_images value (68, 'DaYan_TengYun_2x2_M_Extras_2.jpg', 18);
insert into product_images value (69, 'DaYan_TengYun_2x2_M_Extras_3.jpg', 18);
insert into product_images value (70, 'DaYan_TengYun_2x2_M_Extras_4.jpg', 18);
-- product id = 19
insert into product_images value (71, 'GoCube_2x2_Extras_1.jpg', 19);
insert into product_images value (72, 'GoCube_2x2_Extras_2.jpg', 19);
insert into product_images value (73, 'GoCube_2x2_Extras_3.jpg', 19);
insert into product_images value (74, 'GoCube_2x2_Extras_4.jpg', 19);
insert into product_images value (75, 'GoCube_2x2_Extras_5.jpg', 19);
insert into product_images value (76, 'GoCube_2x2_Extras_6.jpg', 19);
insert into product_images value (77, 'GoCube_2x2_Extras_7.jpg', 19);
-- product id = 20
insert into product_images value (78, 'MonsterGO_2x2_Extras_1.jpg', 20);
insert into product_images value (79, 'MonsterGO_2x2_Extras_2.jpg', 20);
insert into product_images value (80, 'MonsterGO_2x2_Extras_3.jpg', 20);
insert into product_images value (81, 'MonsterGO_2x2_Extras_4.jpg', 20);
insert into product_images value (82, 'MonsterGO_2x2_Extras_5.jpg', 20);
insert into product_images value (83, 'MonsterGO_2x2_Extras_6.jpg', 20);
-- product id = 21
insert into product_images value (84, 'X-MAN_FLARE_2X2_M_Extras_1.jpg', 21);
insert into product_images value (85, 'X-MAN_FLARE_2X2_M_Extras_2.jpg', 21);
-- product id = 22
insert into product_images value (86, 'ANGSTROM_X-MAN_FLARE_2X2_M_Extras_1.jpg', 22);
insert into product_images value (87, 'ANGSTROM_X-MAN_FLARE_2X2_M_Extras_2.jpg', 22);
-- product id = 23
insert into product_images value (88, 'MAN_FLARE_2X2_M_Extras_1.jpg', 23);
insert into product_images value (89, 'MAN_FLARE_2X2_M_Extras_2.jpg', 23);
-- product id = 24
insert into product_images value (90, 'YUXIN_KYLIN_3X3_V2_M_Extras_1.jpg', 24);
insert into product_images value (91, 'YUXIN_KYLIN_3X3_V2_M_Extras_2.jpg', 24);
insert into product_images value (92, 'YUXIN_KYLIN_3X3_V2_M_Extras_3.jpg', 24);
insert into product_images value (93, 'YUXIN_KYLIN_3X3_V2_M_Extras_4.jpg', 24);
insert into product_images value (94, 'YUXIN_KYLIN_3X3_V2_M_Extras_5.jpg', 24);
-- product id = 25
insert into product_images value (95, 'GoCube_X_3x3_Extras_1.jpg', 25);
insert into product_images value (96, 'GoCube_X_3x3_Extras_2.jpg', 25);
insert into product_images value (97, 'GoCube_X_3x3_Extras_3.jpg', 25);
insert into product_images value (98, 'GoCube_X_3x3_Extras_4.jpg', 25);
insert into product_images value (99, 'GoCube_X_3x3_Extras_5.jpg', 25);
insert into product_images value (100, 'GoCube_X_3x3_Extras_6.jpg', 25);
insert into product_images value (101, 'GoCube_X_3x3_Extras_7.jpg', 25);
-- product id = 26
insert into product_images value (102, 'GoCube_Edge_3x3_Extras_1.jpg', 26);
insert into product_images value (103, 'GoCube_Edge_3x3_Extras_2.jpg', 26);
insert into product_images value (104, 'GoCube_Edge_3x3_Extras_3.jpg', 26);
insert into product_images value (105, 'GoCube_Edge_3x3_Extras_4.jpg', 26);
insert into product_images value (106, 'GoCube_Edge_3x3_Extras_5.jpg', 26);
insert into product_images value (107, 'GoCube_Edge_3x3_Extras_6.jpg', 26);
insert into product_images value (108, 'GoCube_Edge_3x3_Extras_7.jpg', 26);
-- product id = 27
insert into product_images value (109, 'MonsterGO_AI_3x3_Extras_1.jpg', 27);
insert into product_images value (110, 'MonsterGO_AI_3x3_Extras_2.jpg', 27);
insert into product_images value (111, 'MonsterGO_AI_3x3_Extras_3.jpg', 27);
insert into product_images value (112, 'MonsterGO_AI_3x3_Extras_4.jpg', 27);
insert into product_images value (113, 'MonsterGO_AI_3x3_Extras_5.jpg', 27);
-- product id = 28
insert into product_images value (114, 'Eastsheen_3x3x3_Cube_Extras_1.jpg', 28);
-- product id = 29
insert into product_images value (115, 'YJ_MGC_Evo_3x3_Extras_1.jpg', 29);
insert into product_images value (116, 'YJ_MGC_Evo_3x3_Extras_2.jpg', 29);
insert into product_images value (117, 'YJ_MGC_Evo_3x3_Extras_3.jpg', 29);
insert into product_images value (118, 'YJ_MGC_Evo_3x3_Extras_4.jpg', 29);
insert into product_images value (119, 'YJ_MGC_Evo_3x3_Extras_5.jpg', 29);
-- product id = 30
insert into product_images value (120, 'MsCube_MS3_V1_M_Extras_1.jpg', 30);
insert into product_images value (121, 'MsCube_MS3_V1_M_Extras_2.jpg', 30);
insert into product_images value (122, 'MsCube_MS3_V1_M_Extras_3.jpg', 30);
-- product id = 31
insert into product_images value (123, 'Valk_3_Elite_M_Extras_1.jpg', 31);
insert into product_images value (124, 'Valk_3_Elite_M_Extras_2.jpg', 31);
insert into product_images value (125, 'Valk_3_Elite_M_Extras_3.jpg', 31);
insert into product_images value (126, 'Valk_3_Elite_M_Extras_4.jpg', 31);
-- product id = 32
insert into product_images value (127, 'MoYu_WeiLong_AI_3x3_Extras_1.jpg', 32);
insert into product_images value (128, 'MoYu_WeiLong_AI_3x3_Extras_2.jpg', 32);
insert into product_images value (129, 'MoYu_WeiLong_AI_3x3_Extras_3.jpg', 32);
insert into product_images value (130, 'MoYu_WeiLong_AI_3x3_Extras_4.jpg', 32);
insert into product_images value (131, 'MoYu_WeiLong_AI_3x3_Extras_5.jpg', 32);
insert into product_images value (132, 'MoYu_WeiLong_AI_3x3_Extras_6.jpg', 32);
insert into product_images value (133, 'MoYu_WeiLong_AI_3x3_Extras_7.jpg', 32);
-- product id = 33
insert into product_images value (134, 'The_Yoo_Cube_Deluxe_3x3_Extras_1.jpg', 33);
insert into product_images value (135, 'The_Yoo_Cube_Deluxe_3x3_Extras_2.jpg', 33);
insert into product_images value (136, 'The_Yoo_Cube_Deluxe_3x3_Extras_3.jpg', 33);
insert into product_images value (137, 'The_Yoo_Cube_Deluxe_3x3_Extras_4.jpg', 33);
insert into product_images value (138, 'The_Yoo_Cube_Deluxe_3x3_Extras_5.jpg', 33);
insert into product_images value (139, 'The_Yoo_Cube_Deluxe_3x3_Extras_6.jpg', 33);
-- product id = 34
insert into product_images value (140, 'MAX_WeiLong_WR_M_3x3_Extras_1.jpg', 34);
insert into product_images value (141, 'MAX_WeiLong_WR_M_3x3_Extras_2.jpg', 34);
-- product id = 35
insert into product_images value (142, 'ROWES_WEILONG_WR_M_3X3_LITE_Extras_1.jpg', 35);
insert into product_images value (143, 'ROWES_WEILONG_WR_M_3X3_LITE_Extras_2.jpg', 35);
insert into product_images value (144, 'ROWES_WEILONG_WR_M_3X3_LITE_Extras_3.jpg', 35);
insert into product_images value (145, 'ROWES_WEILONG_WR_M_3X3_LITE_Extras_4.jpg', 35);
-- product id = 36
insert into product_images value (146, 'ROWE’S_WEILONG_WR_M_3X3_LITE_Extras_1.jpg', 36);
insert into product_images value (147, 'ROWE’S_WEILONG_WR_M_3X3_LITE_Extras_2.jpg', 36);
insert into product_images value (148, 'ROWE’S_WEILONG_WR_M_3X3_LITE_Extras_3.jpg', 36);
-- product id = 37
insert into product_images value (149, 'MOYU_WEILONG_WR_M_3X3_Extras_1.jpg', 37);
insert into product_images value (150, 'MOYU_WEILONG_WR_M_3X3_Extras_2.jpg', 37);
insert into product_images value (151, 'MOYU_WEILONG_WR_M_3X3_Extras_3.jpg', 37);
insert into product_images value (152, 'MOYU_WEILONG_WR_M_3X3_Extras_4.jpg', 37);
-- product id = 38
insert into product_images value (153, 'MOYU_WEILONG_GTS2_M_3X3_Extras_1.jpg', 38);
insert into product_images value (154, 'MOYU_WEILONG_GTS2_M_3X3_Extras_2.jpg', 38);
insert into product_images value (155, 'MOYU_WEILONG_GTS2_M_3X3_Extras_3.jpg', 38);
insert into product_images value (156, 'MOYU_WEILONG_GTS2_M_3X3_Extras_4.jpg', 38);
-- product id = 39
insert into product_images value (157, 'CELERITAS_RS3_M_2020_3X3_Extras_1.jpg', 39);
insert into product_images value (158, 'CELERITAS_RS3_M_2020_3X3_Extras_2.jpg', 39);
insert into product_images value (159, 'CELERITAS_RS3_M_2020_3X3_Extras_3.jpg', 39);
insert into product_images value (160, 'CELERITAS_RS3_M_2020_3X3_Extras_4.jpg', 39);
-- product id = 40
insert into product_images value (161, 'QiYi_MP_3x3_M_Extras_1.jpg', 40);
insert into product_images value (162, 'QiYi_MP_3x3_M_Extras_2.jpg', 40);
insert into product_images value (163, 'QiYi_MP_3x3_M_Extras_3.jpg', 40);
-- product id = 41
insert into product_images value (164, 'DaYan_ZhanChi_Pro_M_3x3_Extras_1.jpg', 41);
insert into product_images value (165, 'DaYan_ZhanChi_Pro_M_3x3_Extras_2.jpg', 41);
insert into product_images value (166, 'DaYan_ZhanChi_Pro_M_3x3_Extras_3.jpg', 41);
insert into product_images value (167, 'DaYan_ZhanChi_Pro_M_3x3_Extras_4.jpg', 41);
-- product id = 42
insert into product_images value (168, 'DaYan_TengYun_M_3x3_Extras_1.jpg', 42);
insert into product_images value (169, 'DaYan_TengYun_M_3x3_Extras_2.jpg', 42);
insert into product_images value (170, 'DaYan_TengYun_M_3x3_Extras_3.jpg', 42);
insert into product_images value (171, 'DaYan_TengYun_M_3x3_Extras_4.jpg', 42);
-- product id = 43
insert into product_images value (172, 'X_Man_Tornado_V2_3x3_Extras_1.jpg', 43);
insert into product_images value (173, 'X_Man_Tornado_V2_3x3_Extras_2.jpg', 43);
insert into product_images value (174, 'X_Man_Tornado_V2_3x3_Extras_3.jpg', 43);
insert into product_images value (175, 'X_Man_Tornado_V2_3x3_Extras_4.jpg', 43);
insert into product_images value (176, 'X_Man_Tornado_V2_3x3_Extras_5.jpg', 43);
-- product id = 44
insert into product_images value (177, 'Tornado_V2_M_3x3_Extras_1.jpg', 44);
insert into product_images value (178, 'Tornado_V2_M_3x3_Extras_2.jpg', 44);
insert into product_images value (179, 'Tornado_V2_M_3x3_Extras_3.jpg', 44);
insert into product_images value (180, 'Tornado_V2_M_3x3_Extras_4.jpg', 44);
insert into product_images value (181, 'Tornado_V2_M_3x3_Extras_5.jpg', 44);
insert into product_images value (182, 'Tornado_V2_M_3x3_Extras_6.jpg', 44);
insert into product_images value (183, 'Tornado_V2_M_3x3_Extras_7.jpg', 44);
insert into product_images value (184, 'Tornado_V2_M_3x3_Extras_8.jpg', 44);
-- product id = 45
insert into product_images value (185, 'GAN12_M_MagLev_3x3_Extras_1.jpg', 45);
insert into product_images value (186, 'GAN12_M_MagLev_3x3_Extras_2.jpg', 45);
insert into product_images value (187, 'GAN12_M_MagLev_3x3_Extras_3.jpg', 45);
insert into product_images value (188, 'GAN12_M_MagLev_3x3_Extras_4.jpg', 45);
insert into product_images value (189, 'GAN12_M_MagLev_3x3_Extras_5.jpg', 45);
insert into product_images value (190, 'GAN12_M_MagLev_3x3_Extras_6.jpg', 45);
insert into product_images value (191, 'GAN12_M_MagLev_3x3_Extras_7.jpg', 45);
insert into product_images value (192, 'GAN12_M_MagLev_3x3_Extras_8.jpg', 45);
insert into product_images value (193, 'GAN12_M_MagLev_3x3_Extras_9.jpg', 45);
insert into product_images value (194, 'GAN12_M_MagLev_3x3_Extras_10.jpg', 45);
insert into product_images value (195, 'GAN12_M_MagLev_3x3_Extras_11.jpg', 45);
-- product id = 46
insert into product_images value (196, 'QiYi_Valk_4_M_4x4_Extras_1.jpg', 46);
insert into product_images value (197, 'QiYi_Valk_4_M_4x4_Extras_2.jpg', 46);
insert into product_images value (198, 'QiYi_Valk_4_M_4x4_Extras_3.jpg', 46);
insert into product_images value (199, 'QiYi_Valk_4_M_4x4_Extras_4.jpg', 46);
-- product id = 47
insert into product_images value (200, 'QiYi_MP_4x4_Magnetic_Extras_1.jpg', 47);
insert into product_images value (201, 'QiYi_MP_4x4_Magnetic_Extras_2.jpg', 47);
insert into product_images value (202, 'QiYi_MP_4x4_Magnetic_Extras_3.jpg', 47);
-- product id = 48
insert into product_images value (203, 'MoYu_AoSu_WR_M_4x4_Extras_1.jpg', 48);
insert into product_images value (204, 'MoYu_AoSu_WR_M_4x4_Extras_2.jpg', 48);
insert into product_images value (205, 'MoYu_AoSu_WR_M_4x4_Extras_3.jpg', 48);
insert into product_images value (206, 'MoYu_AoSu_WR_M_4x4_Extras_4.jpg', 48);
insert into product_images value (207, 'MoYu_AoSu_WR_M_4x4_Extras_5.jpg', 48);
insert into product_images value (208, 'MoYu_AoSu_WR_M_4x4_Extras_6.jpg', 48);
insert into product_images value (209, 'MoYu_AoSu_WR_M_4x4_Extras_7.jpg', 48);
-- product id = 49
insert into product_images value (210, 'X_Man_Ambition_Magnetic_4x4_Extras_1.jpg', 49);
insert into product_images value (211, 'X_Man_Ambition_Magnetic_4x4_Extras_2.jpg', 49);
-- product id = 50
insert into product_images value (212, 'GAN_460_M_4x4_Extras_1.jpg', 50);
insert into product_images value (213, 'GAN_460_M_4x4_Extras_2.jpg', 50);
insert into product_images value (214, 'GAN_460_M_4x4_Extras_3.jpg', 50);
insert into product_images value (215, 'GAN_460_M_4x4_Extras_4.jpg', 50);
insert into product_images value (216, 'GAN_460_M_4x4_Extras_5.jpg', 50);
-- product id = 51
insert into product_images value (217, 'YJ_MGC_5X5_M_Extras_1.jpg', 51);
insert into product_images value (218, 'YJ_MGC_5X5_M_Extras_2.jpg', 51);
insert into product_images value (219, 'YJ_MGC_5X5_M_Extras_3.jpg', 51);
insert into product_images value (220, 'YJ_MGC_5X5_M_Extras_4.jpg', 51);
-- product id = 52
insert into product_images value (221, 'MoYu_AoChuang_WR_M_5x5_Extras_1.jpg', 52);
insert into product_images value (222, 'MoYu_AoChuang_WR_M_5x5_Extras_2.jpg', 52);
insert into product_images value (223, 'MoYu_AoChuang_WR_M_5x5_Extras_3.jpg', 52);
-- product id = 53
insert into product_images value (224, 'QiYi_MP_5x5_Extras_1.jpg', 53);
insert into product_images value (225, 'QiYi_MP_5x5_Extras_2.jpg', 53);
insert into product_images value (226, 'QiYi_MP_5x5_Extras_3.jpg', 53);
-- product id = 54
insert into product_images value (227, 'QiYi_Valk_5_M_5x5_Extras_1.jpg', 54);
insert into product_images value (228, 'QiYi_Valk_5_M_5x5_Extras_2.jpg', 54);
insert into product_images value (229, 'QiYi_Valk_5_M_5x5_Extras_3.jpg', 54);
insert into product_images value (230, 'QiYi_Valk_5_M_5x5_Extras_4.jpg', 54);
-- product id = 55
insert into product_images value (231, 'X_Man_Shadow_V2_M_6x6_Extras_1.jpg', 55);
insert into product_images value (232, 'X_Man_Shadow_V2_M_6x6_Extras_2.jpg', 55);
insert into product_images value (233, 'X_Man_Shadow_V2_M_6x6_Extras_3.jpg', 55);
insert into product_images value (234, 'X_Man_Shadow_V2_M_6x6_Extras_4.jpg', 55);
-- product id = 56
insert into product_images value (235, 'GAN_Megaminx_Extras_1.jpg', 56);
insert into product_images value (236, 'GAN_Megaminx_Extras_2.jpg', 56);
insert into product_images value (237, 'GAN_Megaminx_Extras_3.jpg', 56);
insert into product_images value (238, 'GAN_Megaminx_Extras_4.jpg', 56);
insert into product_images value (239, 'GAN_Megaminx_Extras_5.jpg', 56);
-- product id = 57
insert into product_images value (240, 'DaYan_Megaminx_V2_Extras_1.jpg', 57);
insert into product_images value (241, 'DaYan_Megaminx_V2_Extras_2.jpg', 57);
insert into product_images value (242, 'DaYan_Megaminx_V2_Extras_3.jpg', 57);
-- product id = 58
insert into product_images value (243, 'X_Man_Galaxy_Megaminx_V2_M_Extras_1.jpg', 58);
insert into product_images value (244, 'X_Man_Galaxy_Megaminx_V2_M_Extras_2.jpg', 58);
insert into product_images value (245, 'X_Man_Galaxy_Megaminx_V2_M_Extras_3.jpg', 58);
insert into product_images value (246, 'X_Man_Galaxy_Megaminx_V2_M_Extras_4.jpg', 58);
insert into product_images value (247, 'X_Man_Galaxy_Megaminx_V2_M_Extras_5.jpg', 58);

-- product id = 59
insert into product_images value (248, 'GAN_Magnetic_Skewb_Extras_1.jpg', 59);
insert into product_images value (249, 'GAN_Magnetic_Skewb_Extras_2.jpg', 59);
insert into product_images value (250, 'GAN_Magnetic_Skewb_Extras_3.jpg', 59);
insert into product_images value (251, 'GAN_Magnetic_Skewb_Extras_4.jpg', 59);
insert into product_images value (252, 'GAN_Magnetic_Skewb_Extras_5.jpg', 59);
-- product id = 60
insert into product_images value (253, 'MoYu_AoYan_Magnetic_Skewb_Extras_1.jpg', 60);
insert into product_images value (254, 'MoYu_AoYan_Magnetic_Skewb_Extras_2.jpg', 60);
insert into product_images value (255, 'MoYu_AoYan_Magnetic_Skewb_Extras_3.jpg', 60);
-- product id = 61
insert into product_images value (256, 'GAN_Magnetic_Pyraminx_Extras_1.jpg', 61);
insert into product_images value (257, 'GAN_Magnetic_Pyraminx_Extras_2.jpg', 61);
insert into product_images value (258, 'GAN_Magnetic_Pyraminx_Extras_3.jpg', 61);
insert into product_images value (259, 'GAN_Magnetic_Pyraminx_Extras_4.jpg', 61);
insert into product_images value (260, 'GAN_Magnetic_Pyraminx_Extras_5.jpg', 61);
insert into product_images value (261, 'GAN_Magnetic_Pyraminx_Extras_6.jpg', 61);
-- product id = 62
insert into product_images value (262, 'X_Man_Volt_Square_1_V2_Extras_1.jpg', 62);
insert into product_images value (263, 'X_Man_Volt_Square_1_V2_Extras_2.jpg', 62);
insert into product_images value (264, 'X_Man_Volt_Square_1_V2_Extras_3.jpg', 62);
-- product id = 66
insert into product_images value (265, 'Vortex_Lubricant_Extras_1.jpg', 66);
insert into product_images value (266, 'Vortex_Lubricant_Extras_2.jpg', 66);
insert into product_images value (267, 'Vortex_Lubricant_Extras_3.jpg', 66);
insert into product_images value (268, 'Vortex_Lubricant_Extras_4.jpg', 66);




-- INSERT INTO product_detailsb
-- product id = 1
insert into product_details value (1, 'Brand', 'YJ', 1);
insert into product_details value (2, 'Type', '2x2', 1);
insert into product_details value (3, 'Magnets', 'Magnetic', 1);
insert into product_details value (4, 'Gross Weight', '142g', 1);
insert into product_details value (5, 'Item Weight', '66.7g', 1);
insert into product_details value (6, 'Dimensions', '50.0mm', 1);
-- product id = 2
insert into product_details value (7, 'Brand', 'YJ', 2);
insert into product_details value (8, 'Type', '2x2', 2);
insert into product_details value (9, 'Magnets', 'Magnetic', 2);
insert into product_details value (10, 'Gross Weight', '77g', 2);
insert into product_details value (11, 'Item Weight', '65.0g', 2);
insert into product_details value (12, 'Dimensions', '50.0mm', 2);
-- product id = 3
insert into product_details value (13, 'Brand', 'YJ', 3);
insert into product_details value (14, 'Type', '2x2', 3);
insert into product_details value (15, 'Magnets', 'Magnetic', 3);
insert into product_details value (16, 'Gross Weight', '140g', 3);
insert into product_details value (17, 'Item Weight', '65.0g', 3);
insert into product_details value (18, 'Dimensions', '50.0mm', 3);
-- product id = 4
insert into product_details value (19, 'Brand', 'YJ', 4);
insert into product_details value (20, 'Type', '2x2', 4);
insert into product_details value (21, 'Magnets', 'Magnetic', 4);
insert into product_details value (22, 'Stock Shades', 'Stickerless (Bright)', 4);
insert into product_details value (23, 'Feel', 'Smooth', 4);
insert into product_details value (24, 'Gross Weight', '140g', 4);
insert into product_details value (25, 'Item Weight', '71.0g', 4);
insert into product_details value (26, 'Dimensions', '51.0mm', 4);
-- product id = 5
insert into product_details value (27, 'Brand', 'GAN', 5);
insert into product_details value (28, 'Type', '2x2', 5);
insert into product_details value (29, 'Magnets', 'Magnetic', 5);
insert into product_details value (30, 'Stock Shades', 'Stickerless (Bright)', 5);
insert into product_details value (31, 'Feel', 'Smooth', 5);
insert into product_details value (32, 'Gross Weight', '87g', 5);
insert into product_details value (33, 'Item Weight', '55.9g', 5);
insert into product_details value (34, 'Dimensions', '51.0mm', 5);
-- product id = 6
insert into product_details value (35, 'Brand', 'GAN', 6);
insert into product_details value (36, 'Type', '2x2', 6);
insert into product_details value (37, 'Magnets', 'Magnetic', 6);
insert into product_details value (38, 'Stock Shades', 'Stickerless (Bright)', 6);
insert into product_details value (39, 'Feel', 'Smooth', 6);
insert into product_details value (40, 'Gross Weight', '87g', 6);
insert into product_details value (41, 'Item Weight', '55.9g', 6);
insert into product_details value (42, 'Dimensions', '51.0mm', 6);
-- product id = 7
insert into product_details value (43, 'Brand', 'GAN', 7);
insert into product_details value (44, 'Type', '2x2', 7);
insert into product_details value (45, 'Magnets', 'Magnetic', 7);
insert into product_details value (46, 'Stock Shades', 'Stickerless (Bright)', 7);
insert into product_details value (47, 'Feel', 'Smooth', 7);
insert into product_details value (48, 'Gross Weight', '87g', 7);
insert into product_details value (49, 'Item Weight', '55.9g', 7);
insert into product_details value (50, 'Dimensions', '51.0mm', 7);
-- product id = 8
insert into product_details value (51, 'Brand', 'GAN', 8);
insert into product_details value (52, 'Type', '2x2', 8);
insert into product_details value (53, 'Magnets', 'Magnetic', 8);
insert into product_details value (54, 'Stock Shades', 'Stickerless (Bright)', 8);
insert into product_details value (55, 'Feel', 'Smooth', 8);
insert into product_details value (56, 'Gross Weight', '87g', 8);
insert into product_details value (57, 'Item Weight', '55.9g', 8);
insert into product_details value (58, 'Dimensions', '51.0mm', 8);
-- product id = 9
insert into product_details value (59, 'Brand', 'MoYu', 9);
insert into product_details value (60, 'Type', '2x2', 9);
insert into product_details value (61, 'Magnets', 'Magnetic', 9);
insert into product_details value (62, 'Stock Shades', 'Stickerless (Bright)', 9);
insert into product_details value (63, 'Feel', 'Smooth', 9);
insert into product_details value (64, 'Gross Weight', '87g', 9);
insert into product_details value (65, 'Item Weight', '55.9g', 9);
insert into product_details value (66, 'Dimensions', '51.0mm', 9);
-- product id = 10
insert into product_details value (67, 'Brand', 'MoYu', 10);
insert into product_details value (68, 'Type', '2x2', 10);
insert into product_details value (69, 'Magnets', 'Magnetic', 10);
insert into product_details value (70, 'Stock Shades', 'Stickerless (Bright)', 10);
insert into product_details value (71, 'Feel', 'Smooth', 10);
insert into product_details value (72, 'Gross Weight', '87g', 10);
insert into product_details value (73, 'Item Weight', '55.9g', 10);
insert into product_details value (74, 'Dimensions', '51.0mm', 10);
-- product id = 11
insert into product_details value (75, 'Brand', 'MoYu', 11);
insert into product_details value (76, 'Type', '2x2', 11);
insert into product_details value (77, 'Magnets', 'Magnetic', 11);
insert into product_details value (78, 'Stock Shades', 'Stickerless (Bright)', 11);
insert into product_details value (79, 'Feel', 'Smooth', 11);
insert into product_details value (80, 'Gross Weight', '87g', 11);
insert into product_details value (81, 'Item Weight', '55.9g', 11);
insert into product_details value (82, 'Dimensions', '51.0mm', 11);
-- product id = 12
insert into product_details value (83, 'Brand', 'MoYu', 12);
insert into product_details value (84, 'Type', '2x2', 12);
insert into product_details value (85, 'Magnets', 'Magnetic', 12);
insert into product_details value (86, 'Stock Shades', 'Stickerless (Bright)', 12);
insert into product_details value (87, 'Feel', 'Smooth', 12);
insert into product_details value (88, 'Gross Weight', '87g', 12);
insert into product_details value (89, 'Item Weight', '55.9g', 12);
insert into product_details value (90, 'Dimensions', '51.0mm', 12);
-- product id = 13
insert into product_details value (91, 'Brand', 'MoYu', 13);
insert into product_details value (92, 'Type', '2x2', 13);
insert into product_details value (93, 'Magnets', 'Magnetic', 13);
insert into product_details value (94, 'Stock Shades', 'Stickerless (Bright)', 13);
insert into product_details value (95, 'Feel', 'Smooth', 13);
insert into product_details value (96, 'Gross Weight', '87g', 13);
insert into product_details value (97, 'Item Weight', '55.9g', 13);
insert into product_details value (98, 'Dimensions', '51.0mm', 13);
-- product id = 14
insert into product_details value (99, 'Brand', 'MoYu', 14);
insert into product_details value (100, 'Type', '2x2', 14);
insert into product_details value (101, 'Magnets', 'Magnetic', 14);
insert into product_details value (102, 'Stock Shades', 'Stickerless (Bright)', 14);
insert into product_details value (103, 'Feel', 'Smooth', 14);
insert into product_details value (104, 'Gross Weight', '87g', 14);
insert into product_details value (105, 'Item Weight', '55.9g', 14);
insert into product_details value (106, 'Dimensions', '51.0mm', 14);
-- product id = 15
insert into product_details value (107, 'Brand', 'MoYu', 15);
insert into product_details value (108, 'Type', '2x2', 15);
insert into product_details value (109, 'Magnets', 'Magnetic', 15);
insert into product_details value (110, 'Stock Shades', 'Stickerless (Bright)', 15);
insert into product_details value (111, 'Feel', 'Smooth', 15);
insert into product_details value (112, 'Gross Weight', '87g', 15);
insert into product_details value (113, 'Item Weight', '55.9g', 15);
insert into product_details value (114, 'Dimensions', '51.0mm', 15);
-- product id = 16
insert into product_details value (115, 'Brand', 'MoYu', 16);
insert into product_details value (116, 'Type', '2x2', 16);
insert into product_details value (117, 'Magnets', 'Magnetic', 16);
insert into product_details value (118, 'Stock Shades', 'Stickerless (Bright)', 16);
insert into product_details value (119, 'Feel', 'Smooth', 16);
insert into product_details value (120, 'Gross Weight', '87g', 16);
insert into product_details value (121, 'Item Weight', '55.9g', 16);
insert into product_details value (122, 'Dimensions', '51.0mm', 16);
-- product id = 17
insert into product_details value (123, 'Brand', 'MoYu', 17);
insert into product_details value (124, 'Type', '2x2', 17);
insert into product_details value (125, 'Magnets', 'Magnetic', 17);
insert into product_details value (126, 'Stock Shades', 'Stickerless (Bright)', 17);
insert into product_details value (127, 'Feel', 'Smooth', 17);
insert into product_details value (128, 'Gross Weight', '87g', 17);
insert into product_details value (129, 'Item Weight', '55.9g', 17);
insert into product_details value (130, 'Dimensions', '51.0mm', 17);
-- product id = 18
insert into product_details value (131, 'Brand', 'MoYu', 18);
insert into product_details value (132, 'Type', '2x2', 18);
insert into product_details value (133, 'Magnets', 'Magnetic', 18);
insert into product_details value (134, 'Stock Shades', 'Stickerless (Bright)', 18);
insert into product_details value (135, 'Feel', 'Smooth', 18);
insert into product_details value (136, 'Gross Weight', '87g', 18);
insert into product_details value (137, 'Item Weight', '55.9g', 18);
insert into product_details value (138, 'Dimensions', '51.0mm', 18);
-- product id = 19
insert into product_details value (139, 'Brand', 'MoYu', 19);
insert into product_details value (140, 'Type', '2x2', 19);
insert into product_details value (141, 'Magnets', 'Magnetic', 19);
insert into product_details value (142, 'Stock Shades', 'Stickerless (Bright)', 19);
insert into product_details value (143, 'Feel', 'Smooth', 19);
insert into product_details value (144, 'Gross Weight', '87g', 19);
insert into product_details value (145, 'Item Weight', '55.9g', 19);
insert into product_details value (146, 'Dimensions', '51.0mm', 19);
-- product id = 20
insert into product_details value (147, 'Brand', 'MoYu', 20);
insert into product_details value (148, 'Type', '2x2', 20);
insert into product_details value (149, 'Magnets', 'Magnetic', 20);
insert into product_details value (150, 'Stock Shades', 'Stickerless (Bright)', 20);
insert into product_details value (151, 'Feel', 'Smooth', 20);
insert into product_details value (152, 'Gross Weight', '87g', 20);
insert into product_details value (153, 'Item Weight', '55.9g', 20);
insert into product_details value (154, 'Dimensions', '51.0mm', 20);
-- product id = 21
insert into product_details value (155, 'Brand', 'MoYu', 21);
insert into product_details value (156, 'Type', '2x2', 21);
insert into product_details value (157, 'Magnets', 'Magnetic', 21);
insert into product_details value (158, 'Stock Shades', 'Stickerless (Bright)', 21);
insert into product_details value (159, 'Feel', 'Smooth', 21);
insert into product_details value (160, 'Gross Weight', '87g', 21);
insert into product_details value (161, 'Item Weight', '55.9g', 21);
insert into product_details value (162, 'Dimensions', '51.0mm', 21);
-- product id = 22
insert into product_details value (163, 'Brand', 'X-man', 22);
insert into product_details value (164, 'Type', '2x2', 22);
insert into product_details value (165, 'Magnets', 'Magnetic', 22);
insert into product_details value (166, 'Stock Shades', 'Stickerless (Bright)', 22);
insert into product_details value (167, 'Feel', 'Smooth', 22);
insert into product_details value (168, 'Gross Weight', '87g', 22);
insert into product_details value (169, 'Item Weight', '55.9g', 22);
insert into product_details value (170, 'Dimensions', '51.0mm', 22);
-- product id = 23
insert into product_details value (171, 'Brand', 'X-man', 23);
insert into product_details value (172, 'Type', '2x2', 23);
insert into product_details value (173, 'Magnets', 'Magnetic', 23);
insert into product_details value (174, 'Stock Shades', 'Stickerless (Bright)', 23);
insert into product_details value (175, 'Feel', 'Smooth', 23);
insert into product_details value (176, 'Gross Weight', '87g', 23);
insert into product_details value (177, 'Item Weight', '55.9g', 23);
insert into product_details value (178, 'Dimensions', '51.0mm', 23);
-- product id = 24
insert into product_details value (179, 'Brand', 'Yuxin', 24);
insert into product_details value (180, 'Type', '3x3', 24);
insert into product_details value (181, 'Magnets', 'Magnetic', 24);
insert into product_details value (182, 'Stock Shades', 'Stickerless (Bright)', 24);
insert into product_details value (183, 'Feel', 'Smooth', 24);
insert into product_details value (184, 'Gross Weight', '87g', 24);
insert into product_details value (185, 'Item Weight', '55.9g', 24);
insert into product_details value (186, 'Dimensions', '51.0mm', 24);
-- product id = 25
insert into product_details value (187, 'Brand', 'Go-cube', 25);
insert into product_details value (188, 'Type', '3x3', 25);
insert into product_details value (189, 'Magnets', 'Magnetic', 25);
insert into product_details value (190, 'Stock Shades', 'Stickerless (Bright)', 25);
insert into product_details value (191, 'Feel', 'Smooth', 25);
insert into product_details value (192, 'Gross Weight', '87g', 25);
insert into product_details value (193, 'Item Weight', '55.9g', 25);
insert into product_details value (194, 'Dimensions', '51.0mm', 25);
-- product id = 26
insert into product_details value (195, 'Brand', 'Go-cube', 26);
insert into product_details value (196, 'Type', '3x3', 26);
insert into product_details value (197, 'Magnets', 'Magnetic', 26);
insert into product_details value (198, 'Stock Shades', 'Stickerless (Bright)', 26);
insert into product_details value (199, 'Feel', 'Smooth', 26);
insert into product_details value (200, 'Gross Weight', '87g', 26);
insert into product_details value (201, 'Item Weight', '55.9g', 26);
insert into product_details value (202, 'Dimensions', '51.0mm', 26);
-- product id = 27
insert into product_details value (203, 'Brand', 'Monster-go', 27);
insert into product_details value (204, 'Type', '3x3', 27);
insert into product_details value (205, 'Magnets', 'Magnetic', 27);
insert into product_details value (206, 'Stock Shades', 'Stickerless (Bright)', 27);
insert into product_details value (207, 'Feel', 'Smooth', 27);
insert into product_details value (208, 'Gross Weight', '87g', 27);
insert into product_details value (209, 'Item Weight', '55.9g', 27);
insert into product_details value (210, 'Dimensions', '51.0mm', 27);
-- product id = 28
insert into product_details value (211, 'Brand', 'Eastsheen', 28);
insert into product_details value (212, 'Type', '3x3', 28);
insert into product_details value (213, 'Magnets', 'Magnetic', 28);
insert into product_details value (214, 'Stock Shades', 'Stickerless (Bright)', 28);
insert into product_details value (215, 'Feel', 'Smooth', 28);
insert into product_details value (216, 'Gross Weight', '87g', 28);
insert into product_details value (217, 'Item Weight', '55.9g', 28);
insert into product_details value (218, 'Dimensions', '51.0mm', 28);
-- product id = 29
insert into product_details value (219, 'Brand', 'YJ', 29);
insert into product_details value (220, 'Type', '3x3', 29);
insert into product_details value (221, 'Magnets', 'Magnetic', 29);
insert into product_details value (222, 'Stock Shades', 'Stickerless (Bright)', 29);
insert into product_details value (223, 'Feel', 'Smooth', 29);
insert into product_details value (224, 'Gross Weight', '87g', 29);
insert into product_details value (225, 'Item Weight', '55.9g', 29);
insert into product_details value (226, 'Dimensions', '51.0mm', 29);
-- product id = 30
insert into product_details value (227, 'Brand', 'Ms-Cube', 30);
insert into product_details value (228, 'Type', '3x3', 30);
insert into product_details value (229, 'Magnets', 'Magnetic', 30);
insert into product_details value (230, 'Stock Shades', 'Stickerless (Bright)', 30);
insert into product_details value (231, 'Feel', 'Smooth', 30);
insert into product_details value (232, 'Gross Weight', '87g', 30);
insert into product_details value (233, 'Item Weight', '55.9g', 30);
insert into product_details value (234, 'Dimensions', '51.0mm', 30);
-- product id = 31
insert into product_details value (235, 'Brand', 'The Valk', 31);
insert into product_details value (236, 'Type', '3x3', 31);
insert into product_details value (237, 'Magnets', 'Magnetic', 31);
insert into product_details value (238, 'Stock Shades', 'Stickerless (Bright)', 31);
insert into product_details value (239, 'Feel', 'Smooth', 31);
insert into product_details value (240, 'Gross Weight', '87g', 31);
insert into product_details value (241, 'Item Weight', '55.9g', 31);
insert into product_details value (242, 'Dimensions', '51.0mm', 31);
-- product id = 32
insert into product_details value (243, 'Brand', 'MoYu', 32);
insert into product_details value (244, 'Type', '3x3', 32);
insert into product_details value (245, 'Magnets', 'Magnetic', 32);
insert into product_details value (246, 'Stock Shades', 'Stickerless (Bright)', 32);
insert into product_details value (247, 'Feel', 'Smooth', 32);
insert into product_details value (248, 'Gross Weight', '87g', 32);
insert into product_details value (249, 'Item Weight', '55.9g', 32);
insert into product_details value (250, 'Dimensions', '51.0mm', 32);
-- product id = 33
insert into product_details value (251, 'Brand', 'MoYu', 33);
insert into product_details value (252, 'Type', '3x3', 33);
insert into product_details value (253, 'Magnets', 'Magnetic', 33);
insert into product_details value (254, 'Stock Shades', 'Stickerless (Bright)', 33);
insert into product_details value (255, 'Feel', 'Smooth', 33);
insert into product_details value (256, 'Gross Weight', '87g', 33);
insert into product_details value (257, 'Item Weight', '55.9g', 33);
insert into product_details value (258, 'Dimensions', '51.0mm', 33);
-- product id = 34
insert into product_details value (259, 'Brand', 'MoYu', 34);
insert into product_details value (260, 'Type', '3x3', 34);
insert into product_details value (261, 'Magnets', 'Magnetic', 34);
insert into product_details value (262, 'Stock Shades', 'Stickerless (Bright)', 34);
insert into product_details value (263, 'Feel', 'Smooth', 34);
insert into product_details value (264, 'Gross Weight', '87g', 34);
insert into product_details value (265, 'Item Weight', '55.9g', 34);
insert into product_details value (266, 'Dimensions', '51.0mm', 34);
-- product id = 35
insert into product_details value (267, 'Brand', 'MoYu', 35);
insert into product_details value (268, 'Type', '3x3', 35);
insert into product_details value (269, 'Magnets', 'Magnetic', 35);
insert into product_details value (270, 'Stock Shades', 'Stickerless (Bright)', 35);
insert into product_details value (271, 'Feel', 'Smooth', 35);
insert into product_details value (272, 'Gross Weight', '87g', 35);
insert into product_details value (273, 'Item Weight', '55.9g', 35);
insert into product_details value (274, 'Dimensions', '51.0mm', 35);
-- product id = 36
insert into product_details value (275, 'Brand', 'MoYu', 36);
insert into product_details value (276, 'Type', '3x3', 36);
insert into product_details value (277, 'Magnets', 'Magnetic', 36);
insert into product_details value (278, 'Stock Shades', 'Stickerless (Bright)', 36);
insert into product_details value (279, 'Feel', 'Smooth', 36);
insert into product_details value (280, 'Gross Weight', '87g', 36);
insert into product_details value (281, 'Item Weight', '55.9g', 36);
insert into product_details value (282, 'Dimensions', '51.0mm', 36);
-- product id = 37
insert into product_details value (283, 'Brand', 'MoYu', 37);
insert into product_details value (284, 'Type', '3x3', 37);
insert into product_details value (285, 'Magnets', 'Magnetic', 37);
insert into product_details value (286, 'Stock Shades', 'Stickerless (Bright)', 37);
insert into product_details value (287, 'Feel', 'Smooth', 37);
insert into product_details value (288, 'Gross Weight', '87g', 37);
insert into product_details value (289, 'Item Weight', '55.9g', 37);
insert into product_details value (290, 'Dimensions', '51.0mm', 37);
-- product id = 38
insert into product_details value (291, 'Brand', 'MoYu', 38);
insert into product_details value (292, 'Type', '3x3', 38);
insert into product_details value (293, 'Magnets', 'Magnetic', 38);
insert into product_details value (294, 'Stock Shades', 'Stickerless (Bright)', 38);
insert into product_details value (295, 'Feel', 'Smooth', 38);
insert into product_details value (296, 'Gross Weight', '87g', 38);
insert into product_details value (297, 'Item Weight', '55.9g', 38);
insert into product_details value (298, 'Dimensions', '51.0mm', 38);
-- product id = 39
insert into product_details value (299, 'Brand', 'MoYu', 39);
insert into product_details value (300, 'Type', '3x3', 39);
insert into product_details value (301, 'Magnets', 'Magnetic', 39);
insert into product_details value (302, 'Stock Shades', 'Stickerless (Bright)', 39);
insert into product_details value (303, 'Feel', 'Smooth', 39);
insert into product_details value (304, 'Gross Weight', '87g', 39);
insert into product_details value (305, 'Item Weight', '55.9g', 39);
insert into product_details value (306, 'Dimensions', '51.0mm', 39);
-- product id = 40
insert into product_details value (307, 'Brand', 'QiYi', 40);
insert into product_details value (308, 'Type', '3x3', 40);
insert into product_details value (309, 'Magnets', 'Magnetic', 40);
insert into product_details value (310, 'Stock Shades', 'Stickerless (Bright)', 40);
insert into product_details value (311, 'Feel', 'Smooth', 40);
insert into product_details value (312, 'Gross Weight', '87g', 40);
insert into product_details value (313, 'Item Weight', '55.9g', 40);
insert into product_details value (314, 'Dimensions', '51.0mm', 40);
-- product id = 41
insert into product_details value (315, 'Brand', 'DaYan', 41);
insert into product_details value (316, 'Type', '3x3', 41);
insert into product_details value (317, 'Magnets', 'Magnetic', 41);
insert into product_details value (318, 'Stock Shades', 'Stickerless (Bright)', 41);
insert into product_details value (319, 'Feel', 'Smooth', 41);
insert into product_details value (320, 'Gross Weight', '87g', 41);
insert into product_details value (321, 'Item Weight', '55.9g', 41);
insert into product_details value (322, 'Dimensions', '51.0mm', 41);
-- product id = 42
insert into product_details value (323, 'Brand', 'DaYan', 42);
insert into product_details value (324, 'Type', '3x3', 42);
insert into product_details value (325, 'Magnets', 'Magnetic', 42);
insert into product_details value (326, 'Stock Shades', 'Stickerless (Bright)', 42);
insert into product_details value (327, 'Feel', 'Smooth', 42);
insert into product_details value (328, 'Gross Weight', '87g', 42);
insert into product_details value (329, 'Item Weight', '55.9g', 42);
insert into product_details value (330, 'Dimensions', '51.0mm', 42);
-- product id = 43
insert into product_details value (331, 'Brand', 'X-man Design', 43);
insert into product_details value (332, 'Type', '3x3', 43);
insert into product_details value (333, 'Magnets', 'Magnetic', 43);
insert into product_details value (334, 'Stock Shades', 'Stickerless (Bright)', 43);
insert into product_details value (335, 'Feel', 'Smooth', 43);
insert into product_details value (336, 'Gross Weight', '87g', 43);
insert into product_details value (337, 'Item Weight', '55.9g', 43);
insert into product_details value (338, 'Dimensions', '51.0mm', 43);
-- product id = 44
insert into product_details value (339, 'Brand', 'X-man Design', 44);
insert into product_details value (340, 'Type', '3x3', 44);
insert into product_details value (341, 'Magnets', 'Magnetic', 44);
insert into product_details value (342, 'Stock Shades', 'Stickerless (Bright)', 44);
insert into product_details value (343, 'Feel', 'Smooth', 44);
insert into product_details value (344, 'Gross Weight', '87g', 44);
insert into product_details value (345, 'Item Weight', '55.9g', 44);
insert into product_details value (346, 'Dimensions', '51.0mm', 44);
-- product id = 45
insert into product_details value (347, 'Brand', 'GAN', 45);
insert into product_details value (348, 'Type', '3x3', 45);
insert into product_details value (349, 'Magnets', 'Magnetic', 45);
insert into product_details value (350, 'Stock Shades', 'Stickerless (Bright)', 45);
insert into product_details value (351, 'Feel', 'Smooth', 45);
insert into product_details value (352, 'Gross Weight', '87g', 45);
insert into product_details value (353, 'Item Weight', '55.9g', 45);
insert into product_details value (354, 'Dimensions', '51.0mm', 45);
-- product id = 46
insert into product_details value (355, 'Brand', 'The Valk', 46);
insert into product_details value (356, 'Type', '4x4', 46);
insert into product_details value (357, 'Magnets', 'Magnetic', 46);
insert into product_details value (358, 'Stock Shades', 'Stickerless (Bright)', 46);
insert into product_details value (359, 'Feel', 'Smooth', 46);
insert into product_details value (360, 'Gross Weight', '87g', 46);
insert into product_details value (361, 'Item Weight', '55.9g', 46);
insert into product_details value (362, 'Dimensions', '51.0mm', 46);
-- product id = 47
insert into product_details value (363, 'Brand', 'QiYi', 47);
insert into product_details value (364, 'Type', '4x4', 47);
insert into product_details value (365, 'Magnets', 'Magnetic', 47);
insert into product_details value (366, 'Stock Shades', 'Stickerless (Bright)', 47);
insert into product_details value (367, 'Feel', 'Smooth', 47);
insert into product_details value (368, 'Gross Weight', '87g', 47);
insert into product_details value (369, 'Item Weight', '55.9g', 47);
insert into product_details value (370, 'Dimensions', '51.0mm', 47);
-- product id = 48
insert into product_details value (371, 'Brand', 'MoYu', 48);
insert into product_details value (372, 'Type', '4x4', 48);
insert into product_details value (373, 'Magnets', 'Magnetic', 48);
insert into product_details value (374, 'Stock Shades', 'Stickerless (Bright)', 48);
insert into product_details value (375, 'Feel', 'Smooth', 48);
insert into product_details value (376, 'Gross Weight', '87g', 48);
insert into product_details value (377, 'Item Weight', '55.9g', 48);
insert into product_details value (378, 'Dimensions', '51.0mm', 48);
-- product id = 49
insert into product_details value (379, 'Brand', 'X-man Design', 49);
insert into product_details value (380, 'Type', '4x4', 49);
insert into product_details value (381, 'Magnets', 'Magnetic', 49);
insert into product_details value (382, 'Stock Shades', 'Stickerless (Bright)', 49);
insert into product_details value (383, 'Feel', 'Smooth', 49);
insert into product_details value (384, 'Gross Weight', '87g', 49);
insert into product_details value (385, 'Item Weight', '55.9g', 49);
insert into product_details value (386, 'Dimensions', '51.0mm', 49);
-- product id = 50
insert into product_details value (387, 'Brand', 'GAN', 50);
insert into product_details value (388, 'Type', '4x4', 50);
insert into product_details value (389, 'Magnets', 'Magnetic', 50);
insert into product_details value (390, 'Stock Shades', 'Stickerless (Bright)', 50);
insert into product_details value (391, 'Feel', 'Smooth', 50);
insert into product_details value (392, 'Gross Weight', '87g', 50);
insert into product_details value (393, 'Item Weight', '55.9g', 50);
insert into product_details value (394, 'Dimensions', '51.0mm', 50);
-- product id = 51
insert into product_details value (395, 'Brand', 'YJ', 51);
insert into product_details value (396, 'Type', '5x5', 51);
insert into product_details value (397, 'Magnets', 'Magnetic', 51);
insert into product_details value (398, 'Stock Shades', 'Stickerless (Bright)', 51);
insert into product_details value (399, 'Feel', 'Smooth', 51);
insert into product_details value (400, 'Gross Weight', '87g', 51);
insert into product_details value (401, 'Item Weight', '55.9g', 51);
insert into product_details value (402, 'Dimensions', '51.0mm', 51);
-- product id = 52
insert into product_details value (403, 'Brand', 'MoYu', 52);
insert into product_details value (404, 'Type', '5x5', 52);
insert into product_details value (405, 'Magnets', 'Magnetic', 52);
insert into product_details value (406, 'Stock Shades', 'Stickerless (Bright)', 52);
insert into product_details value (407, 'Feel', 'Smooth', 52);
insert into product_details value (408, 'Gross Weight', '87g', 52);
insert into product_details value (409, 'Item Weight', '55.9g', 52);
-- product id = 53
insert into product_details value (410, 'Brand', 'QiYi', 53);
insert into product_details value (411, 'Type', '5x5', 53);
insert into product_details value (412, 'Magnets', 'Magnetic', 53);
insert into product_details value (413, 'Stock Shades', 'Stickerless (Bright)', 53);
insert into product_details value (414, 'Feel', 'Smooth', 53);
insert into product_details value (415, 'Gross Weight', '87g', 53);
insert into product_details value (416, 'Item Weight', '55.9g', 53);
insert into product_details value (417, 'Dimensions', '51.0mm', 53);
insert into product_details value (418, 'Dimensions', '51.0mm', 53);
-- product id = 54
insert into product_details value (419, 'Brand', 'The Valk', 54);
insert into product_details value (420, 'Type', '5x5', 54);
insert into product_details value (421, 'Magnets', 'Magnetic', 54);
insert into product_details value (422, 'Stock Shades', 'Stickerless (Bright)', 54);
insert into product_details value (423, 'Feel', 'Smooth', 54);
insert into product_details value (424, 'Gross Weight', '87g', 54);
insert into product_details value (425, 'Item Weight', '55.9g', 54);
insert into product_details value (426, 'Dimensions', '51.0mm', 54);
insert into product_details value (427, 'Dimensions', '51.0mm', 54);
-- product id = 55
insert into product_details value (428, 'Brand', 'X-man Design', 55);
insert into product_details value (429, 'Type', '5x5', 55);
insert into product_details value (430, 'Magnets', 'Magnetic', 55);
insert into product_details value (431, 'Stock Shades', 'Stickerless (Bright)', 55);
insert into product_details value (432, 'Feel', 'Smooth', 55);
insert into product_details value (433, 'Gross Weight', '87g', 55);
insert into product_details value (434, 'Item Weight', '55.9g', 55);
insert into product_details value (435, 'Dimensions', '51.0mm', 55);
insert into product_details value (436, 'Dimensions', '51.0mm', 55);
-- product id = 56
insert into product_details value (437, 'Brand', 'GAN', 56);
insert into product_details value (438, 'Type', 'Megaminx', 56);
insert into product_details value (439, 'Magnets', 'Magnetic', 56);
insert into product_details value (440, 'Stock Shades', 'Stickerless (Bright)', 56);
insert into product_details value (441, 'Feel', 'Smooth', 56);
insert into product_details value (442, 'Gross Weight', '87g', 56);
insert into product_details value (443, 'Item Weight', '55.9g', 56);
insert into product_details value (444, 'Dimensions', '51.0mm', 56);
insert into product_details value (445, 'Dimensions', '51.0mm', 56);
-- product id = 57
insert into product_details value (446, 'Brand', 'DaYan', 57);
insert into product_details value (447, 'Type', 'Megaminx', 57);
insert into product_details value (448, 'Magnets', 'Magnetic', 57);
insert into product_details value (449, 'Stock Shades', 'Stickerless (Bright)', 57);
insert into product_details value (450, 'Feel', 'Smooth', 57);
insert into product_details value (451, 'Gross Weight', '87g', 57);
insert into product_details value (452, 'Item Weight', '55.9g', 57);
insert into product_details value (453, 'Dimensions', '51.0mm', 57);
insert into product_details value (454, 'Dimensions', '51.0mm', 57);
-- product id = 58
insert into product_details value (455, 'Brand', 'X-man Design', 58);
insert into product_details value (456, 'Type', 'Megaminx', 58);
insert into product_details value (457, 'Magnets', 'Magnetic', 58);
insert into product_details value (458, 'Stock Shades', 'Stickerless (Bright)', 58);
insert into product_details value (459, 'Feel', 'Smooth', 58);
insert into product_details value (460, 'Gross Weight', '87g', 58);
insert into product_details value (461, 'Item Weight', '55.9g', 58);
insert into product_details value (462, 'Dimensions', '51.0mm', 58);
insert into product_details value (463, 'Dimensions', '51.0mm', 58);
-- product id = 59
insert into product_details value (464, 'Brand', 'GAN', 59);
insert into product_details value (465, 'Type', 'Skew-b', 59);
insert into product_details value (466, 'Magnets', 'Magnetic', 59);
insert into product_details value (467, 'Stock Shades', 'Stickerless (Bright)', 59);
insert into product_details value (468, 'Feel', 'Smooth', 59);
insert into product_details value (469, 'Gross Weight', '87g', 59);
insert into product_details value (470, 'Item Weight', '55.9g', 59);
insert into product_details value (471, 'Dimensions', '51.0mm', 59);
insert into product_details value (472, 'Dimensions', '51.0mm', 59);
-- product id = 60
insert into product_details value (473, 'Brand', 'MoYu', 60);
insert into product_details value (474, 'Type', 'Skew-b', 60);
insert into product_details value (475, 'Magnets', 'Magnetic', 60);
insert into product_details value (476, 'Stock Shades', 'Stickerless (Bright)', 60);
insert into product_details value (477, 'Feel', 'Smooth', 60);
insert into product_details value (478, 'Gross Weight', '87g', 60);
insert into product_details value (479, 'Item Weight', '55.9g', 60);
insert into product_details value (480, 'Dimensions', '51.0mm', 60);
insert into product_details value (481, 'Dimensions', '51.0mm', 60);
-- product id = 61
insert into product_details value (482, 'Brand', 'GAN', 61);
insert into product_details value (483, 'Type', 'Pyraminx', 61);
insert into product_details value (484, 'Magnets', 'Magnetic', 61);
insert into product_details value (485, 'Stock Shades', 'Stickerless (Bright)', 61);
insert into product_details value (486, 'Feel', 'Smooth', 61);
insert into product_details value (487, 'Gross Weight', '87g', 61);
insert into product_details value (488, 'Item Weight', '55.9g', 61);
insert into product_details value (489, 'Dimensions', '51.0mm', 61);
insert into product_details value (490, 'Dimensions', '51.0mm', 61);
-- product id = 62
insert into product_details value (491, 'Brand', 'X-man Design', 62);
insert into product_details value (492, 'Type', 'Square-1', 62);
insert into product_details value (493, 'Magnets', 'Magnetic', 62);
insert into product_details value (494, 'Stock Shades', 'Stickerless (Bright)', 62);
insert into product_details value (495, 'Feel', 'Smooth', 62);
insert into product_details value (496, 'Gross Weight', '87g', 62);
insert into product_details value (497, 'Item Weight', '55.9g', 62);
insert into product_details value (498, 'Dimensions', '51.0mm', 62);
insert into product_details value (499, 'Dimensions', '51.0mm', 62);
-- product id = 63
insert into product_details value (500, 'Brand', 'X-man Design', 63);
insert into product_details value (501, 'Type', 'Mats', 63);
-- product id = 64
insert into product_details value (502, 'Brand', 'GAN', 64);
insert into product_details value (503, 'Type', 'Timers', 64);

insert into currencies value (1, 'USD', 'United States Dollar', '$');
insert into currencies value (2, 'VND', 'Vietnam Dong', 'đ');


insert into settings value ('SITE_NAME', 'GENERAL', 'Rubikme');
insert into settings value ('COPYRIGHT', 'GENERAL','Copyright (C) 2021 Rubikme');
insert into settings value ('SITE_LOGO', 'GENERAL', 'logo.png');
insert into settings value ('CURRENCY_ID', 'CURRENCY', '1');
insert into settings value ('CURRENCY_SYMBOL', 'CURRENCY', '$');
insert into settings value ('CURRENCY_SYMBOL_POSITION', 'CURRENCY', 'before');
insert into settings value ('DECIMAL_POINT_TYPE', 'CURRENCY', 'POINT');
insert into settings value ('DECIMAL_DIGITS', 'CURRENCY', '2');
insert into settings value ('THOUSANDS_POINT_TYPE', 'CURRENCY', 'COMMA');
insert into settings value('MAIL_HOST', 'MAIL_SERVER', 'smtp.gmail.com');
insert into settings value('MAIL_PORT', 'MAIL_SERVER', '587');
insert into settings value('MAIL_USERNAME', 'MAIL_SERVER', 'rubikme.company@gmail.com');
insert into settings value('MAIL_PASSWORD', 'MAIL_SERVER', 'iabywjlraaihdqxv');
insert into settings value('MAIL_FROM', 'MAIL_SERVER', 'rubikme.company@gmail.com');
insert into settings value('SMTP_AUTH', 'MAIL_SERVER', true);
insert into settings value('SMTP_SECURED', 'MAIL_SERVER', true);
insert into settings value('MAIL_SENDER_NAME', 'MAIL_SERVER', 'Rubik Company');
insert into settings value('CUSTOMER_VERIFY_SUBJECT', 'MAIL_TEMPLATES', 'Please check');
insert into settings value('CUSTOMER_VERIFY_CONTENT', 'MAIL_TEMPLATES', 'Hi,&nbsp;<div>Please click the link below to to verification account:</div><div><br></div><div><a href="[[URL]]" target="_self">Verify</a></div><div><br></div><div>Thanks.</div><div><br></div><div><br></div>');

insert into customers value(1, 'Ton Duc Thang University', null, 'anhduc@gmail.com', 1, 'Duc', 'Bach Tran Anh', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '111111111', '123456', null, null);
insert into customers value(2, 'Ton Duc Thang University', null, 'anhduc1@gmail.com', 0, 'Duc', 'Bach Tran Anh', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '111111111', '123456', null, null);
insert into customers value(3, 'Ton Duc Thang University', null, 'anhduc2@gmail.com', 1, 'Duc', 'Bach Tran Anh', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '111111111', '123456', null, null);
insert into customers value(6, '28 Binh Thanh', '2022-04-20', 'customer01@gmail.com', 1, '', '', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '987654321', '123456', null, null);
insert into customers value(7, 'Dakao Quan 1', '2022-04-20', 'customer02@gmail.com', 1, '', '', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '987654321', '123456', null, null);
insert into customers value(8, 'Quan 4', '2022-04-20', 'customer03@gmail.com', 1, '', '', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '987654321', '123456', null, null);
insert into customers value(9, 'Quan 5', '2022-04-20', 'customer04@gmail.com', 1, '', '', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '987654321', '123456', null, null);
insert into customers value(10, 'Quan 6', '2022-04-20', 'customer05@gmail.com', 1, '', '', '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi', '987654321', '123456', null, null);


-- Address
insert into addresses value(1, '24, Vinh Phu, Thuan An, Binh Duong', 0, 1);

-- Orders
insert into orders value(1, null, '2022-02-02 15:02:02', 10, '2022-03-03 15:02:02', 'COD', 1500, 'NEW', 15000, 1);
insert into orders value(2, null, '2022-02-02 15:02:02', 10, '2022-03-03 15:02:02', 'COD', 1500, 'NEW', 15000, 3);
insert into orders value(3, null, '2022-02-02 15:02:02', 10, '2022-03-03 15:02:02', 'COD', 1500, 'NEW', 15000, 1);
insert into orders value(4, null, '2022-02-02 15:02:02', 10, '2022-03-03 15:02:02', 'CREDIT_CARD', 1500, 'NEW', 15000, 1);
insert into orders value(5, null, '2022-02-02 15:02:02', 10, '2022-03-03 15:02:02', 'CREDIT_CARD', 1500, 'NEW', 15000, 3);

insert into order_details value(1, 120, 3, 360, 120, 1, 1);

insert into order_track value(1, 'something', 'PAID', '2022-4-14', 2);
insert into order_track value(2, 'something', 'DELIVERED', '2022-4-14', 1);

insert into reviews value (1, 'This is a perfect product I have used.', 'Perfect', 5, '2022-05-16', 5, 26);



update products set review_count = 0, average_rating = 0 where id = 2;
update products set review_count = 0, average_rating = 0 where id = 3;
update products set review_count = 0, average_rating = 0 where id = 4;
update products set review_count = 0, average_rating = 0 where id = 5;
update products set review_count = 0, average_rating = 0 where id = 6;
update products set review_count = 0, average_rating = 0 where id = 7;
update products set review_count = 0, average_rating = 0 where id = 8;
update products set review_count = 0, average_rating = 0 where id = 9;
update products set review_count = 0, average_rating = 0 where id = 10;
update products set review_count = 0, average_rating = 0 where id = 11;
update products set review_count = 0, average_rating = 0 where id = 12;
update products set review_count = 0, average_rating = 0 where id = 13;
update products set review_count = 0, average_rating = 0 where id = 14;
update products set review_count = 0, average_rating = 0 where id = 15;
update products set review_count = 0, average_rating = 0 where id = 16;
update products set review_count = 0, average_rating = 0 where id = 17;
update products set review_count = 0, average_rating = 0 where id = 18;
update products set review_count = 0, average_rating = 0 where id = 19;
update products set review_count = 0, average_rating = 0 where id = 20;
update products set review_count = 0, average_rating = 0 where id = 21;
update products set review_count = 0, average_rating = 0 where id = 22;
update products set review_count = 0, average_rating = 0 where id = 23;
update products set review_count = 0, average_rating = 0 where id = 24;
update products set review_count = 0, average_rating = 0 where id = 25;
update products set review_count = 0, average_rating = 0 where id = 26;
update products set review_count = 0, average_rating = 0 where id = 27;
update products set review_count = 0, average_rating = 0 where id = 28;
update products set review_count = 0, average_rating = 0 where id = 29;
update products set review_count = 0, average_rating = 0 where id = 30;
update products set review_count = 0, average_rating = 0 where id = 31;
update products set review_count = 0, average_rating = 0 where id = 32;
update products set review_count = 0, average_rating = 0 where id = 33;
update products set review_count = 0, average_rating = 0 where id = 34;
update products set review_count = 0, average_rating = 0 where id = 35;
update products set review_count = 0, average_rating = 0 where id = 36;
update products set review_count = 0, average_rating = 0 where id = 37;
update products set review_count = 0, average_rating = 0 where id = 38;
update products set review_count = 0, average_rating = 0 where id = 39;
update products set review_count = 0, average_rating = 0 where id = 40;
update products set review_count = 0, average_rating = 0 where id = 41;
update products set review_count = 0, average_rating = 0 where id = 42;
update products set review_count = 0, average_rating = 0 where id = 43;
update products set review_count = 0, average_rating = 0 where id = 44;
update products set review_count = 0, average_rating = 0 where id = 45;
update products set review_count = 0, average_rating = 0 where id = 46;
update products set review_count = 0, average_rating = 0 where id = 47;
update products set review_count = 0, average_rating = 0 where id = 48;
update products set review_count = 0, average_rating = 0 where id = 49;
update products set review_count = 0, average_rating = 0 where id = 50;
update products set review_count = 0, average_rating = 0 where id = 51;
update products set review_count = 0, average_rating = 0 where id = 52;
update products set review_count = 0, average_rating = 0 where id = 53;
update products set review_count = 0, average_rating = 0 where id = 54;
update products set review_count = 0, average_rating = 0 where id = 55;
update products set review_count = 0, average_rating = 0 where id = 56;
update products set review_count = 0, average_rating = 0 where id = 57;
update products set review_count = 0, average_rating = 0 where id = 58;
update products set review_count = 0, average_rating = 0 where id = 59;
update products set review_count = 0, average_rating = 0 where id = 60;
update products set review_count = 0, average_rating = 0 where id = 61;
update products set review_count = 0, average_rating = 0 where id = 62;
update products set review_count = 0, average_rating = 0 where id = 63;
update products set review_count = 0, average_rating = 0 where id = 64;
update products set review_count = 0, average_rating = 0 where id = 65;
update products set review_count = 0, average_rating = 0 where id = 66;
update products set review_count = 0, average_rating = 0 where id = 67;

update users set password = '$2a$10$HalyCWlFL5rWDSInsUyxY.gH3xom/Ounod0QZxObv0K3LFy5nAMyi' where id = 7;


update orders set address_deliver = 'Vinh Phu 24' where id = 3;
update orders set address_deliver = 'Vinh Phu 24' where id = 4;
update orders set address_deliver = 'Vinh Phu 24' where id = 5;


select * from products where name like '%gan%'
or short_description like '%gan%'
or full_description like '%gan%';

select * from settings;
select * from customers;
select * from cart_item;
select * from addresses;
select * from orders;
select * from order_details;
select * from products;
select * from currencies;
select * from reviews;
select * from categories;
select * from brands;
use rubikdb;

delete from settings where `key` = 'SITE_LOGO';
delete from customers where id = 4;