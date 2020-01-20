--
-- 创建数据库
--
create database tp_blog;


SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

SET
  AUTOCOMMIT = 0;

START TRANSACTION;

SET
  time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;

/*!40101 SET NAMES utf8mb4 */
;

--
-- 数据库： `tp_blog`
--
-- --------------------------------------------------------
--
-- 表的结构 `tp_admin`
--
CREATE TABLE `tp_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('1', '0') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `is_super` enum('1', '0') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_admin`
--
INSERT INTO
  `tp_admin` (
    `id`,
    `username`,
    `password`,
    `nickname`,
    `email`,
    `status`,
    `is_super`,
    `create_time`,
    `update_time`,
    `delete_time`
  )
VALUES
  (
    36,
    'muxi_k',
    '123123',
    'muuu',
    'lqjxm666@163.com',
    '1',
    '1',
    1579330027,
    1579331355,
    NULL
  );

-- --------------------------------------------------------
--
-- 表的结构 `tp_article`
--
CREATE TABLE `tp_article` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desc` text COLLATE utf8mb4_unicode_ci,
  `tags` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `is_top` enum('1', '0') COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_article`
--
INSERT INTO
  `tp_article` (
    `id`,
    `title`,
    `desc`,
    `tags`,
    `content`,
    `is_top`,
    `cate_id`,
    `create_time`,
    `update_time`,
    `delete_time`
  )
VALUES
  (
    1,
    'Hello Word',
    '好烦啊啊啊',
    'demo',
    '<p><span style=\"color: rgb(192, 0, 0);\">你好世界</span></p>',
    '1',
    NULL,
    1579428988,
    1579428988,
    NULL
  ),
  (
    2,
    '母猪产后护理',
    '啊啊啊啊啊啊啊啊啊啊',
    '啊',
    '<p>啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊</p>',
    '1',
    1,
    1579431688,
    1579431688,
    NULL
  ),
  (
    3,
    '山鬼',
    '是水水水闪闪发光',
    'linux',
    '<p>的方法广告</p>',
    '0',
    1,
    1579432414,
    1579432414,
    NULL
  );

-- --------------------------------------------------------
--
-- 表的结构 `tp_cate`
--
CREATE TABLE `tp_cate` (
  `id` int(11) NOT NULL,
  `catename` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- 转存表中的数据 `tp_cate`
--
INSERT INTO
  `tp_cate` (
    `id`,
    `catename`,
    `sort`,
    `create_time`,
    `update_time`,
    `delete_time`
  )
VALUES
  (1, 'laravel', 2, 1579350297, 1579413926, NULL),
  (
    2,
    'tp5.1',
    3,
    1579352305,
    1579415947,
    1579415947
  ),
  (3, 'Python', 1, 1579413986, 1579413986, NULL);

-- --------------------------------------------------------
--
-- 表的结构 `tp_coment`
--
CREATE TABLE `tp_coment` (
  `id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `article_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- 表的结构 `tp_member`
--
CREATE TABLE `tp_member` (
  `id` int(11) NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

-- --------------------------------------------------------
--
-- 表的结构 `tp_system`
--
CREATE TABLE `tp_system` (
  `id` int(11) NOT NULL,
  `webname` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `copyright` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;

--
-- 转储表的索引
--
--
-- 表的索引 `tp_admin`
--
ALTER TABLE
  `tp_admin`
ADD
  PRIMARY KEY (`id`);

--
-- 表的索引 `tp_article`
--
ALTER TABLE
  `tp_article`
ADD
  PRIMARY KEY (`id`);

--
-- 表的索引 `tp_cate`
--
ALTER TABLE
  `tp_cate`
ADD
  PRIMARY KEY (`id`);

--
-- 表的索引 `tp_coment`
--
ALTER TABLE
  `tp_coment`
ADD
  PRIMARY KEY (`id`);

--
-- 表的索引 `tp_member`
--
ALTER TABLE
  `tp_member`
ADD
  PRIMARY KEY (`id`);

--
-- 表的索引 `tp_system`
--
ALTER TABLE
  `tp_system`
ADD
  PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--
--
-- 使用表AUTO_INCREMENT `tp_admin`
--
ALTER TABLE
  `tp_admin`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 37;

--
-- 使用表AUTO_INCREMENT `tp_article`
--
ALTER TABLE
  `tp_article`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- 使用表AUTO_INCREMENT `tp_cate`
--
ALTER TABLE
  `tp_cate`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;

--
-- 使用表AUTO_INCREMENT `tp_coment`
--
ALTER TABLE
  `tp_coment`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `tp_system`
--
ALTER TABLE
  `tp_system`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;