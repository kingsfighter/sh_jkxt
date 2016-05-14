CREATE DATABASE jfinal_demo;

USE jfinal_demo;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(200) NOT NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `blog` VALUES ('1', 'JFinal Demo Title here', 'JFinal Demo Content here');
INSERT INTO `blog` VALUES ('2', 'test 1', 'test 1');
INSERT INTO `blog` VALUES ('3', 'test 2', 'test 2');
INSERT INTO `blog` VALUES ('4', 'test 3', 'test 3');
INSERT INTO `blog` VALUES ('5', 'test 4', 'test 4');

CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `userName` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `sex` varchar(2) NOT NULL, -- 0:male,1:female
  `email` varchar(200) NULL,
  `content` mediumtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `user` VALUES ('1', 'admin', 'admin','管理员','男','admin@test.com','我是管理员');
commit;


CREATE TABLE `monitor_object_config` (
  `id` int(11) NOT NULL auto_increment,
  `appName` varchar(200) NOT NULL,
  `appUrl` varchar(200) NOT NULL,
  `appDesc` varchar(500) NULL,
  `appStatus` int(1) NOT NULL, -- 0:shutdown,1:running
  `accessCountMin` int(11) default 0 NULL,
  `accessCountMax` int(11) default 100 NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `monitor_object_config` (`id`,`appName`,`appUrl`,`appDesc`,`appStatus`,`accessCountMin`,`accessCountMax`) VALUES (1,'百度','http://www.baidu.com','百度搜索1',0,50,1000);
INSERT INTO `monitor_object_config` (`id`,`appName`,`appUrl`,`appDesc`,`appStatus`,`accessCountMin`,`accessCountMax`) VALUES (3,'网易','www.163.com','大爱网易。',1,50,300);
INSERT INTO `monitor_object_config` (`id`,`appName`,`appUrl`,`appDesc`,`appStatus`,`accessCountMin`,`accessCountMax`) VALUES (4,'新浪','www.sina.cn','新浪微博',1,500,1000);
INSERT INTO `monitor_object_config` (`id`,`appName`,`appUrl`,`appDesc`,`appStatus`,`accessCountMin`,`accessCountMax`) VALUES (5,'知乎','www.zhihu.com','综合性网站',1,100,500);
commit;


CREATE TABLE `monitor_log` (
  `id` int(11) NOT NULL auto_increment,
  `objectId` int(11) NOT NULL,
  `appName` varchar(200) NOT NULL,
  `appStatus` int(1) NOT NULL, -- 0:shutdown,1:running
  `accessCount` int(11) default 0 NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;