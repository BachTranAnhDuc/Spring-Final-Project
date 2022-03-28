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
insert into products values (2, 'YJ YuPo V2 Magnetic 2x2', 'YJ_YuPo_V2_Magnetic_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YJ YuPo 2x2 V2 M is a fantastic budget friendly magnetic 2x2 speed cube. This puzzle turns well right out of the box and features a medium magnetic feel that is sure to please beginners and professional solvers alike.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Dry, fast turning</li><li>Flexible, stable mechanism</li><li>Controllable</li></ul><h4>Accessories included</h4><ul><li>The YJ YuPo 2x2 V2 M is a budget friendly magnetic 2x2 from YJ. This puzzle turns well right out of the box.</li><li>It features a medium magnetic feel that is sure to please beginners and professional solvers alike. products</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'YJ-YuPo-V2-Magnetic-2x2-Black_Main.jpg', 1, 1, 1, 1, 1, 4);
insert into products values (3, 'YJ MGC2 Elite 2x2', 'YJ_MGC2_Elite_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MGC Elite 2x2 is the second 2x2 speed cube in the MGC Elite line. It features an innovative, first of its kind on a 2x2, center/edge magnetic mechanism that offers great control and stability.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MGC Elite 2x2 is the second speed cube in the MGC Elite line. It features an innovative, first of its kind on a 2x2, center/edge magnetic mechanism that offers great control and stability.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory. Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids. </li><li>Great corner cutting ,Tension adjustable. It doesn't corner twist as often nor does it lock up. Difficult to pop, good control of the cubes, comes pre-lubricated and tensioned.</li><li>No one falls out of love with the puzzle cubes. Perfect Christmas / Birthday / Children’s Day Gift Idea. This classic puzzle game will never go out of style. GIFT BOX PACKING Gift box packing makes it a perfect gift for your kids.</li></ul>", null, null, 1, 1, 17, 19.99, 5, 'YJ-MGC-Elite-Magnetic-2x2-Black-2-Main.jpg', 1, 1, 1, 1, 1, 4);
insert into products values (4, 'Angstrom MGC2 Elite 2x2', 'Angstrom_MGC2_Elite_2x2', "<div><h3><b>Product Description</b></h3></div><span>The Angstrom MGC2 Elite 2x2 features an innovative center/edge magnetic mechanism that offers great control and stability. This puzzle is lubed with Angstrom Gravitas, Angstrom Dignitas, and DNM-37. This a fast and long-lasting mixture that is superior to a traditional silicone setup.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>Original puzzle made by YJ. It features an Angstrom Research logo on the red side.</li><li>Angstrom MGCElite 2x2</li><li>Cubicle Cube Stand (assorted color)</li><li>Angstrom Research Collectible Card</li></ul>", null, null, 1, 1, 17, 19.99, 5, 'MGCPicture2_Main.jpg', 1, 1, 1, 1, 1, 4);
insert into products values (5, 'GAN 249 V2 M', 'GAN_249_V2_M', "<div><h3><b>Product Description</b></h3></div><span>The GAN 249 V2 M the magnetized version of the GAN 249 V2. This 2x2 speed cube features a honeycomb design on the corner contact points and an overall smooth feel. The Stickerless version features a bright stickerless color scheme, primary plastic internals, while the black plastic version features the GAN Full Bright color scheme and black plastic internals.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The GAN249v2M has perfectly match of magnetic forces with elastic forces. Precisely placed 48 3*1.5 magnets inside. Easier to control the power of the cube with magnetic forces.</li><li>The GAN 249 V2 M the magnetized version of the GAN 249 V2. It features a honeycomb design on the corner contact points and an overall smooth feel. </li><li>The Stickerless version features a bright stickerless color scheme, primary plastic internals, while the black plastic version features the GAN Full Bright color scheme and black plastic internals. It is packaged inside a special GAN box with a plastic tensioning tool and GAN CFOP pamphlet </li><li>This 2x2 just glides its way to perfection. I'm really used to the buttery feel of GAN cubes, and this gives buttery a whole different meaning. It's smooth, but at the same time its not. If you turn it slowly, you can both feel and hear sort of a sandy and bumpy feeling from the honey-comb design and the magnets, but once you start scrambling and playing with it, it's so smooth but somehow has a dry feeling.</li><li>I won't say its the best on the market, but to my preferences, it's amazing. Nice job for a version 2 GAN! </li></ul>", null, null, 1, 1, 17, 19.99, 5, 'gan_249_v2_m_main.jpg', 1, 1, 1, 1, 4, 4);
insert into products values (6, 'GAN251 M Explorer', 'GAN251_M_Explorer', "<div><h3><b>Product Description</b></h3></div><span>The GAN251 M Explorer is the newest 2x2 speed cube from GAN. This cube features all of the same characteristics of the 249 V2 M like great corner cutting, matte finish, a light/airy feel, and a medium magnetic strength. This small increase in size (2mm), although seemingly insignificant, is definitely noticeable and gives the solver much more control over the puzzle and ultimately leads to a better solving experience!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>GAN 251 M UPGRADED - 3 versions available from the menu: Air, Pro and Leap. With magnetic core inside, new GAN 251 series has smoother turning feel and lighter body.</li><li>WHAT MAKES THE DIFFERENCE - GAN 251 M Air has unadjustable corner magnets but no magnet in the core. That reduces the weight and the cube turns very straightforward. Both Pro and Leap have the same corner core adjustable magnet system, and Leap has much bigger mangets in the core. Overall, two versions perform consistently good, Pro has better stability and Leap has faster speed.</li><li>VARIOUS TUNING - Tuning versatility is always GAN's prominent feature, and GAN 251 M remain so. It is equipped with 2 kinds of nut distances, 4 levels elasticity, and optional 3 settings of magnets(Pro & Leap). All 24 configurations can be achieved within seconds, only a tool and alternative GES nut needed. Have more styles to tune but cost less time to explore.</li><li>FINE CRAFTMANSHIP - The mechanism of GAN251 M series supports adjustable magnet strength(Pro & Leap) and tension tuning individually, with great corner cutting and rounded slide track. All features combined together are less than 60 grams in total, serving as buttery smooth in your hands.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 27, 29.99, 5, 'GAN251_M_Explorer_Main.jpg', 1, 1, 1, 1, 4, 4);
insert into products values (7, 'GAN 251 M Pro', 'GAN_251_M_Pro', "<div><h3><b>Product Description</b></h3></div><span>The GAN251 M Explorer is the newest 2x2 speed cube from GAN. This cube features all of the same characteristics of the 249 V2 M like great corner cutting, matte finish, a light/airy feel, and a medium magnetic strength. This small increase in size (2mm), although seemingly insignificant, is definitely noticeable and gives the solver much more control over the puzzle and ultimately leads to a better solving experience!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>GAN 251 M UPGRADED - 3 versions available from the menu: Air, Pro and Leap. With magnetic core inside, new GAN 251 series has smoother turning feel and lighter body.</li><li>WHAT MAKES THE DIFFERENCE - GAN 251 M Air has unadjustable corner magnets but no magnet in the core. That reduces the weight and the cube turns very straightforward. Both Pro and Leap have the same corner core adjustable magnet system, and Leap has much bigger mangets in the core. Overall, two versions perform consistently good, Pro has better stability and Leap has faster speed.</li><li>VARIOUS TUNING - Tuning versatility is always GAN's prominent feature, and GAN 251 M remain so. It is equipped with 2 kinds of nut distances, 4 levels elasticity, and optional 3 settings of magnets(Pro & Leap). All 24 configurations can be achieved within seconds, only a tool and alternative GES nut needed. Have more styles to tune but cost less time to explore.</li><li>FINE CRAFTMANSHIP - The mechanism of GAN251 M series supports adjustable magnet strength(Pro & Leap) and tension tuning individually, with great corner cutting and rounded slide track. All features combined together are less than 60 grams in total, serving as buttery smooth in your hands.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 31, 32.99, 5, 'GAN251_M_Explorer_Main.jpg', 1, 1, 1, 1, 4, 4);
insert into products values (8, 'The GAN 251 M Leap', 'The_GAN_251_M_Leap', "<div><h3><b>Product Description</b></h3></div><span>Product Description</b></h3></div><span>The GAN 251 M Leap is an updated 2x2 mechanism which features corner/core and traditional magnets just like the GAN 11 M Pro. This version also utilizes large angle magnetic alignment technology, an internal magnet design that helps the cube snap into place easier and faster.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>GAN 251 M UPGRADED - 3 versions available from the menu: Air, Pro and Leap. With magnetic core inside, new GAN 251 series has smoother turning feel and lighter body.</li><li>WHAT MAKES THE DIFFERENCE - GAN 251 M Air has unadjustable corner magnets but no magnet in the core. That reduces the weight and the cube turns very straightforward. Both Pro and Leap have the same corner core adjustable magnet system, and Leap has much bigger mangets in the core. Overall, two versions perform consistently good, Pro has better stability and Leap has faster speed.</li><li>VARIOUS TUNING - Tuning versatility is always GAN's prominent feature, and GAN 251 M remain so. It is equipped with 2 kinds of nut distances, 4 levels elasticity, and optional 3 settings of magnets(Pro & Leap). All 24 configurations can be achieved within seconds, only a tool and alternative GES nut needed. Have more styles to tune but cost less time to explore.</li><li>FINE CRAFTMANSHIP - The mechanism of GAN251 M series supports adjustable magnet strength(Pro & Leap) and tension tuning individually, with great corner cutting and rounded slide track. All features combined together are less than 60 grams in total, serving as buttery smooth in your hands.</li><li>CONNECTED WITH GAN TEAM - By choosing GAN Cube store, you are choosing the world's most successful 3x3 brand. Here you can have the latest news of GAN products, join fans group, or even make a sound to future models. No worry about missing accessories or unpleasant experience, our CS Team will make you satisfied.</li></ul>", null, null, 1, 1, 37, 39.99, 5, 'GAN_251_M_Leap_Main.jpg', 1, 1, 1, 1, 4, 4);
insert into products values (9, 'MoYu WeiPo 2x2 WR M', 'MoYu_WeiPo_2x2_WR_M', "<div><h3><b>Product Description</b></h3></div><span>The WeiPo 2x2 WRS from MoYu is a leap forward in 2x2 design from the famous company. This 2x2 has a magnetic adjustment system as well as a spring compression adjustment so you can find your perfect setup!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The WeiPo 2x2 WRS from MoYu is a leap forward in 2x2 design from the famous company. This 2x2 has a magnetic adjustment system as well as a spring compression adjustment so you can find your perfect setup!</li></ul>", null, null, 1, 1, 17, 19.99, 5, 'The_GAN_251_M_Leap_Main.jpg', 1, 1, 1, 1, 3, 4);
insert into products values (10, 'MoYu RS2 M 2x2', 'MoYu_RS2_M_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MoYu RS2 M 2x2 is the latest puzzle in the RS line. It features frosted plastic, medium/strong magnetic strength, and smooth turning right out of the box.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MoYu RS2 M 2x2 is the latest puzzle in the RS line. It features frosted plastic, medium/strong magnetic strength, and smooth turning right out of the box.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating! The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves </li><li>Magnetic Positioning Technology - magnets inside the cube improve the hand feel, magnet slots ensure the magnets placed accurately.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 5, 7.99, 5, 'MoYu_RS2_M_2x2_Main.jpg', 1, 1, 1, 1, 3, 4);
insert into products values (11, 'Qiyi QiDi S 2x2 - Jelly', 'Qiyi_QiDi_S_2x2_Jelly', "<div><h3><b>Product Description</b></h3></div><span>The Qiyi QiDi S 2x2 - Jelly is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi QiDi S 2x2 is the latest 2x2 from QiYi/MoFangGe. It features a frosted, scratch-resistant surface, and symmetrical positioning technology -- all at a very economical price </li><li>The Qiyi QiDi S 2x2 - Jelly is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.</li></ul>", null, null, 1, 1, 4, 5.99, 5, 'Qiyi_QiDi_S_2x2_Jelly_Main.jpg', 1, 1, 1, 1, 2, 4);
insert into products values (12, 'QiYi MS 2x2', 'QiYi_MS_2x2', "<div><h3><b>Product Description</b></h3></div><span>The QiYi MS 2x2 is a magnetic 2x2 speed cube built for performance and economy. Part of QiYi’s new economy “MS” line, this 2x2 has an unbelievably light and quick feel. This puzzle is sure to please beginners and advanced solvers alike.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi QiDi S 2x2 is the latest 2x2 from QiYi/MoFangGe. It features a frosted, scratch-resistant surface, and symmetrical positioning technology -- all at a very economical price </li><li>The Qiyi QiDi S 2x2 - Jelly is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'QiYi_MS_2x2_Main.jpg', 1, 1, 1, 1, 2, 4);
insert into products values (13, ' QiYi MP 2x2 M', ' QiYi_MP_2x2_M', "<div><h3><b>Product Description</b></h3></div><span>The QiYi MP 2x2 M is a magnetic 2x2 with a smooth feel. The magnets on this cube are on the stronger side, but feel good when turning. This cube features a glossy outer finish and vibrant stickerless bright shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The QiYi QiDi S 2x2 is the latest 2x2 from QiYi/MoFangGe. It features a frosted, scratch-resistant surface, and symmetrical positioning technology -- all at a very economical price </li><li>The QiYi MP 2x2 M is just like a typical QiYi QiDi S, except this version has transparent, icy stickerless shades.</li></ul>", null, null, 1, 1, 14, 15.99, 5, 'QiYi_MP_2x2_M_Main.jpg', 1, 1, 1, 1, 2, 4);
insert into products values (14, 'YuXin Little Magic 2x2', 'YuXin_Little_Magic_2x2', "<div><h3><b>Product Description</b></h3></div><span>The YuXin Little Magic 2x2 feel, that so many people have come to enjoy, is now available with factory magnets! This is a great magnetic speed cube for any skill level from beginner to professional.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Yuxin Little Magic 2x2 is a fast, sandy feeling 2x2 that retains the feel of its 3x3 counterpart. It is definitely a competitor for best budget 2x2 on the market.</li><li>Super light, super fast. All I did was loosen it a few turns to unlock better corner cutting. Great for people who like light and fast cubes</li><li>It has a lot of grooves which are great for speed, and they fit nicely together giving it a stable feel. The frosted plastic is subtle. The turning feels smooth and a little scratchy.</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'YuXin_Little_Magic_2x2_Main.jpg', 1, 1, 1, 1, 15, 4);
insert into products values (15, 'Little Magic 2x2 V2 M', 'Little_Magic_2x2_V2_M', "<div><h3><b>Product Description</b></h3></div><span>The Little Magic 2x2 V2 M is a new magnetic 2x2 from YuXin. This puzzle has a medium/strong magnetic feel, black internals, and features vibrant stickerless bright shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The Yuxin Little Magic 2x2 is a fast, sandy feeling 2x2 that retains the feel of its 3x3 counterpart. It is definitely a competitor for best budget 2x2 on the market.</li><li>Super light, super fast. All I did was loosen it a few turns to unlock better corner cutting. Great for people who like light and fast cubes</li><li>It has a lot of grooves which are great for speed, and they fit nicely together giving it a stable feel. The frosted plastic is subtle. The turning feels smooth and a little scratchy.</li></ul>", null, null, 1, 1, 5, 6.99, 5, 'Little_Magic_2x2_V2_M_Main.jpg', 1, 1, 1, 1, 15, 4);
insert into products values (16, 'MFJS MeiLong 2x2 M', 'MFJS_MeiLong_2x2_M', "<div><h3><b>Product Description</b></h3></div><span>The MFJS MeiLong 2x2 M is a budget friendly magnetic 2x2 speed cube from MFJS. It offers great performance and a medium/light magnetic feel at a fraction of the cost of other magnetic 2x2s!&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MFJS MeiLong 2x2 M is a budget friendly magnetic 2x2 speed cube from MFJS. It offers great performance and a medium/light magnetic feel at a fraction of the cost of other magnetic 2x2s!</li><li>So ootb this cube does not feel cheap, kinda like the 251 it has a nice hollow feeling and crunchy turning, the corner cutting is amazing and its a really fast cube, it out preforms a fully setup gan 251 M, holy this cube is amazing </li><li>This puzzle is sure to be a challenge for beginners and seasoned puzzlers alike. It comes in vibrant stickerless bright shades </li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 5.00, 6.99, 5, 'MFJS_MeiLong_2x2_M_Main.jpg', 1, 1, 1, 1, 10, 4);
insert into products values (17, 'Moyu MoFang JiaoShi Macaron Meilong 2x2 stickerless', 'MFJS_MeiLong_2x2_Macaron', "<div><h3><b>Product Description</b></h3></div><span>The MFJS MeiLong 2x2 - Macaron is a budget friendly 2x2 speed cube from MoFang JiaoShi. This puzzle features smooth turning right out of the box, and light pastel shades.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The MFJS MeiLong 2x2 M is a budget friendly magnetic 2x2 speed cube from MFJS. It offers great performance and a medium/light magnetic feel at a fraction of the cost of other magnetic 2x2s!</li><li>So ootb this cube does not feel cheap, kinda like the 251 it has a nice hollow feeling and crunchy turning, the corner cutting is amazing and its a really fast cube, it out preforms a fully setup gan 251 M, holy this cube is amazing </li><li>This puzzle is sure to be a challenge for beginners and seasoned puzzlers alike. It comes in vibrant stickerless bright shades </li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul>", null, null, 1, 1, 6.00, 7.99, 5, 'MFJS_MeiLong_2x2_Macaron_Main.jpg', 1, 1, 1, 1, 10, 4);
insert into products values (18, 'DaYan TengYun 2x2 M', 'DaYan_TengYun_2x2_M', "<div><h3><b>Product Description</b></h3></div><span>The TengYun M is the newest 2x2 from DaYan. This puzzle is factory magnetized with medium/strong magnets and has wavy ridges on the inside of the pieces to ensure smooth turning. This puzzle takes the smooth, quiet feel from the TengYun 3x3 M and puts it in a very exciting 2x2.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The TengYun M is the newest 2x2 from DaYan. This puzzle is factory magnetized with medium/strong magnets and has wavy ridges on the inside of the pieces to ensure smooth turning.</li><li>This puzzle takes the smooth, quiet feel from the TengYun 3x3 M and puts it in a very exciting 2x2.</li><li>Environmental material, Using the original ABS material: no stickers, non-poisonous material, the color will never fade. Smooth and fast ,solve it when each side matches.</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids.</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style.</li></ul></ul>", null, null, 1, 1, 17.00, 18.99, 5, 'DaYan_TengYun_2x2_M_Main.jpg', 1, 1, 1, 1, 5, 4);
insert into products values (19, 'GoCube 2x2', 'GoCube_2x2', "<div><h3><b>Product Description</b></h3></div><span>The GoCube 2x2 is a smart 2x2x2 puzzle that works with the GoCube app! This puzzle is pillowed with colorful tiles surrounded by transparent plastic in the style of the original GoCube. &nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>SMART & CONNECTED - This smart cube wirelessly connects to your phone or tablet and allows everyone to LEARN how to solve the iconic puzzle Cube. THE PERFECT WAY TO GET INTO CUBING! And don’t be fooled by it, the GoCube 2x2 is still VERY challenging ;) LEARN, IMPROVE & PLAY!</li><li>EVERYONE CAN SOLVE IT! - Use the mobile FREE application to learn how to solve the cube. Track your electronic cube progress, Get accurate stats to improve your solve time, challenge yourself and get better! Sharpen your skills and join our global leaderboard.</li><li>INNOVATIVE & EDUCATIONAL - The GoCube 2x2 is the perfect STEM toy, it is educational and fun, and adds tons of value to screen time! Learn the fundamentals of Problem Solving in a fun and interactive way, develop your child’s memorization skills as well as hand & eye coordination. Proven to build Self-Esteem and Confidence. Oh, the look in their eyes when they solve it for the first time…</li><li>THE PERFECT GIFT FOR THE HOLIDAYS - The GoCube 2x2 is FUN, EDUCATIONAL and TECHIE. EVERYONE would love it! This is the best brain teaser, and a perfect gift for the holidays, especially when Covid is around and everyone is looking for new innovative toys to entertain their family! FITS ALL AGES & CAPABILITIES !!</li><li>1 YEAR WARRANTY, SUPERB CUSTOMER SERVICE - A family-friendly game, perfect for Family Saturday Nights, while on-the-go, flights and road trips. The GoCube 2x2 comes with a travel pouch, it is light and durable and will entertain your family for hours!! Oh, and you have a 1-year-warranty on your cube and superb customer support! </li></ul>", null, null, 1, 1, 47, 49.99, 5, 'GoCube_2x2_Main.jpg', 1, 1, 1, 1, 9, 4);
insert into products values (20, 'MonsterGO 2x2', 'MonsterGO_2x2', "<div><h3><b>Product Description</b></h3></div><span>The MonsterGO 2x2 is a non-magnetic 2x2 that features frosted plastic, vibrant stickerless bright shades, and GES nuts installed for tensioning.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>That is a perfect product</li></ul>", null, null, 1, 1, 10.00, 1.99, 5, 'MonsterGO_2x2_Main.jpg', 1, 1, 1, 1, 11, 4);
insert into products values (21, 'X-MAN FLARE 2X2 M', 'X-MAN_FLARE_2X2_M', "<div><h3><b>Product Description</b></h3></div><span>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style</li></ul></ul>", null, null, 1, 1, 15.00, 16.99, 5, 'X-MAN_FLARE_2X2_M_Main.jpg', 1, 1, 1, 1, 14, 4);
insert into products values (22, 'ANGSTROM X-MAN FLARE 2X2 M', 'ANGSTROM_X-MAN_FLARE_2X2_M', "<div><h3><b>Product Description</b></h3></div><span>The Angstrom X-Man Flare 2x2 M is one of our premium versions of QiYi’s flagship 2x2 in the X-Man series featuring adjustable magnets. It is set up with Angstrom Gravitas, Angstrom Dignitas, and DNM-37 on the pieces, creating a smooth and controllable turing experience, especially after breaking it in.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.</li><li>The traditional stickers have been replaced with original and eco-friendly ABS material, which mean no fading, peeling or cheating!</li><li>The Anti-stick Degin can prevent the cube viscosity,make the cube solve smoothlt.Optimized parts of the round corner pieces,makes work coordinate effectively.enhance the corner cutting ability,make it more smooth when it solves</li><li>Solving puzzles and brain teasers are important activities to teach kids to work hard at solving complex problems and foster your kid's sense of space and enhance a child's memory.Whether you're trying to stretch your brain capacity or spending some leisure time with your loved ones, this would be a great gift for your kids</li><li>Perfect Christmas gift/ birthday gift for kids. This classic puzzle game will never go out of style</li></ul></ul>", null, null, 1, 1, 25.00, 26.99, 5, 'ANGSTROM_X-MAN_FLARE_2X2_M_Main.jpg', 1, 1, 1, 1, 14, 4);
insert into products values (23, 'PRO SHOP X-MAN FLARE 2X2 M', 'PRO_SHOP_X-MAN_FLARE_2X2_M', "<div><h3><b>Product Description</b></h3></div><span>The Pro Shop X-Man Flare 2x2 M is one of our premium versions of QiYi’s flagship 2x2 in the X-Man series featuring adjustable magnets. It is set up with Traxxas-30k, Lubicle Speedy, and DNM-37 on the pieces, creating a fast and controllable turing experience.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The X-Man Flare 2x2 M is a new magnetic 2x2 by QiYi sub-brand, X-Man Design. The Flare is the first 2x2 to feature adjustable magnets. Using adjustable switches located in the red, green, white piece, the Flare has three different magnetic settings based on the positions of the switches. Apart from its elegant and creative adjustment system, the Flare has a satisfyingly light and crunchy feel.</li></ul></ul>", null, null, 1, 1, 22.00, 23.99, 5, 'ANGSTROM_X-MAN_FLARE_2X2_M_Main.jpg', 1, 1, 1, 1, 14, 4);






insert into products values (31, 'MoYu WeiLong AI 3x3', 'MoYu_WeiLong_AI_3x3', "<div><h3><b>Product Description</b></h3></div><span>The WeiLong AI is a new smart cube from MoYu. The mechanism is based on the WR M 2020, so its performance is not compromised like all previous smart cubes. This puzzle also features a gyroscope to track rotations.&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li>The WeiLong WR M MagLev is the latest version in the famous WeiLong line. This 3x3 features purple internals, magnetic adjustment, tension and compression adjustment, and a maglev system in place of traditional springs.</li><li>Maglev technology utilizes opposing magnets (magnetic levitation) to replicate spring force, this reduces friction and completely eliminates spring noise.</li><li>Unique 9-level dual adjustment design on the tensioning, you can adjust the elasticity on your own preference.</li><li>The torpedo on edges and corners come to multi-track inner circle, making the cube more stable and has a better anti-pop performance.</li><li>High quality ABS material and unified turning surface, keeping the cube smooth and stable. </li></ul>", null, null, 1, 1, 63.00, 64.99, 5, 'MoYu_WeiLong_AI_3x3_Main.jpg', 1, 1, 1, 1, 3, 5);



insert into products values (1, '', '', "<div><h3><b>Product Description</b></h3></div><span>&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li><li></li><li></li></ul>", null, null, 1, 1, 7.00, 9.99, 5, '.jpg', 1, 1, 1, 1, 1, 4);

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



delete from product_images where id = 20;
delete from product_images where id = 21;
delete from product_images where id = 22;
delete from product_images where id = 23;
delete from product_images where id = 24;
delete from product_images where id = 78;

delete from product_details where product_id = 21;

delete from products where id = 9;

update products set maim_image = 'DaYan_TengYun_2x2_M_Main.jpg' where id = 18;