-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2020-02-17 12:42:45
-- 服务器版本： 8.0.19
-- PHP 版本： 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `tp_blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_admin`
--

CREATE TABLE `tp_admin` (
  `id` int NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_super` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `delete_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_admin`
--

INSERT INTO `tp_admin` (`id`, `username`, `password`, `nickname`, `email`, `status`, `is_super`, `create_time`, `update_time`, `delete_time`) VALUES
(36, 'muxi_k', '111', 'niubiaa', 'lqjxm666@163.com', '1', '1', 1579330027, 1581391894, NULL),
(37, 'admin', 'admin02', 'admin', '669150007@qq.com', '1', '0', 1579503251, 1579871782, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_article`
--

CREATE TABLE `tp_article` (
  `id` int NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `author` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `tags` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `click` int NOT NULL DEFAULT '0',
  `comm_num` int NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_top` enum('1','0') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `cate_id` int DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `delete_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_article`
--

INSERT INTO `tp_article` (`id`, `title`, `author`, `desc`, `tags`, `click`, `comm_num`, `content`, `is_top`, `cate_id`, `create_time`, `update_time`, `delete_time`) VALUES
(4, '母猪产后护理a', '李桥金', 'admin', '母猪', 58, 0, '<p>helloword<br/></p>', '1', 3, 1579527218, 1581258729, NULL),
(5, '欢迎来到Mu\'xi', '李桥金', 'aaaaaaaa', 'linux', 0, 0, '<p>aaaaaaaaaaaaaaaaaa</p>', '1', 1, 1579659674, 1579663090, 1579663090),
(6, '春', '', '盼望着，盼望着，东风来了，春天的脚步近了。\r\n\r\n一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。\r\n\r\n', '竹子请', 0, 0, '<p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">盼望着，盼望着，东风来了，春天的脚步近了。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">小草偷偷地从土里钻出来，嫩嫩的，绿绿的。园子里，田野里，瞧去，一大片一大片满是的。坐着，躺着，打两个滚，踢几脚球，赛几趟跑，捉几回迷藏。风轻悄悄的，草绵软软的。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">桃树、杏树、梨树，你不让我，我不让你，都开满了花赶趟儿。红的像火，粉的像霞，白的像雪。花里带着甜味儿；闭了眼，树上仿佛已经满是桃儿、杏儿、梨儿。花下成千成百的蜜蜂嗡嗡地闹着，大小的蝴蝶飞来飞去。野花遍地是：杂样儿，有名字的，没名字的，散在花丛里，像眼睛，像星星，还眨呀眨的。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">“吹面不寒杨柳风”，不错的，像母亲的手抚摸着你。风里带来些新翻的泥土的气息，混着青草味儿，还有各种花的香，都在微微润湿的空气里酝酿。鸟儿将巢安在<a href=\"https://www.baidu.com/s?wd=%E7%B9%81%E8%8A%B1%E5%AB%A9%E5%8F%B6&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\" style=\"color: rgb(63, 136, 191); text-decoration-line: none;\">繁花嫩叶</a>当中，高兴起来了，<a href=\"https://www.baidu.com/s?wd=%E5%91%BC%E6%9C%8B%E5%BC%95%E4%BC%B4&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\" style=\"color: rgb(63, 136, 191); text-decoration-line: none;\">呼朋引伴</a>地卖弄清脆的喉咙，唱出宛转的曲子，跟轻风流水应和着。牛背上牧童的短笛，这时候也成天嘹亮地响着。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">雨是最寻常的，一下就是三两天。可别恼。看，像牛毛，像花针，像细丝，密密地斜织着，人家屋顶上全笼着一层薄烟，树叶儿却绿得发亮，小草也青得逼你的眼。傍晚时候，上灯了，一点点黄晕的光，烘托出一片安静而和平的夜。在乡下，小路上，石桥边，有撑起伞慢慢走着的人；地里还有工作的农民，披着蓑戴着笠。他们的房屋，稀稀疏疏的在雨里静默着。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">天上风筝渐渐多了，地上孩子也多了。城里乡下，家家户户，老老小小，也赶趟儿似的，一个个都出来了。舒活舒活筋骨，抖擞抖擞精神，各做各的一份儿事去，“一年之计在于春”；刚起头儿，有的是工夫，有的是希望。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">春天像刚落地的娃娃，从头到脚都是新的，它生长着。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">春天像小姑娘，花枝招展的，笑着，走着。</p><p style=\"margin-top: 17px; margin-bottom: 17px; padding: 0px; line-height: 28px; color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">春天像健壮的青年，有铁一般的胳膊和腰脚，领着我们上前去。</p><p><br/></p>', '1', 4, 1579659812, 1581248949, 1581248949),
(7, '春', '李桥金', '　盼望着，盼望着，东风来了，春天的脚步近了。', '散文', 28, 1, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　盼望着，盼望着，东风来了，春天的脚步近了。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　一切都像刚睡醒的样子，欣欣然张开了眼。山朗润起来了，水涨起来了，太阳的脸红起来了。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　小草偷偷地从土地里钻出来，嫩嫩的，绿绿的。园子里，田野里，瞧去，一大片一大片满是的。坐着，躺着，打两个滚，踢几脚球，赛几趟跑，捉几回迷藏。风轻悄悄的，草软绵绵的。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　桃树，杏树，梨树，你不让我，我不让你，都开满了花赶趟儿。红的像火，粉的像霞，白的像雪。花里带着甜味；闭了眼，树上仿佛已经满是桃儿，杏儿，梨儿。花下成千成百的蜜蜂嗡嗡的闹着，大小的蝴蝶飞来飞去。野花遍地是：杂样儿，有名字的，没名字的，散在草丛里像眼睛像星星，还眨呀眨的。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　“吹面不寒杨柳风”，不错的，像母亲的手抚摸着你，风里带着些新翻的泥土的气息，混着青草味儿，还有各种花的香，都在微微润湿的空气里酝酿。鸟儿将巢安在</span><a href=\"https://www.baidu.com/s?wd=%E7%B9%81%E8%8A%B1%E5%AB%A9%E5%8F%B6&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">繁花嫩叶</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">当中，高兴起来了，</span><a href=\"https://www.baidu.com/s?wd=%E5%91%BC%E6%9C%8B%E5%BC%95%E4%BC%B4&tn=SE_PcZhidaonwhc_ngpagmjz&rsv_dl=gh_pc_zhidao\" target=\"_blank\" class=\"baidu-highlight\" style=\"color: rgb(63, 136, 191); text-decoration-line: none; font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; white-space: normal; background-color: rgb(255, 255, 255);\">呼朋引伴</a><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">的卖弄清脆的歌喉，唱出婉转的曲子，跟清风流水应和着。牛背上牧童的短笛，这时候也成天嘹亮的响着。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　雨是最寻常的，一下就是三两天。可别恼。看，像牛毛，像花针，像细丝，密密地斜织着，人家屋顶上全笼着一层薄烟。树叶却绿得发亮，小草也青得逼你的眼。傍晚时候，上灯了，一点点黄晕的光，烘托出一片安静而和平的夜。在乡下，小路上，石桥边，有撑着伞慢慢走着的人，地里还有工作的农民，披着蓑戴着笠。他们的房屋稀稀疏疏的，在雨里静默着。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　天上的风筝渐渐多了，地上的孩子也多了。城里乡下，家家户户，老老小小，也赶趟似的，一个个都出来了。舒活舒活筋骨，抖擞抖擞精神，各做各的一份事儿去。“一年之计在于春”，刚起头儿，有的是功夫，有的是希望。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　春天像刚落地的娃娃，从头到脚都是新的，它生长着。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　春天像小姑娘，花枝招展的，笑着走着。</span><br/><span style=\"color: rgb(51, 51, 51); font-family: &quot;PingFang SC&quot;, &quot;Lantinghei SC&quot;, &quot;Microsoft YaHei&quot;, arial, 宋体, sans-serif, tahoma; background-color: rgb(255, 255, 255);\">　　春天像健壮的青年，有铁一般的胳膊和腰脚，领着我们向前去。</span></p>', '1', 6, 1581259190, 1581386217, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_cate`
--

CREATE TABLE `tp_cate` (
  `id` int NOT NULL,
  `catename` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `delete_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_cate`
--

INSERT INTO `tp_cate` (`id`, `catename`, `sort`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 'laravel', 2, 1579350297, 1579663090, 1579663090),
(2, 'tp5.1', 3, 1579352305, 1579415947, 1579415947),
(3, 'Python', 2, 1579413986, 1581253122, NULL),
(4, '散文', 3, 1579660044, 1581248949, 1581248949),
(5, 'ThinkPHP', 1, 1581253112, 1581253112, NULL),
(6, '散文', 3, 1581258892, 1581258892, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_comment`
--

CREATE TABLE `tp_comment` (
  `id` int NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `article_id` int DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `delete_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_comment`
--

INSERT INTO `tp_comment` (`id`, `content`, `article_id`, `member_id`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 'demo', 4, 2, 1579925642, 1581387216, 1581387216),
(3, '6666666666666666666', 4, 2, 1579352305, 1581386980, 1581386980),
(4, '啊啊啊啊啊', 7, 2, 1581345452, 1581387210, 1581387210),
(5, '竹子去好看', 7, 7, 1581386217, 1581387178, 1581387178);

-- --------------------------------------------------------

--
-- 表的结构 `tp_member`
--

CREATE TABLE `tp_member` (
  `id` int NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `delete_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_member`
--

INSERT INTO `tp_member` (`id`, `username`, `password`, `nickname`, `email`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 'user', 'user', 'user', 'lqjxm666@163.com', 1579790292, 1579794008, 1579794008),
(2, 'admin', 'admin', 'user01', 'muxikf4@gmail.com', 1579794028, 1579838726, NULL),
(3, 'admin01', 'qwqw', 'qwqw', 'lqjxm666@163.com', 1579857597, 1579857597, NULL),
(4, 'aaa', 'aaa', 'aaa', 'aaa@qq.com', 1579857790, 1579857790, NULL),
(5, 'qqq', 'qqqqqq', 'lqjxm666', 'lqjxm666a@163.com', 1581321068, 1581321068, NULL),
(6, 'qqqa', 'qqqqqq', 'lqjxm666', 'lqjxm666a@163.coma', 1581321152, 1581321152, NULL),
(7, 'muxi_k', '123123', '123', 'muxi_k@163.com', 1581321169, 1581387178, 1581387178),
(8, 'muxi_ka', '123123a', 'aaa', 'amuxikf4@gmail.com', 1581321202, 1581321202, NULL),
(9, 'muxi_ks', 'aaa', 'asd', 'asd@aa.col', 1581321251, 1581321251, NULL),
(10, 'muxi_kss', 'aaa', 'asd', 'asd@aa.cols', 1581321567, 1581321567, NULL),
(11, 'muxi_ksss', 'aaa', 'asd', 'aasd@aa.cols', 1581321642, 1581321642, NULL),
(12, 'dfasdf', '121212', 'aaa', 'muxi_1k@163.com', 1581321700, 1581321700, NULL),
(13, 'dfasdfa', '121212', 'aaa', 'muxi_1k@163.coma', 1581321883, 1581321883, NULL),
(14, 'muxi_kaaaas', '123123', 'aaa', 'admin@a.com', 1581323295, 1581323295, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `tp_system`
--

CREATE TABLE `tp_system` (
  `id` int NOT NULL,
  `webname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` int DEFAULT NULL,
  `update_time` int DEFAULT NULL,
  `delete_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_system`
--

INSERT INTO `tp_system` (`id`, `webname`, `copyright`, `create_time`, `update_time`, `delete_time`) VALUES
(1, 'Mux', 'www.muxii.top', NULL, 1581253014, NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `tp_admin`
--
ALTER TABLE `tp_admin`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_article`
--
ALTER TABLE `tp_article`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_cate`
--
ALTER TABLE `tp_cate`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_comment`
--
ALTER TABLE `tp_comment`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_member`
--
ALTER TABLE `tp_member`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `tp_system`
--
ALTER TABLE `tp_system`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `tp_admin`
--
ALTER TABLE `tp_admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- 使用表AUTO_INCREMENT `tp_article`
--
ALTER TABLE `tp_article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `tp_cate`
--
ALTER TABLE `tp_cate`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `tp_comment`
--
ALTER TABLE `tp_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `tp_member`
--
ALTER TABLE `tp_member`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- 使用表AUTO_INCREMENT `tp_system`
--
ALTER TABLE `tp_system`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
