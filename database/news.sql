-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 2018-09-04 02:44:57
-- 服务器版本： 5.7.19
-- PHP Version: 7.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `cid` int(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `dsc` TEXT(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `create_time` varchar(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `news` (`cid`, `title`, `dsc`,`image`,`url`,`create_time`,`content`) VALUES
( 1, '航空母舰发射成功1-1','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 1, '航空母舰发射成功1-2','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 1, '航空母舰发射成功1-3','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 1, '航空母舰发射成功1-4','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 1, '航空母舰发射成功1-5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 2, '航空母舰发射成功2','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 2, '航空母舰发射成功2','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 2, '航空母舰发射成功2','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 2, '航空母舰发射成功2','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 2, '航空母舰发射成功2','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 3, '航空母舰发射成功3','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 3, '航空母舰发射成功3','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 3, '航空母舰发射成功3','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 3, '航空母舰发射成功3','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 3, '航空母舰发射成功3','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 4, '航空母舰发射成功4','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 4, '航空母舰发射成功4','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 4, '航空母舰发射成功4','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 4, '航空母舰发射成功4','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 4, '航空母舰发射成功4','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 5, '航空母舰发射成功5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 5, '航空母舰发射成功5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 5, '航空母舰发射成功5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 5, '航空母舰发射成功5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 5, '航空母舰发射成功5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>'),
( 5, '航空母舰发射成功5','发射成功','http://..','http://..','2018-09-02 20:40:01','<ul><li>1</ul>');

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
