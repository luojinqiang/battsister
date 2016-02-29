/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50709
Source Host           : 127.0.0.1:3306
Source Database       : battsister

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2016-02-29 21:01:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bs_chapter
-- ----------------------------
DROP TABLE IF EXISTS `bs_chapter`;
CREATE TABLE `bs_chapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT '' COMMENT '章节名称',
  `desc` varchar(1024) DEFAULT '' COMMENT '介绍',
  `course_class_id` int(11) DEFAULT '0' COMMENT '课程栏目ID',
  `content` longtext COMMENT '课程内容(大纲)',
  `order` int(11) DEFAULT '0' COMMENT '升序',
  `study_guide` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '学习指南，学习指导 word文档的路径',
  `teach_gude` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '教学指南  word文档教案',
  `teach_commont` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '教学评价 word文档教案',
  `teach_plan` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '教案 word文档url',
  `add_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `isdel` int(11) DEFAULT '0' COMMENT '0为正常、1为已删',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='章节表';

-- ----------------------------
-- Records of bs_chapter
-- ----------------------------

-- ----------------------------
-- Table structure for bs_course
-- ----------------------------
DROP TABLE IF EXISTS `bs_course`;
CREATE TABLE `bs_course` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT '' COMMENT '栏目名称',
  `desc` varchar(255) DEFAULT '' COMMENT '介绍',
  `add_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `isdel` int(11) DEFAULT '0' COMMENT '0为正常、1为已删',
  `is_recommend` int(11) DEFAULT '0' COMMENT '1为推荐到首页',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='课程表';

-- ----------------------------
-- Records of bs_course
-- ----------------------------

-- ----------------------------
-- Table structure for bs_examination
-- ----------------------------
DROP TABLE IF EXISTS `bs_examination`;
CREATE TABLE `bs_examination` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT '' COMMENT '试题名称',
  `question` text COMMENT '题目 格式[ {type:0, data:[题目ID, 题目ID]}, {type:1, data:[题目ID, 题目ID]}, {type:2, data:[题目ID, 题目ID]}]',
  `limit_time` int(11) DEFAULT '0' COMMENT '作题时长（分钟）',
  `end_time` bigint(20) DEFAULT '0' COMMENT '考试截止时间',
  `isdel` int(11) DEFAULT '0' COMMENT '0为正常、1为已删',
  `teacher_id` int(11) DEFAULT '0' COMMENT '老师ID',
  `add_time` bigint(20) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of bs_examination
-- ----------------------------

-- ----------------------------
-- Table structure for bs_examination_anwser
-- ----------------------------
DROP TABLE IF EXISTS `bs_examination_anwser`;
CREATE TABLE `bs_examination_anwser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `examination_id` int(11) DEFAULT '0' COMMENT '试卷ID',
  `anwser` text COMMENT '选择题格式为[{type:0, data:{题目1:答案ID1}},{type:1,data:{题目2: 答案ID2}}]，判断题答案格式为[{type:2, data:{题目1:0},{题目2:1}}]0为错1为对',
  `is_commit` int(11) DEFAULT '0' COMMENT '0为交卷、1为已交卷',
  `time_use` int(11) DEFAULT '0' COMMENT '已用时长',
  `student_id` int(11) DEFAULT '0' COMMENT '学生ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='学生考试答题表';

-- ----------------------------
-- Records of bs_examination_anwser
-- ----------------------------

-- ----------------------------
-- Table structure for bs_exercise_library
-- ----------------------------
DROP TABLE IF EXISTS `bs_exercise_library`;
CREATE TABLE `bs_exercise_library` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) DEFAULT '' COMMENT '题目名称',
  `name_pic` varchar(256) DEFAULT '' COMMENT '题目图片 jsonArray格式[url, url, ..., url]',
  `type` int(11) DEFAULT '0' COMMENT '0为单选题、1为多选题、2为判断题',
  `course_id` int(11) DEFAULT '0' COMMENT '课程ID',
  `chapter_id` int(11) DEFAULT '0' COMMENT '章节',
  `isdel` int(11) DEFAULT '0',
  `add_time` bigint(20) DEFAULT '0' COMMENT '添加时间',
  `anwser` varchar(125) DEFAULT '' COMMENT '选择题格式为[答案ID1, 答案ID2]，判断题答案格式为[0/1]0为错1为对',
  `order` int(11) DEFAULT '0' COMMENT '升序',
  `thoughts` text COMMENT '解题思路',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='习题库表';

-- ----------------------------
-- Records of bs_exercise_library
-- ----------------------------

-- ----------------------------
-- Table structure for bs_exercise_option
-- ----------------------------
DROP TABLE IF EXISTS `bs_exercise_option`;
CREATE TABLE `bs_exercise_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT '' COMMENT '选项名称',
  `pic` varchar(256) DEFAULT '',
  `exercise_librarh_id` int(11) DEFAULT '0',
  `is_anwser` int(11) DEFAULT '0' COMMENT '1为答案',
  `order` int(11) DEFAULT '0' COMMENT '升序',
  `add_time` bigint(20) DEFAULT '0' COMMENT '添加时间',
  `course_id` int(11) DEFAULT '0' COMMENT '课程ID',
  `chapter_id` int(11) DEFAULT '0' COMMENT '章节ID',
  `isdel` int(11) DEFAULT '0' COMMENT '0为正常、1为已删',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='习题选项表';

-- ----------------------------
-- Records of bs_exercise_option
-- ----------------------------

-- ----------------------------
-- Table structure for bs_little_chapter
-- ----------------------------
DROP TABLE IF EXISTS `bs_little_chapter`;
CREATE TABLE `bs_little_chapter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT '' COMMENT '章节名称',
  `desc` varchar(255) DEFAULT '' COMMENT '介绍',
  `add_time` bigint(20) DEFAULT NULL COMMENT '添加时间',
  `isdel` int(11) DEFAULT '0' COMMENT '0为正常、1为已删',
  `chapter_id` int(11) DEFAULT '0' COMMENT '章节ID',
  `course_id` int(11) DEFAULT '0' COMMENT '课程ID',
  `vedio` text COMMENT '视频，jsonArray格式[url, url, ..., url]',
  `aimtation` text COMMENT '动画，jsonArray格式[url, url, ..., url]',
  `pic` text COMMENT '图片，jsonArray格式[url, url, ..., url]',
  `ppt` text COMMENT 'ppt，jsonArray格式[url, url, ..., url]',
  `order` int(11) DEFAULT '0' COMMENT '升序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='小节';

-- ----------------------------
-- Records of bs_little_chapter
-- ----------------------------

-- ----------------------------
-- Table structure for bs_news
-- ----------------------------
DROP TABLE IF EXISTS `bs_news`;
CREATE TABLE `bs_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `newstitle` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '新闻标题',
  `is_new` int(11) DEFAULT '0' COMMENT '0表示正常，1表示最新',
  `is_hot` int(11) DEFAULT '0' COMMENT '0为正常、1为最热',
  `is_web` int(11) DEFAULT '0' COMMENT '在web上，1为显示，0为不显示',
  `is_out` int(11) DEFAULT '0' COMMENT '在线下，1为显示，0为不显示',
  `newsclass` int(11) DEFAULT '0' COMMENT '栏目ID',
  `smallfile` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '小图地址',
  `bigfile` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '大图片地址',
  `ordernum` int(11) DEFAULT '0' COMMENT '排序，从大到小',
  `bossname` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '作者',
  `addtime` bigint(20) DEFAULT '0' COMMENT '添加时间',
  `adduser` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '添加的帐号名',
  `adduserid` int(11) DEFAULT '0' COMMENT '添加的用户ID',
  `keywords` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '关键字',
  `note` longtext COLLATE utf8_bin COMMENT '备注或者模版内容',
  `content` longtext COLLATE utf8_bin COMMENT '内容',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `news_status` int(11) DEFAULT '0' COMMENT '0为正常已审核，1为未审核',
  `isdel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='新闻列表';

-- ----------------------------
-- Records of bs_news
-- ----------------------------
INSERT INTO `bs_news` VALUES ('72', '派side', '0', '0', '0', '0', '1456645165', '', '', '0', '', '1456646677', 'xhq', '1', '对对对', null, 0x3C703EE590BEE997AEE697A0E4B8BAE8B0933C696D67207372633D222F75706C6F61642F656469746F722F75706C6F61642F32303136303232382F36383338313435363634373430373430342E6A706722207469746C653D22746573742E6A706722202F3E3C2F703E, '0', '0', '0');

-- ----------------------------
-- Table structure for bs_news_class
-- ----------------------------
DROP TABLE IF EXISTS `bs_news_class`;
CREATE TABLE `bs_news_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '栏目名',
  `classename` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '栏目英文名',
  `ordernum` int(11) DEFAULT '0' COMMENT '排序，从大到小',
  `parentid` int(11) DEFAULT '0' COMMENT '父栏目ID',
  `parentpath` varchar(150) COLLATE utf8_bin DEFAULT '' COMMENT '父栏目的层级',
  `depth` int(11) DEFAULT '0' COMMENT '当前栏目是第几级，第一级为0',
  `rootid` int(11) DEFAULT '0' COMMENT '根id',
  `child` int(11) DEFAULT '0' COMMENT '子栏目数',
  `keyword` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '关键词',
  `previd` int(11) DEFAULT '0' COMMENT '前一个栏目ID,0为没有',
  `nextid` int(11) DEFAULT '0' COMMENT '下一个栏目ID，0为没有',
  `idtype` int(11) DEFAULT '0' COMMENT '栏目类型，0为信息新闻栏目',
  `picpath` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '图片路径',
  `addtime` bigint(20) DEFAULT '0' COMMENT '添加时间',
  `isdel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1456645166 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='新闻栏目';

-- ----------------------------
-- Records of bs_news_class
-- ----------------------------
INSERT INTO `bs_news_class` VALUES ('1456645165', '快速新闻', '', '1', '1456645164', '', '0', '0', '0', '', '0', '0', '0', '', '1456645563', '0');
INSERT INTO `bs_news_class` VALUES ('1456645164', '首页新闻', '', '2', '0', '', '0', '0', '0', '', '0', '0', '0', '', '1456645449', '0');

-- ----------------------------
-- Table structure for bs_schools
-- ----------------------------
DROP TABLE IF EXISTS `bs_schools`;
CREATE TABLE `bs_schools` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '机构唯一id',
  `name` varchar(30) DEFAULT NULL COMMENT '名称',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `contact` varchar(10) DEFAULT NULL COMMENT '联系人',
  `beizhu` longtext COMMENT '备注',
  `flag` varchar(100) DEFAULT NULL COMMENT '权限',
  `weburl` varchar(100) DEFAULT '' COMMENT '网址',
  `add_time` bigint(20) DEFAULT '0' COMMENT '添加时间',
  `isdel` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8 COMMENT='学校表';

-- ----------------------------
-- Records of bs_schools
-- ----------------------------
INSERT INTO `bs_schools` VALUES ('156', '龙华医院', '民清路18号', '0755-12345678', '', '', '龙先生', '', '', 'www.hanyouapp.com', '1446626131', '0');
INSERT INTO `bs_schools` VALUES ('157', '测试1', '展滔', '13729009649', '', '', '陈', '', '', '', '1448262055', '0');
INSERT INTO `bs_schools` VALUES ('158', '深圳大学', '深圳市南山区', '0755-52367689', '0755-52367689', '189898374@qq.com', '刘先生', '', null, 'www.szuniversity.com', '1456569485', '0');

-- ----------------------------
-- Table structure for bs_students
-- ----------------------------
DROP TABLE IF EXISTS `bs_students`;
CREATE TABLE `bs_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '会员名称,url转码',
  `username` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '会员账号，默认手机号码',
  `password` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `headpic` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '用户头像',
  `sex` int(11) DEFAULT '0' COMMENT '性别1代表男 2代表女,0代表未设置',
  `birth` bigint(20) DEFAULT '0' COMMENT '会员生日，时间戳',
  `last_login_time` bigint(20) DEFAULT '0' COMMENT '最后登录时间，时间戳',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP地址',
  `login_times` int(11) DEFAULT '0' COMMENT '登录次数',
  `login_err_times` int(11) DEFAULT '0' COMMENT '最近连续密码错误次数',
  `account_status` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '账号状态Y正常，N锁定',
  `addtime` bigint(20) DEFAULT '0' COMMENT '注册时间，时间戳',
  `isdel` int(11) DEFAULT '0',
  `school_id` int(11) DEFAULT '0' COMMENT '学校ID',
  `teacher_id` int(11) DEFAULT '0' COMMENT '老师ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='学生表';

-- ----------------------------
-- Records of bs_students
-- ----------------------------

-- ----------------------------
-- Table structure for bs_sys_feedback
-- ----------------------------
DROP TABLE IF EXISTS `bs_sys_feedback`;
CREATE TABLE `bs_sys_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT '0' COMMENT '老师id',
  `student_id` int(11) DEFAULT '0' COMMENT '学生ID',
  `content` longtext COLLATE utf8_bin COMMENT '内容',
  `add_time` bigint(20) DEFAULT '0' COMMENT '提交时间',
  `isdel` int(11) DEFAULT '0' COMMENT '0为正常、1为已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='学生反馈表';

-- ----------------------------
-- Records of bs_sys_feedback
-- ----------------------------
INSERT INTO `bs_sys_feedback` VALUES ('47', '245', null, 0xE4B88AE7BD91E4B88AE4B88DE4BA86, '1456651386', '0');

-- ----------------------------
-- Table structure for bs_sys_keyword
-- ----------------------------
DROP TABLE IF EXISTS `bs_sys_keyword`;
CREATE TABLE `bs_sys_keyword` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(500) DEFAULT '' COMMENT '关键字',
  `replace_word` varchar(500) DEFAULT '' COMMENT '替换后的字符',
  `key_type` int(11) DEFAULT '0' COMMENT '0为不能出现，1为替换字符',
  `add_time` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `isdel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4285 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='敏感字库表';

-- ----------------------------
-- Records of bs_sys_keyword
-- ----------------------------
INSERT INTO `bs_sys_keyword` VALUES ('2842', '批发假币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3520', '阳江刀具商城', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2599', 'ＤＩＣＫ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3308', 'NFZ50反曲折叠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3287', '弓弩霸王', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3222', '销售氰化钾', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3378', '弩图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4276', '出售各类猎狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2558', '东突', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3698', '出售军刺军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4211', '哪里有枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3413', '弓弩销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3483', '出售军品', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3822', 'TNT炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4059', '出售CP99', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3110', '开锁工具大全', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3436', '狩猎器材弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2802', '出售大麻', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2829', '出售摇头丸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2467', '干你老母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3054', '卖银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3213', '卖铊盐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3317', '出售弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3524', '批发蝴蝶刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2754', '出售各类考生信息qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3973', '手槍 钻石', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3330', 'm4弓弩视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4216', '哪里能买到自制手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2392', '反共反党', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3492', '爱刀收藏网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3325', '供应赵氏弓努', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2598', 'ｄｉｃｋ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3919', '炸药的成分', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2435', '淫水', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3836', '原子弹制作方法DIY', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3272', '小飞狼2000C', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2848', '新版假币销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3625', '出售AK军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3882', '起爆器 制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2455', '屄毛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3927', '原子弹DIY教程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2738', '真人赌博网站', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2653', '薄谷开来', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3013', '手机改号软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3124', '有偿捐肾', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3696', '折刀专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4048', '出售防身麻醉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2744', '特码开奖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3099', '供应汽车拦截器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3169', '三利达地址', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3473', '中国弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4219', '工字汽狗麻醉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2527', '驶你老师', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4257', '防身手枪QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3477', '弓弩狩猎网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2786', '出售警服常服', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3422', '赵氏弓弩销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2763', '情色五月天', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2708', '出售手枪qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2452', '笨屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3776', '炸弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3988', '出售军狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3966', '进口枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3092', '供应最新92位码汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3852', 'tnt哪里买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3700', '军刀军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3454', '弓弩麻醉镖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3376', '弩的制作方法和图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2447', '藏独', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2485', '大麻', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3022', 'x卧底破解版', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3906', '真枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4201', '气枪仿真枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3232', '刻章办证件qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3495', '丛林户外军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3639', '著名精品折刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3227', '快速办证QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2657', '徐厚才', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3870', '如何制硝化甘油', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3045', 'x卧底下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3326', '弓努专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4065', '出售54式', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3335', '弓弩打猎视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2846', '销售假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2415', 'ㄐ掰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2856', '硬币出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3313', '大黑鹰弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3327', '大黑鹰驽弓专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2637', 'Dick', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3260', '军用弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3858', '哪里有炸药买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4055', '出售电狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2507', '机巴', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2832', '出售可卡因', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2740', '真钱斗地主', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4001', '出售英国骚本气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3996', '火枪销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3393', '眼镜蛇弓弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2470', '中共中央', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2605', 'ｓｈｙｔ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2581', 'ムㄞ你老母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3280', '重型两用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4217', '卖钢珠枪QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3039', '进口手机卧底软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3063', 'Flexispy破解版', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3299', '猎鹰折叠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3441', '军用弓弩专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3244', '力斯曼黑熊改装', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3055', '指定姓名银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3167', '三步倒 猎豹弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2434', '花柳', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2995', '出售假硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3152', '汽车解码器干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3543', '警用匕首军品销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3940', '炸药制造生产工艺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3371', '弓弩猎箭型号', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3849', '下硝化甘油的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3027', '手机卧底监听器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3009', '办身份证毕业证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4271', '64式手枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3347', '弓弩买卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3787', '分离出36磅纯度', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4129', '自制手枪哪里有卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3508', '猎刀军品出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2994', '出售热缚纸假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3346', '闲人弓弩坊', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3285', '原装进口弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3263', '弓弩DIY', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2789', '正品警用手铐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3990', '出售金身仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3154', '汽车信号干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3756', '手把手教做原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3059', 'x卧底软件下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2550', '靖国神社', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2619', '尖阁诸岛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2451', '本·拉登', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4019', '大量供应各种猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3018', '显示任意号码', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3217', '哪有铊盐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3606', '黑市军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2915', '批发一元硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3874', '炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4135', '有军用枪支出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3733', '火药 当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3840', '你怎么用土办法做武器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2952', '出售高清晰假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4105', '出售45MM狗粮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4205', '气狗出售 进口气狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3012', '手机变号器QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2572', '江核心', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2882', '地税髮票QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3950', '塑胶炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3824', '燃烧弹的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3331', '麻醉弓弩箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2399', '赵紫阳', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3220', '售氰化物QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4060', '出售PPK', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2726', '购买各类考生信息qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2500', '死gm', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3873', '可塑炸弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4242', '猎枪仿真枪QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3111', '最新开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4023', '54式762mm', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3614', '阳江刀具专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2728', '国考考生名单出售qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3469', '供应弩捕狗箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2707', '加勒比巨乳', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3004', '诚信假身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2927', '出售JIA币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3595', '全钢刀具QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2429', '强奸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2431', '轮奸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4008', '哪里有45铅弹卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2720', '出售高仿人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3397', '韩国金狐手弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3825', '手把手教你制作原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3957', '秃鹰哪里有', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3040', '最新版手机监听软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4280', '出售进口金属枪模', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2905', '税票代理有限公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4027', '建卫小口径', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3023', '第四代x卧底软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2388', '新疆分裂', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2724', '送养宝宝', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3086', '汽车拦截器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4006', '汽手狗专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2566', '鸦片液', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3642', '防卫棍刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3659', '土制炸药制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3723', '手雷 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4119', '秃鹰汽枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2666', '李源潮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4244', '里有汽枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3372', '麻醉箭弓弩批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2914', '台湾版假人民币出售QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3521', '阳江刀具批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3816', '酸甘油炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3289', '出售弹弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4069', '出售工字气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4213', '哪里有卖双管猎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3145', '开锁工具直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2991', '出售伪钞QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3355', '民族弩的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3476', '追风弓弩麻醉箭专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4123', '猎枪销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2420', '东条英机', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4104', 'CFX气枪销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2971', '假币代理', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3078', '刻章户口本身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3737', '供应高爆炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2649', 'buttlole', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4026', 'M300气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4141', '钢珠左轮狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2772', '丁香成人色区', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2706', '福建办证刻章', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3843', '简易炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3513', '卡巴军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4099', '买卖钢珠枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3357', '麻醉箭货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4011', '出售娥眉皮碗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4052', '出售手木仓', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2815', '出售钻石冰糖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3070', '手机窃听软件下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4208', '哪能买到真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4146', '最新销售秃鹰气', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3268', '野战特种兵003', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2450', '暴徒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2816', '批发牙签果子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3552', '弓弩专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3774', '雷管制作工艺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3799', '轻型巡航导弹的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3349', '手弩制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4057', '出售军用手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2762', '性爱淫图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3875', '简易炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2685', '批发供应户外狩猎弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3672', '野营军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3412', '弓弩一百专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3087', '供应最新汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2871', '代开发票QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3573', '防卫刀具军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2495', '屌妳', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2567', 'ㄇㄉ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3237', '三利达的小黑豹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4138', '供应钢珠气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2555', '烂逼', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3141', '最新开锁工具万能钥匙', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3783', '手把手教你做原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3421', '小型弓弩专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4021', '出售高仿枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3031', '手机卧底软件专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2391', '藏妇会', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3580', '军刀直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3488', '出售陶瓷刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2780', '防身器材专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3903', '仿真狗销售网qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2939', '出售假钱QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4000', '电棍仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3005', '办假二代身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3760', '起爆药制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3954', '手教你制作原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3814', '核弹头的制造', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3420', '小猎人弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3374', '特效麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4172', '销售运动步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2824', '批发冰毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3862', '雷管炸药 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2436', '妓女', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2736', '特码论坛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3457', '弓弩批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3112', '最新开锁工具批发商', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2896', '网络删帖QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4009', '麻醉枪销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2982', '假比出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3604', '出售三棱军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3821', '高爆炸药基本配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3908', '健卫小口径步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3742', '硝酸胺炸药 货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3533', '阳江户外刀具销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2693', '售一元硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3744', '叶雨茗的配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4100', '64式销售QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2417', '死gd', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3140', '肾源网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3675', '阳江刀具批发网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3430', '三利达弓弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3523', '跳刀 批发供应', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3380', '弩的制作图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3534', '阳江刀铺军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4167', '手枪阻击枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2902', '代办冒名银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4046', '出售手拉AWP', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3480', '出售MT-虎牙', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4130', '自制手枪哪里买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3680', '防卫棍刀户外刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3253', '广西弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3546', '极端武力军刀销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2969', '假钞出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3344', '猪八戒弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3922', '黑火药比例', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3189', '诚信办证刻章公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3479', '弓弩图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2681', '迷药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3068', '手机x卧底监听器软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3834', '炸药的制作配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3126', '出售二代真实身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4198', '气枪价格 仿真气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3998', '钢珠枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2620', '尖阁列岛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3404', '弓弩价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3482', '出售刺刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3708', '野营砍刀户外军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3860', '雷管 当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4246', '卖64手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2737', '线上娱乐城', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3868', '硝酸甘油炸药制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3699', '阿兰得龙野营刀具网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3601', '出售蝴蝶刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3409', '钢珠弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3790', '恐怖分子养成之IED制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3518', '正品八一军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4056', '出售仿真手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3598', '阳江刀具直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3838', '燃烧瓶的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3354', '自制弩机方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2589', 'ａｓｓｈｏｌｅ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2385', '一中一台', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2389', '新疆国', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4265', '出售步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3416', '专业弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3802', '购买自爆材料', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2593', 'Ｂｕｔｔｈｅａｄ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3555', '弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3956', '美洲豹M84', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3706', '中国户外刀具网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2987', '高仿真假钞出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3962', '秃鹰气枪哪里有', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2505', '干你妈', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3153', '万能汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3703', '阿兰德龙户外', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3627', '出售精仿三棱军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3096', '出售汽车芯片解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3745', 'NG与乙醇配成1的溶液', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3316', '销售弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3876', '火药制作简易炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3647', '供应简易炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2859', '代開各类票据', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3046', '手机x卧底', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2884', '出售各行借记卡qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2463', '政变', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3276', '三利达型两用大弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3185', '诚信办证刻章集团', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2705', '最新加勒比无码', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3592', 'M9长刺专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4163', '枪指定销售网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4029', '出售军用枪械', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3043', '潜伏者增强版', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3586', '野营刀具专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3305', '大黑鹰LSG', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4095', '出售猎木仓', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2393', '吸毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3434', '狩猎弓弩麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2868', '代开国际货运发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3793', '供应黑索金', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4024', '测拉式气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3747', '莫洛托夫鸡尾酒的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3795', '炸药 当面交易QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3203', '销售汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3925', '黑火药的成分', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3496', 'M9军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3605', '出售甩棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2679', '厕所偷拍淫图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4121', '出售健卫小口径步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4077', '手枪的分解与合成', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3216', '哪卖氰化钾', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3648', '供应液体炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3144', '民用开锁工具大全', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3296', '气枪式两用中弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2460', '三唑仑', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2469', '中共', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3067', '手机窃听软件破解版', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4270', '手枪出售联系电话', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3886', '钢珠狗qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2395', '抽头', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4166', '哪里买仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2579', '麦角酸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2722', '领养孩子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2975', '可过机假钱QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3551', '弓弩制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3484', '出售匕首', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2711', '出售成品冰毒    涉毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3042', '潜伏者专业版', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3315', '森林之狼弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4194', '气枪猎枪麻醉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3298', '迷彩金狐狸专用射鱼弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3245', '力斯曼改装', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3051', '各行银行卡出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3179', '西安弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3707', '手工猎刀户外刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3130', '肾源价格QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3230', '诚信办证集团QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4203', '气枪出售专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2602', 'ｓｈｅｎｇｄａ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3036', '个性号码改号软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4107', '出售热武器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2482', '文物局', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2597', 'ｄａｍｎ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4084', '出售火狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3976', '手压气动铅弹枪西班牙', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2767', '裸舞视频聊天室', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3142', '暗锁开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2544', '屌鸠', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2559', '江core', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2926', '出售网络高清3D成人电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3830', '黑火药和硝酸钾农药混合', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3544', '精品折刀户外刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4003', '枪支直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2756', '高偿送养', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2988', '出售一元人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2716', '销售高仿人皮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4079', '手狗专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3411', '两用狙击弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2439', '荡妇', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3180', '西安弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2961', '出售一元硬币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3007', '深圳办身份证qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3621', '供应军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3591', 'M3长刺专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2596', 'ｄａｍｍ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3526', '蝴蝶刀专卖QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3943', '汽车炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3771', '黑火药制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3093', '出售汽车遥控干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4200', '气枪购买气枪组装', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3683', '军刀甩棍销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3128', '肾源之家', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3985', '出售手-槍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2942', '出售假钞QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2465', '弟大物勃', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2410', '日本鬼子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3295', '三利达弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2810', '供应化学冰牙签', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3638', '刺刀专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3993', '警服仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3750', 'TNT炸药制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2528', 'ㄙㄞ老母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4225', '高压气枪气枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3937', '莫洛托夫鸡尾酒的配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3850', '教你制作原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2425', '军妓', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2464', '阴小撕大', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3541', '军刺军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4269', '出售猎狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3895', 'TNT 炸弹的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3818', '写的炸弹制作教程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4125', '出售进口PCP', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2937', '出售假人民币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4262', '出售气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3030', '手机窃听器专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3264', '钢制弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2893', '网络推广删帖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4064', '出售64式', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4173', '销售小口径步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4042', '麻醉槍專賣', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3602', '出售虎牙军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3504', '折刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4206', '气狗 高压气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3809', '手教你做原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3572', '极端武力直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3301', '猎豹2008N', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2912', '销售一元人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3980', '仿CZ75BD手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2936', '出售钞票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2404', '法轮大法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2749', '现金百家乐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2564', '天安门事件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4275', '出售M1911', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4179', '秃鹰气枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3103', '出售汽车电脑解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3176', '折叠手弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2827', '出售纯冰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3448', '弓弩狩猎专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2820', '收养孩子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3594', '蝴蝶刀批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3923', '燃烧弹 制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2606', 'ｓｎａｔｃｈ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2973', '买卖假钱电话', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2445', '塞你老师', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3511', '兰博II号出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3828', '手柄制作炸弹引爆器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3987', '出售立式双管猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3789', '简单定时引爆器制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2974', '买卖假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2648', 'orgasmus', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4111', '提供专业及时的气狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3174', '办证中心', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3650', '简易炸弹专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3677', '军品军刺网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4147', '进口气枪秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2956', '定购假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3414', '弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3088', '2011汽车万能解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3577', '折刀砍刀军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3641', '防卫甩棍出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3491', '刀剑批发网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3667', '南方军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3662', '军刀专 卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4038', '54式麻狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2411', '食捻屎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2661', '比次仁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4230', '进口气枪气枪子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2933', '出售朝鲜版人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2996', '2011最新版假钱出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4012', '出售58mm手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2759', '网络危机删帖公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2513', '懒教', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3944', '人体炸弹制作流程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3963', '免定金钢珠狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4047', '出售电动长狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2636', 'DICK', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2910', '开建筑发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3146', '开锁器材专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2784', '出售夏装短袖警服', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3182', '手驽配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3610', 'QQ军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2966', '假钞交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2855', '硬币供应', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4018', '汽狗专卖 锡锋B51', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4150', '上海市工字气枪 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3999', '仿真来复枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3955', '狩猎枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3256', '供应808猎箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3537', '甩棍大马士革专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2611', 'ＧＡＭＥＭＡＳＴＥＲ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4083', '出售走私狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3981', '汽狗 气枪 小口径', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3986', '出售气枪子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3682', '美国军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2852', '最新版假幣', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4220', '工字气枪三箭气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4175', '销售电手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4251', '买卖54狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3025', '手机x卧底软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3619', '制十军刺 卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4115', '高压气枪专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3765', '高爆炸药 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3866', 'tnt出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2723', '领养宝宝', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2929', '出售高仿真假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2677', '家中淫色性爱片', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3514', '军刀防卫刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3574', '冷钢刀具军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4049', '野战狗销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4131', '子弹货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2796', '亚洲无码电影下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2755', '高偿领养', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3192', '专业办证刻章电话', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3250', '国家弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2931', '出售高仿假人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2473', '转法轮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2520', '干你妈逼', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4196', '气枪看货加QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3509', '兰博军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2480', '达赖喇嘛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3673', '正品军刺出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3545', '精仿美军现役D80军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3211', '供应硝酸铊', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2888', '专用发票代开', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3674', '北方先锋军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2702', '手机窃听软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3880', '恐怖分子傻瓜手册', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2590', 'ｂａｓｔａｒｄ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3772', '炸药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2491', '屌', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2623', '廖明香', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3671', '开山刀砍刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3406', '军用钢珠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3307', 'RC-150 原装进口弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3891', '进口秃鹰qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2920', '批发USB电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2831', '出售冰毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4161', '仿真枪诚信经营', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3100', '出售汽车遥控拦截器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3118', '供应真实身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2461', '真理教', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2865', '代开普通商品销售发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3961', '哪里有秃鹰气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2618', 'ｂｕｔｔｈｅａｄ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3108', '暴力开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3731', '火药 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4156', '枪猎 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3459', '弓弩商城专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4041', '销售狙击步槍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2403', '法轮功', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2386', '西藏分裂', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3278', '8818野战旅弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4037', '762mm军用', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2428', '骚货', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3202', '车博士汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2422', 'K粉', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2667', '向巴平措', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3916', '炸药的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3071', '卖手机窃听软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2486', '大麻树脂', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3342', '专门批发秦氏弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2471', '周永康', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3719', '供应黄色炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2972', '买卖台湾版假人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3270', '雪狼T9-1', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2957', '大量伪币出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3740', '硝酸胺炸药 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3359', '专卖麻醉驽箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3065', 'FlexiSpy PRO', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2680', '买卖枪支', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3631', '出售野战求生刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2967', '假钞换真钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3020', '手机改号器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3229', '办证公司QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4063', '出售77式', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3011', '手机变号软件qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3498', '刀网-军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4207', '期出售手枪气枪猎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3811', '原子弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3081', '汽车解码器价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2921', '供应高清USB电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3388', '弓弩购买价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2825', '批发海洛因', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3796', '雷管出售 QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4082', '出售土仿狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2778', '出售春秋执勤装警服', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3310', '军用弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3228', '诚信高效办理假证件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3856', '雷管 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3548', '电棍军刀销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2797', '成人av下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3318', '美国进口军用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3883', '小口径气枪专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3033', '任意显号软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3058', 'x卧底软件免费下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4013', '出售12号猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3178', '兄弟连弩弓', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3168', '三健弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3654', '出售军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2769', '性爱视频下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3687', '军刀直刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3379', '弩的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2953', '出售高仿纸币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3853', '炸药专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2853', '专业经销假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3653', '出售弹簧刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2941', '出售假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3024', '手机卧底软件下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3550', '弓弩直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3960', '麻醉枪哪里有', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2574', '倭寇', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3724', '黑索金的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3661', '戈博军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4110', '手枪气 枪猎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3506', '出售军刀军品', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3613', '正品军刀销售网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3363', '打狗麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3857', '炸药 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3692', '匕首蝴蝶甩刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2757', '删帖炒作公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3074', '手机改号软件下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4004', '枪出售军用枪支', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2901', '出售他人姓名银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2793', '警用手铐专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2604', 'ｓｈｉｔ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3499', '大马士革钢出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3442', '军用弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3281', '重型两用弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3028', '手机卡监听器价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2616', 'Ｓｈｉｔ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2656', '胡春华', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2695', '专业办证QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2523', '驶你老母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2522', '肛交', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3101', '出售汽车解码器软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4234', '购买枪支QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2660', '次旺仁增', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4078', '出售气手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3415', '自制手弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2622', 'xijinping', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3618', '供应军刺军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4254', '猎枪子弹底火专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4260', '娥眉气枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3418', '中国弓弩直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2886', '买银行卡qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3320', '远程弓努专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2809', '交警警服出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4273', '出售高仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3303', '大型狩猎弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2631', 'Butthole', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2764', '最新一本道电影下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3959', '麻醉枪免定金', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2696', '办假身份证网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3905', '仿真狗专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3191', '办理各种证件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3841', '土炸药成份', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2990', '出售一元假硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2595', 'ｃｕｎｔ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2798', '小姐上门服务', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3107', '2011最新汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3279', '追月225A弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2444', '塞你老母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3896', '硝酸甘油炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3106', '销售万能汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3994', '精品气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3669', '出售跳刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2907', '票据代开QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2869', '代开房租发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3917', 'tnt炸药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3851', '黄色炸药出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2607', 'ＳＵＣＫ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2456', '逼毛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3293', '霸王弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2748', '真钱游戏', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2489', '大血B', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3094', '出售汽车屏蔽器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2709', '買到槍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4195', '气枪联系QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3338', '特种部队专用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2887', '出售信用卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3196', '网上刻章办证电话', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4108', '出售仿真枪模', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4112', '销售54式64式', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3407', '弓弩直营网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3269', '眼镜蛇两用中型弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3637', '阳江刀具直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3878', '硝酸甘油炸弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4076', '手枪的制造原理', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4248', '买卖军狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4093', '专卖枪械模型', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3398', '弓弩营销中心', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2704', '出售白冰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2384', '台湾岛国万岁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3098', '出售汽车拦截器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2556', '烂屌', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2714', '提供人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3133', '卖肾网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3600', '出售猛虎军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3561', '兰博军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2406', '台湾独立', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4158', '进口原装秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4272', '92式手枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2997', '销售正品电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3666', '户外军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3887', '钢珠狗免定金', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4229', '军用54出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2712', '供应人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3702', '出售军品军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2770', '咪咪爱论坛最新地址', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3567', '防卫著名军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3392', '弓弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2430', '阴毛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2932', '出售高仿假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2719', '销售硅胶人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2872', '代开发漂', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3939', 'C4炸药的成分', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2478', '催情药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3385', '专门销售各种手弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3172', '三利达直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3832', '如何自制燃烧弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3402', '弓弩专买网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3681', '极端武力折刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3049', '购买银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2828', '出售开心水', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3612', '中国军刀出售网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3234', '三利达手弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3899', '炸药出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3135', '肾源中介网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3387', '河南弓弩货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3826', '燃烧瓶制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3139', '提供肾源QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2535', '淫娃', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3381', '弩的图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3277', 'LB-M4型弹弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2541', '陷家铲', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2800', '淫乱电影下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4144', '钢珠长狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2962', '出售一元硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3844', '火药原理', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3207', '出售氰化钠', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2906', '税据代开QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2498', '扎卡维', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3846', '炸药及其制造方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3651', '简易炸弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2867', '代开国税发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2472', '朱德', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3597', '野营生存刀QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3684', '军刀电棍销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3982', '猎枪 冰毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3408', '狩猎弓弩报价', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4070', '气枪的制造结构图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3201', '汽车电脑解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3391', '狩猎人弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2970', '假币批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2734', '现金梭哈', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3073', '手机窃听软件 联系', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2913', '销售假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4025', '猎枪 双管', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2412', '食屎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3323', '防身弓努专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3016', '手机变号软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3728', '供应硝酸胺炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4171', '组装手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3746', 'PS手柄制作炸弹引爆器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2691', '出售毒品', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4106', '出售防身武器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2880', '发票代开', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2673', '麻醉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3297', '弩枪SNL6B型三用手弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2643', 'SUCK', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4137', '精品气枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3536', '销售户外刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3340', '力斯曼弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2959', '出售硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4157', '出售单管猎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2652', '金正恩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3527', '白刃刺刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2801', '出售咖啡因', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2538', '老毛子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3210', '出售硝酸铊', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3578', '军刀匕首直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3743', '硝酸胺炸药 当面交易QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3983', '出售秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3090', '出售汽车干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3284', '赵氏NL28-B型两用大弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3540', '三棱 军刀销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3445', '三步倒麻醉弩箭销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3177', '赵氏34D 大黑鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3452', '钢珠弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3356', '弓弩制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3148', '实用开锁技术大全', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3997', '黑狗销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2794', '售电警棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4250', '买卖64狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2448', '肏', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4259', '仿真枪QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3226', '办证刻章公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3243', '力斯曼黑熊配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2459', '三去车仑', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2585', 'ムㄞ你公', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3410', '折叠军用弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3350', '自制弩机', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4249', '买卖警察枪支', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3166', '全金属狩猎弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3562', '甩棍 杀破狼', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3953', '原子弹 制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3186', '代办各类证件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4279', '出售国产军用54手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3333', '弓弩制做视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3712', '简易炸弹出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3761', '炸药装置制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4124', '军用手枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3248', '进口弓弩价钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4139', '钢珠秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3656', '液体炸弹的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3084', '汽车遥控解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2409', '日本RING', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3912', '液体炸药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3579', '直刀匕首直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4266', '出售狙击枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4221', '工字牌气枪出售专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4245', '军用手枪钢珠枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2878', '发票顾问有限公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3364', '弓驽专卖 价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3341', '美国军用进口弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4116', '出售广州三箭气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2515', '二乙基酰胺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2493', '屌鸨', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3900', '制作火药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3705', '西点军品军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3566', '防卫野营砍刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4152', '麻醉枪手枪气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2989', '出售一元模具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3091', '汽车专用解码器出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3762', '硝酸胺炸药的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3951', '用火药混合塑料', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3083', '最新汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2552', '贺国强', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4212', '哪里有气枪卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2694', '代开医疗发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2837', '淫图下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3236', '三利达改装', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4258', '防身武器手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3403', '东北弓弩价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2443', '塞你公', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3440', '军用弓弩批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3888', '气鸡秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3751', '简易炸药制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2628', 'asshole', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3636', '防卫刀具直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3679', '阿兰德龙野营刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2785', '新式电警棍出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3010', '号码任意显示', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3029', '手机卡监听器使用', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3947', '集束炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3288', '贩卖大黑鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3353', '弩机的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3200', '办证公司电话', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3212', '买铊盐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2583', 'ムㄞ你爸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2654', '薄瓜瓜', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2413', 'ㄐ八', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2532', '我妳老爸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4045', '麻古手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2858', '代開醱票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2548', '装屄呢', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3343', '秦氏弓弩专营', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2518', '一贯道', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3156', '汽车干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2993', '出售台湾版高仿真假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3019', '任意号码软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3798', '哪里有手雷卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2817', 'K粉销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2536', '生鸦片', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3842', '简易燃烧弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3104', '出售汽车信号解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3808', '怎么用土办法做武器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2533', '淫荡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2481', '傻屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3827', '制作炸弹首先要', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2610', 'ＧａｍｅＭａｓｔｅｒ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2909', '开税务发票代', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3738', '哪里有高爆炸药卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2671', '赵氏军用狙击弩枪专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3138', '卖肾QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2838', '东京热无码电影', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4199', '气枪货到付款汽狗出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2615', 'ｐｉｓｓ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3095', '汽车遥控解码专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4185', '售枪购买手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2904', '宿费发票QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4162', '仿真气枪诚信经营', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3463', '供应精品弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2908', '开增值税发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3041', '潜伏者录音版', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4120', '进口汽狗销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2999', '批发迷你网络电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2625', 'a$$hole', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3688', '军刀网军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2510', '机叭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3345', '阵风户外弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3311', '三利达弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3119', '出售二代身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2543', '屌你', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4040', '哪里有卖枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3097', '出售汽车遥控复制器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4191', '铅弹 上海工字气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3433', '手枪式折叠三用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4236', '供应军用手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3085', '汽车遥控干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3035', '手机改号', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2742', '特码六合彩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2958', '大量出售各种假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3820', '爆破和杀伤燃烧弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4159', '美国秃鹰销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2540', '斯大林台联', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3945', '炸弹制作从入门', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2582', 'ムㄞ你娘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3964', '钢珠狗货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2630', 'Butthead', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2890', '住宿发票代开', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3732', '火药 专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3221', '售铊盐QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3242', '力斯曼货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4068', '出售GLOCK', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3752', '销售雷管', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3819', '炸弹制作从入门到精', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2387', '西藏国', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4097', '气枪铅弹销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2418', '死GD', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3716', '加入2228毫升的浓硫酸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2964', '假钱代理', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2965', '假钱QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2847', '销售假人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4109', '出售铅弹气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2674', '开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3678', '军刀价格军用刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3709', '仿品军刺网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2621', '尖阁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3122', '器官有偿捐赠信息', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3377', '手弩图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4160', '最新销售秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4178', '锡峰气枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4224', '高压气枪专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2468', '干妳老母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3048', '出售银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2545', '鸠屎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2664', '拉顿德通', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2650', 'butthead', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3282', '侦察兵折叠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3839', '燃烧弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2678', '麻烟', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4149', '西班牙气枪cfx', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3617', '供应阳江刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4188', '三箭气枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2504', '干拎娘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4153', '防身武器出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2841', '批发出售假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3715', '浓硝酸  浓硫酸  甘油', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3921', '黑火药的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2549', '日你妈啦屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3375', '弩的最简制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2873', '代开fapiao', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3739', '硝酸胺炸药制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3223', '销售铊盐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3936', '教你怎么用土办法做武器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3205', '供应汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2731', '香港六合彩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3131', '肾源中介qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3516', '弓弩专营', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3209', '出售铊盐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3616', '刀具专卖QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3134', '肾源提供中介', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3972', '销售军用54式64式', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3114', '开锁培训', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3246', '兰州弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3596', '砂光甩刀QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2442', '塞你爸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2565', '学潮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2592', 'Ｂｉｔｃｈ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4081', 'K粉手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3458', '弓弩亲兄弟货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2578', '鸦片渣', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2979', '假钱批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3160', '弩弦供应', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3865', '哪里有雷管卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3915', 'tnt炸药成分', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2508', '鸡巴', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2408', '人体炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3373', '兽用麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3748', 'C4的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4122', '销售虎头猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4050', 'CS狗专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2833', '黄色电影免费下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2850', '长期供应发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3804', '燃烧剂的简易制备', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3170', '三利达官网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2733', '在线博彩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2466', '以茎至洞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2426', '卖淫', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2895', '网络水军QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3554', '弓弩专卖货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4148', '气枪价格购买气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3302', '猎豹2008E', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2788', '销售警用手铐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2571', '摩门教', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3456', '弓弩免定金货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2727', '出售考生名单qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2521', '干七八', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2760', '网络推手水军公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2743', '真钱棋牌游戏', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2864', '代开税票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3258', '弓弩的做法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4181', '手槍买卖自制手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3321', '中国弓努店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2745', '网上赌钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3047', '出售USB电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2844', '批发一元假硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3069', '手机窃听软件 详情咨询', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3933', '简易原子弹教程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3235', '三利达弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3072', '手机窃听软件 QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2446', '塞你母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2761', '成人小说下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2885', '出售各行储蓄卡qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3150', '暴力开锁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3894', '硝铵炸药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2806', '批发警棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4184', '淘宝气枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3711', '简易炸弹货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4142', 'WG 702左轮钢珠狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2843', '批发假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2774', '品色堂论坛最新地址', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4074', '手枪的制造方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3823', '怎么自制燃烧弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3451', '钢珠弓弩专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4089', '出售各式热兵器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3190', '网上诚信办证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4031', '英国骚本PCP', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2419', '致幻剂', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4215', '哪里有钢珠枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3460', '供应钢珠弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4241', '猎枪麻醉枪钢珠枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4053', '专卖手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3334', '弓弩狩猎视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4113', '出售金钟气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3768', '高爆炸药 当面交易QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3587', '折刀砍刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2542', '含捻', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3273', '森林之狼2005M弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4080', '出售仿真狙击枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3194', '专业证件办理中心', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3000', '供应网络电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3932', '原子弹制作手册', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3643', '三分之二的汽油与三分之', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3924', '黑火药配方比例', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3686', '手工猎刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3437', '狩猎器材弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2938', '出售假人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3435', '狩猎弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3726', '硝酸胺炸药 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2502', '干你娘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2874', '出售票据', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4264', '出售汽枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3892', '炸弹配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3713', '供应土制炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2646', 'GameMaster', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3443', '三步倒捕狗药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3970', '袖珍麻醉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2663', '自由西藏学生会', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3294', '安阳弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2725', '收养宝宝', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2721', '订制人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4127', '专卖双管猎', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2398', '人弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2499', '死GM', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3991', '出售黑狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3757', '土炸药的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2675', '裸聊', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2457', '冰毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3164', '临沂弓弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2494', '屌毛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3249', '焦作弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3162', '迷彩大黑鹰弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4238', '猎枪销售手枪销售气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3803', '高爆炸药的基本配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3348', '怎样制作弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3902', '出售雷管', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3914', '自制炸药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3427', '制作简易弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3292', '出售808猎箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2676', '刀具专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4223', '各类军用枪支', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2862', '代开税务发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4058', '出售兽用麻醉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3259', '两用中型弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2686', '狩猎用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4017', '射钉弹改装', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2453', '笨逼', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3644', '两个燃烧弹合在一起是最', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2860', '代开咨询发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3123', '有偿捐肝', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3633', '出售精仿军刃', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2710', '出售一元硬币司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3859', '哪里有雷管买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4102', '麻醉枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3306', '巴力WILD CAT C5', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2960', '出售一元硬币假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2603', 'ＳＨＩＴ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3475', '中国战神军用弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4136', '小口径秃鹰沙漠', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3729', '哪里有硝酸胺炸药卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4209', '哪里有真枪卖买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3626', '出售56式军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3948', '硝酸铵的简便制取方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4043', '手qiang出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4284', 'a', '', '0', '1429780842000', '1');
INSERT INTO `bs_sys_keyword` VALUES ('3467', '供应麻醉箭批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3784', '基本添上一平勺碳酸钠', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4263', '出售手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3691', '军刀专卖军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3847', '原子弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3556', '弓弩专卖网货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4170', '最新销售汽狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3974', '手狗出猎狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2752', '高考生名单出售qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3239', '三利达 大黑鹰 lsg', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4183', '司马仿真枪模型QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3255', '供应三利达直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3121', '真实身份证qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3419', '中国弓弩狩猎网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4035', '五四式-汽狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3390', '眼镜蛇yjs中型弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3449', '麻醉弓弩专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2948', '出售假BI', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4168', '猎枪真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4073', '枪械制造图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3664', '出售开山刀军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2421', '共匪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4005', '铅弹狗粮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2739', '在线百家乐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3791', 'IED炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3717', '炸药 专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2807', '出售警衔警服', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2647', 'GAMEMASTER', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4039', '出售警用枪械', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2509', '机八', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2835', '美女裸体视频聊天室', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3889', '真枪哪里有', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2644', 'Suck', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4085', '出售自用电狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4118', '销售工字牌汽枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3021', '手机卧底官网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3225', '快速办证刻章QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2639', 'shengda', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4088', '出售枪具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3215', '哪卖报仇用药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3608', '日本武士刀QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2715', '出售易容面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3489', '出售asp野人谷甩棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3635', '出售精品军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3720', 'tnt的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3942', '「红烧兔子」大餐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2423', 'K他命', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3734', '火药 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3080', '刻章办证身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2662', '西藏妇女会', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4007', '气槍专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2584', 'ムㄞ你母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2563', '西藏喇嘛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2877', '工商代理QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2396', 'B博士', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3525', '蝴蝶刀专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2897', '网络水军招聘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2580', '江Core', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2940', '出售过机版假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3529', '出售63式军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3864', '哪里有炸药卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3082', '汽车万能解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3884', '哪里有小口径步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3105', '出售汽车锁解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2834', '高清炮图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3512', '砍刀专卖军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3117', '卖真实2代身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3151', '万能开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3251', '国际弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3328', '中国弓弩店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3382', '殷氏弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2433', '奶子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3165', '猎豹弓弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2577', '西藏独立', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4237', '猎枪专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2799', '成人裸聊', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3187', '办理假证件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3143', '批发开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2570', '鸡叭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4090', '销售狙击枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2526', '驶你公', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2427', '鸡八', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2641', 'SM', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4140', '钢珠猎狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2976', '可过机假钞QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2483', '倭国', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3362', '大量批发供应弓驽', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3658', '液体炸弹当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4186', '出售外国枪模', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4096', '出售温切斯特', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3274', '森林之虎2006B', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3780', '硝酸甘油滴到碳酸钠溶液', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3539', '三棱刺刀折刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3428', '中国弓驽网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3971', '销售铅弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3801', 'Zha药制造进程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3582', '出售美军现役军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3833', '炸药的配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2573', '疆独', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3008', '身份证qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3238', '三利达厂家直销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2741', '六合彩公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3785', '注入13mL浓硝酸  冷却', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2889', '专业开发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2804', '买卖冰毒QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3517', '正品军刺专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2898', '网络删帖公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3400', '弓弩的价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2612', 'ｏｒｇａｓｍｕｓ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2775', '电警棍出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3779', '乙炔喷灯足以熔化铀235', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2795', '小姐兼职服务', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2830', '出售甲基苯丙胺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2627', 'as$hole', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3405', '钢珠手弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2614', 'ｐｈｕｃ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4281', '出售仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2608', 'Ｓｕｃｋ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2669', '江青', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4066', '出售娥眉气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2779', '警服出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2397', '瘸腿帮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3257', '弓弩价钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4103', '出售军用五连发手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4204', '气枪专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2383', '热比娅', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2899', '出售冒名信用卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3266', '多功能大型弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3565', '尼泊尔军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3188', '诚信办证咨询', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2870', '代开发嘌', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3559', '出售戈博军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2917', '批发假钱QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3417', '中国弩弓专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3806', '基本配方是硝酸甘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3568', '军刺野营砍刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2751', '公务员考生信息出售qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3050', '银行卡长期出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2894', '收费清理负面信息', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3845', 'ATOM弹制造', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3395', '弓弩货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3634', '出售开刃军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3560', '军用匕首出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3652', '出售三棱刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2950', '出售过机假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3431', '三利达弓弩直营', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3231', '证件制作QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2978', '假硬币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3931', '核弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3224', '代办车牌执照', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3645', '把分批弄来的铀235', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3136', '肝源网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3481', '出售军品刺刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3589', '军用刀具军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3193', '专业办证公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2624', 'ass', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3466', '供应麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2818', '销售麻古QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2441', '萨哒姆', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2903', '出售各行信用卡qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2814', '出售高纯度冰糖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4133', '折叠狗QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3493', 'MT-虎牙专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2922', '出售全球网络电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2701', '汽车解码', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4143', '出售钢珠狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3583', '防卫刀具专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2474', '装屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3487', '中国军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3062', 'spyflexispy下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2821', '批发甲基苯丙胺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2992', '出售伪钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3670', '仿品军刺出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2883', '代理发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2587', 'ａ＄＄ｈｏｌｅ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3426', '郑州弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2836', '欧美成人贴图区', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2947', '出售假rmb', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2462', '真善忍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2718', '专业制作高仿人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2968', '假钞换钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2405', '台独', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3632', '出售甩棍跳刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3439', '军用弓弩公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3869', '简易大威力炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3336', '专卖驽弓', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2861', '代开增值税发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3505', '出售警用刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3663', '西点军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4239', '猎枪手枪买卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3470', '供应弩用麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4010', '軍品銷售公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2781', '出售警服', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3120', '二代身份证qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2811', '出售海洛因QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3181', '狩猎弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3766', '高爆炸药 专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3531', '正品北方先锋M9军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4062', '出售92式', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4197', '气枪价格气枪专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2525', '驶你爸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3901', '出售炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3701', '勃朗宁军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2803', '出售麻黄素原料', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3528', '出售M1枪刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3159', '弩用麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4274', '出售54式手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2688', '手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2561', '马卖马屁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3649', '简易炸弹当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2600', 'Ｄｉｃｋ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3805', '炸弹制作入门', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4202', '气枪猎枪钢珠枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2753', '购买考生名单qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3695', '阳江军品军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3461', '供应弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3486', '出售勃朗宁军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4032', '那里可以买到真手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4054', '出售手拉鸡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2700', '网络赌场', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3665', '三棱军刺专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3935', '自制炸药方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3001', '网络电视棒专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2851', '最新假币出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3898', '出售雷管炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4164', '秃鹰气枪销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3585', '阳江刀具专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3967', '供应54枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4227', '高压气枪气枪子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3909', '自制燃烧弹 方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4282', '出售麻醉枪免收任何定金', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3102', '供应汽车干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2863', '代开税票QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2638', 'fosaon', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3763', '高爆炸药的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3089', '出售汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2823', '氯胺酮K粉出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3314', '进口弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3056', '销售银行卡qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4190', '全金属仿真枪专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2594', 'Ｂｕｔｔｈｏｌｅ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3629', '出售仿真军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3386', '弓弩视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3446', '三步倒弩箭专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2692', '枪支出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4253', '麻醉枪出售可验货', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2845', '台湾版假币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2557', '烂屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3893', '硝酸甘油制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3291', '出售大黑鹰lsg弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4165', '哪里买汽狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4283', '出售手枪货到付款', '', '0', '1429776663000', '1');
INSERT INTO `bs_sys_keyword` VALUES ('2935', '出售朝鲜版硬币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3890', '原装秃鹰qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3304', '大威力弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2981', '假币出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2475', '陈水扁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2672', '钢珠弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2632', 'cunt', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2717', '出售人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3794', '手雷 专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3003', '办假身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3581', '刀具直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2519', '干你妈b', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3149', '防盗门开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4189', '热武器QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3195', '办证刻章有限公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3571', '冷钢刀具直销网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3401', '猎豹m4钢珠专用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2501', '死CD', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3741', '硝酸胺炸药 专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2840', '卖新版假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3978', '日本MARUI沙漠之鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3076', '办四级证办身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3928', '雷管出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3599', '名刀网出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3351', '弩机图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3155', '汽车防盗干扰器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4028', '出售短狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2682', '出售武士刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3977', '台湾产秃鹰气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2980', '假币出售QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3622', '供应军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2642', 'snatch', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3676', '军刀军刺甩棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4016', '怎么改装射钉枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2586', 'ムㄞ你老师', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2659', '西藏青年大会', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3384', '眼镜蛇弓弩视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3262', '弓弩的自制图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3918', '各种炸药配方大全', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2524', '驶你娘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2783', '出售警用手铐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3309', 'M19多功能大型弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2668', '艾力更', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3861', '炸药 当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3640', '防卫电棍出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3697', '警用刀具出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3432', '三利达弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3782', '橡胶溶解汽油中添加碱液', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3693', '砍刀精品折刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2613', 'ｐｅｎｉｓ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3590', '极端武力军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3992', '出售工字皮碗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3773', '雷管制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2875', '机打发票代开', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3668', '军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3132', '肾源中介公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3714', '火药配方比例', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2735', '现金斗地主', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4020', 'qi狗专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3727', '硝酸胺炸药出售 QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3116', '开锁工具专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2900', '出售网银卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3183', '办证当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3052', '出售借记卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3930', 'DIY核弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3502', '阳江刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3788', '用生活用品制作简易炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3218', '求购氰化钾', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3163', '麻醉箭专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3877', '硝酸甘油炸药制作教程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2698', '供应赵氏钢珠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4176', '销售专卖买卖77式手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2414', 'ㄐ巴', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3910', '燃烧弹 制造', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3718', 'tnt 出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3300', '猎豹折叠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3538', '三刃木折刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2503', '干妳娘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4086', '冰毒手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3494', '戈博专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3219', '求购铊盐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2813', '麻果配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2854', '真钱买假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3778', '这个巡航导弹不大', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3286', '弓弩扳机制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3797', '哪里有黑索金卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3060', 'X卧底第四代', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4117', '出售 瓦斯手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3810', '火药的配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2534', '淫毛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2808', '超高压电警棍出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2747', '真钱梭哈', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3815', '简易导弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2943', '出售假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2984', '购买假币网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2560', '妈卖妈屁', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3989', '出售金属手拉机', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4169', '出售警用手铐仿真枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3904', '仿真狗货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4252', '麻醉枪猎枪军用', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3109', '万能钥匙购买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2609', 'ｓｕｃｋ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3465', '供应军用弩折叠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3394', '进口弓弩价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3542', '军刺精品折刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2458', '塞你娘', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2591', 'ｂｉｔｃｈ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3337', '木制弓弩视频', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2773', '激情裸聊网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2506', '干妳妈', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2670', '美女露鲍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4182', '售手枪QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3129', '肾源肝源中介', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2703', '出售54手枪qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4177', '仙鹤气枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3447', '弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2925', '成人电视棒QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3037', '短信改号软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3361', '弓驽货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2918', '批发假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2402', '法轮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3564', '三利达弓弩军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3553', '弓弩专卖店网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2924', 'USB电视棒QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3455', '弓弩麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4187', '高压狗QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3324', '授权弓驽专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4154', '手 枪气枪 猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3339', '秦氏弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3721', '手雷 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2437', '嫖客', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4192', '汽狗高压汽枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2792', '警用手铐货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3926', '原子弹配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3588', '军刀直刀军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2771', '一本道无码合集', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2805', '出售高纯K粉', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3265', '飞鹰A25重型双手柄弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2651', '薄熙来', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2634', 'damn', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3735', '高爆炸药 看货付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2635', 'dick', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3510', '兰博II号求生刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3184', '证件印章制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3657', '液体炸弹货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2766', '美女性爱美图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4098', '出售自制手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4128', '阻击枪汽枪高压气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4214', '哪里有连发猎枪买卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2826', '出售成品冰毒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3958', '气枪原装进口', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3646', 'TNT配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4051', '出售司马系列气狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3607', '三棱军刺批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3254', '供应小黑豹2005A', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2812', '出售冰毒制作技术', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2919', '出售高清网络TV棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3365', '狩猎者弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3352', '弩机制作图纸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3066', '手机窃听软件免费下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3781', '如果你这个恐怖份子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3399', '连发钢珠弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3497', '日本军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3759', '原子弹制作教程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2655', '王立军', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3911', '弹药制造方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2699', '野营军刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2551', '可待因', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2949', '出售过机假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2822', '出售GHB水', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4101', '92式销售QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3472', '供应三步倒麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4067', '出售雷明登猎狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4022', '64式762mm', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4218', '卖92手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4014', '诚信出售气狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3730', '供应黑火药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3006', '二代身份证刻章办证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4034', '出售火药动力钢珠枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3267', '叠型重型两用弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3453', '弓弩论坛', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3197', '驾驶证代办', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3807', '制作性能优良的燃烧弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3764', '高爆炸药制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3837', '炸弹制作手册 硫酸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2732', '真钱赌博', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2746', '博彩乐透乐', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4044', '售54式qiang', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2539', '驶你母', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3689', '军刀图片砍刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3872', 'C4塑胶炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3969', '专卖秃鹰气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2449', '暴动', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2977', '假硬币出售QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2839', '亚洲成人贴图区', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2626', 'Admin', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4231', '集团出售手枪气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2776', '出售警服装备', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2476', '陈至立', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2892', '增值税发票代开', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4036', '手枪见面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2849', '出售酒店发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2553', '可卡叶', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2963', '假钱买卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4092', '买卖组装枪支', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4233', '国产汽狗专卖气枪货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2665', '习仲勋', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3075', '手机变号器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2916', '批发假硬币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4235', '供应汽枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2629', 'bastard', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3198', '专业网络证件办理', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2530', '懒散', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3920', '黑火药的配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3630', '出售蝴蝶跳刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3628', '出售户外砍刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2750', '出售各类考生名单qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3490', '淘刀网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3423', '赵氏弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3946', '鸡尾酒炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2777', '出售警服及警用品', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3530', '正品军刀户外刀具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3685', '自动跳刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2401', '李洪志', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2562', '烂B', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3624', '军刀 卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3913', '炸药配方与制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3831', '标准炸弹教程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2416', '安眠酮', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3032', '手机改号QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3368', '钢珠专用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4226', '高压气枪电狗专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2640', 'shyt', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2790', '出售伸缩型电警棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3053', '专业办理银行卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3360', '中国神弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4240', '猎枪哪里有卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2687', '台湾秃鹰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2986', '供应假幣', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2617', 'ｂｕｔｔｌｏｌｅ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3199', '在线办理证件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2490', '党主席', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3786', '硝酸甘油 浓硫酸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3532', '正品m9军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4222', '各式气枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2934', '出售朝鲜版高仿真假钞', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3979', '仿QSG92式手枪?', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3478', '弓弩特许经销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3519', '阳江刀具甩卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2568', '他ㄇㄉ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3501', 'AK-47军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2891', '正规税票代开', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4114', '出售虎头双管', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3694', '野营刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3471', '供应秦氏弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2951', '出售过机假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2946', '出售假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2944', '出售假幣', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3464', '供应军用弓弩专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4255', '钢珠枪小口径步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2407', '恐怖主义', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3710', '简易炸弹的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3175', '网上办证公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3329', '弓驽网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2683', '假币销售QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2496', '屌七', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3214', '卖硝酸铊', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2517', '摇头玩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3620', '尼泊尔军刀 卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3002', '出售成人电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2575', '吴仪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4075', '手枪的参数示意图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4261', '出售猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2440', '婊子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3885', '秃鹰销售网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3061', 'spyflexispy软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3576', '野营刀具军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3777', '自制炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3907', '进口真枪qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3584', '冷钢刀具专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3115', '开锁器材', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2730', '出售考生考号qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3014', '改号软件下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2658', '桑东仁波切', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3171', '三利达弩商店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2930', '出售高仿真假币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2479', '达赖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3161', '弩弓狩猎网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3867', '燃烧剂的简易制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3965', '哪里有钢珠狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3370', '便携式弓弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3332', '专门批发供应折叠手弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2569', '他ㄇ的', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4210', '哪里有真枪出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2881', '发漂代开QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3767', '高爆炸药 货到付款', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4267', '出售手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3557', '军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2955', '定购假钱', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4015', '长期出售电狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2782', '警服专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2765', '在线激情脱衣艳舞表演', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2390', '藏青会', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2438', '吹箫', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2713', '买卖人皮面具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3563', '跳刀 弹簧刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2488', '大卫教', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3208', '出售氰化物', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3623', '军刺 卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3547', '蝴蝶甩刀军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3425', '赵氏弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4030', '工字 汽狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2531', '妳老母的', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3322', '远程弓驽专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3077', '身份证办证电话', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3358', '强效麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3934', '黑火药配方', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3835', '汽油三分之一白糖混合', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3500', 'D9军刺军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3660', '土制炸药的制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2516', '摇头丸', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3813', '可塑炸弹制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2454', '屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4126', '最新销售秃鹰高压', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3938', 'zz炸弹的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3271', '小黑豹 2005A', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4061', '出售气步枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2546', '舔西', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3468', '供应麻醉箭三步倒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4256', '出售袖珍手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3704', '野营开山刀军刺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3812', '炸药硝酸甘油制法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3444', '三步倒麻醉箭专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4232', '集团出售手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3736', '高爆炸药出售 QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2857', '新版伪钞QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3829', '恐怖分子自己制造炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2945', '出售假币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3769', '销售炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2514', '二屄', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3485', '出售战刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3549', '弓弩有限公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3817', '原子弹制作 方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4247', '买卖军用枪支', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3369', '供应狙击钢珠专用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3725', '哪里有黑火药卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2729', '高考考生信息出售qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3503', '野人谷甩棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3015', '短信号码任意显示', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4193', '气枪迷魂药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4033', '出售左轮手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3366', '弓弩扳机图片', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3800', '黑索金的制造过程', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3034', '手机改号器QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3515', '军刺世界名刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3233', '三利达追风', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3615', '户外刀具批发网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4180', '提供气狗专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3754', '塑胶炸药制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4087', '手枪的制造工艺', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2768', '妞妞成人基地', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3252', '广州弓弩网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3158', '批发汽车遥控解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4094', '出售气木仓', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3247', '卡巴弩用808猎箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3367', '供应赵氏弓驽', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3855', '哪里弄炸药', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3897', '在家里做原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3127', '卖二代真实身份证', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2791', '出售新款电警棍', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2866', '代开普通发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3929', '制作硝化甘油', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3147', '开锁技能培训学校', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3396', 'mp9军用反恐狙击弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4174', '销售气手狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3968', '冰毒 手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3569', '战术军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3438', '供应三利达弓弩麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2690', '出售枪支QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2492', '屌7', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3424', '赵氏弓弩专卖店', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3775', '雷管制作技术', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3125', '肾源出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3319', '供应眼镜蛇弓努', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2537', '圣战', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3113', '2011最新开锁工具', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3474', '中国弓弩专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3854', '雷管专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3204', '批发汽车解码器', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2576', '误译', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3975', '温彻斯特 1000X?', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3570', '户外军刀出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3283', '折叠阻击弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3026', '手机监听器软件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3881', '氢弹手工制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3575', '阳江刀具军品网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3450', '打狗弓弩三步倒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2394', '走私', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2512', '新党', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2923', '出售3D网络电视棒', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3593', '黑市刀具QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2477', '粗制吗啡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3558', '尼泊尔军刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4072', '枪械制造方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3535', '阳江刀具销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3611', '阳江市刀具批发网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2497', '屌西', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4071', '猎枪的制造结构图', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2697', '裸聊视讯妹妹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3941', '原子弹制造完全手册', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3655', '液体炸弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3792', '哪里有火药卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3173', '森林之虎-大型弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2529', '懒叫', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3522', '阳江刀具供应', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3044', '泰国Vervata', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3848', 'DIY原子弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3984', '出售秃鹰皮碗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3157', '汽车遥控解码器供应商', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4243', '猎枪出售枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2432', '妓院', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3206', '出售氰化钾', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3863', '雷管炸药出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3871', '水浴法制TNT', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3290', '出售大黑鹰弩配件', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4268', '出售气狗', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3275', '森林之狐2005P', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2588', 'ａｓ＄ｈｏｌｅ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2487', '大麻油', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3995', '精品猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2424', '阴户', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2684', '六四式手QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2876', '供应代开发票', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2787', '警服销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3609', '军刀专卖网', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2985', '购买假币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4145', '出售猎枪气枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2554', '可卡因', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4228', '军用77出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2911', '酒店发票QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2547', '鸡掰', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3507', '美国军刀专卖', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3879', '手把手教你做炸弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3462', '供应弓弩麻醉箭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3753', '如何制作硝化甘油', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2819', '送养孩子', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3690', '军刀专卖刀具批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3770', '爆炸装置制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2511', '鸡芭', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3261', '加长两用弩', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2983', '过机版人民币QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3017', '手机改号软件qq', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3755', '雷管制作', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2689', '丁香五月天最新网址', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2601', 'ｆｏｓａｏｎ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2879', '发票代理', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2633', 'damm', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3383', '弓弩购买', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3758', '硝铵炸药的制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2954', '高仿真假币销售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3949', '莫洛托夫燃烧弹', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3137', '肾源供应', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2484', '大花B', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3749', 'TNT炸弹制作方法', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4091', '出售微型手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4134', '长期出 售手枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4151', '工字牌气枪指定销', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3952', '高性能爆炸物质混合', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3389', '中国弓弩价格', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2998', '高清网络电视棒QQ', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3038', '出售储蓄卡', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2928', '出售高仿真人民币', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3722', '手雷 当面交易', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3064', 'FlexiSpy下载', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3057', '各类银行卡出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3079', '毕业证书身份证代办', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3603', '出售圣甲虫跳刀', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4132', '转让 猎枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4002', '热武器出售', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2645', 'suck', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('4155', '天津哪里有猎 枪', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2758', '删帖营销公司', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('2400', '胡耀邦', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3241', '猎豹弓弩改装', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3429', '三步倒药箭批发', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3240', '弓弩之家', '', '0', '1429776663000', '0');
INSERT INTO `bs_sys_keyword` VALUES ('3312', '秦氏弓弩专卖', '', '0', '1429776663000', '0');

-- ----------------------------
-- Table structure for bs_sys_log
-- ----------------------------
DROP TABLE IF EXISTS `bs_sys_log`;
CREATE TABLE `bs_sys_log` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `user_name` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '帐号',
  `log_title` varchar(250) COLLATE utf8_bin DEFAULT '' COMMENT '说明',
  `create_time` bigint(20) DEFAULT NULL,
  `create_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT 'IP地址',
  `log_remark` longtext COLLATE utf8_bin COMMENT '内容',
  `isdel` int(11) DEFAULT '0',
  `log_type` int(11) DEFAULT '0' COMMENT '0为系统日志，1为学校老师操作记录，2为学生操作记录',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8337 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='操作日志表';

-- ----------------------------
-- Records of bs_sys_log
-- ----------------------------
INSERT INTO `bs_sys_log` VALUES ('8305', '1', 'xhq', 'API--学校--增加', '1456569485000', '127.0.0.1', 0x2669643D3026616374696F6E3D73617665266E616D653DE6B7B1E59CB3E5A4A7E5ADA626636F6E746163743D2674656C3D26656D61696C3D266661783D26616464726573733D2677656275726C3D, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8306', '1', 'xhq', 'API--学校--编辑', '1456569588000', '127.0.0.1', 0x2669643D31353826616374696F6E3D73617665266E616D653DE6B7B1E59CB3E5A4A7E5ADA626636F6E746163743DE58898E58588E7949F2674656C3D303735352D353233363736383926656D61696C3D3138393839383337344071712E636F6D266661783D303735352D353233363736383926616464726573733DE6B7B1E59CB3E5B882E58D97E5B1B1E58CBA2677656275726C3D7777772E737A756E69766572736974792E636F6D, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8307', '1', 'xhq', '登录成功', '1456570669000', '127.0.0.1', 0x26616374696F6E3D64656E676C7526757365725F6E616D653D78687126757365725F7077643D313131313131, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8308', '1', 'xhq', 'API--教师账号--增加', '1456570708000', '127.0.0.1', 0x2669643D3026616374696F6E3D7361766526757365726E616D653D6C756F6A696E7169616E67266E616D653DE9AA86E994A6E5BCBA266163636F756E745F7374617475733D59267365783D312662697274683D323031362D30322D3237267363686F6F6C5F69643D31353826686561647069633D2F75706C6F61642F3230313630322F32372F31382D35382D31365F343131332E6A70672670617373776F72643D3132333435362670617373776F7264313D313233343536, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8309', '1', 'xhq', 'API--教师账号--编辑', '1456570774000', '127.0.0.1', 0x2669643D32343526616374696F6E3D7361766526757365726E616D653D6C756F6A696E7169616E67266E616D653DE9AA86E994A6E5BCBA266163636F756E745F7374617475733D59267365783D312662697274683D323031362D30322D32372030303A30303A3030267363686F6F6C5F69643D3026686561647069633D2F75706C6F61642F3230313630322F32372F31382D35382D31365F343131332E6A70672670617373776F72643D2670617373776F7264313D, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8310', '1', 'xhq', 'API--教师账号--编辑', '1456570781000', '127.0.0.1', 0x2669643D32343526616374696F6E3D7361766526757365726E616D653D6C756F6A696E7169616E67266E616D653DE9AA86E994A6E5BCBA266163636F756E745F7374617475733D59267365783D312662697274683D323031362D30322D32372030303A30303A3030267363686F6F6C5F69643D31353826686561647069633D2F75706C6F61642F3230313630322F32372F31382D35382D31365F343131332E6A70672670617373776F72643D2670617373776F7264313D, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8311', '1', 'xhq', '登录成功', '1456641915000', '127.0.0.1', 0x26616374696F6E3D64656E676C7526757365725F6E616D653D78687126757365725F7077643D313131313131, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8312', '1', 'xhq', 'API-添加新闻栏目', '1456645003000', '127.0.0.1', 0x26616374696F6E3D736176652669643D3026706172656E7469643D30266964747970653D3026636C6173736E616D653DE9A696E9A1B5E696B0E997BB266F726465726E756D3D30, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8313', '1', 'xhq', 'API-添加新闻栏目', '1456645163000', '127.0.0.1', 0x26616374696F6E3D736176652669643D3026706172656E7469643D30266964747970653D3026636C6173736E616D653DE9A696E9A1B5E696B0E997BB266F726465726E756D3D30, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8314', '1', 'xhq', '登录成功', '1456645433000', '127.0.0.1', 0x26616374696F6E3D64656E676C7526757365725F6E616D653D78687126757365725F7077643D313131313131, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8315', '1', 'xhq', 'API--删除新闻栏目', '1456645438000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D31343536363435313633, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8316', '1', 'xhq', 'API--删除新闻栏目', '1456645441000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D31343536363435303033, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8317', '1', 'xhq', 'API-添加新闻栏目', '1456645449000', '127.0.0.1', 0x26616374696F6E3D736176652669643D3026706172656E7469643D30266964747970653D3026636C6173736E616D653DE9A696E9A1B5E696B0E997BB266F726465726E756D3D30, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8318', '1', 'xhq', 'API-添加新闻栏目', '1456645563000', '127.0.0.1', 0x26616374696F6E3D736176652669643D3026706172656E7469643D31343536363435313634266964747970653D3026636C6173736E616D653DE5BFABE9809FE696B0E997BB266F726465726E756D3D30, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8319', '1', 'xhq', '编辑新闻栏目', '1456645781000', '127.0.0.1', 0x26616374696F6E3D736176652669643D3134353636343531363426706172656E7469643D30266964747970653D3026636C6173736E616D653DE9A696E9A1B5E696B0E997BB266F726465726E756D3D32, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8320', '1', 'xhq', '编辑新闻栏目', '1456645797000', '127.0.0.1', 0x26616374696F6E3D736176652669643D3134353636343531363526706172656E7469643D31343536363435313634266964747970653D3026636C6173736E616D653DE5BFABE9809FE696B0E997BB266F726465726E756D3D31, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8321', '1', 'xhq', 'API-添加新闻', '1456646677000', '127.0.0.1', 0x2669643D3026616374696F6E3D73617665266E657773747970653D31266E657773636C6173733D31343536363435313635266F726465726E756D3D30266E6577737469746C653DE6B4BE73696465266B6579776F7264733DE5AFB9E5AFB9E5AFB926736D616C6C66696C653D2F75706C6F61642F3230313630322F32382F31362D30312D35325F353835312E6A70672662696766696C653D2F75706C6F61642F3230313630322F32382F31362D30312D35365F383733392E6A7067266C6F67737461727474696D653D323031362D30322D32382031363A30313A343126636F6E74656E74783D253343702533452575353433452575393545452575363545302575344533412575384331332533432F70253345, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8322', '1', 'xhq', '编辑新闻', '1456647454000', '127.0.0.1', 0x2669643D373226616374696F6E3D73617665266E657773747970653D31266E657773636C6173733D31343536363435313635266F726465726E756D3D30266E6577737469746C653DE6B4BE73696465266B6579776F7264733DE5AFB9E5AFB9E5AFB926736D616C6C66696C653D2662696766696C653D266C6F67737461727474696D653D323031362D30322D32382031363A30373A353326636F6E74656E74783D25334370253345257535343345257539354545257536354530257534453341257538433133253343696D672532307372632533442532322F75706C6F61642F656469746F722F75706C6F61642F32303136303232382F36383338313435363634373430373430342E6A70672532322532307469746C65253344253232746573742E6A70672532322532302F2533452533432F70253345, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8323', '1', 'xhq', 'API--删除关键字', '1456649470000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D34323833, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8324', '1', 'xhq', '编辑管理员', '1456649741000', '127.0.0.1', 0x2669643D313326616374696F6E3D656469747361766526757365725F666C61673D2C2C2C2C2C26757365725F6E616D653D7869616F7368656E2669736C6F636B3D312667796D5F67726F75705F69643D756E646566696E65642667796D5F69643D756E646566696E656426757365725F7077643D26757365725F707764323D266C6F67696E5F6572723D30266C6F67737461727474696D653D323031362D30322D32382031363A35353A3338, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8325', '1', 'xhq', '编辑管理员', '1456649747000', '127.0.0.1', 0x2669643D313326616374696F6E3D656469747361766526757365725F666C61673D2C2C2C2C2C26757365725F6E616D653D7869616F7368656E2669736C6F636B3D302667796D5F67726F75705F69643D756E646566696E65642667796D5F69643D756E646566696E656426757365725F7077643D26757365725F707764323D266C6F67696E5F6572723D30266C6F67737461727474696D653D323031362D30322D32382031363A35353A3435, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8326', '1', 'xhq', '添加管理员', '1456649767000', '127.0.0.1', 0x2669643D3026616374696F6E3D6164647361766526757365725F666C61673D2C2C2C2C2C26757365725F6E616D653D7869616F7169616E67312669736C6F636B3D302667796D5F67726F75705F69643D756E646566696E65642667796D5F69643D756E646566696E656426757365725F7077643D31323334353626757365725F707764323D313233343536266C6F67696E5F6572723D30266C6F67737461727474696D653D323031362D30322D32382031363A35353A3532, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8327', '1', 'xhq', 'API--删除后台管理员', '1456649959000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D3134, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8328', '1', 'xhq', 'API--删除后台管理员', '1456649963000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D3133, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8329', '1', 'xhq', 'API--删除后台管理员', '1456649967000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D38, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8330', '1', 'xhq', 'API--删除后台管理员', '1456649969000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D37, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8331', '1', 'xhq', 'API-后台-关键字-编辑', '1456650336000', '127.0.0.1', '', '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8332', '1', 'xhq', 'API--删除用户反馈', '1456653448000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D3437, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8333', '1', 'xhq', 'API--删除用户反馈', '1456653465000', '127.0.0.1', 0x26616374696F6E3D64656C2669643D3437, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8334', '1', 'xhq', '修改密码', '1456653562000', '127.0.0.1', 0x2669643D3126616374696F6E3D656469747361766526757365725F6E616D653D756E646566696E656426757365725F7077643D31323334353626757365725F707764323D313233343536, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8335', '1', 'xhq', '登录失败', '1456653567000', '127.0.0.1', 0x26616374696F6E3D64656E676C7526757365725F6E616D653D78687126757365725F7077643D313131313131, '0', '0');
INSERT INTO `bs_sys_log` VALUES ('8336', '1', 'xhq', '登录成功', '1456653572000', '127.0.0.1', 0x26616374696F6E3D64656E676C7526757365725F6E616D653D78687126757365725F7077643D313233343536, '0', '0');

-- ----------------------------
-- Table structure for bs_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_sys_user`;
CREATE TABLE `bs_sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '后台帐号',
  `password` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `flag` text COLLATE utf8_bin COMMENT '用户权限，格式：,2001,2002,',
  `login_err` int(11) DEFAULT '0' COMMENT '登陆错误次数',
  `create_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '创建的IP',
  `create_time` bigint(20) DEFAULT '0' COMMENT '创建时间',
  `last_login_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '最近登录IP',
  `last_login_time` bigint(20) DEFAULT '0' COMMENT '最近一次登陆时间',
  `islock` int(11) DEFAULT '0' COMMENT '锁定状态，0为正常，1为已锁定',
  `isdel` int(11) DEFAULT '0' COMMENT '删除状态，0为正常，1为已删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of bs_sys_user
-- ----------------------------
INSERT INTO `bs_sys_user` VALUES ('1', 'xhq', '49ba59abbe56e057', 0x2C313030312C313030342C313030352C313030372C323030372C323032352C323032362C323032372C323032382C323032392C323033302C323033332C323033312C323033322C333030312C333030352C333030392C333031372C333034352C333034392C333035302C333035312C343030312C343030322C343030332C343030342C353030312C353030352C353030372C363030312C363030322C363030392C363030332C363030362C363030382C, '0', '127.0.0.1', '1429776663000', '127.0.0.1', '1456653572000', '0', '0');
INSERT INTO `bs_sys_user` VALUES ('8', 'www', '965eb72c92a549dd', 0x2C2C2C2C2C2C2C, '0', '127.0.0.1', '1429776900000', '', '0', '0', '1');
INSERT INTO `bs_sys_user` VALUES ('9', 'eee', '965eb72c92a549dd', 0x2C2C2C2C2C2C2C, '0', '127.0.0.1', '1429776941000', '', '0', '0', '1');
INSERT INTO `bs_sys_user` VALUES ('13', 'xiaoshen', '965eb72c92a549dd', 0x2C2C2C2C2C2C2C, '0', '218.17.13.49', '1440578083000', '', '0', '0', '1');
INSERT INTO `bs_sys_user` VALUES ('10', 'xiaoqiang', '965eb72c92a549dd', 0x2C313030312C313030342C313030352C313030372C323030372C323032362C323032372C323032382C323032392C323033302C323033312C323033322C323033332C333030352C333030392C333031372C333034352C333034392C333035302C333035312C343030312C343030322C343030332C343030342C353030312C353030352C353030372C363030312C363030322C363030392C363030332C363030362C363030382C, '0', '218.17.13.193', '1432203812000', '119.136.34.30', '1451034273000', '0', '0');
INSERT INTO `bs_sys_user` VALUES ('12', 'xiaolong', '965eb72c92a549dd', 0x2C313030312C313030322C313030332C313030342C313030352C313030372C313030392C323030372C323031302C323031342C323031382C323031392C323032332C323032342C323032352C323032362C323032372C323032382C333030352C333030392C333031372C333032312C333032352C333033332C333033372C333034312C333034352C333034392C333035322C333035332C343030312C343030322C343030332C343030342C353030312C353030352C353030372C363030312C363030322C363030392C363030332C363030362C363030372C363030382C, '0', '59.40.116.226', '1439257145000', '119.122.255.156', '1450232085000', '0', '0');
INSERT INTO `bs_sys_user` VALUES ('11', 'xiaoluo', '965eb72c92a549dd', 0x2C313030312C313030322C313030332C313030342C313030352C313030372C313030392C323030372C323031302C323031342C323031382C323031392C323032332C333030392C333031332C333031372C333032312C333032352C333033332C333033372C333034312C333034352C333034392C333035322C343030312C343030322C353030312C353030352C353030372C363030312C363030322C363030332C363030362C363030372C, '0', '218.17.13.119', '1432258110000', '218.17.13.119', '1432258662000', '0', '0');
INSERT INTO `bs_sys_user` VALUES ('7', 'xxx', '965eb72c92a549dd', 0x2C313030302C313030312C313030322C313030332C313031302C313031312C313031322C313031332C313032302C313032312C313032322C313032332C313033302C313033312C313033322C313033332C313034302C313034312C313034322C313034332C313035302C313035312C313035322C313035332C313036302C313036312C313036322C313036332C313037302C313037312C313037322C313037332C313130302C313130312C313130322C313130332C313131302C313131312C313131322C313131332C313132302C313132312C313132322C313132332C313133302C313133312C313133322C313133332C313134302C313134312C313134322C313134332C313230302C313230312C313230322C313230332C313230342C313330302C313330312C313330322C313330332C313330342C313331302C313331312C313331322C313331332C313331342C313331352C313331362C313332302C313430302C313530302C313530312C313531302C313531312C313531322C313532302C313532312C313533302C313533312C313533322C313533332C313533342C313534302C313534312C313535302C313535312C313536302C313536312C313536322C313536332C313537302C313537312C313537322C, '0', '127.0.0.1', '1429776663000', '', '0', '0', '1');
INSERT INTO `bs_sys_user` VALUES ('14', 'xiaoqiang1', '49ba59abbe56e057', 0x2C2C2C2C2C2C2C, '0', '127.0.0.1', '1456649767000', '', '0', '0', '1');

-- ----------------------------
-- Table structure for bs_teachers
-- ----------------------------
DROP TABLE IF EXISTS `bs_teachers`;
CREATE TABLE `bs_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '姓名',
  `username` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '账号',
  `password` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `headpic` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '头像',
  `sex` int(11) DEFAULT '0' COMMENT '性别1代表男 2代表女,0代表未设置',
  `birth` bigint(20) DEFAULT '0' COMMENT '生日，时间戳',
  `last_login_time` bigint(20) DEFAULT '0' COMMENT '最后登录时间，时间戳',
  `last_login_ip` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP地址',
  `login_times` int(11) DEFAULT '0' COMMENT '登录次数',
  `login_err_times` int(11) DEFAULT '0' COMMENT '最近连续密码错误次数',
  `account_status` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '账号状态Y正常，N锁定',
  `addtime` bigint(20) DEFAULT '0' COMMENT '注册时间，时间戳',
  `isdel` int(11) DEFAULT '0',
  `school_id` int(11) DEFAULT '0' COMMENT '学校ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='教师表';

-- ----------------------------
-- Records of bs_teachers
-- ----------------------------
INSERT INTO `bs_teachers` VALUES ('245', '骆锦强', 'luojinqiang', '49ba59abbe56e057', '/upload/201602/27/18-58-16_4113.jpg', '1', '1456502400', '0', '', '0', '0', 'Y', '1456570708', '0', '158');

-- ----------------------------
-- Table structure for bs_upfile
-- ----------------------------
DROP TABLE IF EXISTS `bs_upfile`;
CREATE TABLE `bs_upfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '用户名',
  `userid` int(11) DEFAULT '0' COMMENT '用户id',
  `logid` int(11) DEFAULT '0' COMMENT '新闻内容id',
  `file_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '文件名称',
  `file_path` varchar(150) COLLATE utf8_bin DEFAULT '' COMMENT '文件路径',
  `file_ext` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '文件后缀',
  `file_size` int(11) DEFAULT '0' COMMENT '文件大小',
  `file_readme` varchar(150) COLLATE utf8_bin DEFAULT '' COMMENT '文件显示名称',
  `isphoto` int(11) DEFAULT '0' COMMENT '是否是相片',
  `addtime` bigint(20) DEFAULT '0' COMMENT '添加时间',
  `file_remark` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '文件备注',
  `file_showname` varchar(150) COLLATE utf8_bin DEFAULT NULL COMMENT '展示名称',
  `issave` int(11) DEFAULT '0' COMMENT '是否保存',
  `photofile` varchar(150) COLLATE utf8_bin DEFAULT '' COMMENT '相册文件',
  `photo_width` int(11) DEFAULT '0' COMMENT '图片的宽',
  `photo_height` int(11) DEFAULT '0' COMMENT '图片的高',
  `viewnum` int(11) DEFAULT '0' COMMENT '查看的顺序',
  `addip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '上传ip',
  `isdel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1920 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='上传的图片、视频地址表';

-- ----------------------------
-- Records of bs_upfile
-- ----------------------------
INSERT INTO `bs_upfile` VALUES ('1917', '', '0', '0', '/upload/201602/27/18-58-16_4113.jpg', 'upload/201602/27', 'jpg', '10', '/upload/201602/27/18-58-16_4113.jpg', '1', '1456570696000', '', '', '0', '', '292', '220', '0', '', '0');
INSERT INTO `bs_upfile` VALUES ('1918', '', '0', '0', '/upload/201602/28/16-01-52_5851.jpg', 'upload/201602/28', 'jpg', '10', '/upload/201602/28/16-01-52_5851.jpg', '1', '1456646513000', '', '', '0', '', '292', '220', '0', '', '0');
INSERT INTO `bs_upfile` VALUES ('1919', '', '0', '0', '/upload/201602/28/16-01-56_8739.jpg', 'upload/201602/28', 'jpg', '10', '/upload/201602/28/16-01-56_8739.jpg', '1', '1456646516000', '', '', '0', '', '292', '220', '0', '', '0');
