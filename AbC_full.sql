/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `abc_full` /*!40100 DEFAULT CHARACTER SET utf16 COLLATE utf16_general_ci */;
USE `abc_full`;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `content` varchar(1024) NOT NULL DEFAULT '',
  `rating_id` int(11) NOT NULL DEFAULT 0,
  `customer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comment_product` (`product_id`),
  KEY `FK_comment_rating` (`rating_id`),
  KEY `FK_comment_customer` (`customer_id`),
  CONSTRAINT `FK_comment_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comment_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comment_rating` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `comment` (`id`, `product_id`, `content`, `rating_id`, `customer_id`) VALUES
	(1, 1, 'The waist band has two subtle rubberized bands that should help shirts stay tucked in, something I struggle with. My only question is on a shadow, narrow side pocket next to the right front pocket. I\'m not sure what it might be useful for, maybe a ball marker.', 5, NULL),
	(2, 2, 'For the past two weeks since I\'ve had the phone, it has operated like brand-new. I\'ll provide an update throughout the next weeks. I got the phone along with a cable and charger.', 5, 1),
	(4, 7, 'It has not only features a premium aesthetic and ergonomic design, but also utilizes higher-quality materials and boasts a more efficient after-sales service team.It has certifications guarantee many years of enjoying the chair\'s ergonomic comfort.', 4, NULL),
	(5, 7, 'fter just an hour of sitting, the cushion feels flat and offers no support. I purchased this chair hoping for a comfortable work-from-home solution, but it’s more like sitting on a plank. The backrest is too rigid and doesn’t provide the promised ergonomic support.', 2, 6),
	(6, 4, 'The plastic components feel somewhat cheap. The base is sturdy enough, but the jar and lid are prone to scratching and staining.', 3, 8),
	(7, 6, 'Sweetness initially on the first sip, it’s like a large dose of artificial apple sweetener. The melon comes through from the nose to the palate. The alcohol hotness comes forth in a sudden wave and the overall mouth feel is thin, in fact very thin.', 5, 1),
	(8, 8, 'During the book, nothing really rung untrue. There are plot devices, you recognize them for what it is and Rothfuss doesn\'t insult your intelligence. ', 3, 11),
	(10, 8, 'The majority of the focus on characters and set-up, very little forward movement in the plot, a well-drawn world with cultures and three-dimensional people.', 5, 1),
	(11, 3, 'The build quality is decent, though it’s more plastic than metal, which gives it a slightly less premium feel. The screen is vibrant and clear, but the bezels are a bit thicker than I expected.', 4, 2),
	(12, 3, 'this cellphone is a reasonable choice for everyday use. It’s reliable for basic tasks and has a good design, but there are areas where it could improve, especially in performance under load and camera quality in low light.', 3, NULL);

CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `address` varchar(60) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `password` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `phone_number` (`phone_number`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `customer` (`id`, `first_name`, `last_name`, `email`, `address`, `phone_number`, `last_login`, `password`) VALUES
	(1, 'Thor', 'Buncom', 'tbuncom0@cafepress.com', '7403 Village Court', '404-573-7766', '2023-12-13 13:35:32', 'rR8$f`d*GN'),
	(2, 'Osmund', 'Reyson', 'oreyson1@deliciousdays.com', '2 Dryden Plaza', '636-175-2237', '2024-03-13 19:43:56', 'bF5"iDNCtEr'),
	(3, 'Brock', 'Ryam', 'bryam2@craigslist.org', '9199 Cottonwood Parkway', '232-198-5681', '2023-08-13 13:52:43', 'uS2|Y9almW'),
	(4, 'Jillana', 'Canning', 'jcanning3@fema.gov', '8382 Laurel Park', '130-403-2218', '2023-09-04 21:47:34', 'aT5)GLzQ`y(o'),
	(5, 'Davida', 'Oglesbee', 'doglesbee4@sakura.ne.jp', '77141 Park Meadow Park', '515-945-0590', '2023-10-16 05:33:09', 'lE6},qN!a!G'),
	(6, 'Tammara', 'Bonnesen', 'tbonnesen5@diigo.com', '840 Fuller Alley', '496-316-6816', '2023-07-12 16:25:47', 'pN2~p&`?7g(#T)m'),
	(7, 'Yard', 'Esser', 'yesser6@squarespace.com', '308 Acker Junction', '986-670-9830', '2023-07-19 13:40:53', 'iC5_2!kKlWs*l'),
	(8, 'Emma', 'Bortoletti', 'ebortoletti7@toplist.cz', '1 Village Green Alley', '789-155-9808', '2023-07-13 09:53:38', 'qT0?y?Lv'),
	(9, 'Tallia', 'Bloschke', 'tbloschke8@wiley.com', '12 Grasskamp Drive', '707-222-6943', '2024-05-27 03:37:30', 'gF6*p=KRD$H}7QD&'),
	(10, 'Junette', 'D\'Alessandro', 'jdalessandro9@topsy.com', '240 Talisman Crossing', '702-453-4829', '2023-09-11 00:54:20', 'gN8|fJl5'),
	(11, 'Phyllis', 'Blasetti', 'pblasettia@hud.gov', '7891 Bultman Road', '757-665-1529', '2024-02-13 08:09:11', 'uR9.i#1_r*'),
	(12, 'Peria', 'Lester', 'plesterb@yellowbook.com', '653 Golf Trail', '909-345-9097', '2023-06-30 11:48:22', 'vS8&.WxSdkvma'),
	(13, 'Hi', 'Doding', 'hdodingc@accuweather.com', '3603 Eliot Hill', '781-508-9280', '2023-07-01 20:42:08', 'vZ1&rKk)');

CREATE TABLE IF NOT EXISTS `items_by_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quatity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_items_by_order_order` (`order_id`),
  KEY `FK_items_by_order_product` (`product_id`),
  CONSTRAINT `FK_items_by_order_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_items_by_order_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `items_by_order` (`ID`, `order_id`, `product_id`, `quatity`, `unit_price`) VALUES
	(1, 1, 1, 2, 10.000000),
	(2, 1, 10, 1, 20.000000),
	(3, 2, 4, 1, 200.000000),
	(4, 3, 8, 2, 15.000000),
	(5, 4, 9, 3, 6.000000),
	(6, 5, 2, 1, 1500.000000),
	(7, 6, 6, 5, 800.000000),
	(8, 7, 3, 2, 1300.000000),
	(9, 8, 5, 2, 800.000000),
	(10, 9, 7, 3, 25.000000),
	(11, 10, 7, 1, 25.000000),
	(12, 11, 7, 3, 15.000000),
	(13, 11, 4, 2, 150.000000),
	(14, 12, 2, 1, 1300.000000),
	(15, 12, 3, 1, 980.000000),
	(16, 11, 10, 1, 35.000000);

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` decimal(12,2) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL,
  `status_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_customer` (`customer_id`),
  KEY `FK_order_order_status` (`status_id`),
  KEY `order_date` (`order_date`),
  CONSTRAINT `FK_order_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_order_order_status` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `order` (`id`, `total`, `customer_id`, `order_date`, `status_id`) VALUES
	(1, 0.00, 1, '2024-04-09 13:08:22', 3),
	(2, 0.00, 2, '2024-05-18 17:18:22', 4),
	(3, 0.00, 8, '2024-07-31 21:28:22', 2),
	(4, 0.00, 4, '2024-04-15 01:38:22', 3),
	(5, 0.00, 9, '2024-11-11 05:09:22', 1),
	(6, 0.00, 10, '2024-01-24 09:19:22', 4),
	(7, 0.00, 5, '2024-03-06 10:29:22', 2),
	(8, 0.00, 6, '2024-05-20 13:39:22', 3),
	(9, 0.00, 7, '2024-07-24 16:00:22', 2),
	(10, 0.00, 3, '2024-09-19 19:10:22', 4),
	(11, 0.00, 9, '2024-06-29 17:10:37', 1),
	(12, 0.00, 12, '2024-06-29 17:12:15', 1);

CREATE TABLE IF NOT EXISTS `order_status` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `order_status` (`id`, `name`) VALUES
	(1, 'On Stock'),
	(2, 'Packing'),
	(3, 'On Shipping'),
	(4, 'Delivered'),
	(5, 'Returned');

CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_product_supplier` (`supplier_id`),
  KEY `FK_product_product_category` (`category_id`),
  CONSTRAINT `FK_product_product_category` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_product_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `product` (`id`, `supplier_id`, `category_id`, `name`, `price`, `description`) VALUES
	(1, 1, 1, 'short pants', 10.00, 'ready for fun on summer'),
	(2, 10, 3, 'Iphone 18', 1500.00, 'Apple\'s last iphone model'),
	(3, 3, 3, 'Moto Razr', 1300.00, 'Foldable motorola phone'),
	(4, 4, 4, 'Blender', 200.00, 'Blender of 400W, Durable. Blend almost all type of food'),
	(5, 5, 3, 'Industrial phone', 800.00, 'Mobile phone with industrial case ang glass for better protection'),
	(6, 6, 6, 'Jameson Whiskey', 20.00, 'The best irish Whiskey'),
	(7, 7, 7, 'Chair', 25.00, 'Triagular chair for m small spaces'),
	(8, 2, 2, 'The wise man\'s fear', 15.00, 'The continuing of story of Kvothe'),
	(9, 8, 9, 'Aspirinin', 6.00, 'The mos traditional german painkiller'),
	(10, 1, 1, 'Jacket', 20.00, 'Proctect yourself from coldest winter with this beatiful Jacket');

CREATE TABLE IF NOT EXISTS `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `product_category` (`id`, `name`) VALUES
	(1, 'Clothing'),
	(2, 'Books'),
	(3, 'Mobile phones'),
	(4, 'Kitchen ware'),
	(5, 'Tools'),
	(6, 'Beverages'),
	(7, 'Household furniture'),
	(8, 'Home appliances'),
	(9, 'Heath'),
	(10, 'Hiking and camping');

CREATE TABLE IF NOT EXISTS `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `path` varchar(256) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_product_image_product` (`product_id`),
  CONSTRAINT `FK_product_image_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `product_image` (`id`, `product_id`, `path`) VALUES
	(1, 1, '/m.media-amazon.com/images/I/81xR5DygQiL._AC_SX679_.jpg'),
	(2, 1, '/m.media-amazon.com/images/I/92ds6FbgQjn._fe_tX780_.jpg'),
	(3, 2, '/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(4, 2, '/images/G/01/apparel/rcxgs/tfielet._CBs48f33s69s11s0_.gif'),
	(5, 3, '/m.media-amazon.com/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(6, 3, '/m.media-Mamazon.com/images/G/01/apparel/rcxgs/tile._5f4wfwrdwq3erq_.gif'),
	(7, 4, '/m.media-Mamazon.com/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(8, 4, '/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(9, 5, '/m.media-amazon.com/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(10, 5, '/m.media-amazon.com/images/I/71XwZjeGwPL.__AC_SX300_SY300_QL70_FMwebp_.jpg'),
	(11, 6, '/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(12, 6, '/img/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(13, 7, '/s3/amazon.com/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(14, 7, '/mamazon.com/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(15, 8, '/book-amazon.com/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(16, 8, '/images/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(17, 9, '/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(18, 9, '/bilden/G/01/apparel/rcxgs/tile._CB483369110_.gif'),
	(19, 10, '/media/I/61vr8A3wW6L._AC_SX679_.jpg'),
	(20, 10, '/images/I/61vr8A3wW6L._AC_SX679_.jpg');

CREATE TABLE IF NOT EXISTS `rating` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `rating` (`id`, `name`, `value`) VALUES
	(1, 'imperfect', 1),
	(2, 'Bad', 2),
	(3, 'Average', 3),
	(4, 'Good', 4),
	(5, 'Excellent', 5);

CREATE TABLE IF NOT EXISTS `returned_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_by_order_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reason` varchar(256) DEFAULT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_returned_item_items_by_order` (`item_by_order_id`),
  CONSTRAINT `FK_returned_item_items_by_order` FOREIGN KEY (`item_by_order_id`) REFERENCES `items_by_order` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `returned_item` (`id`, `item_by_order_id`, `quantity`, `reason`, `date`) VALUES
	(1, 12, 1, 'It has a broken leg', '2024-06-30 22:38:57'),
	(2, 14, 1, 'the jars lid doesn\'t fit.', '2024-06-30 22:40:24'),
	(3, 15, 1, 'It was purchased by error.', '2024-06-30 22:40:26');

CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  `email` varchar(60) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf16 COLLATE=utf16_general_ci;

INSERT INTO `supplier` (`id`, `name`, `email`, `phone`, `address`) VALUES
	(1, 'H and M', 'commercial@handm.email', '4915751628512', 'Karl-Wichmann-Str. 13a, Ost Jeremiashagen, ST 47549'),
	(2, 'Penguin', 'books@penguin.com', '4915503173420', 'Montanusstr. 78a, Alt Vivien, TH 70719'),
	(3, 'Motorola', 'sales@motorola.com', '4915561556157', 'Hallesche Str. 60b, Neu Hanna, HH 85646'),
	(4, 'Kitchen aid', 'trade@ka.com', '491635556416', 'Zimmer 877 Marc-Chagall-Str. 771, Neu Connorgrün, BE 17293'),
	(5, 'cat', 'business@caterpillar.com', '09154 54 92 80 ', 'Carl-Maria-von-Weber-Str. 33c, Ost Manuel, BB 00151'),
	(6, 'Diaego', 'salesandtrade@diaego.com', '03381 47 45 17 ', '03381 47 45 17 '),
	(7, 'Ikea', 'data@ikea.com', '04851 38 54 27 ', 'Apt. 545 Scharnhorststr. 9, Schön Cemfeld, HH 00250'),
	(8, 'Bayer', 'verkauf@bayer.com', '06861 67 96 20 ', 'Apt. 761 Stefan-Zweig-Str. 78c, Klein Mattisland, HE 83370'),
	(9, '14-8000', 'store@148000.com', '030 76 79 07 ', 'Apt. 504 Ahornweg 126, Groß Elina, SN 72618'),
	(10, 'Apple', 'sales@apple.com', '08807 19 30 39 ', 'Zimmer 916 Hans-Arp-Str. 74b, Nord Jasmina, NW 99273');

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateOrderTotalPrice`(
	IN `order_id` INT
)
BEGIN
	UPDATE `order` o
	SET total = (
		SELECT SUM(quatity * unit_price)
		FROM items_by_order ibo
		WHERE ibo.order_id =order_id
	)
	WHERE o.id = order_id;
END//
DELIMITER ;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `items_by_order_after_delete` AFTER DELETE ON `items_by_order` FOR EACH ROW BEGIN
	CALL UpdateOrderTotalPrice(OLD.order_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `items_by_order_after_insert` AFTER INSERT ON `items_by_order` FOR EACH ROW BEGIN
	CALL UpdateOrderTotalPrice(NEW.order_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE DEFINER=`root`@`localhost` TRIGGER `items_by_order_after_update` AFTER UPDATE ON `items_by_order` FOR EACH ROW BEGIN
	CALL UpdateOrderTotalPrice(NEW.order_id);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
