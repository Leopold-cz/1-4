/*
MySQL Backup
Source Server Version: 8.0.11
Source Database: practice
Date: 2021/5/10 20:24:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) DEFAULT NULL,
  `teacher_name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `term` varchar(255) DEFAULT NULL,
  `capacity` int(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pattern` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `menu_role`
-- ----------------------------
DROP TABLE IF EXISTS `menu_role`;
CREATE TABLE `menu_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nameZh` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `student_count`
-- ----------------------------
DROP TABLE IF EXISTS `student_count`;
CREATE TABLE `student_count` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `age` varchar(50) DEFAULT NULL,
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `homeland` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `subject` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `mail` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `wechat` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `school` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `college` varchar(255) DEFAULT NULL,
  `height` double(10,2) DEFAULT NULL,
  `weight` double(10,2) DEFAULT NULL,
  `identify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `new_age` int(255) DEFAULT NULL,
  `grade` varchar(255) DEFAULT NULL,
  `work_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'userID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `phone` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '住宅电话',
  `address` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系地址',
  `enabled` tinyint(1) DEFAULT '1',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
--  Table structure for `user_role`
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Records 
-- ----------------------------
INSERT INTO `course` VALUES ('1','Java','徐传运','2020-2021','第一学期','60');
INSERT INTO `menu` VALUES ('1','/',NULL,'1','所有',''), ('2','/home','1','1','所有管理','Home'), ('3','/db/**','2','1','成绩管理','Score'), ('4','/admin/**','2','1','基本信息','Information'), ('5','/student/**','2','1','学生管理','Student'), ('6','/home','1','1','权限管理','Home'), ('7','/user/**','6','1','用户管理','UserManage'), ('8','/teacher/**','2','1','教师管理','Teacher'), ('9','/course/**','2','1','课程管理','Course');
INSERT INTO `menu_role` VALUES ('1','3','1'), ('2','4','2'), ('3','5','3'), ('4','7','2'), ('5','8','3'), ('6','9','3');
INSERT INTO `role` VALUES ('1','ROLE_dba','数据库管理员'), ('2','ROLE_admin','系统管理员'), ('3','ROLE_user','用户');
INSERT INTO `student` VALUES ('29','徐昊','22','男'), ('31','老萧','23','女'), ('32','黄录','21','男'), ('33','沈志杰','21','男'), ('34','马光健','21','男'), ('35','舒畅','21','男');
INSERT INTO `student_count` VALUES ('1','3');
INSERT INTO `teacher` VALUES ('55','李姗','2021-03-17','女','','壮族','软件需求工程','1826086577','HiShan3@outlook.com','45678908765','党员','重庆师大','计算机','160.00','90.00',NULL,NULL,NULL,NULL,NULL), ('58','丽莎','2018-03-14','女','','壮族','计算机网络,数据库','23457654','12345654@qq.com','123454321','党员','重庆师范大学','计算机','178.00','150.00',NULL,NULL,NULL,NULL,NULL), ('59','清大哥','2012-03-12','男','','汉族','数据结构,数据库','12345','123434@163.com','12345654','群众','重庆大学','数学','190.00','180.00',NULL,NULL,NULL,NULL,NULL), ('60','李姗儿','2000-01-29','女','中国','汉族','数据结构','17357814188','416688109@qq.com','18260865477','预备党员','华南理工大学','软件学院','160.00','90.00',NULL,NULL,NULL,NULL,NULL), ('61','1','2021-04-06','女','1','1','数据结构,软件需求工程,数据库','1','1','1','1','1','1','1.00','1.00',NULL,NULL,NULL,NULL,NULL), ('62','lishans','2021-04-07','女','重庆市-沙坪坝区-尖顶坡','1','计算机网络','1','1','1','1','1','1','1.00','1.00',NULL,NULL,NULL,NULL,NULL), ('63','二七','2021-04-12','女','重庆市-沙坪坝区-微电园','壮族','计算机网络,软件需求工程','13456789876','12345673456','234567567','党员','1','1','1.00','1.00',NULL,NULL,NULL,NULL,NULL), ('64','语子','2021-04-13','男','重庆市-沙坪坝区-尖顶坡','苗族','计算机网络,数据库','18260865477','hishaner@outlook.com','18260865477','预备党员','中山大学','数据与计算机学院','160.50','94.55',NULL,NULL,NULL,NULL,NULL), ('65','气死我了','1995-04-03','男','重庆市-沙坪坝区-陈家桥','回族','数据库,数据结构,软件需求工程,软件测试,计算机网络','17347814188','tokkishan@163.com','tokki','预备党员','华南师范大学','数学学院','172.00','121.00',NULL,NULL,NULL,NULL,NULL), ('66','tokki','2021-04-04','男','重庆市-沙坪坝区-大学城','汉族','计算机网络,数据库,数据结构,软件需求工程,软件测试','18712345674','tokki@qq.com','tokki3','群众','北京大学','数学学院','182.00','135.00',NULL,NULL,NULL,NULL,NULL), ('67','errrr','2021-04-04','男','重庆市-沙坪坝区-陈家桥','汉族','计算机网络','18712345671','2435465786@qq.com','12345554','党员','ddfjdi','dfasg','160.20','90.00',NULL,NULL,NULL,NULL,NULL), ('68','wer','2021-03-28','女','重庆市-沙坪坝区-尖顶坡','汉族','计算机网络,数据库','15723456781','rtyui@qq.com','ertyuio','预备党员','nnsad','fgd','176.00','153.00',NULL,NULL,NULL,NULL,NULL), ('69','qwert','2021-03-28','男','重庆市-沙坪坝区-大学城','回族','计算机网络,数据库','19212345678','wert@qq.com','ertyui','党员','qwer','qwer','170.00','121.00','450121200001294248','20','20','2019',NULL), ('70','wert','2021-01-19','男','重庆市-沙坪坝区-陈家桥','汉族','计算机网络','19260865477','ertyuio@163.com','ertyuio','党员','tyui','tyui','176.00','190.00','45121200001294248','29','2017','2019','大笨猪.。'), ('71','还是','1994-04-11','女','重庆市-沙坪坝区-尖顶坡','汉族','计算机网络,数据库','17260865477','hijump@163.com','ertyuio','群众','清华大学','问学院','172.00','120.00','450199411204248','28','2020','2020','加油'), ('72','issss','1991-02-12','女','重庆市-沙坪坝区-尖顶坡','壮族','计算机网络,数据库','18260865477','416688109@qq.com','34567898765','党员','中山大学','数据与计算机学院','171.00','100.00','450121199102124248','30','2018','20000501','也');
INSERT INTO `user` VALUES ('1','超级管理员','18568887789','029-82881234','哈尔滨','1','admin','$2a$10$bevf8t3broLT4mXMnGn2P.FQeiLtGF9xF8jfjqW5mUBI0j5ThFsuC',NULL), ('2','徐昊','18568123489','029-82123434','重庆','1','xuhao','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.',NULL), ('3','老王','18568123666','029-82111555','广州','1','laowang','$2a$10$oE39aG10kB/rFu2vQeCJTu/V/v4n6DRR0f8WyXRiAYvBpmadoOBE.',NULL), ('8','老张',NULL,NULL,NULL,'1','laozhang','$2a$10$lv5kCzOsIVXVrYSOxykyGOUPpW.AIJ9.rAIVk6EJ6nxOyFGVmC0Zq',NULL), ('9','老李',NULL,NULL,NULL,'0','laoli','$2a$10$s3.qcTY9tw9egA.UoyBZ8Oyi6.NVAW84P6mN.A8wcgzXJQho.Ck9i',NULL), ('11','哈哈哈',NULL,NULL,NULL,'1','hhh','$2a$10$30.wi4mGO6.wWgG2TEVw/O5glfMG1TWpgeEi7xK5Y5GvrQglQlH86',NULL);
INSERT INTO `user_role` VALUES ('1','1','1'), ('2','1','2'), ('3','2','2'), ('4','3','3'), ('5','1','3');
