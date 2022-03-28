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






insert into products values (3, '', '', "<div><h3><b>Product Description</b></h3></div><span>&nbsp;</span><div><b><br></b></div>", "<h4>Overview</h4><ul><li></li><li></li><li></li><li></li></ul>", null, null, 1, 1, 17, 19.99, 5, '', 1, 1, 1, 1, 4, 4);


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





delete from product_images where id = 20;
delete from product_images where id = 21;
delete from product_images where id = 22;
delete from product_images where id = 23;
delete from product_images where id = 24;
delete from product_images where id = 25;