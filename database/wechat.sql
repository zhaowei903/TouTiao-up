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

DROP TABLE IF EXISTS `wechat`;
CREATE TABLE IF NOT EXISTS `wechat` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `user_avada` LONGTEXT NOT NULL,
  `publish_time` varchar(255) NOT NULL,
  `publish_address` varchar(255) NOT NULL,
  `content` LONGTEXT NOT NULL,
  `img_urls` LONGTEXT NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `wechat` (`user_id`, `user_avada`, `publish_time`,`publish_address`,`content`,`img_urls`) VALUES
('寡人悲剧了','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643277542&di=75f95db501af1a2481d32ddb7884d536&imgtype=0&src=http%3A%2F%2Fimg02.sogoucdn.com%2Fapp%2Fa%2F200654%2F1503364838612915.jpeg','2018-09-02 09:40:01','凯通大厦','新的一天，依然很丧','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536642967964&di=99426a88e2f1bc54817027924f9b4156&imgtype=0&src=http%3A%2F%2Fimg1.jiemian.com%2Fjiemian%2Foriginal%2F20170619%2F149785681164347500_a580xH.jpg;https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643092337&di=702641244e6377481a937997e2cb0d35&imgtype=0&src=http%3A%2F%2Fresource.feng.com%2Fresource%2Fh061%2Fh72%2Fimg201704302125012.png;https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643105301&di=6862c06d734bca3ee4315354ba8e19b5&imgtype=0&src=http%3A%2F%2Fimg.cyol.com%2Fimg%2Fnews%2Fattachement%2Fjpeg%2Fsite2%2F20170816%2FIMG94659c88928f4528493872.jpeg;https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3552926315,2294971532&fm=26&gp=0.jpg'),
('寡人悲剧了','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643277542&di=75f95db501af1a2481d32ddb7884d536&imgtype=0&src=http%3A%2F%2Fimg02.sogoucdn.com%2Fapp%2Fa%2F200654%2F1503364838612915.jpeg','2018-09-03 20:40:01','凯通大厦','我以为我会哭，但是我饿了','https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536642967964&di=99426a88e2f1bc54817027924f9b4156&imgtype=0&src=http%3A%2F%2Fimg1.jiemian.com%2Fjiemian%2Foriginal%2F20170619%2F149785681164347500_a580xH.jpg;https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643092337&di=702641244e6377481a937997e2cb0d35&imgtype=0&src=http%3A%2F%2Fresource.feng.com%2Fresource%2Fh061%2Fh72%2Fimg201704302125012.png;https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1536643105301&di=6862c06d734bca3ee4315354ba8e19b5&imgtype=0&src=http%3A%2F%2Fimg.cyol.com%2Fimg%2Fnews%2Fattachement%2Fjpeg%2Fsite2%2F20170816%2FIMG94659c88928f4528493872.jpeg;https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3552926315,2294971532&fm=26&gp=0.jpg');


COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
