-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS category_category_id_seq;

-- Table Definition
CREATE TABLE "public"."category" (
    "category_id" int4 NOT NULL DEFAULT nextval('category_category_id_seq'::regclass),
    "category_name" varchar(255),
    "create_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "is_remove" bool DEFAULT false,
    PRIMARY KEY ("category_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS orders_order_id_seq;

-- Table Definition
CREATE TABLE "public"."orders" (
    "order_id" int4 NOT NULL DEFAULT nextval('orders_order_id_seq'::regclass),
    "user_id" int4,
    "list_product" _int4,
    "create_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "orders_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id"),
    PRIMARY KEY ("order_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS payment_payment_id_seq;

-- Table Definition
CREATE TABLE "public"."payment" (
    "payment_id" int4 NOT NULL DEFAULT nextval('payment_payment_id_seq'::regclass),
    "order_id" int4,
    "status" varchar(50),
    "create_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "payment_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id"),
    PRIMARY KEY ("payment_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS product_product_id_seq;

-- Table Definition
CREATE TABLE "public"."product" (
    "product_id" int4 NOT NULL DEFAULT nextval('product_product_id_seq'::regclass),
    "product_name" varchar(255),
    "attributes" jsonb,
    "user_id" int4,
    "rate" numeric(2,1),
    "star" int4,
    "description" text,
    "category_id" int4,
    "create_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "is_remove" bool DEFAULT false,
    CONSTRAINT "product_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "public"."users"("user_id"),
    CONSTRAINT "product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "public"."category"("category_id"),
    PRIMARY KEY ("product_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS shipping_ship_id_seq;

-- Table Definition
CREATE TABLE "public"."shipping" (
    "ship_id" int4 NOT NULL DEFAULT nextval('shipping_ship_id_seq'::regclass),
    "order_id" int4,
    "full_name" varchar(255),
    "email" varchar(255),
    "phone" varchar(15),
    "address" text,
    "create_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "shipping_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "public"."orders"("order_id"),
    PRIMARY KEY ("ship_id")
);

-- This script only contains the table creation statements and does not fully represent the table in the database. Do not use it as a backup.

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS users_user_id_seq;

-- Table Definition
CREATE TABLE "public"."users" (
    "user_id" int4 NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
    "full_name" varchar(255),
    "email" varchar(255),
    "password" varchar(255),
    "create_at" timestamp DEFAULT CURRENT_TIMESTAMP,
    "is_remove" bool DEFAULT false,
    PRIMARY KEY ("user_id")
);


-- Indices
CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);

INSERT INTO "public"."category" ("category_id", "category_name", "create_at", "is_remove") VALUES
(1, 'Cơm', '2024-09-19 13:35:05.933328', 'f');
INSERT INTO "public"."category" ("category_id", "category_name", "create_at", "is_remove") VALUES
(2, 'Gà Rán', '2024-09-19 13:35:05.933328', 'f');
INSERT INTO "public"."category" ("category_id", "category_name", "create_at", "is_remove") VALUES
(3, 'Burger', '2024-09-19 13:35:05.933328', 'f');
INSERT INTO "public"."category" ("category_id", "category_name", "create_at", "is_remove") VALUES
(4, 'Bún', '2024-09-19 13:35:05.933328', 'f'),
(5, 'Mì', '2024-09-19 13:35:05.933328', 'f');

INSERT INTO "public"."orders" ("order_id", "user_id", "list_product", "create_at") VALUES
(1, 1, '{391,399,407,435}', '2024-10-09 14:35:05.809');
INSERT INTO "public"."orders" ("order_id", "user_id", "list_product", "create_at") VALUES
(2, 1, '{391,399,407,435}', '2024-10-09 14:35:54.591');
INSERT INTO "public"."orders" ("order_id", "user_id", "list_product", "create_at") VALUES
(3, 1, '{391,399,407,435}', '2024-10-09 14:37:55.048');
INSERT INTO "public"."orders" ("order_id", "user_id", "list_product", "create_at") VALUES
(4, 16, '{391,407,435}', '2024-10-15 05:40:29.411'),
(5, 16, '{391,407,435}', '2024-10-16 02:35:53.699'),
(6, 16, '{391,407,435}', '2024-10-16 02:39:31.915'),
(7, 16, '{391,407,435}', '2024-10-16 02:46:33.031'),
(8, 16, '{391,407,435}', '2024-10-16 02:55:50.652');



INSERT INTO "public"."product" ("product_id", "product_name", "attributes", "user_id", "rate", "star", "description", "category_id", "create_at", "is_remove") VALUES
(391, 'Cơm Gà Xối Mỡ', '[{"image": "images/com_ga_xoi_mo.jpg", "price": 50000}]', 1, 4.5, 100, 'Cơm gà với nước sốt đậm đà.', 1, '2024-09-19 13:37:25.620886', 'f');
INSERT INTO "public"."product" ("product_id", "product_name", "attributes", "user_id", "rate", "star", "description", "category_id", "create_at", "is_remove") VALUES
(392, 'Cơm Tấm Sườn', '[{"image": "images/com_tam_suon.jpg", "price": 60000}]', 1, 4.3, 90, 'Cơm tấm sườn nướng thơm ngon.', 1, '2024-09-19 13:37:25.620886', 'f');
INSERT INTO "public"."product" ("product_id", "product_name", "attributes", "user_id", "rate", "star", "description", "category_id", "create_at", "is_remove") VALUES
(393, 'Cơm Chiên Dương Châu', '[{"image": "images/com_chien_duong_chau.jpg", "price": 55000}]', 1, 4.0, 85, 'Cơm chiên với tôm và rau.', 1, '2024-09-19 13:37:25.620886', 'f');
INSERT INTO "public"."product" ("product_id", "product_name", "attributes", "user_id", "rate", "star", "description", "category_id", "create_at", "is_remove") VALUES
(394, 'Cơm Gà Nướng', '[{"image": "images/com_ga_nuong.jpg", "price": 65000}]', 1, 4.6, 95, 'Cơm gà nướng thơm phức.', 1, '2024-09-19 13:37:25.620886', 'f'),
(395, 'Cơm Bò Kho', '[{"image": "images/com_bo_kho.jpg", "price": 70000}]', 1, 4.4, 88, 'Cơm bò kho với nước sốt đậm đà.', 1, '2024-09-19 13:37:25.620886', 'f'),
(396, 'Cơm Sườn Cốt Lết', '[{"image": "images/com_suon_cot_let.jpg", "price": 75000}]', 1, 4.2, 85, 'Cơm sườn cốt lết nướng.', 1, '2024-09-19 13:37:25.620886', 'f'),
(397, 'Cơm Ngon Nhất', '[{"image": "images/com_ngon_nhat.jpg", "price": 80000}]', 1, 4.7, 100, 'Cơm với nước sốt đặc biệt.', 1, '2024-09-19 13:37:25.620886', 'f'),
(398, 'Cơm Hải Sản', '[{"image": "images/com_hai_san.jpg", "price": 90000}]', 1, 4.8, 90, 'Cơm hải sản tươi ngon.', 1, '2024-09-19 13:37:25.620886', 'f'),
(399, 'Cơm Xá Xíu', '[{"image": "images/com_xa_xiu.jpg", "price": 60000}]', 1, 4.1, 80, 'Cơm xá xíu ngon miệng.', 1, '2024-09-19 13:37:25.620886', 'f'),
(400, 'Cơm Rang Thập Cẩm', '[{"image": "images/com_rang_thap_cam.jpg", "price": 70000}]', 1, 4.5, 95, 'Cơm rang với nhiều loại thịt.', 1, '2024-09-19 13:37:25.620886', 'f'),
(401, 'Cơm Tóp Mỡ', '[{"image": "images/com_top_mo.jpg", "price": 65000}]', 1, 4.0, 75, 'Cơm với tóp mỡ giòn rụm.', 1, '2024-09-19 13:37:25.620886', 'f'),
(402, 'Cơm Cá Kho Tộ', '[{"image": "images/com_ca_kho_to.jpg", "price": 60000}]', 1, 4.2, 85, 'Cơm cá kho tộ thơm ngon.', 1, '2024-09-19 13:37:25.620886', 'f'),
(403, 'Cơm Gà Bà Ngoại', '[{"image": "images/com_ga_ba_ngoai.jpg", "price": 75000}]', 1, 4.3, 90, 'Cơm gà theo công thức truyền thống.', 1, '2024-09-19 13:37:25.620886', 'f'),
(404, 'Cơm Rượu Gà', '[{"image": "images/com_ruou_ga.jpg", "price": 70000}]', 1, 4.5, 92, 'Cơm gà nấu với rượu.', 1, '2024-09-19 13:37:25.620886', 'f'),
(405, 'Cơm Bò Lúc Lắc', '[{"image": "images/com_bo_luc_lac.jpg", "price": 80000}]', 1, 4.4, 88, 'Cơm bò lúc lắc ngon tuyệt.', 1, '2024-09-19 13:37:25.620886', 'f'),
(406, 'Cơm Bắp Ngô', '[{"image": "images/com_bap_ngo.jpg", "price": 55000}]', 1, 4.1, 80, 'Cơm với ngô bắp thơm ngon.', 1, '2024-09-19 13:37:25.620886', 'f'),
(407, 'Cơm Hến', '[{"image": "images/com_hen.jpg", "price": 65000}]', 1, 4.3, 85, 'Cơm hến độc đáo.', 1, '2024-09-19 13:37:25.620886', 'f'),
(408, 'Cơm Xào Tôm', '[{"image": "images/com_xao_tom.jpg", "price": 60000}]', 1, 4.6, 90, 'Cơm xào tôm tươi ngon.', 1, '2024-09-19 13:37:25.620886', 'f'),
(409, 'Cơm Thịt Kho Tàu', '[{"image": "images/com_thit_kho_tau.jpg", "price": 70000}]', 1, 4.2, 85, 'Cơm thịt kho tàu đậm đà.', 1, '2024-09-19 13:37:25.620886', 'f'),
(410, 'Cơm Gà Roti', '[{"image": "images/com_ga_roti.jpg", "price": 80000}]', 1, 4.7, 95, 'Cơm gà Roti thơm lừng.', 1, '2024-09-19 13:37:25.620886', 'f'),
(411, 'Gà Rán Giòn', '[{"image": "images/ga_ran_gion.jpg", "price": 80000}]', 2, 4.5, 100, 'Gà rán giòn rụm bên ngoài.', 2, '2024-09-19 13:37:25.620886', 'f'),
(412, 'Gà Rán Cay', '[{"image": "images/ga_ran_cay.jpg", "price": 85000}]', 2, 4.3, 90, 'Gà rán với gia vị cay đặc biệt.', 2, '2024-09-19 13:37:25.620886', 'f'),
(413, 'Gà Rán Nguyên Miếng', '[{"image": "images/ga_ran_nguyen_mieng.jpg", "price": 90000}]', 2, 4.6, 95, 'Gà rán nguyên miếng hấp dẫn.', 2, '2024-09-19 13:37:25.620886', 'f'),
(414, 'Gà Rán BBQ', '[{"image": "images/ga_ran_bBQ.jpg", "price": 95000}]', 2, 4.4, 88, 'Gà rán sốt BBQ thơm ngon.', 2, '2024-09-19 13:37:25.620886', 'f'),
(415, 'Gà Rán Sả', '[{"image": "images/ga_ran_sa.jpg", "price": 75000}]', 2, 4.2, 85, 'Gà rán với hương vị sả.', 2, '2024-09-19 13:37:25.620886', 'f'),
(416, 'Gà Rán Tỏi', '[{"image": "images/ga_ran_toi.jpg", "price": 80000}]', 2, 4.5, 92, 'Gà rán tỏi thơm lừng.', 2, '2024-09-19 13:37:25.620886', 'f'),
(417, 'Gà Rán Bơ Tỏi', '[{"image": "images/ga_ran_bo_toi.jpg", "price": 85000}]', 2, 4.6, 95, 'Gà rán với bơ và tỏi.', 2, '2024-09-19 13:37:25.620886', 'f'),
(418, 'Gà Rán Ớt', '[{"image": "images/ga_ran_ot.jpg", "price": 75000}]', 2, 4.1, 80, 'Gà rán ớt cay nồng.', 2, '2024-09-19 13:37:25.620886', 'f'),
(419, 'Gà Rán Phô Mai', '[{"image": "images/ga_ran_pho_mai.jpg", "price": 90000}]', 2, 4.7, 95, 'Gà rán phô mai ngậy.', 2, '2024-09-19 13:37:25.620886', 'f'),
(420, 'Gà Rán Mật Ong', '[{"image": "images/ga_ran_mat_ong.jpg", "price": 85000}]', 2, 4.4, 85, 'Gà rán sốt mật ong.', 2, '2024-09-19 13:37:25.620886', 'f'),
(421, 'Gà Rán Nướng', '[{"image": "images/ga_ran_nuong.jpg", "price": 80000}]', 2, 4.3, 90, 'Gà nướng giòn rụm.', 2, '2024-09-19 13:37:25.620886', 'f'),
(422, 'Gà Rán Hành', '[{"image": "images/ga_ran_hanh.jpg", "price": 75000}]', 2, 4.2, 78, 'Gà rán hành giòn thơm.', 2, '2024-09-19 13:37:25.620886', 'f'),
(423, 'Gà Rán Tỏi Ớt', '[{"image": "images/ga_ran_toi_ot.jpg", "price": 85000}]', 2, 4.5, 85, 'Gà rán tỏi ớt cay nồng.', 2, '2024-09-19 13:37:25.620886', 'f'),
(424, 'Gà Rán Thần Thánh', '[{"image": "images/ga_ran_than_thanh.jpg", "price": 90000}]', 2, 4.6, 90, 'Gà rán với gia vị thần thánh.', 2, '2024-09-19 13:37:25.620886', 'f'),
(425, 'Gà Rán Chanh', '[{"image": "images/ga_ran_chanh.jpg", "price": 80000}]', 2, 4.4, 86, 'Gà rán vị chanh tươi.', 2, '2024-09-19 13:37:25.620886', 'f'),
(426, 'Gà Rán Kèm Bánh Mì', '[{"image": "images/ga_ran_kem_banh_mi.jpg", "price": 80000}]', 2, 4.3, 88, 'Gà rán kèm bánh mì.', 2, '2024-09-19 13:37:25.620886', 'f'),
(427, 'Gà Rán Nguyên Con', '[{"image": "images/ga_ran_nguyen_con.jpg", "price": 100000}]', 2, 4.8, 95, 'Gà rán nguyên con thơm ngon.', 2, '2024-09-19 13:37:25.620886', 'f'),
(428, 'Gà Rán Rôti', '[{"image": "images/ga_ran_roti.jpg", "price": 95000}]', 2, 4.5, 90, 'Gà rán Rôti hấp dẫn.', 2, '2024-09-19 13:37:25.620886', 'f'),
(429, 'Gà Rán Truyền Thống', '[{"image": "images/ga_ran_truyen_thong.jpg", "price": 85000}]', 2, 4.6, 91, 'Gà rán truyền thống thơm ngon.', 2, '2024-09-19 13:37:25.620886', 'f'),
(430, 'Burger Thịt Bò', '[{"image": "images/burger_thit_bo.jpg", "price": 60000}]', 3, 4.5, 100, 'Burger thịt bò ngon miệng.', 3, '2024-09-19 13:37:25.620886', 'f'),
(431, 'Burger Gà', '[{"image": "images/burger_ga.jpg", "price": 65000}]', 3, 4.3, 90, 'Burger gà thơm ngon.', 3, '2024-09-19 13:37:25.620886', 'f'),
(432, 'Burger Phô Mai', '[{"image": "images/burger_pho_mai.jpg", "price": 70000}]', 3, 4.6, 95, 'Burger với phô mai béo ngậy.', 3, '2024-09-19 13:37:25.620886', 'f'),
(433, 'Burger Bò Nướng', '[{"image": "images/burger_bo_nuong.jpg", "price": 70000}]', 3, 4.4, 88, 'Burger bò nướng tuyệt hảo.', 3, '2024-09-19 13:37:25.620886', 'f'),
(434, 'Burger Tôm', '[{"image": "images/burger_tom.jpg", "price": 80000}]', 3, 4.1, 85, 'Burger tôm tươi ngon.', 3, '2024-09-19 13:37:25.620886', 'f'),
(435, 'Burger Nấm', '[{"image": "images/burger_nam.jpg", "price": 65000}]', 3, 4.2, 82, 'Burger nấm chay hấp dẫn.', 3, '2024-09-19 13:37:25.620886', 'f');
INSERT INTO "public"."product" ("product_id", "product_name", "attributes", "user_id", "rate", "star", "description", "category_id", "create_at", "is_remove") VALUES
(436, 'Burger Đặc Biệt', '[{"image": "images/burger_dac_biet.jpg", "price": 75000}]', 3, 4.5, 90, 'Burger với công thức đặc biệt.', 3, '2024-09-19 13:37:25.620886', 'f'),
(437, 'Burger Tự Chọn', '[{"image": "images/burger_tu_chon.jpg", "price": 70000}]', 3, 4.6, 93, 'Burger tùy chọn theo sở thích.', 3, '2024-09-19 13:37:25.620886', 'f'),
(438, 'Burger Bò Khoai Tây', '[{"image": "images/burger_bo_khoai_tay.jpg", "price": 75000}]', 3, 4.3, 89, 'Burger với khoai tây chiên.', 3, '2024-09-19 13:37:25.620886', 'f'),
(439, 'Burger Thịt Xông Khói', '[{"image": "images/burger_thit_xong_khoi.jpg", "price": 80000}]', 3, 4.4, 86, 'Burger thịt xông khói hấp dẫn.', 3, '2024-09-19 13:37:25.620886', 'f'),
(440, 'Burger Hải Sản', '[{"image": "images/burger_hai_san.jpg", "price": 90000}]', 3, 4.7, 95, 'Burger hải sản tươi ngon.', 3, '2024-09-19 13:37:25.620886', 'f'),
(441, 'Burger BBQ', '[{"image": "images/burger_bBQ.jpg", "price": 85000}]', 3, 4.8, 97, 'Burger với sốt BBQ đậm đà.', 3, '2024-09-19 13:37:25.620886', 'f'),
(442, 'Burger Gà Rán', '[{"image": "images/burger_ga_ran.jpg", "price": 70000}]', 3, 4.1, 80, 'Burger gà rán giòn rụm.', 3, '2024-09-19 13:37:25.620886', 'f'),
(443, 'Burger Chay', '[{"image": "images/burger_chay.jpg", "price": 60000}]', 3, 4.0, 75, 'Burger chay lành mạnh.', 3, '2024-09-19 13:37:25.620886', 'f'),
(444, 'Burger Gà Xào', '[{"image": "images/burger_ga_xao.jpg", "price": 65000}]', 3, 4.2, 85, 'Burger gà xào thơm lừng.', 3, '2024-09-19 13:37:25.620886', 'f'),
(445, 'Burger Đậu Hủ', '[{"image": "images/burger_dau_hu.jpg", "price": 60000}]', 3, 4.3, 88, 'Burger đậu hủ cho người ăn chay.', 3, '2024-09-19 13:37:25.620886', 'f'),
(446, 'Burger Gà Hấp', '[{"image": "images/burger_ga_hap.jpg", "price": 65000}]', 3, 4.6, 90, 'Burger gà hấp nhẹ nhàng.', 3, '2024-09-19 13:37:25.620886', 'f'),
(447, 'Burger Thịt Nướng', '[{"image": "images/burger_thit_nuong.jpg", "price": 70000}]', 3, 4.5, 92, 'Burger thịt nướng thơm ngon.', 3, '2024-09-19 13:37:25.620886', 'f'),
(448, 'Burger Nấm Trứng', '[{"image": "images/burger_nam_trung.jpg", "price": 65000}]', 3, 4.1, 79, 'Burger nấm trứng hấp dẫn.', 3, '2024-09-19 13:37:25.620886', 'f'),
(449, 'Burger Gà Bánh Mì', '[{"image": "images/burger_ga_banh_mi.jpg", "price": 70000}]', 3, 4.0, 82, 'Burger gà kết hợp với bánh mì.', 3, '2024-09-19 13:37:25.620886', 'f'),
(450, 'Bún Thịt Nướng', '[{"image": "images/bun_thit_nuong.jpg", "price": 55000}]', 4, 4.5, 100, 'Bún thịt nướng thơm ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(451, 'Bún Bò Huế', '[{"image": "images/bun_bo_hue.jpg", "price": 60000}]', 4, 4.3, 90, 'Bún bò Huế đậm đà.', 4, '2024-09-19 13:37:25.620886', 'f'),
(452, 'Bún Chả Hà Nội', '[{"image": "images/bun_cha_hanoi.jpg", "price": 65000}]', 4, 4.6, 95, 'Bún chả Hà Nội đặc trưng.', 4, '2024-09-19 13:37:25.620886', 'f'),
(453, 'Bún Riêu', '[{"image": "images/bun_rieu.jpg", "price": 55000}]', 4, 4.4, 88, 'Bún riêu cua thơm ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(454, 'Bún Cá', '[{"image": "images/bun_ca.jpg", "price": 60000}]', 4, 4.1, 85, 'Bún cá hấp dẫn.', 4, '2024-09-19 13:37:25.620886', 'f'),
(455, 'Bún Nước Lèo', '[{"image": "images/bun_nuoc_leo.jpg", "price": 65000}]', 4, 4.2, 82, 'Bún nước lèo thơm ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(456, 'Bún Gà', '[{"image": "images/bun_ga.jpg", "price": 55000}]', 4, 4.5, 90, 'Bún gà thơm lừng.', 4, '2024-09-19 13:37:25.620886', 'f'),
(457, 'Bún Mắm', '[{"image": "images/bun_mam.jpg", "price": 60000}]', 4, 4.6, 95, 'Bún mắm ngon tuyệt.', 4, '2024-09-19 13:37:25.620886', 'f'),
(458, 'Bún Hến', '[{"image": "images/bun_hen.jpg", "price": 55000}]', 4, 4.3, 89, 'Bún hến độc đáo.', 4, '2024-09-19 13:37:25.620886', 'f'),
(459, 'Bún Ngũ Vị', '[{"image": "images/bun_ngu_vi.jpg", "price": 60000}]', 4, 4.4, 86, 'Bún ngũ vị thơm ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(460, 'Bún Ốc', '[{"image": "images/bun_oc.jpg", "price": 65000}]', 4, 4.7, 95, 'Bún ốc tươi ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(461, 'Bún Chay', '[{"image": "images/bun_chay.jpg", "price": 50000}]', 4, 4.1, 80, 'Bún chay lành mạnh.', 4, '2024-09-19 13:37:25.620886', 'f'),
(462, 'Bún Bò Nam Bộ', '[{"image": "images/bun_bo_nam_bo.jpg", "price": 65000}]', 4, 4.0, 75, 'Bún bò Nam Bộ đặc trưng.', 4, '2024-09-19 13:37:25.620886', 'f'),
(463, 'Bún Tôm', '[{"image": "images/bun_tom.jpg", "price": 60000}]', 4, 4.2, 85, 'Bún tôm hấp dẫn.', 4, '2024-09-19 13:37:25.620886', 'f'),
(464, 'Bún Hủ Tiếu', '[{"image": "images/bun_hu_tieu.jpg", "price": 70000}]', 4, 4.3, 88, 'Bún hủ tiếu thơm ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(465, 'Bún Thập Cẩm', '[{"image": "images/bun_thap_cam.jpg", "price": 65000}]', 4, 4.5, 90, 'Bún thập cẩm phong phú.', 4, '2024-09-19 13:37:25.620886', 'f'),
(466, 'Bún Tàu Hủ', '[{"image": "images/bun_tau_hu.jpg", "price": 55000}]', 4, 4.1, 79, 'Bún tàu hủ cho người ăn chay.', 4, '2024-09-19 13:37:25.620886', 'f'),
(467, 'Bún Tôm Nướng', '[{"image": "images/bun_tom_nuong.jpg", "price": 60000}]', 4, 4.4, 84, 'Bún tôm nướng thơm ngon.', 4, '2024-09-19 13:37:25.620886', 'f'),
(468, 'Mì Ý Thịt Bò', '[{"image": "images/mi_y_thit_bo.jpg", "price": 70000}]', 5, 4.5, 100, 'Mì Ý với thịt bò tươi ngon.', 5, '2024-09-19 13:37:25.620886', 'f'),
(469, 'Mì Xào Hải Sản', '[{"image": "images/mi_xao_hai_san.jpg", "price": 75000}]', 5, 4.3, 90, 'Mì xào hải sản hấp dẫn.', 5, '2024-09-19 13:37:25.620886', 'f'),
(470, 'Mì Xào Thịt Bò', '[{"image": "images/mi_xao_thit_bo.jpg", "price": 70000}]', 5, 4.6, 95, 'Mì xào thịt bò thơm ngon.', 5, '2024-09-19 13:37:25.620886', 'f'),
(471, 'Mì Cay', '[{"image": "images/mi_cay.jpg", "price": 60000}]', 5, 4.4, 88, 'Mì cay nồng nàn.', 5, '2024-09-19 13:37:25.620886', 'f'),
(472, 'Mì Trứng', '[{"image": "images/mi_trung.jpg", "price": 55000}]', 5, 4.1, 85, 'Mì trứng hấp dẫn.', 5, '2024-09-19 13:37:25.620886', 'f'),
(473, 'Mì Xào Chay', '[{"image": "images/mi_xao_chay.jpg", "price": 60000}]', 5, 4.2, 82, 'Mì xào chay lành mạnh.', 5, '2024-09-19 13:37:25.620886', 'f'),
(474, 'Mì Hến', '[{"image": "images/mi_hen.jpg", "price": 65000}]', 5, 4.5, 90, 'Mì hến thơm ngon.', 5, '2024-09-19 13:37:25.620886', 'f'),
(475, 'Mì Bò Kho', '[{"image": "images/mi_bo_kho.jpg", "price": 70000}]', 5, 4.6, 95, 'Mì bò kho đậm đà.', 5, '2024-09-19 13:37:25.620886', 'f'),
(476, 'Mì Hải Sản', '[{"image": "images/mi_hai_san.jpg", "price": 80000}]', 5, 4.8, 98, 'Mì hải sản tươi ngon.', 5, '2024-09-19 13:37:25.620886', 'f'),
(477, 'Mì Gà Nướng', '[{"image": "images/mi_ga_nuong.jpg", "price": 75000}]', 5, 4.4, 86, 'Mì gà nướng thơm phức.', 5, '2024-09-19 13:37:25.620886', 'f'),
(478, 'Mì Xào Thập Cẩm', '[{"image": "images/mi_xao_thap_cam.jpg", "price": 70000}]', 5, 4.5, 90, 'Mì xào thập cẩm hấp dẫn.', 5, '2024-09-19 13:37:25.620886', 'f'),
(479, 'Mì Chay', '[{"image": "images/mi_chay.jpg", "price": 50000}]', 5, 4.1, 80, 'Mì chay lành mạnh.', 5, '2024-09-19 13:37:25.620886', 'f'),
(480, 'Mì Bò Nướng', '[{"image": "images/mi_bo_nuong.jpg", "price": 70000}]', 5, 4.3, 85, 'Mì bò nướng tuyệt hảo.', 5, '2024-09-19 13:37:25.620886', 'f'),
(481, 'Mì Hủ Tiếu', '[{"image": "images/mi_hu_tieu.jpg", "price": 60000}]', 5, 4.2, 82, 'Mì hủ tiếu thơm ngon.', 5, '2024-09-19 13:37:25.620886', 'f'),
(482, 'Mì Tôm', '[{"image": "images/mi_tom.jpg", "price": 55000}]', 5, 4.4, 88, 'Mì tôm tươi ngon.', 5, '2024-09-19 13:37:25.620886', 'f'),
(483, 'Mì Tôm Chua', '[{"image": "images/mi_tom_chua.jpg", "price": 60000}]', 5, 4.1, 80, 'Mì tôm chua ngọt.', 5, '2024-09-19 13:37:25.620886', 'f'),
(484, 'Mì Nguyên Bản', '[{"image": "images/mi_nguyen_ban.jpg", "price": 50000}]', 5, 4.0, 75, 'Mì nguyên bản hấp dẫn.', 5, '2024-09-19 13:37:25.620886', 'f'),
(485, 'Mì Đặc Biệt', '[{"image": "images/mi_dac_biet.jpg", "price": 80000}]', 5, 4.7, 95, 'Mì đặc biệt với nhiều nguyên liệu.', 5, '2024-09-19 13:37:25.620886', 'f'),
(486, 'Mì Tôm Xào', '[{"image": "images/mi_tom_xao.jpg", "price": 65000}]', 5, 4.5, 90, 'Mì tôm xào hấp dẫn.', 5, '2024-09-19 13:37:25.620886', 'f'),
(487, 'Mì Gà Xào', '[{"image": "images/mi_ga_xao.jpg", "price": 70000}]', 5, 4.6, 93, 'Mì gà xào thơm lừng.', 5, '2024-09-19 13:37:25.620886', 'f');

INSERT INTO "public"."shipping" ("ship_id", "order_id", "full_name", "email", "phone", "address", "create_at") VALUES
(1, 8, 'pikachu1', 'pikachu1@gmail.com', '789546123', 'SIN', '2024-10-16 02:55:50.699');


INSERT INTO "public"."users" ("user_id", "full_name", "email", "password", "create_at", "is_remove") VALUES
(2, 'Trần Thị B', 'tranthib@example.com', 'hashed_password_2', '2024-09-19 13:37:11.058666', 'f');
INSERT INTO "public"."users" ("user_id", "full_name", "email", "password", "create_at", "is_remove") VALUES
(3, 'Lê Văn C', 'levanc@example.com', 'hashed_password_3', '2024-09-19 13:37:11.058666', 'f');
INSERT INTO "public"."users" ("user_id", "full_name", "email", "password", "create_at", "is_remove") VALUES
(4, 'Phạm Thị D', 'phamthid@example.com', 'hashed_password_4', '2024-09-19 13:37:11.058666', 'f');
INSERT INTO "public"."users" ("user_id", "full_name", "email", "password", "create_at", "is_remove") VALUES
(5, 'Nguyễn Văn E', 'nguyenvane@example.com', 'hashed_password_5', '2024-09-19 13:37:11.058666', 'f'),
(6, 'Trần Văn F', 'tranvanf@example.com', 'hashed_password_6', '2024-09-19 13:37:11.058666', 'f'),
(7, 'Lê Thị G', 'lethig@example.com', 'hashed_password_7', '2024-09-19 13:37:11.058666', 'f'),
(8, 'Phạm Văn H', 'phamvanh@example.com', 'hashed_password_8', '2024-09-19 13:37:11.058666', 'f'),
(9, 'Nguyễn Thị I', 'nguyenthi@example.com', 'hashed_password_9', '2024-09-19 13:37:11.058666', 'f'),
(10, 'Trần Văn J', 'tranvanj@example.com', 'hashed_password_10', '2024-09-19 13:37:11.058666', 'f'),
(11, NULL, 'linh@gmail.com', '123456', '2024-09-20 08:26:34.079', 'f'),
(12, NULL, 'dsdssd@gmail.com', '123', '2024-10-04 09:46:30.231', 'f'),
(14, NULL, 'vu123@gmail.com', '123456', '2024-10-04 13:35:07.03', 'f'),
(1, 'Nguyễn Văn Vũ', 'vu@gmail.com', '123456', '2024-09-19 13:37:11.058666', 'f'),
(13, 'Nguyễn Văn Vũ', 'nguyenvanvu220798@gmail.com', '123456', '2024-10-04 09:47:02.494', 'f'),
(15, 'pikachu', 'pikachu@gmail.com', '123456', '2024-10-14 09:10:15.183', 'f'),
(16, 'pikachu1', 'pikachu1@gmail.com', '123456', '2024-10-14 09:13:58.677', 'f'),
(17, 'pikachu2', 'pikachu2@gmail.com', '123456', '2024-10-15 03:32:02.173', 'f'),
(18, 'pikachu23', 'pikachu23@gmail.com', '123456', '2024-10-15 05:00:37.478', 'f'),
(19, 'pikachu234', 'pikachu234@gmail.com', '123456', '2024-10-16 08:41:27.374', 'f'),
(20, 'pikachu34', 'pikachu34@gmail.com', '123456', '2024-10-16 09:25:13.236', 'f');
