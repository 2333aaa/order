/*
SQLyog Ultimate v12.3.1 (64 bit)
MySQL - 5.7.12-log : Database - order
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`order` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `order`;

/*Table structure for table `t_account` */

DROP TABLE IF EXISTS `Customer`;

CREATE TABLE `Customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30)  NOT NULL,
  `sex` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `is_member` boolean default false,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Member` */

DROP TABLE IF EXISTS `Member`;

CREATE TABLE `Member` (
  `member_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`member_id`),
  foreign key  (`customer_id`) references Customer(customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `MenuItems` */
CREATE TABLE `MenuItems` (
  `item_id` int NOT NULL AUTO_INCREMENT,
  `item_name` varchar(30) NOT NULL,
  `description` text default NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Order` */
CREATE TABLE `Order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  foreign key  (`customer_id`) references Customer(customer_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Order_detail` */
CREATE TABLE `orderDetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `order_date` datetime NOT NULL,
  `price` float NOT NULL,
  `amount` int NOT NULL,
  `item_id` int NOT NULL,
  `discount` float default NULL,
  `is_complete` boolean default false,
  PRIMARY KEY (`id`),
  foreign key  (`order_id`) references `Order`(order_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Employee` */
CREATE TABLE `Employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Role` */
CREATE TABLE `Role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Employee_Role` */
CREATE TABLE `Employee_Role` (
  `id`  int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL ,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`id`),
  foreign key  (`role_id`) references `Role`(role_id),
  foreign key  (`employee_id`) references `Employee`(employee_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Action` */
CREATE TABLE `Action` (
  `action_id` int NOT NULL AUTO_INCREMENT,
  `action_name` varchar(20) NOT NULL,
  PRIMARY KEY (`action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Role_Action` */
CREATE TABLE `Role_Action` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `action_id` int NOT NULL,
  PRIMARY KEY (`id`),
  foreign key  (`role_id`) references `Role`(role_id),
  foreign key  (`action_id`) references `Action`(action_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Coupon` */
CREATE TABLE `Coupon` (
  `coupon_id` int NOT NULL AUTO_INCREMENT,
  `quota` int default NULL,
  `discount` float NOT NULL,
  `take_count` int NOT NULL,
  `used_count` int NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Coupon_Member` */
CREATE TABLE `Coupon_Member` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  PRIMARY KEY (`id`),
  foreign key  (`member_id`) references `Member`(member_id),
  foreign key  (`coupon_id`) references `Coupon`(coupon_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `Coupon_Order` */
CREATE TABLE `Coupon_Order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `coupon_id` int NOT NULL,
  PRIMARY KEY (`id`),
  foreign key  (`order_id`) references `Order`(order_id),
  foreign key  (`coupon_id`) references `Coupon`(coupon_id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
