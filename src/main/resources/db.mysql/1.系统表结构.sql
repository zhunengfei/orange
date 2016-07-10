SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for JY_BASE_ACCOUNT
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_ACCOUNT`;
CREATE TABLE `JY_BASE_ACCOUNT` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户Id',
  `loginName` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '用户登录名',
  `password` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '密码',
  `salt` varchar(32) NOT NULL,
  `roleId` varchar(32) NOT NULL DEFAULT '0' COMMENT '用户类型(对应jy_base_role的Id)',
  `picUrl` varchar(255) DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8 DEFAULT '' COMMENT '用户名字',
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '电子邮箱',
  `skin` varchar(64) DEFAULT '',
  `isValid` int(2) NOT NULL DEFAULT '0' COMMENT '是否有效(1:有效，0:无效)',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for JY_BASE_ACCOUNT_POSITION
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_ACCOUNT_POSITION`;
CREATE TABLE `JY_BASE_ACCOUNT_POSITION` (
  `accountId` varchar(32) NOT NULL,
  `posId` varchar(32) NOT NULL,
  PRIMARY KEY (`accountId`,`posId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_base_login_log
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_LOGIN_LOG`;
CREATE TABLE `JY_BASE_LOGIN_LOG` (
  `id` varchar(32) DEFAULT NULL,
  `accountId` varchar(32) DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `loginIP` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_base_org
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_ORG`;
CREATE TABLE `JY_BASE_ORG` (
  `id` varchar(32) NOT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_base_org_resources
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_ORG_RESOURCES`;
CREATE TABLE `JY_BASE_ORG_RESOURCES` (
  `org_Id` varchar(32) DEFAULT NULL,
  `resources_id` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_base_position
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_POSITION`;
CREATE TABLE `JY_BASE_POSITION` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) NOT NULL,
  `orgId` varchar(32) NOT NULL,
  `type` varchar(32) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_base_resources
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_RESOURCES`;
CREATE TABLE `JY_BASE_RESOURCES` (
  `id` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT 'Id',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '菜单名字',
  `parentId` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '父Id',
  `layer` int(11) NOT NULL,
  `type` int(4) NOT NULL DEFAULT '1' COMMENT '资源类型(1:为菜单，2:功能，3:按钮)',
  `resUrl` varchar(512) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单链接',
  `btnId` varchar(32) DEFAULT NULL,
  `btnFun` varchar(64) DEFAULT NULL,
  `icon` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '菜单Icon',
  `sort` int(10) DEFAULT NULL COMMENT '菜单顺序(由小到大排列)',
  `isValid` int(2) DEFAULT NULL COMMENT '是否有效(1:有效,0:无效)',
  `description` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `updateTime` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for jy_base_role
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_ROLE`;
CREATE TABLE `JY_BASE_ROLE` (
  `id` varchar(32) NOT NULL,
  `orgId` varchar(32) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_base_role_resources
-- ----------------------------
DROP TABLE IF EXISTS `JY_BASE_ROLE_RESOURCES`;
CREATE TABLE `JY_BASE_ROLE_RESOURCES` (
  `role_id` varchar(32) NOT NULL,
  `resources_id` varchar(32) NOT NULL,
  PRIMARY KEY (`role_id`,`resources_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_data_dict
-- ----------------------------
DROP TABLE IF EXISTS `JY_DATA_DICT`;
CREATE TABLE `JY_DATA_DICT` (
  `id` varchar(32) NOT NULL,
  `dataKey` varchar(32) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `isValid` int(2) NOT NULL DEFAULT '0',
  `description` varchar(128) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_data_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `JY_DATA_DICT_ITEM`;
CREATE TABLE `JY_DATA_DICT_ITEM` (
  `dictId` varchar(32) NOT NULL,
  `value` varchar(64) NOT NULL,
  `name` varchar(32) NOT NULL,
  `sort` int(10) NOT NULL,
  PRIMARY KEY (`dictId`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `JY_SYS_DICT`;
CREATE TABLE `JY_SYS_DICT` (
  `id` varchar(32) NOT NULL,
  `paramKey` varchar(64) DEFAULT NULL,
  `paramName` varchar(128) DEFAULT NULL,
  `paramValue` varchar(128) DEFAULT NULL,
  `isValid` int(2) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_task_log
-- ----------------------------
DROP TABLE IF EXISTS `JY_TASK_LOG`;
CREATE TABLE `JY_TASK_LOG` (
  `id` varchar(32) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `className` varchar(128) DEFAULT NULL,
  `type` int(2) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_task_schedule
-- ----------------------------
DROP TABLE IF EXISTS `JY_TASK_SCHEDULE`;
CREATE TABLE `JY_TASK_SCHEDULE` (
  `scheduleJobId` varchar(32) NOT NULL,
  `jobName` varchar(64) DEFAULT NULL,
  `jobGroup` varchar(64) DEFAULT NULL,
  `aliasName` varchar(64) DEFAULT NULL,
  `jobClass` varchar(128) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  `cronExpression` varchar(64) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`scheduleJobId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for jy_tool_email
-- ----------------------------
DROP TABLE IF EXISTS `JY_TOOL_EMAIL`;
CREATE TABLE `JY_TOOL_EMAIL` (
  `id` varchar(32) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `body` text,
  `toList` text,
  `ccList` text,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for oa_leave
-- ----------------------------
DROP TABLE IF EXISTS `OA_LEAVE`;
CREATE TABLE `OA_LEAVE` (
  `id` varchar(32) NOT NULL,
  `org` varchar(64) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `approver` varchar(32) DEFAULT NULL,
  `type` varchar(4) DEFAULT NULL,
  `beginTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `rejectReason` varchar(256) DEFAULT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_event_click
-- ----------------------------
DROP TABLE IF EXISTS `WX_EVENT_CLICK`;
CREATE TABLE `WX_EVENT_CLICK` (
  `id` varchar(32) NOT NULL,
  `keyId` varchar(32) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `content` varchar(128) DEFAULT NULL,
  `picUrl` varchar(1024) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_follower
-- ----------------------------
DROP TABLE IF EXISTS `WX_FOLLOWER`;
CREATE TABLE `WX_FOLLOWER` (
  `openid` varchar(32) NOT NULL,
  `subscribe` int(4) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `sex` int(4) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `province` varchar(64) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `headimgurl` varchar(512) DEFAULT NULL,
  `subscribeTime` datetime DEFAULT NULL,
  `unionid` varchar(32) DEFAULT NULL,
  `remark` varchar(128) DEFAULT NULL,
  `groupid` varchar(32) DEFAULT '',
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for wx_menu
-- ----------------------------
DROP TABLE IF EXISTS `WX_MENU`;
CREATE TABLE `WX_MENU` (
  `id` varchar(32) NOT NULL,
  `pId` varchar(32) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `keyId` varchar(32) DEFAULT NULL,
  `url` varchar(1024) DEFAULT NULL,
  `sort` int(10) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `selectType` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
