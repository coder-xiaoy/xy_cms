/*
 Navicat Premium Data Transfer

 Source Server         : docker
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : 192.168.147.115:3306
 Source Schema         : test

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 14/07/2023 19:45:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encrypt` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_time` int(10) NOT NULL DEFAULT 0,
  `creat_time` int(10) NOT NULL,
  `is_lock` smallint(2) NOT NULL DEFAULT 0,
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logins` int(10) NOT NULL DEFAULT 0,
  `group_id` smallint(4) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'admin', '89444e89c4696e600a146df9489e167e', 'lr24vx2', 1636439723, 1413949646, 0, '223.12.183.251', 174, 1);
INSERT INTO `admin` VALUES (2, 'admin', '89444e89c4696e600a146df9489e167e', 'lr24vx2', 1636439723, 1413949646, 0, '223.12.183.251', 174, 1);

-- ----------------------------
-- Table structure for admin_group
-- ----------------------------
DROP TABLE IF EXISTS `admin_group`;
CREATE TABLE `admin_group`  (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of admin_group
-- ----------------------------
INSERT INTO `admin_group` VALUES (1, '超级管理员');

-- ----------------------------
-- Table structure for block
-- ----------------------------
DROP TABLE IF EXISTS `block`;
CREATE TABLE `block`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tag` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of block
-- ----------------------------
INSERT INTO `block` VALUES (1, '首页关于我们', 'pageabout', '<p>\r\n	<span style=\"line-height:1.5;color:#E53333;\">&nbsp; &nbsp; 山西沁丰园农业科技有限公司，成立于2013年，现注册资金3000万元，公司主要经营玉米、高粱种子， 拥有较强的技术实力，固定职工17人，其中高级技术职务人员2人，研究生4人，可以满足农作物育种、引种、生产、加工、质量检验各项经营活动。</span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;color:#E53333;\">&nbsp; &nbsp; &nbsp;</span><span style=\"line-height:1.5;color:#E53333;\">公司下设育种事业部、基地生产部、市场营销部等三个非独立性经营实体，设有财务科、办公室两个管理服务部门。</span> \r\n</p>');
INSERT INTO `block` VALUES (11, '顶部电话35053', 'toptel', '<img src=\"/uploadfile/image/20191128/20191128230514_88368.png\" alt=\"\" />');
INSERT INTO `block` VALUES (12, '首页联系我们右侧图片150149', 'pagecontactimg', '<img src=\"/uploadfile/image/20170527/20170527150353_81625.jpg\" width=\"150\" height=\"149\" alt=\"\" />');
INSERT INTO `block` VALUES (13, '联系我们', 'contact', '<p>\r\n	<span style=\"color:#000000;line-height:2;font-size:16px;font-family:NSimSun;\"></span><span style=\"color:#000000;line-height:2.5;font-size:16px;font-family:SimSun;\">山西沁丰园农业科技有限公司&nbsp;</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#000000;line-height:2.5;font-size:16px;font-family:SimSun;\">电话：</span><span style=\"color:#000000;line-height:2.5;font-family:SimSun;font-size:18px;\"><b>400-800-4333</b></span>\r\n</p>\r\n<span style=\"color:#000000;line-height:2.5;font-size:16px;font-family:SimSun;\">地址：山西省太原市小店区北格</span> \r\n<p>\r\n	<span style=\"line-height:2;font-family:SimSun;font-size:18px;\"></span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"color:#555555;font-family:SimSun;background-color:#FFFFFF;\">\r\n	<br />\r\n</p>');
INSERT INTO `block` VALUES (10, '首页关于我们图片180240', 'pageaboutimg', '<img src=\"/uploadfile/image/20180731/20180731152839_20501.png\" width=\"240\" height=\"180\" alt=\"\" />');
INSERT INTO `block` VALUES (14, '底部二维码8080', 'qrcode', '<img src=\"/uploadfile/image/20180801/20180801102313_58988.jpg\" width=\"81\" height=\"80\" alt=\"\" />');
INSERT INTO `block` VALUES (15, '底部版权', 'copyright', '<p style=\"color:#555555;font-family:SimSun;background-color:#388F33;\">\r\n	<span style=\"color:#000000;line-height:2;font-size:16px;\"><span style=\"font-size:16px;\">版权所有：山西沁丰园农业科技有限公司</span><span style=\"font-family:宋体;font-size:16px;\"><span style=\"font-size:16px;\">&nbsp;</span></span></span><span style=\"color:#000000;line-height:2;font-size:16px;\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span><span style=\"color:#000000;line-height:2;font-size:16px;\"><span style=\"font-size:16px;\">联系电话：</span><span style=\"font-size:18px;\">400-800-4333</span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:SimSun;background-color:#388F33;\">\r\n	<span><span style=\"color:#000000;line-height:2;\"><span style=\"font-size:16px;\"><span style=\"font-size:16px;\">地 &nbsp; &nbsp;址：山西省<span style=\"font-family:SimSun;font-size:16px;\">太原市小店区北格</span></span></span><span style=\"font-size:16px;\">&nbsp;</span><span style=\"font-size:16px;\"><span style=\"font-size:16px;\">&nbsp; &nbsp; &nbsp;&nbsp;</span></span></span></span> \r\n</p>\r\n<p style=\"color:#555555;font-family:SimSun;background-color:#388F33;\">\r\n	<span><span style=\"color:#000000;line-height:2;\"><span style=\"font-size:16px;\"><span style=\"font-size:16px;\">备 案 号：<a href=\"https://beian.miit.gov.cn/\" target=\"_blank\"><span style=\"color:#000000;\">晋ICP备18008392号</span></a></span></span></span><span style=\"color:#000000;line-height:2;font-size:16px;\"><a href=\"https://beian.miit.gov.cn/\" target=\"_blank\"><span style=\"color:#000000;\">&nbsp;</span></a><span style=\"color:#000000;\">&nbsp;</span></span></span> \r\n</p>');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `model_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `cat_name` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cat_dir` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thumb` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_meshow` tinyint(1) UNSIGNED NULL DEFAULT 0,
  `is_target` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_html` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_link` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `template_cate` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_list` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `template_show` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seo_title` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seo_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `seo_des` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `power` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `url_list` int(4) UNSIGNED NOT NULL,
  `url_show` int(4) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'single', 1, 1, 0, '关于我们', 'abouts', '', 'index.php?m=content&c=index&f=lists&catid=1', 1, 1, 1, 0, 0, 0, 'category_single.html', 'list_single.html', 'show_news.html', '', '', '', 'NULL', 1, 2);
INSERT INTO `category` VALUES (40, 'news', 0, 2, 1, '新闻中心', 'xw', '', 'index.php?m=content&c=index&f=lists&catid=40', 2, 1, 1, 0, 0, 0, 'category_news.html', 'list_news.html', 'show_news.html', '', '', '', 'NULL', 1, 2);
INSERT INTO `category` VALUES (3, 'product', 0, 3, 40, '产品展示', 'products', '', 'index.php?m=content&c=index&f=lists&catid=3', 3, 1, 1, 0, 0, 0, 'category_product.html', 'list_product.html', 'show_product.html', '', '', '', 'NULL', 1, 2);
INSERT INTO `category` VALUES (34, 'single', 0, 1, 0, '留言反馈', '123123', '', 'index.php?m=form&c=lists&formid=7', 4, 1, 1, 0, 0, 1, 'category_single.html', 'list_single.html', 'show_single.html', '', '', '', 'NULL', 1, 2);
INSERT INTO `category` VALUES (28, 'product', 0, 3, 0, '基地风采', 'download', '', 'index.php?m=content&c=index&f=lists&catid=28', 5, 1, 1, 0, 0, 0, 'category_product.html', 'list_product.html', 'show_product.html', '', '', '', 'NULL', 1, 2);
INSERT INTO `category` VALUES (33, 'single', 0, 1, 0, '联系我们', '12311', '', 'index.php?m=content&c=index&f=lists&catid=33', 6, 1, 1, 0, 0, 0, 'category_single.html', 'list_single.html', 'show_single.html', '', '', '', 'NULL', 1, 2);
INSERT INTO `category` VALUES (59, '产品模型', 0, 3, 0, '123', '123', '', '', 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', 0, 0);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `config_array` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `config_tag` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES (1, '{\"apply\":\"www.sxqfyny.com\",\"caching\":\"false\",\"cookie\":\"123\",\"copyright\":\"www.sxqfyny.com\",\"createhtml\":\"1\",\"description\":\"山西沁丰园农业科技有限公司,沁丰园农业,佳昌689,F3588,晋单62,脊玉809,Q100,LY156,H717,金育328，玉米种子哪家好,玉米种子批发,山西玉米种子哪种好,玉米种子\",\"keywords\":\"山西沁丰园农业科技有限公司,沁丰园农业,佳昌689,F3588,鑫丰盛966,晋单62,脊玉809,Q100,LY156,H717,金育328，玉米种子哪家好,玉米种子批发,山西玉米种子哪种好,玉米种子  \",\"logourl\":\"123\",\"sitename\":\"123\",\"siteurl\":\"123\",\"template\":\"0\",\"title\":\"山西沁丰园农业科技有限公司|沁丰园农业|佳昌689|F3588|鑫丰盛966|晋单62|脊玉809|Q100|LY156|H717|金育328|山西玉米种子|玉米种子批发\"}', 'config');
INSERT INTO `config` VALUES (2, 'array (\n  \'master\' => \'管理员\',\n  \'email\' => \'service@senfeikeji.com\',\n  \'contact\' => \'管理员\',\n  \'telephone\' => NULL,\n  \'fax\' => NULL,\n  \'mobilephone\' => NULL,\n  \'address\' => NULL,\n)', 'contact');
INSERT INTO `config` VALUES (3, 'array (  \'mailobject\' => \'1\',  \'mailserver\' => \'smtp.163.com\',  \'mailport\' => \'25\',  \'password\' => \'123456\',  \'mailadd\' => \'admin@163.com\',  \'username\' => \'admin@163.com\',)', 'email');
INSERT INTO `config` VALUES (4, 'array (\n  \'isopen\' => \'1\',\n  \'imagesize\' => \'20480\',\n  \'imageallowed\' => \'gif,jpg,jpeg,png\',\n  \'filesize\' => \'20480\',\n  \'fileallowed\' => \'rar,zip,doc\',\n  \'watermark\' => \'100\',\n  \'pos\' => \'9\',\n  \'font\' => \'5\',\n  \'width\' => \'300\',\n  \'color\' => \'#FF0000\',\n  \'text\' => \'senfeikeji.com\',\n  \'image\' => \'uploadfile/sfcms.png\',\n)', 'upload');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content`  (
  `contentid` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `catid` tinyint(5) UNSIGNED NOT NULL DEFAULT 0,
  `title` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thumb` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keywords` char(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` char(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `commend` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `url` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `userid` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `username` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hits` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `sort` int(8) UNSIGNED NOT NULL DEFAULT 0,
  `style` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`contentid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES (142, 28, '基地风采', 'uploadfile/image/20181025/201810251049350.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=142', 1, 'admin', 1540435387, 1540435765, 114, 142, '');
INSERT INTO `content` VALUES (146, 28, '基地风采', 'uploadfile/image/20181025/201810251050260.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=146', 1, 'admin', 1540435844, 1540435809, 140, 146, '');
INSERT INTO `content` VALUES (122, 1, '关于我们', '', '', '', 0, 'index.php?m=content&c=index&f=lists&catid=1', 1, '', 1502699964, 1632033534, 0, 122, '');
INSERT INTO `content` VALUES (121, 33, '联系我们', '', '', '', 0, 'index.php?m=content&c=index&f=lists&catid=33', 1, '', 1502530098, 1632049181, 0, 121, '');
INSERT INTO `content` VALUES (139, 40, '脊玉809在山西创高产奇迹', '', '', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=139', 1, 'admin', 1540172639, 1540258130, 689, 139, '');
INSERT INTO `content` VALUES (137, 28, '基地风采', 'uploadfile/image/20181009/201810090114270.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=137', 1, 'admin', 1536552673, 1539062675, 173, 137, '');
INSERT INTO `content` VALUES (138, 40, '试验田筛选出18个后续品种', 'uploadfile/image/20181009/201810091243060.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=138', 1, 'admin', 1539060649, 1539061602, 295, 138, 'c6 tb');
INSERT INTO `content` VALUES (134, 28, '基地风采', 'uploadfile/image/20180801/201808011018460.png', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=134', 1, 'admin', 1533089934, 1533089922, 115, 134, '');
INSERT INTO `content` VALUES (133, 28, '基地风采', 'uploadfile/image/20180801/201808011018310.png', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=133', 1, 'admin', 1533089921, 1539059546, 76, 133, '');
INSERT INTO `content` VALUES (101, 39, '营养价值', '', '', '', 0, 'index.php?m=content&c=index&f=lists&catid=39', 1, '', 1498440052, 1498442186, 0, 101, '');
INSERT INTO `content` VALUES (166, 40, '2021年新品种发布会圆满成功', 'uploadfile/image/20210919/202109190243200.jpg', '新品种,新形势,新发展', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=166', 1, 'admin', 1632035580, 1632036384, 24, 166, 'c4 tb');
INSERT INTO `content` VALUES (167, 3, '沁丰876', 'uploadfile/image/20211109/202111090309250.jpg', '', '', 1, 'index.php?m=content&c=index&f=show&catid=3&contentid=167', 1, 'admin', 1636441190, 1636442624, 73, 167, 'c3');
INSERT INTO `content` VALUES (123, 3, '脊玉809', 'uploadfile/image/20181108/201811080410280.jpg', '', '', 1, 'index.php?m=content&c=index&f=show&catid=3&contentid=123', 1, 'admin', 1533022538, 1614783229, 2216, 123, '');
INSERT INTO `content` VALUES (131, 40, '榆次区脊玉809长势喜人', '', '', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=131', 1, 'admin', 1533089534, 1539062822, 561, 131, 'c5 tb');
INSERT INTO `content` VALUES (145, 28, '基地风采', 'uploadfile/image/20181025/201810251048370.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=145', 1, 'admin', 1540435723, 1540435672, 111, 145, '');
INSERT INTO `content` VALUES (130, 40, '试验田顺利播种', '', '', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=130', 1, 'admin', 1533089335, 1539062843, 226, 130, 'c7 tb');
INSERT INTO `content` VALUES (129, 40, '玉米苗后除草剂什么时候打最安全，怎样打，注意事项有哪些？', '', '', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=129', 1, 'admin', 1533089172, 1539062857, 184, 129, 'c3 tb');
INSERT INTO `content` VALUES (128, 40, '山西沁丰园突出新品种', '', '', '', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=128', 1, 'admin', 1533089120, 1539062878, 133, 128, 'c6 tb');
INSERT INTO `content` VALUES (127, 3, '佳昌689', 'uploadfile/image/20181112/201811121256550.jpg', '', ' 生育期126天，株高285厘米，穗位100厘米，穗轴红色，果穗长24厘米，穗行数16-18行，千粒重405g，粒型马齿，抗性好。亩留苗3800株左右。芽率98、纯度98、净度99。该品种已经在山西引种备案，适应山西春播中晚熟区。', 1, 'index.php?m=content&c=index&f=show&catid=3&contentid=127', 1, 'admin', 1533088922, 1610090393, 1097, 127, '');
INSERT INTO `content` VALUES (126, 3, 'F3588', 'uploadfile/image/20181112/201811121257410.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=3&contentid=126', 1, 'admin', 1533088855, 1614783102, 1076, 126, '');
INSERT INTO `content` VALUES (132, 28, '基地风采', 'uploadfile/image/20180801/201808011018100.png', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=132', 1, 'admin', 1533089904, 1533089883, 74, 132, '');
INSERT INTO `content` VALUES (102, 9, '企业文化', '', '', '', 0, 'index.php?m=content&c=index&f=lists&catid=9', 1, '', 1498440441, 1498525588, 0, 102, '');
INSERT INTO `content` VALUES (147, 28, '基地风采', 'uploadfile/image/20181025/201810251051290.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=147', 1, 'admin', 1540435906, 1540435848, 83, 147, '');
INSERT INTO `content` VALUES (148, 28, '基地风采', 'uploadfile/image/20181025/201810251052330.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=148', 1, 'admin', 1540435982, 1540435909, 113, 148, '');
INSERT INTO `content` VALUES (149, 28, '基地风采', 'uploadfile/image/20181025/201810251053170.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=149', 1, 'admin', 1540436012, 1540435985, 128, 149, '');
INSERT INTO `content` VALUES (154, 28, '基地风采', 'uploadfile/image/20181025/201810251102120.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=154', 1, 'admin', 1540436548, 1540436510, 138, 154, '');
INSERT INTO `content` VALUES (155, 28, '基地风采', 'uploadfile/image/20181025/201810251102550.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=155', 1, 'admin', 1540436592, 1599114933, 151, 155, '');
INSERT INTO `content` VALUES (156, 40, '公司甘肃生产基地陆续运回玉米种', '', '', '  山西沁丰园农业科技有限公司甘肃生产基地于2018年10月24日经过检测，所有玉米种子经过晾晒，水分已经达标，开始陆续脱粒，脱粒过程中他们会保证少碾压、少破损把质量做到最优。首批种子已经装车发出，运往公司加工厂，预计11月20日左右就可以给各地经销商供货。', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=156', 1, 'admin', 1540450782, 1553330680, 216, 156, '');
INSERT INTO `content` VALUES (153, 28, '基地风采', 'uploadfile/image/20181025/201810251055030.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=28&contentid=153', 1, 'admin', 1540436118, 1540436092, 131, 153, '');
INSERT INTO `content` VALUES (165, 3, '邦农151', 'uploadfile/image/20210303/202103031057110.png', '', '', 0, 'index.php?m=content&c=index&f=show&catid=3&contentid=165', 1, 'admin', 1614781117, 1614783408, 244, 165, '');
INSERT INTO `content` VALUES (159, 40, '科技发展铸未来', '', '试验田', '选出适应性、丰产性、稳产性、抗病性、抗逆性、抗旱抗涝性好的新品种', 0, 'index.php?m=content&c=index&f=show&catid=40&contentid=159', 1, 'admin', 1563932939, 1563933432, 240, 159, '');
INSERT INTO `content` VALUES (162, 3, 'H717', 'uploadfile/image/20200903/202009031139470.jpg', '', '', 1, 'index.php?m=content&c=index&f=show&catid=3&contentid=162', 1, 'admin', 1599112736, 1610089838, 393, 162, '');
INSERT INTO `content` VALUES (161, 3, 'LY156', 'uploadfile/image/20200903/202009031121190.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=3&contentid=161', 1, 'admin', 1599023467, 1599286311, 332, 161, '');
INSERT INTO `content` VALUES (163, 3, 'Q100', 'uploadfile/image/20200905/202009050228110.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=3&contentid=163', 1, 'admin', 1599113571, 1599287270, 349, 163, '');
INSERT INTO `content` VALUES (164, 3, '金育328', 'uploadfile/image/20200905/202009050209390.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=3&contentid=164', 1, 'admin', 1599114669, 1610089751, 531, 164, '');
INSERT INTO `content` VALUES (168, 3, '沁丰12', 'uploadfile/image/20211109/202111090318140.jpg', '', '', 0, 'index.php?m=content&c=index&f=show&catid=3&contentid=168', 1, 'admin', 1636442323, 1636442352, 61, 168, '');

-- ----------------------------
-- Table structure for download
-- ----------------------------
DROP TABLE IF EXISTS `download`;
CREATE TABLE `download`  (
  `contentid` int(8) NOT NULL,
  `files` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of download
-- ----------------------------

-- ----------------------------
-- Table structure for flash
-- ----------------------------
DROP TABLE IF EXISTS `flash`;
CREATE TABLE `flash`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `thumb` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `type` tinyint(2) UNSIGNED NOT NULL DEFAULT 1,
  `sort` int(5) UNSIGNED NOT NULL DEFAULT 0,
  `inputtime` int(8) NOT NULL DEFAULT 0,
  `catid` int(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of flash
-- ----------------------------
INSERT INTO `flash` VALUES (1, '首页幻灯图片', '#', 'uploadfile/image/20180912/201809121213060.jpg', 0, 1, 1, 1322017704, 0);
INSERT INTO `flash` VALUES (4, '123', '#', 'uploadfile/image/20180912/201809121213160.jpg', 0, 1, 0, 1417743403, 0);

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `form_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `form_table` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_email` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_code` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES (7, '在线留言', 'message', 1, 0, 0, 1);
INSERT INTO `form` VALUES (8, '投递简历', 'resume', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for form_field
-- ----------------------------
DROP TABLE IF EXISTS `form_field`;
CREATE TABLE `form_field`  (
  `fieldid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `formid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `field` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `formtype` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` tinyint(4) NOT NULL DEFAULT 0,
  `height` tinyint(4) NOT NULL DEFAULT 0,
  `initial` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `explain` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`fieldid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of form_field
-- ----------------------------
INSERT INTO `form_field` VALUES (18, 7, 'address', '地址', 'text', 35, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (16, 7, 'truename', '姓名', 'text', 15, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (17, 7, 'telephone', '电话', 'text', 20, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (19, 7, 'content', '详细内容', 'textarea', 45, 6, '', '', 0, 0);
INSERT INTO `form_field` VALUES (20, 8, 'truename', '姓名', 'text', 10, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (21, 8, 'age', '年龄', 'text', 8, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (22, 8, 'telephone', '联系电话', 'text', 15, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (23, 8, 'degree', '学历', 'option', 0, 0, '小学,初中,高中,中专,大专,本科及以上', '', 0, 0);
INSERT INTO `form_field` VALUES (24, 8, 'address', '目前所在地', 'text', 8, 0, '', '', 0, 0);
INSERT INTO `form_field` VALUES (25, 8, 'school', '学习经历', 'textarea', 60, 6, '', '', 0, 0);
INSERT INTO `form_field` VALUES (26, 8, 'work', '工作经历', 'textarea', 60, 8, '', '', 0, 0);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job`  (
  `contentid` int(8) NOT NULL,
  `type` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `experience` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `degree` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sex` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `numbers` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `wage` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of job
-- ----------------------------

-- ----------------------------
-- Table structure for keywords
-- ----------------------------
DROP TABLE IF EXISTS `keywords`;
CREATE TABLE `keywords`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of keywords
-- ----------------------------

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, '森飞科技', 'http://www.senfeikeji.com', 0, 1322016402);
INSERT INTO `link` VALUES (2, '百度', 'http://www.baidu.com', 0, 1322017014);
INSERT INTO `link` VALUES (3, '站长之家', 'http://www.chinaz.com', 0, 1322017014);
INSERT INTO `link` VALUES (4, '网易', 'http://www.163.com', 0, 1322017029);
INSERT INTO `link` VALUES (5, '新浪', 'http://www.sina.com.cn', 0, 1322017029);
INSERT INTO `link` VALUES (6, '新浪微博', 'http://weibo.com', 0, 1322017029);
INSERT INTO `link` VALUES (7, '淘宝', 'http://www.taobao.com', 0, 1322017029);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `userid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupid` tinyint(4) UNSIGNED NOT NULL DEFAULT 1,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_time` int(10) NOT NULL DEFAULT 0,
  `creat_time` int(10) NOT NULL,
  `is_lock` smallint(2) NOT NULL DEFAULT 0,
  `last_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logins` int(10) NOT NULL DEFAULT 0,
  `sex` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `truename` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member
-- ----------------------------

-- ----------------------------
-- Table structure for member_field
-- ----------------------------
DROP TABLE IF EXISTS `member_field`;
CREATE TABLE `member_field`  (
  `fieldid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `field` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `formtype` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` tinyint(4) NOT NULL DEFAULT 0,
  `height` tinyint(4) NOT NULL DEFAULT 0,
  `initial` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `explain` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_register` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`fieldid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_field
-- ----------------------------
INSERT INTO `member_field` VALUES (3, 'truename', '姓名', 'text', 12, 0, '', '', 1, 0, 1);
INSERT INTO `member_field` VALUES (2, 'sex', '性别', 'radio', 0, 0, '男,女,保密', '', 2, 0, 0);
INSERT INTO `member_field` VALUES (4, 'phone', '联系电话', 'text', 15, 0, '', '', 3, 0, 0);
INSERT INTO `member_field` VALUES (5, 'address', '联系地址', 'text', 40, 0, '', '', 5, 0, 0);
INSERT INTO `member_field` VALUES (6, 'email', '安全邮箱', 'text', 30, 0, '', '', 4, 1, 1);

-- ----------------------------
-- Table structure for member_group
-- ----------------------------
DROP TABLE IF EXISTS `member_group`;
CREATE TABLE `member_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of member_group
-- ----------------------------
INSERT INTO `member_group` VALUES (1, '普通会员');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `menuid` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parentid` int(8) UNSIGNED NOT NULL,
  `title` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` int(8) NULL DEFAULT 0,
  `is_show` mediumint(1) UNSIGNED NOT NULL DEFAULT 1,
  `groupid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`menuid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '后台首页', 'index.php?m=sfcms&c=index&f=left&id=1', 0, 1, '');
INSERT INTO `menu` VALUES (2, 0, '系统设置', 'index.php?m=sfcms&c=index&f=left&id=2', 0, 1, '');
INSERT INTO `menu` VALUES (3, 0, '内容管理', 'index.php?m=sfcms&c=index&f=left&id=3', 0, 1, '');
INSERT INTO `menu` VALUES (4, 0, '模块管理', 'index.php?m=sfcms&c=index&f=left&id=4', 0, 1, '');
INSERT INTO `menu` VALUES (5, 0, '模板管理', 'index.php?m=sfcms&c=index&f=left&id=5', 0, 1, '');
INSERT INTO `menu` VALUES (6, 0, '文件管理', 'index.php?m=sfcms&c=index&f=left&id=6', 0, 1, '');
INSERT INTO `menu` VALUES (7, 1, '常用操作', '###', 0, 1, '');
INSERT INTO `menu` VALUES (8, 7, '后台首页', 'index.php?m=sfcms&c=index&f=main', 0, 1, '');
INSERT INTO `menu` VALUES (9, 7, '更新首页', 'index.php?m=sfcms&c=creathtml&f=update_index', 0, 1, '');
INSERT INTO `menu` VALUES (10, 7, '添加栏目', 'index.php?m=sfcms&c=category&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (11, 7, '管理栏目', 'index.php?m=sfcms&c=category', 0, 1, '');
INSERT INTO `menu` VALUES (12, 7, '内容模型管理', 'index.php?m=sfcms&c=model', 0, 1, '');
INSERT INTO `menu` VALUES (13, 7, '更新全站缓存', 'index.php?m=sfcms&c=update_cache', 0, 1, '');
INSERT INTO `menu` VALUES (14, 1, '个人信息', '###', 0, 1, '');
INSERT INTO `menu` VALUES (15, 14, '修改密码', 'index.php?m=sfcms&c=index&f=edit', 0, 1, '');
INSERT INTO `menu` VALUES (16, 2, '栏目管理', '###', 2, 1, '');
INSERT INTO `menu` VALUES (17, 2, '模型管理', '###', 3, 1, '');
INSERT INTO `menu` VALUES (18, 2, '管理员设置', '###', 4, 1, '');
INSERT INTO `menu` VALUES (19, 2, '数据库管理', '###', 5, 1, '');
INSERT INTO `menu` VALUES (20, 2, '关键词链接', '###', 6, 1, '');
INSERT INTO `menu` VALUES (21, 2, '网站配置', '###', 1, 1, '');
INSERT INTO `menu` VALUES (22, 2, '后台菜单管理', '###', 7, 1, '');
INSERT INTO `menu` VALUES (23, 16, '添加栏目', 'index.php?m=sfcms&c=category&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (24, 16, '管理栏目', 'index.php?m=sfcms&c=category', 0, 1, '');
INSERT INTO `menu` VALUES (25, 17, '添加模型', 'index.php?m=sfcms&c=model&f=model_add', 0, 1, '');
INSERT INTO `menu` VALUES (26, 17, '管理模型', 'index.php?m=sfcms&c=model', 0, 1, '');
INSERT INTO `menu` VALUES (27, 18, '添加管理员', 'index.php?m=sfcms&c=admin&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (28, 18, '管理员列表', 'index.php?m=sfcms&c=admin', 0, 1, '');
INSERT INTO `menu` VALUES (29, 19, '数据库备份', 'index.php?m=sfcms&c=data', 0, 1, '');
INSERT INTO `menu` VALUES (30, 19, '数据库恢复', 'index.php?m=sfcms&c=data&f=data_file', 0, 1, '');
INSERT INTO `menu` VALUES (31, 20, '添加关键词', 'index.php?m=sfcms&c=keywords&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (32, 20, '管理关键词', 'index.php?m=sfcms&c=keywords', 0, 1, '');
INSERT INTO `menu` VALUES (33, 21, '基本信息', 'index.php?m=sfcms&c=setting', 0, 1, '');
INSERT INTO `menu` VALUES (34, 21, '联系方式', 'index.php?m=sfcms&c=setting&f=contact', 0, 1, '');
INSERT INTO `menu` VALUES (35, 21, '邮件设置', 'index.php?m=sfcms&c=setting&f=email', 0, 1, '');
INSERT INTO `menu` VALUES (36, 22, '添加菜单', 'index.php?m=sfcms&c=menu&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (37, 22, '管理菜单', 'index.php?m=sfcms&c=menu', 0, 1, '');
INSERT INTO `menu` VALUES (38, 4, '碎片管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (39, 38, '添加碎片', 'index.php?m=sfcms&c=block&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (40, 38, '管理碎片', 'index.php?m=sfcms&c=block', 0, 1, '');
INSERT INTO `menu` VALUES (41, 4, '幻灯片管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (42, 4, '客服QQ管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (43, 4, '友情链接管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (44, 4, '会员管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (45, 41, '添加幻灯', 'index.php?m=flash&c=admin&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (46, 41, '管理幻灯', 'index.php?m=flash&c=admin', 0, 1, '');
INSERT INTO `menu` VALUES (47, 42, '添加客服', 'index.php?m=qq&c=admin&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (48, 42, '管理客服', 'index.php?m=qq&c=admin', 0, 1, '');
INSERT INTO `menu` VALUES (49, 43, '添加链接', 'index.php?m=link&c=admin&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (50, 43, '管理链接', 'index.php?m=link&c=admin', 0, 1, '');
INSERT INTO `menu` VALUES (51, 44, '会员列表', 'index.php?m=member&c=admin', 0, 1, '');
INSERT INTO `menu` VALUES (52, 44, '模型配置', 'index.php?m=member&c=admin&f=field', 0, 1, '');
INSERT INTO `menu` VALUES (53, 44, '会员组管理', 'index.php?m=member&c=group', 0, 1, '');
INSERT INTO `menu` VALUES (54, 5, '模板管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (55, 54, '模板列表', 'index.php?m=sfcms&c=template', 0, 1, '');
INSERT INTO `menu` VALUES (56, 5, '数据调用', '###', 0, 1, '');
INSERT INTO `menu` VALUES (57, 56, '调用说明', 'index.php?m=sfcms&c=template&f=calls', 0, 1, '');
INSERT INTO `menu` VALUES (58, 6, '生成html', '###', 0, 1, '');
INSERT INTO `menu` VALUES (59, 6, '更新URL', '###', 0, 1, '');
INSERT INTO `menu` VALUES (60, 58, '更新首页', 'index.php?m=sfcms&c=creathtml&f=update_index', 0, 1, '');
INSERT INTO `menu` VALUES (61, 58, '更新栏目页', 'index.php?m=sfcms&c=categorytree&f=category_tree', 0, 1, '');
INSERT INTO `menu` VALUES (62, 58, '更新内容页', 'index.php?m=sfcms&c=categorytree&f=show_tree', 0, 1, '');
INSERT INTO `menu` VALUES (63, 59, '更新URL', 'index.php?m=sfcms&c=categorytree', 0, 1, '');
INSERT INTO `menu` VALUES (64, 4, '自定义表单管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (65, 64, '管理表单', 'index.php?m=form&c=admin', 0, 1, '');
INSERT INTO `menu` VALUES (66, 4, '模块管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (67, 66, '模块列表', 'index.php?m=sfcms&c=module', 0, 1, '');
INSERT INTO `menu` VALUES (68, 18, '管理员组管理', 'index.php?m=sfcms&c=admin&f=admin_group', 0, 1, '');
INSERT INTO `menu` VALUES (69, 18, '添加管理员组', 'index.php?m=sfcms&c=admin&f=admin_group_add', 0, 1, '');
INSERT INTO `menu` VALUES (70, 21, '上传设置', 'index.php?m=sfcms&c=setting&f=upload', 0, 1, '');
INSERT INTO `menu` VALUES (71, 6, 'URL规则管理', '###', 0, 1, '');
INSERT INTO `menu` VALUES (72, 71, '添加规则', 'index.php?m=sfcms&c=urlrule&f=add', 0, 1, '');
INSERT INTO `menu` VALUES (73, 71, '规则管理', 'index.php?m=sfcms&c=urlrule', 0, 1, '');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inputtime` int(10) NOT NULL DEFAULT 0,
  `truename` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, '太原市农林科技公司评选活动', 1589166834, '汇融名企', '400-058-0357', '汇融名企', '恭喜贵公司成功入选“科学规划，绿色农林”太原市农林科技公司评选活动。\r\n1、公司企业参与活动过程中，将帮助贵公司更加专业的了解用户，倾听用户心声，探索运营方式。增强自己的品牌积累，造就品牌影响力\r\n2、本次活动真实有效，公平公正，活动免费报名，绝不收取任何报名费用。\r\n3、参加活动的选手，请使用真实有效的活动照片。\r\n4、活动开始时间：2018-04-07 07:00 活动结束时间：2018-04-19 23:59\r\n每天点亮星星时间：（早）07:00-（晚）24:00\r\n点亮星星规则：每隔30分钟可点亮一颗星星\r\n希望您多多关注，积极参与，预祝您取得好的成绩！');
INSERT INTO `message` VALUES (2, 'buy cialis online fast delivery Shalvably', 1592720135, 'hoparoura', '81443165783', 'Axum', 'Como Conseguir Viagra Sin Receta Medica  https://cheapcialisll.com/ - buy cialis online with prescription Purchasing Acticin Drugs  &lta hrefhttps://cheapcialisll.com/#&gtCheap Cialis&lt/a&gt effet cialis 5mg  ');
INSERT INTO `message` VALUES (3, 'apcalis cialis regalis tadalafil', 1619596763, 'TrokAnnek', '83114134225', 'Ennis', '&lta hrefhttp://vsdoxycyclinev.com/&gtdoxycycline 100mg price');
INSERT INTO `message` VALUES (4, 'tadalafil paypal', 1623320722, 'accercows', '87156534983', 'Avarua', '&lta hrefhttp://vskamagrav.com&gtreal kamagra');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apply_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of migration
-- ----------------------------

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `model_name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model_table` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of model
-- ----------------------------
INSERT INTO `model` VALUES (1, '单页模型', 'single', 1, 1);
INSERT INTO `model` VALUES (2, '新闻模型', 'news', 1, 0);
INSERT INTO `model` VALUES (3, '产品模型', 'product', 1, 0);
INSERT INTO `model` VALUES (4, '招聘模型', 'job', 1, 0);
INSERT INTO `model` VALUES (5, '下载模型', 'download', 1, 0);

-- ----------------------------
-- Table structure for model_field
-- ----------------------------
DROP TABLE IF EXISTS `model_field`;
CREATE TABLE `model_field`  (
  `fieldid` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `modelid` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `field` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `formtype` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `width` tinyint(4) NOT NULL DEFAULT 0,
  `height` tinyint(4) NOT NULL DEFAULT 0,
  `initial` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `explain` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` mediumint(8) UNSIGNED NOT NULL DEFAULT 0,
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`fieldid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of model_field
-- ----------------------------
INSERT INTO `model_field` VALUES (1, 1, 'content', '详细内容', 'editor', 0, 0, '', '', 0, 1);
INSERT INTO `model_field` VALUES (2, 2, 'content', '详细内容', 'editor', 0, 0, '', '', 0, 0);
INSERT INTO `model_field` VALUES (4, 3, 'content', '详细说明', 'editor', 0, 0, '', '', 2, 0);
INSERT INTO `model_field` VALUES (5, 4, 'type', '招聘类别', 'option', 0, 0, '全职,兼职', '', 0, 0);
INSERT INTO `model_field` VALUES (6, 4, 'experience', '经验要求', 'option', 0, 0, '不限,毕业生,1年,2年,3年,5年', '或以上', 0, 0);
INSERT INTO `model_field` VALUES (7, 4, 'degree', '学历要求', 'option', 0, 0, '不限,初中,高中,职校,中专,大专,本科,硕士,博士', '或以上', 0, 0);
INSERT INTO `model_field` VALUES (8, 4, 'sex', '性别要求', 'option', 0, 0, '不限,男性,女性', '', 0, 0);
INSERT INTO `model_field` VALUES (9, 4, 'numbers', '招聘人数', 'text', 8, 0, '', '人', 0, 0);
INSERT INTO `model_field` VALUES (10, 4, 'wage', '月薪待遇', 'text', 15, 0, '', '', 0, 0);
INSERT INTO `model_field` VALUES (11, 4, 'content', '职位描述', 'editor', 0, 0, '', '', 0, 0);
INSERT INTO `model_field` VALUES (14, 5, 'files', '上传文件', 'files', 0, 0, '', '', 0, 0);
INSERT INTO `model_field` VALUES (15, 5, 'content', '详细说明', 'editor', 0, 0, '', '', 0, 0);
INSERT INTO `model_field` VALUES (16, 3, 'moreimage', '多图上传', 'moreimage', 0, 0, '', '', 1, 0);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `contentid` int(8) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (128, '<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#00D100;\\\">2017年在山西沁丰园试验田（榆次修文镇）2500多个组合中，经过多次的观察、筛选、对比选出30多个非常突出的优良品种。非常感谢公司的育种人员，多年的南繁<span style=\\\"line-height:25.6px;\\\">艰辛，</span><span style=\\\"line-height:1.6;\\\">终于有了成果。</span></span> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;\\\"><br />\r\n</span> \r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#FF6827;\\\"><strong><span style=\\\"line-height:1.6;\\\">沁丰804--亩留苗4500株，生育期125天，大矮杆，不秃尖！</span></strong></span> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;\\\"></span> \r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100419_99180.jpg\\\" /> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;\\\"></span> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100427_45559.jpg\\\" /> \r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100436_92647.jpg\\\" /> \r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100446_19828.jpg\\\" /> \r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;\\\"><br />\r\n</span><strong><span style=\\\"color:#D92142;\\\">沁丰77-亩留苗5500株，生育期123天，脱水更快！</span></strong> \r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100455_98324.jpg\\\" /> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100502_95428.jpg\\\" /> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100509_33245.jpg\\\" /> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100516_37967.jpg\\\" /> \r\n	</p>\r\n	<div>\r\n		<br />\r\n	</div>');
INSERT INTO `news` VALUES (129, '<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" color:#3E3E3E;font-size:16px;text-indent:2em;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">对于玉米苗后除草剂，各地玉米种植户每年都在用，但是每年都会出现玉米药害，打完没效果等问题，有时候还会出现打完玉米苗后除草剂，<strong>杂草没有死，玉米却死了</strong>，很是让农民用户头疼。</span> \r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　今天就详细说说玉米苗后除草剂什么时候打最安全，怎样打效果最好，最佳喷药时间，喷药方法，使用过程又有哪些注意事项？带着一系列问题，下面我们一起来学习下：</span> \r\n</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" color:#3E3E3E;font-size:16px;text-align:center;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#EE0000;font-size:14px;\\\"><strong>　</strong></span><span style=\\\"color:#EE0000;\\\"><strong>　玉米苗后除草剂最佳喷药时间</strong></span> \r\n		</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　由于玉米苗后除草剂<strong>喷施后需要2-6个小时</strong>的吸收过程，在这2-6个小时中，药效发挥好不好（也就是除草效果是否理想）与气温和空气湿度关系十分密切。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><br />\r\n</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　在气温高、天气旱的上午、中午或下午喷药，由于温度高，光照强，药液挥发快，喷药后一会儿药液就会蒸发，使除草剂进入杂草体内的量受到限制，吸收量明显不足，从而影响了除草效果；同时在高温干旱时喷药，玉米苗也易发生药害。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　<strong>最佳喷药时间是傍晚六点以后</strong>，因为这时喷药，施药后温度较低，湿度较大，药液在杂草叶面上呆的时间较长，杂草能充分地吸收除草剂成分，保证了除草效果，傍晚用药也可显着提高玉米苗安全性，不易发生药害。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n		</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#EE0000;\\\"><strong>　　玉米苗几个叶子可以喷打玉米苗后除草剂</strong></span> \r\n	</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　<strong>玉米3一5片叶，杂草2一4叶期为最佳</strong>，尤其是玉农乐与2,4—D丁酯混用不能在玉米5叶期之后施药。</span> \r\n</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　田间杂草基本出齐，多数杂草2~4叶期喷雾。施药期过晚，杂草抗性增强，除草效果受影响。<strong>喷药时要求气温在15~25℃，空气相对湿度65%以上</strong>，风速4米/秒以下时进行。按要求选好喷雾器械和喷嘴并按喷药作业操作规范施药。</span> \r\n</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" color:#3E3E3E;font-size:16px;text-align:center;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#EE0000;\\\"><strong>　　玉米苗后除草剂怎么打效果好</strong></span> \r\n		</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　给大家说一个实际打药过程中，总结出来的一个方法，在药量足够的前提下，水越多越好（当然不是说无限制的加水，相对来说），比如，购买了除草剂，建议是1瓶1桶水1亩地，也就是兑水15公斤左右，喷在一亩地里，但是，如果你兑20-25公斤水，同样喷在了一亩地里，效果就比15公斤水的好些。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　在俗点说，<strong>1瓶1桶水1亩地变成1瓶2桶水1亩地</strong>，有兴趣的朋友可以试试，不过注意，喷量一定要均匀，千万不可一片多一片少的情况。</span> \r\n			</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-align:justify;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <br />\r\n				</h2>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　看草大小</strong></span> \r\n			</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　喷药在喷玉米苗后除草剂时，好多农民有个误区，认为杂草越小，抗性越小，草越易杀死。其实不然，因为草太小了没有着药面积，除草效果也不理想。<strong>最佳的草龄是2叶1心至4叶1心期</strong>，这时杂草有了一定的着药面积，杂草抗性也不大，除草效果显着。</span> \r\n		</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-align:justify;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <br />\r\n	</h2>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　玉米品种</strong></span> \r\n		</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　由于现在玉米苗后除草剂大多是烟嘧磺隆成分，一些玉米品种对本成分敏感，易发生药害，所以，种植甜玉米、糯玉米、登海系列等品种的玉米田不能喷施，防止药害产生。对于新的玉米品种，请先试验再推广。</span> \r\n			</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-align:justify;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <br />\r\n				</h2>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　农药混用问题</strong></span> \r\n			</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　喷苗后除草剂的前后7天，严禁喷施有机磷类杀虫剂，否则易发生药害。但可与菊酯类杀虫剂混喷，喷药时要注意尽量避开心叶，防药液灌心。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　今年一些玉米田瑞典蝇和蓟马发生严重，防治这两种小害虫可用吡虫啉或啶虫脒喷心叶，但是喷药时也不要和苗后除草剂混喷，尽管吡虫啉或啶虫脒不是有机磷类。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　因为防治两种小害虫需要喷心叶，如果混用喷心叶则易发生药害，可分开喷：在前边喷苗后除草剂，后边紧跟着用吡虫啉或啶虫脒喷心叶。</span> \r\n		</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-align:justify;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <br />\r\n	</h2>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　杂草本身的抵抗力</strong></span> \r\n		</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　由于近年来，杂草自身的抗逆能力得到加强，为了防止体内的水分过量蒸发，杂草生长得并不那么水灵粗壮，而是生长得灰白、矮小，实际草龄都并不小（即所谓的“小老头”）。这些杂草大都全身布满白色的小绒毛，来减少水分的蒸发。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　这样喷施农药时，药液被这些小绒毛顶在杂草茎叶表面之上，杂草本身吸收得很少，自然就影响药效的发挥，所以高温干旱时不论施什么药，都应该加大喷施的药液量，以不影响药效的发挥，请农民朋友施药时千万不要惜水，不要惜药。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" color:#3E3E3E;font-size:16px;text-align:center;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n		</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#EE0000;\\\"><strong>　　玉米苗后除草剂使用注意事项</strong></span> \r\n	</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　1、按照规定剂量进行常量喷雾，不可随意加大药量。<br />\r\n　　2、采用“二次稀释法”，先配成母液，后对水均匀喷雾。<br />\r\n　　3、一般玉米苗后除草剂使用适期应在玉米可见叶2叶以后至可见叶5叶以前。若<strong>在5～7叶期用药</strong>，应在玉米行间使用，避免药液喷到心叶内。<br />\r\n　　4、有些玉米苗后除草剂对甜玉米、制种田、自交系比较敏感，勿用。应<strong>严格按照除草剂标签说明</strong>使用。<br />\r\n<br />\r\n</span> \r\n</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　5、用有机磷药剂处理过的玉米对苗后除草剂敏感。两药间隔期至少7天。<br />\r\n　　6、使用机动喷雾器施药，不得擅自增加药量，禁止重复喷雾。<br />\r\n　　7、除草剂使用前要注意清洗喷过有机磷农药的喷雾器。<br />\r\n　　8、下午4点以后用药效果好，持续高温天气（<strong>气温超过35℃</strong>）避免用药。</span> \r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><br />\r\n</span> \r\n</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-indent:0em;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#EE0000;\\\"><strong>　　玉米打完除草剂后就下雨了，第二天还用重喷吗</strong></span> \r\n	</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　首先我们不建议打第二遍苗后除草剂。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　那么有些农民用户怕草不死，想打第二遍，怎么办？</span> \r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　1、打完药后立即下雨。<br />\r\n　　2、大雨或者暴雨，时间很长。<br />\r\n　　3、阔叶草3-5天，尖叶草5-7天后，还没有中毒现象，玉米也正常生长。<br />\r\n　　满足以上3点可以重喷一次。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　相反：</strong></span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　1、雨下的不大，而且时间较短。<br />\r\n　　2、在喷施玉米苗后除草剂6个小时后，在下雨。<br />\r\n　　3、杂草已有中毒现象。<br />\r\n</span> \r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　满足以上3点，则不建议重喷，以免出现药害。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　有些朋友会说，我不满足以上的条件，但是打第二遍时，不打玉米上，只打杂草上，定向喷雾，可以吗。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　答：那肯定是可以的！！</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　药剂的混用是要讲究科学性的，药剂混用之前，一定要先了解药剂的理化性质、作用特点以及生物活性等，然后通过田间应用试验，最后才能大面积使用，要不绝不能滥混滥用，后果不堪设想。</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　那究竟玉米除草剂能不能和杀虫剂可以混用，能和什么样的杀虫剂混用，混用后的效果如何？带着一系列问题，我们来了解下以下内容：</span> \r\n		</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" color:#3E3E3E;font-size:16px;text-align:center;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n	</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　为什么有不少人会疑惑这个问题呢？无非就是想偷懒，懒省事呗！究竟能不能，我们先来学习下以下内容：</span> \r\n		</p>\r\n<h2 style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,; font-size: 16px; font-weight: 400;\\\" text-align:justify;color:#3E3E3E;background-color:#FFFFFF;?=\\\"\\\"> <br />\r\n			</h2>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#FF0000;\\\"><strong>　　农药混用的原则</strong></span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\">　<strong>　1、混用品种之间不发生不良化学反应</strong>（如水解、碱解、酸解或氧化还原反应等），保证正常药效或增效，也不影响药剂的物理性状（如乳化性、悬浮率降低等）。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\"><br />\r\n</span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\">　　例如，多数有机磷杀虫剂不能与波尔多液、石硫合剂等混用；粉剂不能与可湿性粉剂、可溶性粉剂混用。<br />\r\n</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　<strong>　2、不同品种混用后，不能使作物产生药害。</strong>例如，有机磷杀虫剂与敌稗混用后，会使水稻产生药害，波尔多液与石硫合剂混用，易使作物产生药害。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　3、农药混合后，不增加毒性，保证对人畜安全</strong><strong>。</strong></span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\"><strong>　　4、混用要合理。</strong>包括本种间搭配合理，如防除大豆田禾本科杂草，单用拿捕净、盖草能即可防除，再用两者混配，虽然从药剂稳定性上可行，但属于混配不合理，既不增效，也不扩大防治范围，棍用没有必要。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　农药混用是为了省工省时，提高经济效益，如制成混剂后，追加成本很大，是不能允许的。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　<strong>　5、注意农药品种间的拮抗作用</strong>，保证混用的效果，如苯达松与拿捕净混用因拮抗作用而降低对禾本科杂草的防效。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span>　　<span style=\\\"color:#FF0000;\\\"><strong>玉米除草剂能不能和杀虫剂混用</strong></span></span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\">　　对于农作物来说，有苗前（或芽前）处理，主要指作物播种前（或移栽前），或作物播种后出苗前，土壤喷雾处理封闭杀灭未出苗杂草。</span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\"><br />\r\n</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\">　　玉米田此类除草剂包括酰胺类的乙草胺、精异丙甲草胺，三氮苯类的莠去津等等，可防除田间多种一年生禾本科及部分小粒种子阔叶杂草了，如果是在东北三省地区，还会使用加入2,4-d丁酯等除草剂的混剂品种扩大杀草谱或增加药效。<br />\r\n</span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　如果此时期没施药或土壤封闭效果不好，可以选择使用苗后除草剂对已出苗杂草进行茎叶喷雾防除，包括磺酰脲类的烟嘧磺隆（日本石原公司）等，防治效果都还可以。</span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#FF0000;\\\"><strong>　　提醒：</strong></span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　一定注意严格按照除草剂农药的标签及说明书的技术要点和注意事项严格使用，避免造成药害事故。</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　</span><span style=\\\"color:#FF0000;\\\"><strong>　建议：</strong></span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　　最好不要混用，两者的用药着重点不一样，一个打草，一个打玉米。再者杀虫剂中可能含有有机磷成分，容易与玉米苗后产品混用发生药害，所以不建议混用。</span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" color:#3E3E3E;font-size:16px;text-align:center;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"color:#FF0000;font-size:14px;\\\"><strong>　　</strong></span><span style=\\\"color:#FF0000;\\\"><strong>玉米除草剂和杀虫剂不混用的原因分析：</strong></span> \r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"line-height:1.6;font-size:14px;\\\">　<strong>　1、不知道除草剂和杀虫剂都是什么成分</strong>，以玉米除草剂来说，含有烟嘧磺隆的除草剂和含有有机磷类的杀虫剂混用，就会出现药害，就是打完玉米除草剂之后的7天内，也不能用有机磷类的杀虫剂。<br />\r\n</span> \r\n			</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-align:justify;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n				</p>\r\n<p style=\\\"font-family: -apple-system-font, BlinkMacSystemFont,;\\\" text-indent:0em;color:#3E3E3E;font-size:16px;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:14px;\\\">　<strong>　2、抛去药害不说，玉米除草剂主要是往草上喷</strong>，让草吸取药液，进而杀死杂草，而杀虫剂则是打在玉米叶片上，让玉米叶片吸收药液，达到防虫治虫的目的。要是混用后，你说主要打在玉米上还是杂草上？</span> \r\n			</p>\r\n			<div>\r\n				<br />\r\n			</div>');
INSERT INTO `news` VALUES (130, '<p>\r\n	<strong>试验田简介：</strong> \r\n</p>\r\n<p>\r\n	地址：山西省晋中市榆次区修文镇\r\n</p>\r\n<p>\r\n	试验田面积：120亩\r\n</p>\r\n<span></span><span></span> \r\n<p>\r\n	<strong>一、玉米组合测配试验：</strong> \r\n</p>\r\n<p>\r\n	共设2500个测配组合、45个后续组合，<span style=\\\"line-height:22.4px;background-color:#FFFFFF;\\\">设60多个展区、每个区组40个组合。</span> \r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100737_34050.jpg\\\" width=\\\"640\\\" height=\\\"480\\\" /><img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100754_23182.jpg\\\" /><span></span><span></span> \r\n<p>\r\n	<strong>二、现有品种展示：</strong> \r\n</p>\r\n<img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100800_73040.jpg\\\" width=\\\"200\\\" height=\\\"150\\\" /><img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100824_73389.jpg\\\" width=\\\"200\\\" height=\\\"150\\\" /><img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100836_90658.jpg\\\" width=\\\"200\\\" height=\\\"150\\\" /> \r\n<p>\r\n	试验展区\r\n</p>\r\n<img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801100847_88039.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" /> \r\n<p>\r\n	经过3天的连续播种，2018年4月25号玉米试验田顺利播种完毕。为以后公司能够更好的筛选出抗性强、品质好、产量高的优良品种奠定了良好的基础。\r\n</p>\r\n<p style=\\\"text-align:center;\\\">\r\n	<span style=\\\"font-size:16px;\\\"><strong><span>望后期合作伙伴前来参观</span></strong></span> \r\n</p>');
INSERT INTO `news` VALUES (131, '<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:16px;\\\">五月份的春播以后，大家是不是也特别关注脊玉809玉米苗的长势呢？今天就给大家奉上一组图片。</span> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"> <span style=\\\"font-size:16px;\\\">&nbsp; &nbsp; &nbsp;图片是未经任何处理的天然原图，是自己拍的，可能构图不是特好。不过，玉米的长势还是在那里的，真的长势喜人啊。</span> \r\n</p>\r\n<p style=\\\"text-align: justify; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801101023_68015.jpg\\\" width=\\\"600\\\" height=\\\"800\\\" /> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n</p>\r\n<p style=\\\"text-align: justify; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801101042_76515.jpg\\\" width=\\\"600\\\" height=\\\"800\\\" /> \r\n	</p>\r\n<p style=\\\"text-align: justify; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801101056_28676.jpg\\\" width=\\\"600\\\" height=\\\"800\\\" /> \r\n</p>\r\n<p style=\\\"text-align: justify; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801101114_27386.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" /> \r\n	</p>\r\n<p style=\\\"text-align: justify; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801101127_22197.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" /> \r\n</p>\r\n<p style=\\\"text-align: justify; color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;background-color:#FFFFFF;?=\\\"\\\"> <img alt=\\\"\\\" src=\\\"/uploadfile/image/20180801/20180801101139_95475.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" /> \r\n	</p>\r\n<p style=\\\"color: rgb(51, 51, 51); font-family: -apple-system-font, BlinkMacSystemFont,;\\\" font-size:17px;text-align:justify;background-color:#FFFFFF;?=\\\"\\\"><br />\r\n</p>');
INSERT INTO `news` VALUES (138, '<p>\r\n	<span style=\\\"color:#009900;font-size:14px;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018年9月28日，公司科研部在公司试验田（榆次修文镇</strong></span><span style=\\\"color:#009900;font-size:14px;\\\"><strong>）认真筛选出18个后续品种，综合抗性、产量、脱水性的都非常突出的好品种。</strong></span> \r\n</p>\r\n<img style=\\\"width:643px;height:1160px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009125428_34872.jpg\\\" width=\\\"611\\\" height=\\\"1889\\\" /><img style=\\\"width:646px;height:713px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009125243_27957.jpg\\\" width=\\\"682\\\" height=\\\"1893\\\" /><img style=\\\"width:650px;height:840px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009125615_79404.jpg\\\" width=\\\"646\\\" height=\\\"1917\\\" /><img style=\\\"width:651px;height:779px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009125820_99612.jpg\\\" width=\\\"667\\\" height=\\\"1892\\\" /><img style=\\\"width:652px;height:710px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009125940_85578.jpg\\\" width=\\\"669\\\" height=\\\"1920\\\" /><img style=\\\"width:650px;height:633px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009130043_58810.jpg\\\" width=\\\"667\\\" height=\\\"1889\\\" /><img style=\\\"width:649px;height:906px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009130206_57941.jpg\\\" width=\\\"659\\\" height=\\\"1817\\\" /><img style=\\\"width:648px;height:808px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009130305_31510.jpg\\\" width=\\\"621\\\" height=\\\"1883\\\" /><img style=\\\"width:648px;height:1254px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009130405_69919.jpg\\\" width=\\\"679\\\" height=\\\"1600\\\" /><img style=\\\"width:649px;height:1140px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009130500_84026.jpg\\\" width=\\\"645\\\" height=\\\"1694\\\" /> \r\n<p align=\\\"center\\\">\r\n	&nbsp;\r\n	<p align=\\\"center\\\">\r\n		&nbsp;\r\n		<div align=\\\"left\\\">\r\n			&nbsp;\r\n		</div>\r\n		<p>\r\n			<br />\r\n		</p>\r\n		<p align=\\\"center\\\">\r\n			<br />\r\n		</p>\r\n<span style=\\\"color:#009900;font-size:14px;\\\"></span>');
INSERT INTO `news` VALUES (139, '<div style=\\\"text-align:center;\\\">\r\n	<iframe frameborder=\\\"0\\\" width=\\\"500\\\" height=\\\"450\\\" src=\\\"https://v.qq.com/txp/iframe/player.html?vid=f0750sfifca\\\">\r\n	</iframe>\r\n</div>');
INSERT INTO `news` VALUES (156, '<div style=\\\"text-align:left;\\\">\r\n	<span font-size:17px;background-color:#ffffff;\\\"=\\\"\\\" style=\\\"color: rgb(51, 51, 51);\\\"><span style=\\\"font-size:14px;\\\">&nbsp; &nbsp;</span><strong> <span style=\\\"font-size:14px;\\\">公司甘肃生产基地于2018年10月24日经过检测，所有玉米种子经过晾晒，水分已经达标，开始陆续脱粒，脱粒过程中他们会保证少碾压、少破损把质量做到最优。</span></strong></span><span font-size:17px;background-color:#ffffff;\\\"=\\\"\\\" style=\\\"color: rgb(51, 51, 51); font-size: 14px;\\\"><strong>首批种子已经装车发出，运往公司加工厂，</strong></span><span font-size:17px;background-color:#ffffff;\\\"=\\\"\\\" style=\\\"color: rgb(51, 51, 51); font-size: 14px;\\\"><strong>预计11月20日左右就可以给各地经销商供货。</strong></span><strong><span style=\\\"font-size:14px;\\\">&nbsp; </span></strong><img src=\\\"/admin/../uploadfile/image/20181025/20181025145855_15761.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /><img src=\\\"/admin/../uploadfile/image/20181025/20181025145855_34407.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /><img src=\\\"/admin/../uploadfile/image/20181025/20181025145855_37854.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /><img src=\\\"/admin/../uploadfile/image/20181025/20181025145855_61382.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /><img src=\\\"/admin/../uploadfile/image/20181025/20181025145856_64812.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /><img src=\\\"/admin/../uploadfile/image/20181025/20181025145856_96387.jpg\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /> \r\n</div>');
INSERT INTO `news` VALUES (159, '<p style=\\\"text-indent:2em;\\\">\r\n	<span style=\\\"color:#FFFFFF;font-size:32px;background-color:#4C33E5;\\\">&nbsp; 试&nbsp; 验&nbsp; 田&nbsp; 动&nbsp; 态 &nbsp;</span><span style=\\\"font-size:16px;\\\"><strong> &nbsp; &nbsp; &nbsp;</strong></span>&nbsp;\r\n</p>\r\n<p align=\\\"center\\\" style=\\\"text-indent:2em;\\\">\r\n	<span style=\\\"font-size:24px;\\\"><strong><span style=\\\"font-size:24px;\\\"><br />\r\n</span></strong></span> \r\n</p>\r\n<p align=\\\"center\\\" style=\\\"text-indent:2em;\\\">\r\n	<span style=\\\"font-size:24px;\\\"><strong><span style=\\\"font-size:24px;\\\">沁 丰 园 玉 米 试 验 田 长 势 喜 人</span></strong></span> \r\n</p>\r\n<p style=\\\"text-indent:2em;\\\">\r\n	<span style=\\\"font-size:16px;\\\"><strong></strong></span> \r\n</p>\r\n<hr class=\\\"ke-pagebreak\\\" style=\\\"page-break-after:always;\\\" />\r\n<p style=\\\"text-align:center;color:#333333;text-indent:2em;font-style:normal;font-weight:400;text-decoration:none;margin-left:0px;background-color:transparent;\\\">\r\n	<br />\r\n</p>\r\n<p style=\\\"text-align:center;color:#333333;text-indent:2em;font-style:normal;text-decoration:none;margin-left:0px;background-color:transparent;\\\">\r\n	<b></b><b></b> \r\n</p>\r\n<p style=\\\"text-align:left;text-indent:2em;margin-left:0px;\\\">\r\n	<strong> </strong> \r\n</p>\r\n<p style=\\\"text-align:left;text-indent:2em;\\\">\r\n	<span style=\\\"font-size:18px;\\\"><br />\r\n</span> \r\n</p>\r\n<p style=\\\"text-align:left;text-indent:2em;\\\">\r\n	<span style=\\\"font-size:18px;\\\">为了加快玉米新品种的更新换代步伐，选出适应性、丰产性、稳产性、抗病性、抗逆性、抗旱抗涝性好的新品种，我公司育种部正在努力进行中……</span> \r\n</p>\r\n<hr class=\\\"ke-pagebreak\\\" style=\\\"page-break-after:always;\\\" />\r\n<p style=\\\"text-align:left;text-indent:2em;\\\">\r\n	<span style=\\\"font-size:18px;\\\"><br />\r\n</span> \r\n</p>\r\n<p style=\\\"text-align:left;text-indent:2em;margin-left:0px;\\\">\r\n	<span style=\\\"font-size:18px;\\\">今年4月公司进行了玉米试验田的准备工作，试验田共设2600多个组合测配，200多个第二年组合筛选以及山西省青贮玉米品种自行试验。试验点玉米长势喜人。</span><span style=\\\"font-size:18px;\\\">目前公司育种部开始进行插牌、记录、观察、筛选等科研数据采集工作。</span> \r\n</p>\r\n<p style=\\\"text-indent:2em;\\\">\r\n	<br />\r\n</p>\r\n<p style=\\\"text-indent:2em;\\\">\r\n	<br />\r\n</p>\r\n<hr class=\\\"ke-pagebreak\\\" style=\\\"page-break-after:always;\\\" />\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\\\"text-indent:2em;\\\">\r\n	<br />\r\n</p>\r\n<p style=\\\"text-align:center;text-indent:2em;margin-left:0px;\\\">\r\n	<br />\r\n</p>\r\n<strong> \r\n<p align=\\\"center\\\">\r\n	<img width=\\\"500\\\" height=\\\"374\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20190724/20190724094458_73983.png\\\" /> \r\n</p>\r\n<p align=\\\"center\\\">\r\n	<img alt=\\\"\\\" src=\\\"/uploadfile/image/20190724/20190724094541_51441.png\\\" /> \r\n</p>\r\n<p align=\\\"left\\\">\r\n	<span style=\\\"color:#000000;font-size:24px;\\\"><span style=\\\"color:#000000;font-size:24px;\\\">我公司主要从事玉米、高粱种子的科研开发、生产加工和销售及服务业务，我们要做到：</span></span><span style=\\\"color:#000000;font-size:32px;\\\">更优质的种子、更周到的服务、农民更贴心信赖的朋友。</span><span style=\\\"font-size:32px;\\\"></span> \r\n</p>\r\n<p align=\\\"center\\\">\r\n	<img width=\\\"500\\\" height=\\\"302\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20190724/20190724094738_71036.jpg\\\" /> \r\n</p>\r\n<p align=\\\"left\\\">\r\n	<br />\r\n</p>\r\n</strong> \r\n<p style=\\\"text-indent:2em;\\\">\r\n	<br />\r\n</p>\r\n<p style=\\\"text-indent:2em;\\\">\r\n	<br />\r\n</p>\r\n<p style=\\\"text-indent:2em;\\\">\r\n	<br />\r\n</p>');
INSERT INTO `news` VALUES (166, '<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>山西沁丰园种业新品种发布会于9月12</strong></span><span style=\\\"font-size:16px;\\\"><strong><span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>日-9月14日山西长治成功举行。发布会以“新品种、新形势、新发展”为主题，正式发布了2021年审定的品种“沁丰12、沁丰876”以及新组合“沁丰1402、沁丰1403、沁丰108</strong></span><span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>.</strong></span></strong></span><span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>......”。</strong></span> \r\n</p>\r\n<p>\r\n	<img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919144819_32671.jpg\\\" width=\\\"800\\\" height=\\\"370\\\" /> \r\n</p>\r\n<p>\r\n	<img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919145003_66245.jpg\\\" width=\\\"800\\\" height=\\\"449\\\" /> \r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>公司总经理朱建优在会上就国际、国内形势分析以及公司发展</strong><strong>做了发言。</strong></span> \r\n</p>\r\n<img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919145307_72740.jpg\\\" width=\\\"800\\\" height=\\\"421\\\" /> \r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>产品部经理王超介绍了公司所有品种、组合，以及适合区域。</strong></span> \r\n</p>\r\n<img style=\\\"width:800px;height:413px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919145628_26794.jpg\\\" width=\\\"800\\\" height=\\\"969\\\" /> \r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>王宇奇经理阐述了“质量是企业的生存的根本”。</strong></span> \r\n</p>\r\n<img style=\\\"width:800px;height:504px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919145831_67659.jpg\\\" width=\\\"800\\\" height=\\\"600\\\" /> \r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>先正达陈经理讲述了沁丰园种业与先正达的长期战略合作。</strong></span> \r\n</p>\r\n<img style=\\\"width:800px;height:431px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150150_73786.jpg\\\" width=\\\"800\\\" height=\\\"533\\\" /> \r\n<p>\r\n	<br />\r\n<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>销售部总监常海亮讲解了窜货、低价销售对种业发展的危害，坚定公司控制市场的决心，保证经销商的利益。</strong></span> \r\n</p>\r\n<p>\r\n	<img style=\\\"width:800px;height:429px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150341_20879.jpg\\\" width=\\\"800\\\" height=\\\"533\\\" /> \r\n</p>\r\n<p>\r\n	<img style=\\\"width:800px;height:491px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150832_94680.jpg\\\" width=\\\"800\\\" height=\\\"600\\\" /> \r\n</p>\r\n<p>\r\n	<br />\r\n<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>会议最后对2020/2021年度优秀经销商进行了表彰与奖励。</strong></span> \r\n</p>\r\n<img style=\\\"width:800px;height:509px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150503_71380.jpg\\\" width=\\\"800\\\" height=\\\"600\\\" /><img style=\\\"width:800px;height:451px;\\\" alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150514_19814.jpg\\\" width=\\\"800\\\" height=\\\"600\\\" /> \r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong></strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>精彩瞬间</strong></span> \r\n</p>\r\n<p>\r\n	<img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150715_78211.jpg\\\" width=\\\"800\\\" height=\\\"1067\\\" /><img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150729_94210.jpg\\\" width=\\\"800\\\" height=\\\"1067\\\" /><img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150743_27461.jpg\\\" width=\\\"800\\\" height=\\\"1067\\\" /><img alt=\\\"\\\" src=\\\"http://www.sxqfykj.com/uploadfile/image/20210919/20210919150757_48095.jpg\\\" width=\\\"800\\\" height=\\\"1067\\\" /><span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>&nbsp;</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"color:#337fe5;font-size:16px;\\\"><strong>&nbsp;沁丰园将始终秉承“品种创新、质量为本”的经营理念，稳步发展。</strong></span> \r\n</p>');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `contentid` int(8) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `moreimage` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (123, '<p align=\"center\">\r\n	<img src=\"/uploadfile/image/20210303/20210303225404_52122.png\" alt=\"\" />\r\n</p>\r\n<div align=\"left\">\r\n	&nbsp;\r\n</div>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>品种介绍：</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>晋审玉20180038，黄色深马齿杂交品种，生育期在山西126天，积温为2700°C，株高275cm，穗位91cm，穗长23-28cm，穗行数16-18行，红轴，果穗筒型，千粒重435克，出籽率91.5%，品质好，牙势优成苗率高，苗齐，苗壮。</strong></span> \r\n</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"> \r\n<p>\r\n	<br />\r\n</p>\r\n</span> \r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>综合抗性：</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>抗玉米螟，中抗大斑病、小斑病、丝黑穗病、茎腐病和纹枯病，高抗倒伏。</strong></span> \r\n</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"> \r\n<p>\r\n	<br />\r\n</p>\r\n</span> \r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>产量高：</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>一般亩产1800-2200斤，具有亩产2600斤以上的增产潜力。</strong></span> \r\n</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"> \r\n<p>\r\n	<br />\r\n</p>\r\n</span> \r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>适宜区域：</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#FF9900;font-size:16px;\"><strong>山西春播中晚熟区均可种植，密度以3800-4000株为宜，旱坡地密度为3300-3500株更高产，施足底肥，精量播种，增产增收。</strong></span> \r\n</p>\r\n<div>\r\n	<br />\r\n</div>\r\n<p>\r\n	<br />\r\n</p>', 'a:1:{i:0;s:45:\"uploadfile/image/20181009/201810091028450.jpg\";}');
INSERT INTO `product` VALUES (167, '<p>\r\n	<strong>审定情况：</strong> \r\n</p>\r\n<p>\r\n	<strong>晋审玉20210058，甘</strong><strong>肃、内蒙、宁</strong><strong>夏、河北引种备案</strong> \r\n</p>\r\n<p>\r\n	<strong>特征特性：</strong> \r\n</p>\r\n<p>\r\n	<strong>山西春播生育期128天，株高290cm，穗位110cm，株形半紧凑，全株叶片21片，果穗筒形，穗轴红色，穗长25cm左右，穗行数16-18行，籽粒橘黄色，宽板粒深马齿，千粒重450g，出籽率89%，容重780g/L。</strong> \r\n</p>\r\n<p>\r\n	<strong>突出优势：</strong> \r\n</p>\r\n<p>\r\n	<strong>棒大穗匀，穗位整齐，根系发达，耐旱抗倒，活干成熟，高抗青枯病，中抗丝黑穗病，中抗大斑病。</strong> \r\n</p>\r\n<p>\r\n	<strong>产量表现：</strong> \r\n</p>\r\n<p>\r\n	<strong>一般亩产1800-2200斤/亩，高产地块具有2600斤/亩以上增产潜力</strong><br />\r\n<strong>&nbsp;</strong> \r\n</p>', 'a:1:{i:0;s:45:\"uploadfile/image/20211109/202111090301180.jpg\";}');
INSERT INTO `product` VALUES (126, '<p style=\"text-align:center;\">\r\n	<img src=\"/uploadfile/image/20210303/20210303225159_75090.png\" alt=\"\" />\r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<br />\r\n</p>\r\n<div class=\"__kindeditor_paste__\">\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>特征特性：</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>山西春播生育期126天左右，苗叶鞘紫色。成株株型半紧凑，株高281厘米，穗位90厘米，全株叶片数21片。雄穗分枝9～15个，花药浅紫色，花丝绿转浅紫色。果穗筒形，穗轴红色，穗长23厘米，穗行数16-18行左右，籽粒黄色，马齿型，千粒重412.0克，出籽率86.9%。品质：2016年河北省农作物品种品质检测中心测定，粗蛋白（干基）11.16%，粗脂肪（干基）3.24%，粗淀粉（干基）72.90%，赖氨酸（干基）0.30%。</strong></span> \r\n	</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"><br />\r\n</span> \r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>抗性：</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>抗病虫性：吉林省农业科学院植物保护研究所鉴定，2014年，高抗茎腐病，中抗大斑病、丝黑穗病、玉米螟；2015年，高抗茎腐病，中抗大斑病，抗玉米螟。</strong></span> \r\n	</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"><br />\r\n</span> \r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>产量表现：</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2014年承德市春播中熟组区域试验，平均亩产956.7千克；2015年同组区域试验，平均亩产972.0千克；2016年生产试验，平均亩产783.0千克。</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2018年参加山西省玉米品种引种备案试验，平均亩产819.9公斤，比对照大丰30增产6.5%。</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2017到2018年连续在山西试种，都比对照先玉335增产超过6%。在山西种植最高亩产达到2516斤。</strong></span>&nbsp;\r\n	</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"><br />\r\n</span> \r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>要点：</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>适宜播期为4月下旬至5月上旬，适宜密度为3800-4200株/亩。亩施玉米专用复合肥20千克、磷酸二铵15千克作底肥，拔节期亩追施尿素30千克。</strong></span> \r\n	</p>\r\n<span style=\"line-height:0.8;font-size:48px;font-weight:bolder;\"><br />\r\n</span> \r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>适宜地区：</strong></span> \r\n	</p>\r\n	<p>\r\n		<span style=\"color:#CC33E5;font-size:16px;\"><strong>该品种已经在山西引种备案，适合山西春播中熟区种植。</strong></span> \r\n	</p>\r\n</div>', 'a:0:{}');
INSERT INTO `product` VALUES (127, '<p style=\"text-align:center;\">\r\n	<img alt=\"\" src=\"/uploadfile/image/20181112/20181112125718_56339.png\" />&nbsp;<img alt=\"\" src=\"/uploadfile/image/20210108/20210108152233_17507.png\" /> \r\n</p>\r\n<p style=\"text-align:center;\">\r\n	<span style=\"color: rgb(53, 53, 53); font-family: -apple-system-font, BlinkMacSystemFont,;\" font-size:14px;line-height:22.4px;background-color:#ffffff;?=\"\">&nbsp;<span style=\"color:#009900;font-family:Microsoft YaHei;font-size:14px;background-color:#FFFFFF;\">生育期126天，株高285厘米，穗位100厘米，穗轴红色，果穗长24厘米，穗行数16-18行，千粒重405g，粒型马齿，抗性好。亩留苗3800株左右。芽率98%、纯度98%、净度99%。</span></span><span style=\"color: rgb(0, 153, 0); font-family: Microsoft YaHei; font-size: 14px; background-color: rgb(255, 255, 255);\" font-size:16px;line-height:22.4px;background-color:#ffffff;?=\"\">该品种已经在山西引种备案，</span><span style=\"color: rgb(0, 153, 0); font-family: Microsoft YaHei; font-size: 14px; background-color: rgb(255, 255, 255);\" font-size:16px;line-height:22.4px;background-color:#ffffff;?=\"\">适应山西春播中晚熟区。</span><span style=\"font-size:16px;\"></span> \r\n</p>', 'a:0:{}');
INSERT INTO `product` VALUES (132, '<div style=\\\"text-align:center;\\\">\r\n	<img src=\\\"uploadfile/image/20180801/201808011018100.png\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" />\r\n</div>', 'a:0:{}');
INSERT INTO `product` VALUES (133, '<div style=\\\"text-align:center;\\\">\r\n	<img alt=\\\"\\\" src=\\\"uploadfile/image/20180801/201808011018310.png\\\" width=\\\"600\\\" height=\\\"450\\\" /> \r\n</div>', 'a:0:{}');
INSERT INTO `product` VALUES (134, '<div style=\\\"text-align:center;\\\">\r\n	<img src=\\\"uploadfile/image/20180801/201808011018460.png\\\" width=\\\"600\\\" height=\\\"450\\\" alt=\\\"\\\" /> \r\n</div>', 'a:0:{}');
INSERT INTO `product` VALUES (137, '<img style=\\\"width:670px;height:431px;\\\" alt=\\\"\\\" src=\\\"/uploadfile/image/20181009/20181009131620_56238.jpg\\\" width=\\\"1456\\\" height=\\\"1081\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (142, '<img src=\\\"/uploadfile/image/20181025/20181025104246_58662.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (148, '<img src=\\\"/uploadfile/image/20181025/20181025105248_96703.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (149, '<img src=\\\"/uploadfile/image/20181025/20181025105329_13436.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (154, '<img src=\\\"/uploadfile/image/20181025/20181025110225_92592.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (155, '<img src=\"/uploadfile/image/20181025/20181025110308_47118.jpg\" alt=\"\" />', 'a:0:{}');
INSERT INTO `product` VALUES (145, '<img src=\\\"/uploadfile/image/20181025/20181025104809_53763.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (146, '<img src=\\\"/uploadfile/image/20181025/20181025105039_15356.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (147, '<img src=\\\"/uploadfile/image/20181025/20181025105143_47678.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (165, '<p style=\"text-align:center;\">\r\n	<span style=\"font-size:16px;color:#60D978;\"><strong><img src=\"/uploadfile/image/20210303/20210303222032_50641.jpg\" width=\"540\" height=\"771\" alt=\"\" /><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;color:#60D978;\"><strong><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;color:#60D978;\"><strong>审定编号：晋审玉20200047</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong><span style=\"color:#60D978;\">特征特性：</span></strong><span style=\"color:#60D978;\">山西春播中晚熟玉米区127天左右，株形紧凑，总叶片数19片，株高291厘米，穗位高103厘米，果穗锥到筒型，穗轴粉红色，穗长22.5厘米，穗行16-18行，行粒数39粒，籽粒黄色，马齿型，百粒重39.4克，出籽率89.7%。</span></span><span style=\"color:#60D978;\"></span> \r\n</p>\r\n<p>\r\n	<span style=\"line-height:1.5;\"><span style=\"font-size:16px;color:#60D978;\"> &nbsp; &nbsp;&nbsp;</span><span style=\"font-size:16px;color:#60D978;\">2018年、2019年山西农业大学抗病性接种鉴定综合结果:中抗丝黑穗病，中抗大斑病，中抗茎腐病，中抗穗腐病，感矮花叶病。2019年农业农村部谷物及制品质量监督检验测试中心(哈尔滨)检测:容重806克/升，粗蛋白 11.21%，粗脂肪3.57%，粗淀粉 75.37%。</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong><span style=\"color:#60D978;\">产量表现:</span></strong><span style=\"color:#60D978;\">2018年、2019年参加山西省春播中晚熟玉米区区域试验，2018年亩产820.8千克，比对照先玉 335 增产 5.6%;2019年亩产776.2千克，比对照先玉 335增产 7.9%;两年平均</span></span><br />\r\n<span style=\"font-size:16px;color:#60D978;\">产798.5千克，比对照增产6.8%。2019年自行开展生产试验，均亩产840.0千克，比对照增产 8.4%。</span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong><span style=\"color:#60D978;\">优点：</span></strong><span style=\"color:#60D978;\">行数18行居多，属于大穗型品种。</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong><span style=\"color:#60D978;\">栽培要点：</span></strong><span style=\"color:#60D978;\">亩留苗3800-4000株。</span></span> \r\n</p>\r\n<p>\r\n	<span style=\"font-size:16px;\"><strong><span style=\"color:#60D978;\">适宜区域：</span></strong><span style=\"color:#60D978;\">山西省中晚熟玉米区，黑龙江、辽宁、吉林、内蒙、河北引种备案区域种植。</span></span> \r\n</p>', 'a:1:{i:0;s:45:\"uploadfile/image/20210303/202103031018370.jpg\";}');
INSERT INTO `product` VALUES (153, '<img src=\\\"/uploadfile/image/20181025/20181025105516_79352.jpg\\\" alt=\\\"\\\" />', 'a:0:{}');
INSERT INTO `product` VALUES (162, '<p>\r\n	<strong><span style=\"color:#60D978;font-size:16px;\"><img alt=\"\" src=\"/uploadfile/image/20200905/20200905141142_56256.jpg\" /><br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#60D978;font-size:16px;\">★特征特性:</span></strong> \r\n</p>\r\n<span style=\"color:#60D978;font-size:16px;\">山西春播生育期128天左右，品种株型紧凑型，株高295厘米，穗位116厘米，果穗筒型，穗长约28厘米左右，穗行数18行，穗轴红色，籽粒黄色，籽粒类型为半马齿型，百粒重39.5克，出籽率为87.3%。</span><br />\r\n<strong><span style=\"color:#60D978;font-size:16px;\">★优势:</span></strong><br />\r\n<span style=\"color:#60D978;font-size:16px;\">棒大，行数多，耐旱，中抗大斑病，中抗穗腐病，中抗灰斑病，中抗茎腐病，抗丝黑穗病、抗青枯病。</span><br />\r\n<strong><span style=\"color:#60D978;font-size:16px;\">★产量表现:</span></strong><br />\r\n<span style=\"color:#60D978;font-size:16px;\">2019年参加同组生产试验，平均亩产762.3公斤，比对照增产9.6%。</span><br />\r\n<p>\r\n	<span style=\"color:#60D978;font-size:16px;\">2019年在山西省多点试验，比对照增产8.2%，具有2600斤以上的增产潜力。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#60D978;font-size:16px;\"><strong>★栽培要点:</strong></span> \r\n</p>\r\n<span style=\"color:#60D978;font-size:16px;\">亩留苗3700株为最佳密度，水浇地可留苗4000株/亩左右。</span><br />\r\n<strong><span style=\"color:#60D978;font-size:16px;\">★适应区域:</span></strong><br />\r\n<span style=\"color:#60D978;font-size:16px;\"><span style=\"color:#60D978;\">适宜在辽宁省活动积温2800</span><span style=\"color:#60D978;font-size:16px;background-color:#FFFFFF;\">°C</span><span style=\"color:#60D978;\">以上中晚熟玉米类型区种植，山西省春播中晚熟区种植，吉林、</span></span><span style=\"color:#60D978;font-size:16px;\">河北、陕西等地同一生态区引种备案地区种植。</span><br />\r\n<br />', 'a:0:{}');
INSERT INTO `product` VALUES (161, '<p>\r\n	<strong><span style=\"color:#E53333;font-size:16px;\"><img src=\"/uploadfile/image/20200905/20200905141209_87879.jpg\" alt=\"\" /><br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#E53333;font-size:16px;\">特征特性：</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:16px;\">山西春播生育期127天左右，品种株型半紧凑，株高260厘米，穗位93厘米，果穗筒型，穗长25厘米，穗行数16-18行，穗轴红色，籽粒黄色，籽粒类型为半马齿型，百粒重39.8克，出籽率88.2%。</span> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#E53333;font-size:16px;\">优势：</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:16px;\">矮杆、大棒、耐密植、果穗匀、中抗大斑病、中抗穗腐病、抗丝黑穗病、抗青枯病。</span> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#E53333;font-size:16px;\">产量表现：</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:16px;\">2019年参加同组生产试验，平均亩产754.3公斤，比对照增产3.7%。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:16px;\">2019年在山西省多点试验中，比对照增产7.2%，具有2620斤以上增产潜力。</span> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#E53333;font-size:16px;\">栽培要点：</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:16px;\">亩留苗4000株左右，水浇地可留苗4200株/亩左右。</span> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#E53333;font-size:16px;\">适应区域：</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#E53333;font-size:16px;\"><span style=\"color:#E53333;\">适宜在辽宁省有效积温2800</span><span style=\"color:#E53333;font-size:16px;background-color:#FFFFFF;\">°C</span><span style=\"color:#E53333;\">以上中晚熟玉米类型区种植，山西省春播中晚熟区种植，吉林、内蒙、河北、陕西、等同一生态区引种备案地区种植。</span></span> \r\n</p>', 'a:0:{}');
INSERT INTO `product` VALUES (163, '<p>\r\n	<strong><span style=\"color:#9933E5;font-size:16px;\"><img src=\"/uploadfile/image/20200905/20200905141114_44484.jpg\" alt=\"\" /><br />\r\n</span></strong> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#9933E5;font-size:16px;\">特征特性:</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#9933E5;font-size:16px;\">山西生育期128天左右,株高290cm左右， 穗位高100cm左右,果穗简型,穗轴红色，穗长27cm,穗行数18行，行粒数48粒，籽粒为半马齿型，百粒重约39 8克，出籽率87.2%。</span> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#9933E5;font-size:16px;\">优势:</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#9933E5;font-size:16px;\">棒大，行数18行居多，根系发达，耐旱，中抗穗腐病、茎腐病、丝黑穗病，高抗青枯病。</span> \r\n</p>\r\n<strong><span style=\"color:#9933E5;font-size:16px;\">产量表现:</span></strong><br />\r\n<span style=\"color:#9933E5;font-size:16px;\">2019年参加同组生产试验，平均亩产787.5kg,比对照增产5.5%; 2019年在山西省大同、朔州、盂县、寿阳、昔阳临县等地种植试验，比对照增产7. 1%。</span><br />\r\n<p>\r\n	<strong><span style=\"color:#9933E5;font-size:16px;\">栽培要点:</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#9933E5;font-size:16px;\">亩留苗3700株为最佳密度，水浇地留苗4000株左右。</span> \r\n</p>\r\n<p>\r\n	<strong><span style=\"color:#9933E5;font-size:16px;\">适应区域:</span></strong> \r\n</p>\r\n<p>\r\n	<span style=\"color:#9933E5;font-size:16px;\"><span style=\"color:#9933E5;\">适宜在辽宁省活动积温2800</span><span style=\"color:#9933E5;font-size:16px;background-color:#FFFFFF;\">°C</span><span style=\"color:#9933E5;\">以上的中晚熟玉米类型区种植，山西晋中、忻州等地春播中晚熟区种植。</span></span> \r\n</p>', 'a:0:{}');
INSERT INTO `product` VALUES (164, '<p>\r\n	<span style=\"color:#4C33E5;font-size:16px;\"><strong><img alt=\"\" src=\"/uploadfile/image/20200905/20200905140958_52182.jpg\" /><br />\r\n</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#4C33E5;font-size:16px;\"><strong>特征特性:</strong></span> \r\n</p>\r\n<span style=\"color:#4C33E5;font-size:16px;\">山西春播区生育期127天，株高300cm, 穗位120cm, 果穗筒型，株型半紧凑，穗长27cm，穗行数20-22行，出籽率85. 7%，百粒重38.7克。</span><br />\r\n<span style=\"color:#4C33E5;font-size:16px;\"><strong>突出优势:</strong></span><br />\r\n<span style=\"color:#4C33E5;font-size:16px;\">旱地专用品种，棒大，行数20-24行，超耐旱，抗丝黑穗病、大斑病、青枯病，是旱地品种的首选。</span><br />\r\n<span style=\"color:#4C33E5;font-size:16px;\"><strong>产量表现:</strong></span><br />\r\n<p>\r\n	<span style=\"color:#4C33E5;font-size:16px;\">2018年在山西省各区域旱地，山坡地种植试验，平均亩产752kg。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#4C33E5;font-size:16px;\">2019年在山西省各区域旱地，山坡地种植试验，平均亩产703kg。</span> \r\n</p>\r\n<span style=\"color:#4C33E5;font-size:16px;\"><strong>栽培要点:</strong></span><br />\r\n<p>\r\n	<span style=\"color:#4C33E5;font-size:16px;\">亩留苗3500株左右，极旱地块留苗3300株/亩左右。</span> \r\n</p>\r\n<p>\r\n	<span style=\"color:#4C33E5;font-size:16px;\"><strong>适应区域:</strong></span> \r\n</p>\r\n<span style=\"font-size:16px;\"><span style=\"color:#4C33E5;\">山西省中晚熟春播玉米区旱地种植。辽宁省活动积温2800</span><span style=\"color:#4C33E5;font-size:16px;background-color:#FFFFFF;\">°C</span><span style=\"color:#4C33E5;\"></span><span style=\"color:#4C33E5;\">以上中晚熟玉米类型区旱地种植。</span></span><br />', 'a:0:{}');
INSERT INTO `product` VALUES (168, '<p>\r\n	<strong>审定情况：</strong> \r\n</p>\r\n<p>\r\n	<strong>晋审玉20210052，甘</strong><strong>肃、内蒙、宁</strong><strong>夏、河北引种备案</strong> \r\n</p>\r\n<p>\r\n	<strong>特征特性：</strong> \r\n</p>\r\n<p>\r\n	<strong>山西春播生育期128天，株高275cm，穗位105cm，株形半紧凑，全株叶片22片，果穗筒形，穗轴红色，穗长23-25cm左右，穗行数18-20行，籽粒橘黄色，行粒数42粒，千粒重426g，出籽率90%。</strong>\r\n</p>\r\n<p>\r\n	<strong>综合抗性</strong>&nbsp;\r\n</p>\r\n<p>\r\n	<strong>2019年、2020年山西农业大学抗病性接种鉴定综合结果：抗丝黑穗病，中抗大斑病，抗茎腐病，中坑穗腐病，综合抗性好，适应性广。</strong>\r\n</p>\r\n<p>\r\n	<strong>产量表现：</strong> \r\n</p>\r\n<p>\r\n	<strong>一般亩产1800-2200斤/亩，高产地块具有2500斤/亩以上增产潜力</strong>\r\n</p>', 'a:1:{i:0;s:45:\"uploadfile/image/20211109/202111090318430.jpg\";}');

-- ----------------------------
-- Table structure for qq
-- ----------------------------
DROP TABLE IF EXISTS `qq`;
CREATE TABLE `qq`  (
  `id` int(4) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `qq` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `inputtime` int(10) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = FIXED;

-- ----------------------------
-- Records of qq
-- ----------------------------
INSERT INTO `qq` VALUES (1, '商业服务', '3054951780', 0, 1322019561);

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `inputtime` int(10) NOT NULL DEFAULT 0,
  `truename` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `age` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telephone` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `degree` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` char(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `school` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `work` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of resume
-- ----------------------------

-- ----------------------------
-- Table structure for single
-- ----------------------------
DROP TABLE IF EXISTS `single`;
CREATE TABLE `single`  (
  `contentid` int(8) NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of single
-- ----------------------------
INSERT INTO `single` VALUES (101, '<p class=\"MsoNormal\" style=\"text-align:justify;\">\r\n	<span style=\"line-height:2;font-size:18px;\"><span style=\"line-height:2.5;font-family:\'Arial Black\';\">&nbsp; &nbsp; &nbsp; </span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">西红柿含有丰富的营养，又有多种功用被称为神奇的菜中之果。它所富含的维生素</span></span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">A原</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">，在人体内转化为维生素</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">A</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">，能促进骨骼生长，防治佝偻病、眼干燥症、夜盲症及某些皮肤病的良好功效。现代医学研究表明，人体获得维生素</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">C</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">的量，是控制和提高肌体抗癌能力的决定因素。西红柿内的苹果酸和柠檬酸等有机酸，还有增加胃液酸度，帮助消化，调整胃肠功能的作用。西红柿中含有果酸，能降低胆固醇的含量，对高血脂症很有益处。据药理研究，西红柿汁有缓慢降低血压、利尿、消肿作用，对高血压、肾病等病人，有良好的辅助治疗作用。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:justify;\">\r\n	<span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">&nbsp; &nbsp; &nbsp; &nbsp;西红柿还具有美容功效。西红柿所含谷胱肽是维护细胞正常代谢不可缺少的物质，能抑制酷氨酸酶的活性，使沉着于皮肤和内脏的色素减退或消失，起到预防蝴蝶斑或老人斑的作用。将西红柿捣烂取汁，加少量蜂蜜及新鲜黄豆粉调匀，涂面部和手臂，</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">15</span><span style=\"line-height:2;font-size:18px;font-family:\'Microsoft YaHei\';\">分钟后洗净，常用能减皱纹。常饮西红柿汁，或用西红柿汁洗脸，能使面容光泽红润。</span> \r\n</p>\r\n<p class=\"MsoNormal\" style=\"text-align:justify;\">\r\n	<span style=\"line-height:2;font-size:18px;\"><br />\r\n</span> \r\n</p>');
INSERT INTO `single` VALUES (121, '<p>\r\n	<span style=\\\"line-height:2;font-family:NSimSun;color:#e53333;font-size:24px;\\\"><strong>地址：山西省太原市小店区北格</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"line-height:2;font-family:NSimSun;color:#e53333;font-size:24px;\\\"><strong>销售电话： 常经理&nbsp;13834583622</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"line-height:2;font-family:NSimSun;color:#e53333;font-size:24px;\\\"><strong>&nbsp; &nbsp; &nbsp; &nbsp;王经理&nbsp;18536826918</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"line-height:2;font-family:NSimSun;color:#e53333;font-size:24px;\\\"></span>&nbsp;<span style=\\\"line-height:2;font-family:NSimSun;color:#e53333;font-size:24px;\\\"><span><span style=\\\"color:#e53333;\\\"><strong>全国服务</strong></span></span><span style=\\\"color:#e53333;\\\"><strong>热线</strong></span><strong>：400-800-4333</strong></span> \r\n</p>');
INSERT INTO `single` VALUES (122, '<p>\r\n	<span style=\\\"font-size:18px;\\\"><span style=\\\"background-color:#e53333;\\\"></span>&nbsp; &nbsp; &nbsp; </span><span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>山西沁丰园农业科技有限公司，成立于2013年，现注册资金3000万元，公司主要经营玉米、高粱种子，拥有较强的技术实力，固定职工17人，其中高级技术职务人员2人，研究生4人，可以满足农作物育种、引种、生产、加工、质量检验各项经营活动。</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp; &nbsp; &nbsp;</strong></span><span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp;公司下设育种部、生产部、营销部、产品部等四个非独立性经营实体，设有财务科、办公室两个管理服务部门。</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp; &nbsp; &nbsp;</strong></span><span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp;育种部主要职能是引进、选育玉米新品种，生产超级原种。近年来育种科研方面取得了不少成绩，目前已经审定的品种有：脊玉809、佳昌689、F3588<strong>、</strong>Q100<strong>、</strong>H717<strong>、</strong>LY156<strong>、</strong>金育328<strong>、邦农151、青贮玉米沁丰206、沁丰12、沁丰876.</strong></strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 生产部的职能主要是杂交种子、原种亲本种子的生产。现拥有较为稳定的高质量的生产基地1万亩,年产种子200万公斤。&nbsp;</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span><span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>营销部主要负责新品种示范推广，市场开发和产品营销，现产品主要销往山西、河南、内蒙、辽宁等4个省市。</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 产品部主要职责为新品种测试及筛选，品种审定相关工作及公司产品定位和产品布局。</strong></span>&nbsp;\r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp; &nbsp; &nbsp;&nbsp;</strong></span><span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp;沁丰园人坚持以“诚信 专业 敬业 创新”为企业精神，以“立足产品，打造精品”为理念。历经几年的发展，公司产品在山西、河南、内蒙、辽宁连年表现现突出，沁丰园的科普营销人员和技术服务团队常年活跃在祖国的大江南北。21世纪是生物科技的时代，21世纪的世界属于中国，中国的首要问题是农民问题。&nbsp;</strong></span> \r\n</p>\r\n<p>\r\n	<span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>&nbsp; &nbsp; &nbsp; </strong></span><span style=\\\"background-color:#ffffff;color:#e53333;font-size:18px;\\\"><strong>沁丰园人正以饱满的热情，昂扬的斗志，走在“科技兴农”的大道上，走在时代发展的前列。</strong></span> \r\n</p>');
INSERT INTO `single` VALUES (102, '<p style=\"text-align:justify;\" class=\"MsoNormal\" align=\"justify\">\r\n	<span style=\"line-height:2;font-size:24px;\"><span style=\"font-family:Microsoft YaHei;font-size:18px;\"><span style=\"font-family:Microsoft YaHei;font-size:18px;\">&nbsp; &nbsp; &nbsp; &nbsp;有机西红柿生产与常规西红柿生产的根本不同在于病虫草害和肥料使用的差异，其要求比常规西 红柿生产高。有机西红柿在生产过程中完全不使用农药、化肥、生长调节剂等化学物质，不使用转基因工程技术，本农场的有机西红柿，是严格按照有机食品的生产环境质量要求和生产技术规范来生产，以保证它的无污染、富营养和高质量的特点。</span></span> </span> \r\n</p>\r\n<p style=\"text-align:justify;\" class=\"MsoNormal\" align=\"justify\">\r\n	<br />\r\n</p>\r\n<p style=\"text-align:justify;\" class=\"MsoNormal\">\r\n	<br />\r\n</p>');
INSERT INTO `single` VALUES (100, '<p style=\"text-align:justify;\" class=\"MsoNormal\" align=\"justify\">\r\n	<span style=\"line-height:2;font-family:Microsoft YaHei;font-size:18px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">襄汾县贵升现代农业科技农场，位于襄汾县景毛乡北李村，西临临夏线，南街襄乡线，地势平坦，交通便利。本农场成立于</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">2016</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">年，是在原襄汾县鑫达水泥厂旧厂址基础上转产所建的，利用闲置工业用地建设而成的。经过政府领导的多次考察论证，将鑫达水泥厂原水泥库</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">2</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">个，</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">4000</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">平方米改造为连栋温室，采用无土栽培模式生产有机蔬菜，以工业化的理念谋划农业，以产业化思路经营农业，预计年产值可达</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">16</span><span style=\"line-height: 2; font-family: Microsoft YaHei; font-size: 18px;\" YaHei?;font-size:18px;?=\"\" Microsoft=\"\">万公斤，这是我们一个大的转型跨越，特别感谢县领导的支持和帮助。本农场主要从事蔬菜种植，生产，销售，观光，采摘等。现主要种植有机西红柿。</span> \r\n</p>\r\n<p style=\"text-align:justify;\" class=\"MsoNormal\">\r\n	<br />\r\n</p>');

-- ----------------------------
-- Table structure for urlrule
-- ----------------------------
DROP TABLE IF EXISTS `urlrule`;
CREATE TABLE `urlrule`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `class` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ishtml` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `urldemo` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` char(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_fixed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of urlrule
-- ----------------------------
INSERT INTO `urlrule` VALUES (1, 'list', 0, 'index.php?m=content&c=index&f=lists&catid=1&page=1', 'index.php?m=content&c=index&f=lists&catid=[catid]&page=[page]', 1);
INSERT INTO `urlrule` VALUES (2, 'show', 0, 'index.php?m=content&c=index&f=show&catid=1&contentid=1', 'index.php?m=content&c=index&f=show&catid=[catid]&contentid=[id]', 1);
INSERT INTO `urlrule` VALUES (3, 'list', 1, 'it/news/1.html', '[categorydir]/[catdir]/[page].html', 1);
INSERT INTO `urlrule` VALUES (4, 'show', 1, '2012/1212/1.html', '[year]/[month][day]/[id].html', 1);
INSERT INTO `urlrule` VALUES (5, 'list', 0, 'list/1/1.html', 'list/[catid]/[page].html', 1);
INSERT INTO `urlrule` VALUES (6, 'show', 0, 'show_1_1.html', 'show_[catid]_[id].html', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT 10,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `password_reset_token`(`password_reset_token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
