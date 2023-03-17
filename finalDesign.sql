/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.5.40 : Database - coursedesign
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`coursedesign` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `coursedesign`;

/*Table structure for table `feedbacks` */

DROP TABLE IF EXISTS `feedbacks`;

CREATE TABLE `feedbacks` (
                             `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
                             `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
                             `pay_id` varchar(50) DEFAULT NULL COMMENT '支付ID',
                             `value` varchar(500) DEFAULT NULL COMMENT '文字信息',
                             `feedbacks_time` varchar(30) DEFAULT NULL COMMENT '时间',
                             `feedbacks_status` int(11) DEFAULT NULL COMMENT '类型（1投诉、0建议、-1反馈）',
                             `orders_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
                             `feedbacks_id` varchar(50) NOT NULL COMMENT '投诉、建议、反馈信息ID（主键、随机码）',
                             `solve_status` int(11) DEFAULT NULL COMMENT '管理员处理状态（1已处理、0未处理、-1不予处理）',
                             `solve_value` varchar(500) DEFAULT NULL COMMENT '管理员处理结果信息',
                             `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
                             PRIMARY KEY (`feedbacks_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `feedbacks` */

/*Table structure for table `goods` */

DROP TABLE IF EXISTS `goods`;

CREATE TABLE `goods` (
                         `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
                         `goods_id` varchar(50) NOT NULL COMMENT '商品ID（主键，随机码）',
                         `dscrip` varchar(500) DEFAULT NULL COMMENT '商品介绍信息',
                         `price` double DEFAULT NULL COMMENT '商品价格',
                         `goods_level` double DEFAULT NULL COMMENT '商品新旧程度',
                         `up_status` int(11) DEFAULT NULL COMMENT '上架状态',
                         `use_status` int(11) DEFAULT NULL COMMENT '可用状态',
                         `hot` double DEFAULT NULL COMMENT '热度信息',
                         `name` varchar(50) DEFAULT NULL COMMENT '商品名称',
                         PRIMARY KEY (`goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goods` */

/*Table structure for table `goodsurl` */

DROP TABLE IF EXISTS `goodsurl`;

CREATE TABLE `goodsurl` (
                            `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
                            `img_url` varchar(200) DEFAULT NULL COMMENT '商品图片URL信息',
                            `img_id` varchar(50) NOT NULL,
                            PRIMARY KEY (`img_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `goodsurl` */


/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
                          `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
                          `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
                          `orders_status` int(11) DEFAULT NULL COMMENT '订单状态（1已完成、0未完成、-1有异议）',
                          `price` double DEFAULT NULL COMMENT '商品价格',
                          `pay_id` varchar(50) DEFAULT NULL COMMENT '支付ID',
                          `orders_id` varchar(50) NOT NULL COMMENT '订单ID（主键、随机码）',
                          `admin_status` int(11) DEFAULT NULL COMMENT '处理状态（1已处理、0未处理）',
                          `time` varchar(30) DEFAULT NULL,
                          PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `ordersback` */

DROP TABLE IF EXISTS `ordersback`;

CREATE TABLE `ordersback` (
                              `orders_id` varchar(50) DEFAULT NULL COMMENT '订单ID',
                              `feedbacks_id` varchar(50) DEFAULT NULL COMMENT '投诉、建议、反馈信息ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ordersback` */

/*Table structure for table `payments` */

DROP TABLE IF EXISTS `payments`;

CREATE TABLE `payments` (
                            `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
                            `pay_id` varchar(50) NOT NULL COMMENT '支付ID（主键，随机码）',
                            `price` double DEFAULT NULL COMMENT '费用',
                            `status` int(11) DEFAULT NULL COMMENT '费用状态（已经转给卖家1，费用在平台0，已经退回给买家-1）',
                            `pay_time` varchar(50) DEFAULT NULL COMMENT '支付时间',
                            `goods_id` varchar(50) DEFAULT NULL COMMENT '商品ID',
                            `pay_status` int(11) DEFAULT NULL COMMENT '支付状态（已完成1、未完成0、有异议-1）',
                            PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payments` */

/*Table structure for table `shopcar` */

DROP TABLE IF EXISTS `shopcar`;

CREATE TABLE `shopcar` (
                           `user_id` varchar(50) NOT NULL,
                           `goods_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `shopcar` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
                         `user_id` varchar(50) NOT NULL COMMENT '用户ID，主键（随机码）',
                         `name` varchar(50) DEFAULT NULL COMMENT '用户昵称',
                         `username` varchar(50) DEFAULT NULL COMMENT '用户名',
                         `password` varchar(50) DEFAULT NULL COMMENT '密码',
                         `sex` int(11) DEFAULT NULL COMMENT '性别（1男，2女）',
                         `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
                         `status` int(11) DEFAULT NULL COMMENT '账户启用状态',
                         `admin` int(11) DEFAULT NULL COMMENT '是否管理员账户',
                         PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE TABLE messages (
                          message_id INT NOT NULL AUTO_INCREMENT,
                          user_id VARCHAR(50) NOT NULL,
                          message TEXT NOT NULL,
                          goods_id VARCHAR(50) NOT NULL,
                          PRIMARY KEY (message_id),
                          FOREIGN KEY (user_id) REFERENCES users(user_id),
                          FOREIGN KEY (goods_id) REFERENCES goods(goods_id)
);

