BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "servicios_servicio" (
	"id"	integer NOT NULL,
	"titulo"	varchar(50) NOT NULL,
	"contenido"	varchar(50) NOT NULL,
	"imagen"	varchar(100) NOT NULL,
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "blog_categoria" (
	"id"	integer NOT NULL,
	"nombre"	varchar(50) NOT NULL,
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "blog_post" (
	"id"	integer NOT NULL,
	"titulo"	varchar(50) NOT NULL,
	"contenido"	varchar(50) NOT NULL,
	"imagen"	varchar(100),
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	"autor_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("autor_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "blog_post_categorias" (
	"id"	integer NOT NULL,
	"post_id"	bigint NOT NULL,
	"categoria_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("post_id") REFERENCES "blog_post"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("categoria_id") REFERENCES "blog_categoria"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "tienda_categoriaprod" (
	"id"	integer NOT NULL,
	"nombre"	varchar(50) NOT NULL,
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tienda_producto_categorias" (
	"id"	integer NOT NULL,
	"producto_id"	bigint NOT NULL,
	"categoriaprod_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("categoriaprod_id") REFERENCES "tienda_categoriaprod"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("producto_id") REFERENCES "tienda_producto"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "tienda_producto" (
	"id"	integer NOT NULL,
	"nombre"	varchar(50) NOT NULL,
	"descripcion"	text NOT NULL,
	"imagen"	varchar(100),
	"disponibilidad"	bool NOT NULL,
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	"precio"	real NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "pedidos" (
	"id"	integer NOT NULL,
	"created_at"	datetime NOT NULL,
	"user_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "lineapedidos" (
	"id"	integer NOT NULL,
	"cantidad"	integer NOT NULL,
	"created_at"	datetime NOT NULL,
	"producto_id"	bigint NOT NULL,
	"user_id"	integer NOT NULL,
	"pedido_id"	bigint NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("pedido_id") REFERENCES "pedidos"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("producto_id") REFERENCES "tienda_producto"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" VALUES (1,'contenttypes','0001_initial','2024-02-01 20:36:06.353653');
INSERT INTO "django_migrations" VALUES (2,'auth','0001_initial','2024-02-01 20:36:06.415465');
INSERT INTO "django_migrations" VALUES (3,'admin','0001_initial','2024-02-01 20:36:06.461234');
INSERT INTO "django_migrations" VALUES (4,'admin','0002_logentry_remove_auto_add','2024-02-01 20:36:06.505527');
INSERT INTO "django_migrations" VALUES (5,'admin','0003_logentry_add_action_flag_choices','2024-02-01 20:36:06.530281');
INSERT INTO "django_migrations" VALUES (6,'contenttypes','0002_remove_content_type_name','2024-02-01 20:36:06.583095');
INSERT INTO "django_migrations" VALUES (7,'auth','0002_alter_permission_name_max_length','2024-02-01 20:36:06.612764');
INSERT INTO "django_migrations" VALUES (8,'auth','0003_alter_user_email_max_length','2024-02-01 20:36:06.649704');
INSERT INTO "django_migrations" VALUES (9,'auth','0004_alter_user_username_opts','2024-02-01 20:36:06.683503');
INSERT INTO "django_migrations" VALUES (10,'auth','0005_alter_user_last_login_null','2024-02-01 20:36:06.717299');
INSERT INTO "django_migrations" VALUES (11,'auth','0006_require_contenttypes_0002','2024-02-01 20:36:06.733342');
INSERT INTO "django_migrations" VALUES (12,'auth','0007_alter_validators_add_error_messages','2024-02-01 20:36:06.762329');
INSERT INTO "django_migrations" VALUES (13,'auth','0008_alter_user_username_max_length','2024-02-01 20:36:06.798403');
INSERT INTO "django_migrations" VALUES (14,'auth','0009_alter_user_last_name_max_length','2024-02-01 20:36:06.836598');
INSERT INTO "django_migrations" VALUES (15,'auth','0010_alter_group_name_max_length','2024-02-01 20:36:06.864532');
INSERT INTO "django_migrations" VALUES (16,'auth','0011_update_proxy_permissions','2024-02-01 20:36:06.888263');
INSERT INTO "django_migrations" VALUES (17,'auth','0012_alter_user_first_name_max_length','2024-02-01 20:36:06.929193');
INSERT INTO "django_migrations" VALUES (18,'servicios','0001_initial','2024-02-01 20:36:06.944412');
INSERT INTO "django_migrations" VALUES (19,'sessions','0001_initial','2024-02-01 20:36:06.971580');
INSERT INTO "django_migrations" VALUES (20,'blog','0001_initial','2024-02-13 19:05:46.883433');
INSERT INTO "django_migrations" VALUES (21,'tienda','0001_initial','2024-02-16 17:02:41.107600');
INSERT INTO "django_migrations" VALUES (22,'tienda','0002_remove_producto_categorias_producto_categorias','2024-02-16 17:17:13.471755');
INSERT INTO "django_migrations" VALUES (23,'tienda','0003_alter_producto_precio','2024-02-16 21:26:04.563504');
INSERT INTO "django_migrations" VALUES (24,'pedidos','0001_initial','2024-02-18 20:36:19.345938');
INSERT INTO "django_admin_log" VALUES (1,'1','primer servicio de ejemplo',1,'[{"added": {}}]',7,2,'2024-02-04 09:41:30.972696');
INSERT INTO "django_admin_log" VALUES (2,'1','primer servicio de ejemplo',2,'[{"changed": {"fields": ["Imagen"]}}]',7,2,'2024-02-04 09:52:22.392050');
INSERT INTO "django_admin_log" VALUES (3,'2','servicio ejermplo 2',1,'[{"added": {}}]',7,2,'2024-02-12 13:55:04.999889');
INSERT INTO "django_admin_log" VALUES (4,'3','servicio 3',1,'[{"added": {}}]',7,2,'2024-02-12 13:55:21.474509');
INSERT INTO "django_admin_log" VALUES (5,'1','Internacionales',1,'[{"added": {}}]',8,2,'2024-02-13 19:10:17.181422');
INSERT INTO "django_admin_log" VALUES (6,'2','Nacionales',1,'[{"added": {}}]',8,2,'2024-02-13 19:10:27.989357');
INSERT INTO "django_admin_log" VALUES (7,'1','Post de Prueba',1,'[{"added": {}}]',9,2,'2024-02-13 19:11:19.138849');
INSERT INTO "django_admin_log" VALUES (8,'2','post 2',1,'[{"added": {}}]',9,2,'2024-02-13 19:27:44.380398');
INSERT INTO "django_admin_log" VALUES (9,'3','otras',1,'[{"added": {}}]',8,2,'2024-02-13 20:03:29.657342');
INSERT INTO "django_admin_log" VALUES (10,'3','post 3',1,'[{"added": {}}]',9,2,'2024-02-13 20:04:00.254386');
INSERT INTO "django_admin_log" VALUES (11,'3','post 3',2,'[{"changed": {"fields": ["Imagen"]}}]',9,2,'2024-02-13 20:05:52.936643');
INSERT INTO "django_admin_log" VALUES (12,'1','mascotas',1,'[{"added": {}}]',11,2,'2024-02-16 17:10:31.701441');
INSERT INTO "django_admin_log" VALUES (13,'1','ejemplo 1',1,'[{"added": {}}]',10,2,'2024-02-16 17:11:48.990487');
INSERT INTO "django_admin_log" VALUES (14,'2','ferreteria',1,'[{"added": {}}]',11,2,'2024-02-16 17:15:10.547015');
INSERT INTO "django_admin_log" VALUES (15,'3','Ceramica',1,'[{"added": {}}]',11,2,'2024-02-16 17:15:15.042103');
INSERT INTO "django_admin_log" VALUES (16,'4','Jueguetes',1,'[{"added": {}}]',11,2,'2024-02-16 17:15:18.359622');
INSERT INTO "django_admin_log" VALUES (17,'2','ejemplo 2',1,'[{"added": {}}]',10,2,'2024-02-16 17:18:11.697961');
INSERT INTO "django_admin_log" VALUES (18,'3','ejemplo 3',1,'[{"added": {}}]',10,2,'2024-02-16 17:48:21.821038');
INSERT INTO "django_admin_log" VALUES (19,'4','ejemplo 4',1,'[{"added": {}}]',10,2,'2024-02-16 17:48:43.695848');
INSERT INTO "django_admin_log" VALUES (20,'5','ejemplo 5',1,'[{"added": {}}]',10,2,'2024-02-16 17:49:14.347709');
INSERT INTO "django_admin_log" VALUES (21,'3','manolo7',3,'',4,2,'2024-02-17 14:35:12.351811');
INSERT INTO "django_content_type" VALUES (1,'admin','logentry');
INSERT INTO "django_content_type" VALUES (2,'auth','permission');
INSERT INTO "django_content_type" VALUES (3,'auth','group');
INSERT INTO "django_content_type" VALUES (4,'auth','user');
INSERT INTO "django_content_type" VALUES (5,'contenttypes','contenttype');
INSERT INTO "django_content_type" VALUES (6,'sessions','session');
INSERT INTO "django_content_type" VALUES (7,'servicios','servicio');
INSERT INTO "django_content_type" VALUES (8,'blog','categoria');
INSERT INTO "django_content_type" VALUES (9,'blog','post');
INSERT INTO "django_content_type" VALUES (10,'tienda','producto');
INSERT INTO "django_content_type" VALUES (11,'tienda','categoriaprod');
INSERT INTO "django_content_type" VALUES (12,'pedidos','pedido');
INSERT INTO "django_content_type" VALUES (13,'pedidos','lineapedido');
INSERT INTO "auth_permission" VALUES (1,1,'add_logentry','Can add log entry');
INSERT INTO "auth_permission" VALUES (2,1,'change_logentry','Can change log entry');
INSERT INTO "auth_permission" VALUES (3,1,'delete_logentry','Can delete log entry');
INSERT INTO "auth_permission" VALUES (4,1,'view_logentry','Can view log entry');
INSERT INTO "auth_permission" VALUES (5,2,'add_permission','Can add permission');
INSERT INTO "auth_permission" VALUES (6,2,'change_permission','Can change permission');
INSERT INTO "auth_permission" VALUES (7,2,'delete_permission','Can delete permission');
INSERT INTO "auth_permission" VALUES (8,2,'view_permission','Can view permission');
INSERT INTO "auth_permission" VALUES (9,3,'add_group','Can add group');
INSERT INTO "auth_permission" VALUES (10,3,'change_group','Can change group');
INSERT INTO "auth_permission" VALUES (11,3,'delete_group','Can delete group');
INSERT INTO "auth_permission" VALUES (12,3,'view_group','Can view group');
INSERT INTO "auth_permission" VALUES (13,4,'add_user','Can add user');
INSERT INTO "auth_permission" VALUES (14,4,'change_user','Can change user');
INSERT INTO "auth_permission" VALUES (15,4,'delete_user','Can delete user');
INSERT INTO "auth_permission" VALUES (16,4,'view_user','Can view user');
INSERT INTO "auth_permission" VALUES (17,5,'add_contenttype','Can add content type');
INSERT INTO "auth_permission" VALUES (18,5,'change_contenttype','Can change content type');
INSERT INTO "auth_permission" VALUES (19,5,'delete_contenttype','Can delete content type');
INSERT INTO "auth_permission" VALUES (20,5,'view_contenttype','Can view content type');
INSERT INTO "auth_permission" VALUES (21,6,'add_session','Can add session');
INSERT INTO "auth_permission" VALUES (22,6,'change_session','Can change session');
INSERT INTO "auth_permission" VALUES (23,6,'delete_session','Can delete session');
INSERT INTO "auth_permission" VALUES (24,6,'view_session','Can view session');
INSERT INTO "auth_permission" VALUES (25,7,'add_servicio','Can add servicio');
INSERT INTO "auth_permission" VALUES (26,7,'change_servicio','Can change servicio');
INSERT INTO "auth_permission" VALUES (27,7,'delete_servicio','Can delete servicio');
INSERT INTO "auth_permission" VALUES (28,7,'view_servicio','Can view servicio');
INSERT INTO "auth_permission" VALUES (29,8,'add_categoria','Can add categoria');
INSERT INTO "auth_permission" VALUES (30,8,'change_categoria','Can change categoria');
INSERT INTO "auth_permission" VALUES (31,8,'delete_categoria','Can delete categoria');
INSERT INTO "auth_permission" VALUES (32,8,'view_categoria','Can view categoria');
INSERT INTO "auth_permission" VALUES (33,9,'add_post','Can add post');
INSERT INTO "auth_permission" VALUES (34,9,'change_post','Can change post');
INSERT INTO "auth_permission" VALUES (35,9,'delete_post','Can delete post');
INSERT INTO "auth_permission" VALUES (36,9,'view_post','Can view post');
INSERT INTO "auth_permission" VALUES (37,10,'add_producto','Can add producto');
INSERT INTO "auth_permission" VALUES (38,10,'change_producto','Can change producto');
INSERT INTO "auth_permission" VALUES (39,10,'delete_producto','Can delete producto');
INSERT INTO "auth_permission" VALUES (40,10,'view_producto','Can view producto');
INSERT INTO "auth_permission" VALUES (41,11,'add_categoriaprod','Can add categoriaProd');
INSERT INTO "auth_permission" VALUES (42,11,'change_categoriaprod','Can change categoriaProd');
INSERT INTO "auth_permission" VALUES (43,11,'delete_categoriaprod','Can delete categoriaProd');
INSERT INTO "auth_permission" VALUES (44,11,'view_categoriaprod','Can view categoriaProd');
INSERT INTO "auth_permission" VALUES (45,12,'add_pedido','Can add pedido');
INSERT INTO "auth_permission" VALUES (46,12,'change_pedido','Can change pedido');
INSERT INTO "auth_permission" VALUES (47,12,'delete_pedido','Can delete pedido');
INSERT INTO "auth_permission" VALUES (48,12,'view_pedido','Can view pedido');
INSERT INTO "auth_permission" VALUES (49,13,'add_lineapedido','Can add Linea Pedido');
INSERT INTO "auth_permission" VALUES (50,13,'change_lineapedido','Can change Linea Pedido');
INSERT INTO "auth_permission" VALUES (51,13,'delete_lineapedido','Can delete Linea Pedido');
INSERT INTO "auth_permission" VALUES (52,13,'view_lineapedido','Can view Linea Pedido');
INSERT INTO "auth_user" VALUES (1,'pbkdf2_sha256$390000$6hvlJK3nLWXNILAQjuj3j3$ePRGnQXVjhhpHvL8lBQtoE6UoVrAkeuo2W0IaxtTaNs=',NULL,1,'boris','','borisanthony03@gmail.com',1,1,'2024-02-01 21:04:50.458339','');
INSERT INTO "auth_user" VALUES (2,'pbkdf2_sha256$720000$1eHPFk8pxTEJQoqV43nfoq$wGCfK/sXrO7GYMHVFslK+aBXZjan/1wjp4y+dEyhWCw=','2024-02-18 21:29:46.926574',1,'boris2','','',1,1,'2024-02-01 21:06:41.736261','');
INSERT INTO "auth_user" VALUES (4,'pbkdf2_sha256$720000$NVdHzPRRF3wHIWbHjYUIZL$/Zpoiil3ihZ3sxKIegNCnBUEdUG/GDUxyfggNtfWSpw=','2024-02-17 14:41:30.779493',0,'manolo9','','',0,1,'2024-02-17 14:41:30.351740','');
INSERT INTO "servicios_servicio" VALUES (1,'primer servicio de ejemplo','este es mi pirmer servicio de ejemplo','servicios/Logo.jpg','2024-02-04 09:41:30.963605','2024-02-04 09:52:22.387534');
INSERT INTO "servicios_servicio" VALUES (2,'servicio ejermplo 2','contenido del 2do servicio','servicios/580b57fcd9996e24bc43c325.png','2024-02-12 13:55:04.993493','2024-02-12 13:55:04.993493');
INSERT INTO "servicios_servicio" VALUES (3,'servicio 3','contenido del 3er servicio','servicios/icono.png','2024-02-12 13:55:21.473001','2024-02-12 13:55:21.473001');
INSERT INTO "django_session" VALUES ('moqm4j7r8er3k5gmh02uifcypnh0nns1','.eJxVjEEOwiAQRe_C2hBKgTAu3XsGMjCDVA0kpV013t026UK3773_NxFwXUpYO89hInEVWlx-WcT04noIemJ9NJlaXeYpyiORp-3y3ojft7P9OyjYy762kJ3JzAaMGhgAYsxqyC56rT1r5VgBJdSkd2jQE6nsFFrjR0ijBfH5AuSpN7Y:1rVeH1:3RS2sHjTc__E0OJvWoHZI_EIoM2xxVaCqIO1mnYW2sM','2024-02-15 21:07:03.519033');
INSERT INTO "django_session" VALUES ('fqvx9retg4dk1up4affg4lsuh9wky4l5','.eJx1zj1ygzAQBeCrZLZmAK1Asijd5wyMfhaQYyRGQOXx3SMSF2SSNCq07-23D7A6pQjdA9jxLCm63W6x9w46VkCIs0kEHdCN5uUe3xgUOUTW5w5r67pURV4RNu90bvAC_KxHCrlRzeS8rjZPwenK2xhiuYQRngXgLwr_oPBE8SyJs4T_Su2lNq0crFNKCcLG2IZbju03nvVe79vU7yulLxoO5_RntP3Ii_LA3XQYY5kv35I35REpX9O1fI-O7tdX9seCSa9TbpsWB9MMSjipEC9SyAsSkm6QS-IDc3UjG6MMcVJGOCbYwIRDbBVjiksFz085MYL3:1rcosL:DOn-a9TbOBe2T_IAS0s0KBAE_ardSnGUXqAE3afCuII','2024-03-06 15:51:13.590864');
INSERT INTO "blog_categoria" VALUES (1,'Internacionales','2024-02-13 19:10:17.178859','2024-02-13 19:10:17.178859');
INSERT INTO "blog_categoria" VALUES (2,'Nacionales','2024-02-13 19:10:27.985908','2024-02-13 19:10:27.985908');
INSERT INTO "blog_categoria" VALUES (3,'otras','2024-02-13 20:03:29.652205','2024-02-13 20:03:29.652205');
INSERT INTO "blog_post" VALUES (1,'Post de Prueba','Contenido de prueba','blog/foto_whisky.png','2024-02-13 19:11:19.132835','2024-02-13 19:11:19.133842',2);
INSERT INTO "blog_post" VALUES (2,'post 2','contenido del post 2','blog/que_pro.jpg','2024-02-13 19:27:44.368966','2024-02-13 19:27:44.368966',2);
INSERT INTO "blog_post" VALUES (3,'post 3','ejemplo del post 3','blog/icono.png','2024-02-13 20:04:00.241519','2024-02-13 20:05:52.926106',2);
INSERT INTO "blog_post_categorias" VALUES (1,1,1);
INSERT INTO "blog_post_categorias" VALUES (2,2,2);
INSERT INTO "blog_post_categorias" VALUES (3,3,3);
INSERT INTO "tienda_categoriaprod" VALUES (1,'mascotas','2024-02-16 17:10:31.697860','2024-02-16 17:10:31.697860');
INSERT INTO "tienda_categoriaprod" VALUES (2,'ferreteria','2024-02-16 17:15:10.544052','2024-02-16 17:15:10.544052');
INSERT INTO "tienda_categoriaprod" VALUES (3,'Ceramica','2024-02-16 17:15:15.039783','2024-02-16 17:15:15.039783');
INSERT INTO "tienda_categoriaprod" VALUES (4,'Jueguetes','2024-02-16 17:15:18.355970','2024-02-16 17:15:18.355970');
INSERT INTO "tienda_producto_categorias" VALUES (1,2,1);
INSERT INTO "tienda_producto_categorias" VALUES (2,2,4);
INSERT INTO "tienda_producto_categorias" VALUES (3,3,1);
INSERT INTO "tienda_producto_categorias" VALUES (4,4,2);
INSERT INTO "tienda_producto_categorias" VALUES (5,5,3);
INSERT INTO "tienda_producto" VALUES (1,'ejemplo 1','un que pro como ejemplo 1 hostia que pro','tienda/icono.png',1,'2024-02-16 17:11:48.988074','2024-02-16 17:11:48.988074',500.3);
INSERT INTO "tienda_producto" VALUES (2,'ejemplo 2','ejemplo 2','tienda/580b57fcd9996e24bc43c325.png',0,'2024-02-16 17:18:11.691041','2024-02-16 17:18:11.691041',150.3);
INSERT INTO "tienda_producto" VALUES (3,'ejemplo 3','ejemplo 3','tienda/foto_whisky.png',1,'2024-02-16 17:48:21.812053','2024-02-16 17:48:21.812053',350.0);
INSERT INTO "tienda_producto" VALUES (4,'ejemplo 4','ejemplo 4','tienda/alas.png',0,'2024-02-16 17:48:43.691254','2024-02-16 17:48:43.691254',150.0);
INSERT INTO "tienda_producto" VALUES (5,'ejemplo 5','ejemplo 5','tienda/1200px-Ruby_logo.svg.png',1,'2024-02-16 17:49:14.342708','2024-02-16 17:49:14.342708',33.0);
INSERT INTO "pedidos" VALUES (1,'2024-02-18 21:40:07.009691',2);
INSERT INTO "lineapedidos" VALUES (1,2,'2024-02-18 21:40:07.027702',1,2,1);
INSERT INTO "lineapedidos" VALUES (2,1,'2024-02-18 21:40:07.027702',2,2,1);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "blog_post_autor_id_8811ea21" ON "blog_post" (
	"autor_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "blog_post_categorias_post_id_categoria_id_70b54e48_uniq" ON "blog_post_categorias" (
	"post_id",
	"categoria_id"
);
CREATE INDEX IF NOT EXISTS "blog_post_categorias_post_id_212bf44c" ON "blog_post_categorias" (
	"post_id"
);
CREATE INDEX IF NOT EXISTS "blog_post_categorias_categoria_id_f3743c06" ON "blog_post_categorias" (
	"categoria_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "tienda_producto_categorias_producto_id_categoriaprod_id_5afd1cb9_uniq" ON "tienda_producto_categorias" (
	"producto_id",
	"categoriaprod_id"
);
CREATE INDEX IF NOT EXISTS "tienda_producto_categorias_producto_id_8bc83fb2" ON "tienda_producto_categorias" (
	"producto_id"
);
CREATE INDEX IF NOT EXISTS "tienda_producto_categorias_categoriaprod_id_2bcd86fe" ON "tienda_producto_categorias" (
	"categoriaprod_id"
);
CREATE INDEX IF NOT EXISTS "pedidos_user_id_c7db7ff2" ON "pedidos" (
	"user_id"
);
COMMIT;
