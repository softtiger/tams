/*
Navicat MySQL Data Transfer

Source Server         : home-tcent
Source Server Version : 80034
Source Host           : 111.229.163.107:3918
Source Database       : tams_practise

Target Server Type    : MYSQL
Target Server Version : 80034
File Encoding         : 65001

Date: 2024-09-09 10:08:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_auth_menus
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_menus`;
CREATE TABLE `tbl_auth_menus` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识id',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '功能名称',
  `en_menu_name` varchar(50) DEFAULT NULL COMMENT '英文名称',
  `menu_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '功能类型 menu-功能菜单 btn-操作按钮',
  `parent_id` int NOT NULL DEFAULT '0' COMMENT '上级菜单ID',
  `icon_css` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '菜单图标样式',
  `menu_url` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '菜单访问地址',
  `priority` int DEFAULT '0' COMMENT '菜单显示优先级顺序',
  `status` tinyint DEFAULT '0' COMMENT '功能状态 0-禁用 1-启用',
  `menu_desc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '功能描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_auth_menus_type` (`menu_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5000302 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='保存系统所有功能及菜单元信息';

-- ----------------------------
-- Records of tbl_auth_menus
-- ----------------------------
INSERT INTO `tbl_auth_menus` VALUES ('100', '首页', 'home page', 'menu', '0', null, '#', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('200', '组织管理', 'org manager', 'menu', '0', null, '#', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('300', '考勤设置', 'time attendance settings', 'menu', '0', null, '#', '10', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('400', '考勤统计', 'attendance statistics', 'menu', '0', null, '#', '20', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('500', '系统设置', 'system settings', 'menu', '0', null, '#', '30', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('10001', '日考勤数据', 'get daily attedance information', 'btn', '100', null, '/home', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('20001', '职位管理', 'position mmanagment', 'menu', '200', null, '#', '10', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('20002', '部门管理', 'deparment managment', 'menu', '200', null, '#', '20', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('20003', '员工管理', 'staff managment', 'menu', '200', null, '#', '30', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('20004', '离职管理', 'offboarding managment', 'menu', '200', null, '#', '40', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('30001', '排班管理', 'schedule managerment', 'menu', '300', null, '#', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('30002', '考勤组管理', 'attendance managerment', 'menu', '300', null, '#', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('40001', '打卡记录', 'attendance record', 'menu', '400', null, '#', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('40002', '考勤汇总', 'attendance statistics', 'menu', '400', null, '#', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('50001', '角色管理', 'role managment', 'menu', '500', null, '#', '10', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('50002', '用户管理', 'user management', 'menu', '500', null, '#', '20', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('50003', '租户管理', 'tenant manager', 'menu', '500', null, '#', '20', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000101', '职位检索', 'position search', 'btn', '20001', null, '/orgPosition/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000102', '新增职位', 'add position', 'btn', '20001', null, '/orgPosition/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000103', '修改职位', 'modify position', 'btn', '20001', null, '/orgPosition/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000104', '切换职位状态', 'toggle position state', 'btn', '20001', null, '/orgPosition/toggle', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000105', '职位详情', 'position detail', 'btn', '20001', null, '/orgPosition/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000201', '部门检索', 'department search', 'btn', '20002', null, '/org/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000202', '新增部门', 'add department', 'btn', '20002', null, '/org/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000203', '修改部门', 'modify department', 'btn', '20002', null, '/org/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000204', '切换部门状态', 'toggle department state', 'btn', '20002', null, '/org/toggle', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000205', '部门详情', 'department detail', 'btn', '20002', null, '/org/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000301', '员工检索', 'staff search', 'btn', '20003', null, '/orgEmployee/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000302', '新增员工', 'add staff', 'btn', '20003', null, '/orgEmployee/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000303', '修改员工', 'modify staff', 'btn', '20003', null, '/orgEmployee/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000304', '员工统计', 'staff  statistics', 'btn', '20003', null, '/orgEmployee/statistics', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000305', '员工详情', 'staff detail', 'btn', '20003', null, '/orgEmployee/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000306', '员工统计', 'staff summary', 'btn', '20003', null, '/orgEmployee/statistics', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000401', '离职信息检索', 'offboarding search', 'btn', '20004', null, '/orgDepart/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000402', '离职详情', 'offboarding detail', 'btn', '20004', null, '/orgDepart/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000403', '新增离职记录', 'add offboarding record', 'btn', '20004', null, '/orgDepart/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000405', '修改离职记录', 'modify offboarding record', 'btn', '20004', null, '/orgDepart/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('2000407', '离职确认', 'confirm offboarding', 'btn', '20004', null, '/orgDepart/confirm', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000101', '排班查询', 'schedule search', 'btn', '30001', null, '/schedule/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000102', '新建排班', 'create schedule', 'btn', '30001', null, '/schedule/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000103', '修改排班', 'modify schedule', 'btn', '30001', null, '/schedule/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000104', '排班详情', 'view schedule detail', 'btn', '30001', null, '/schedule/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000105', '删除排班', 'delete schedule', 'btn', '30001', null, '/schedule/remove', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000201', '考勤组查询', 'attendance group search', 'btn', '30001', null, '/attendanceGroup/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000202', '新建考勤组', 'add attendance group', 'btn', '30001', null, '/attendanceGroup/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000203', '修改考勤组', 'modify attendance group', 'btn', '30001', null, '/attendanceGroup/modify', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000204', '删除考勤组', 'delete attendance group', 'btn', '30001', null, '/attendanceGroup/remove', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('3000205', '查看考勤组详情', 'view attendance group', 'btn', '30001', null, '/attendanceGroup/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('4000101', '查询打卡记录', 'search attendance record', 'btn', '40001', null, '/attendanceRecord/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('4000102', '导出打卡记录', 'export  attendance record', 'btn', '40001', null, '/attendanceRecord/export', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('4000201', '考勤汇总', 'attendance statistics generate', 'btn', '40002', null, '/attendanceStatistics/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('4000202', '考勤汇总导出', 'attendance statistics export', 'btn', '40002', null, '/attendanceStatistics/export', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000101', '角色检索', 'search role', 'btn', '50001', null, '/role/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000102', '新增角色', 'add role', 'btn', '50001', null, '/role/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000103', '修改角色', 'modify role', 'btn', '50001', null, '/role/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000104', '查看角色', 'role detail', 'btn', '50001', null, '/role/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000105', '查看角色权限', 'view role privilege ', 'btn', '50001', null, '/role/getPrivileges', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000106', '设置角色权限', 'set prvilege for role', 'btn', '50001', null, '/role/setPrivileges', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000108', '切换角色状态', 'toggle role status', 'btn', '50001', null, '/role/toggle', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000201', '用户检索', 'user search', 'btn', '50002', null, '/account/search', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000202', '新增用户', 'add user', 'btn', '50002', null, '/account/create', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000203', '修改用户', 'modify user', 'btn', '50002', null, '/account/update', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000204', '用户详情', 'user detail', 'btn', '50002', null, '/account/detail', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000205', '切换用户状态', 'toogle user status', 'btn', '50002', null, '/account/toggle', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000206', '设置用户密码', 'change user password', 'btn', '50002', null, '/account/setPassword', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000207', '修改我的密码', 'change password', 'btn', '50002', null, '/account/changePassword', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000208', '设置用户角色', 'set roles for user', 'btn', '50002', null, '/account/setRoles', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000209', '查看配置的角色', 'view configuation of  roles', 'btn', '50002', null, '/account/getRoles', '0', '1', null);
INSERT INTO `tbl_auth_menus` VALUES ('5000301', '租户检索', 'search tenant', 'btn', '50003', null, '/tenant/search', '0', '1', null);

-- ----------------------------
-- Table structure for tbl_auth_menus_tpl
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_menus_tpl`;
CREATE TABLE `tbl_auth_menus_tpl` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` int DEFAULT NULL COMMENT ' 1-平台商菜单集合  2-正式企业菜单集合 3-试用企业菜单集合 ',
  `auth_menus_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `i_amt_menuId` (`auth_menus_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2081 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='后台账号类型--菜单 模版表，\r\n配置角色时，应从此表中读入对应后台类型的权限集合进行配置';

-- ----------------------------
-- Records of tbl_auth_menus_tpl
-- ----------------------------
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1900', '1', '2000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1901', '1', '2000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1902', '1', '2000103');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1903', '1', '2000104');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1904', '1', '2000105');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1905', '1', '2000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1906', '1', '2000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1907', '1', '2000203');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1908', '1', '2000204');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1909', '1', '2000205');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1910', '1', '2000301');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1911', '1', '2000302');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1912', '1', '2000303');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1913', '1', '2000304');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1914', '1', '2000305');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1915', '1', '2000401');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1916', '1', '2000402');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1917', '1', '2000403');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1918', '1', '2000405');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1919', '1', '2000406');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1920', '1', '2000407');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1921', '1', '5000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1922', '1', '5000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1923', '1', '5000103');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1924', '1', '5000104');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1925', '1', '5000105');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1926', '1', '5000106');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1927', '1', '5000107');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1928', '1', '5000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1929', '1', '5000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1930', '1', '5000203');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1931', '1', '5000204');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1932', '1', '5000205');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1933', '1', '5000206');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1934', '1', '5000207');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1935', '1', '5000208');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1936', '1', '5000209');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1937', '1', '200');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1938', '1', '300');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1939', '1', '400');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1940', '1', '500');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1941', '1', '20001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1942', '1', '20002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1943', '1', '20003');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1944', '1', '20004');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1945', '1', '50001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1946', '1', '50002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1963', '2', '2000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1964', '2', '2000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1965', '2', '2000103');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1966', '2', '2000104');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1967', '2', '2000105');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1968', '2', '2000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1969', '2', '2000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1970', '2', '2000203');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1971', '2', '2000204');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1972', '2', '2000205');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1973', '2', '2000301');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1974', '2', '2000302');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1975', '2', '2000303');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1976', '2', '2000304');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1977', '2', '2000305');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1978', '2', '2000401');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1979', '2', '2000402');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1980', '2', '2000403');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1981', '2', '2000405');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1982', '2', '2000406');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1983', '2', '2000407');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1984', '2', '5000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1985', '2', '5000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1986', '2', '5000103');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1987', '2', '5000104');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1988', '2', '5000105');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1989', '2', '5000106');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1990', '2', '5000107');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1991', '2', '5000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1992', '2', '5000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1993', '2', '5000203');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1994', '2', '5000204');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1995', '2', '5000205');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1996', '2', '5000206');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1997', '2', '5000207');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1998', '2', '5000208');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('1999', '2', '5000209');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2000', '2', '200');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2001', '2', '300');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2002', '2', '400');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2003', '2', '500');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2004', '2', '20001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2005', '2', '20002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2006', '2', '20003');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2007', '2', '20004');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2008', '2', '50001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2009', '2', '50002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2026', '1', '5000108');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2027', '1', '2000306');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2028', '2', '2000306');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2029', '1', '3000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2030', '1', '3000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2031', '1', '3000103');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2033', '1', '30001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2036', '2', '3000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2037', '2', '3000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2038', '2', '3000103');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2040', '2', '30001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2043', '1', '3000104');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2044', '2', '3000104');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2045', '1', '3000105');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2046', '2', '3000105');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2047', '1', '3000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2048', '1', '3000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2049', '1', '3000203');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2050', '1', '3000204');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2051', '1', '3000205');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2052', '1', '30002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2054', '2', '3000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2055', '2', '3000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2056', '2', '3000203');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2057', '2', '3000204');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2058', '2', '3000205');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2059', '2', '30002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2061', '1', '4000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2062', '1', '4000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2063', '1', '4000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2064', '1', '4000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2065', '1', '40001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2066', '1', '40002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2068', '2', '4000101');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2069', '2', '4000102');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2070', '2', '4000201');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2071', '2', '4000202');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2072', '2', '40001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2073', '2', '40002');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2075', '1', '100');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2076', '1', '10001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2077', '2', '100');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2078', '2', '10001');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2079', '1', '50003');
INSERT INTO `tbl_auth_menus_tpl` VALUES ('2080', '1', '5000301');

-- ----------------------------
-- Table structure for tbl_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_role`;
CREATE TABLE `tbl_auth_role` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '唯一标识ID',
  `tenant_id` int NOT NULL COMMENT '入住租户ID',
  `role_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `code` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色编码',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '角色状态 0-禁用 1-启用',
  `role_desc` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '角色描述',
  `create_by` int DEFAULT NULL COMMENT '创建人ID    其中  -1 系统初始化   -2 注册生成',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `un_tenant_code` (`tenant_id`,`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='保存角色信息';

-- ----------------------------
-- Records of tbl_auth_role
-- ----------------------------
INSERT INTO `tbl_auth_role` VALUES ('1', '1', ' 平台统管理员', '000', '1', null, '-1', '2023-10-26 15:57:13');
INSERT INTO `tbl_auth_role` VALUES ('2', '1', '人事', '010', '0', null, '-1', '2023-10-31 20:26:31');
INSERT INTO `tbl_auth_role` VALUES ('4', '2', '管理员', '020', '1', null, '1', '2023-11-08 15:08:07');
INSERT INTO `tbl_auth_role` VALUES ('83', '1', '行政人员', '020', '1', null, '1', '2024-09-09 09:29:27');

-- ----------------------------
-- Table structure for tbl_auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_role_permission`;
CREATE TABLE `tbl_auth_role_permission` (
  `role_id` int NOT NULL COMMENT '角色ID',
  `menu_id` int NOT NULL COMMENT '功能ID',
  KEY `idx_auth_permission_roleid` (`role_id`,`menu_id`) USING BTREE,
  CONSTRAINT `FKbpqwqje01r67cde6hc3msf9nc` FOREIGN KEY (`role_id`) REFERENCES `tbl_auth_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='保存角色和功能的关系';

-- ----------------------------
-- Records of tbl_auth_role_permission
-- ----------------------------
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '200');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '200');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '300');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '300');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '400');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '500');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20001');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20001');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20002');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20002');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20003');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20003');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20004');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '20004');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '30001');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '50001');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '50002');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '50003');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000301');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000301');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000302');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000302');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000303');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000303');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000304');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000304');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000305');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000305');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000401');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000401');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000402');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000402');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000403');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000403');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000405');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000405');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000406');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000406');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000407');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '2000407');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '3000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '3000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '3000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000106');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000107');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000108');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000206');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000207');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000208');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000209');
INSERT INTO `tbl_auth_role_permission` VALUES ('1', '5000301');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '200');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '20001');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '20002');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '20003');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '20004');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000301');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000302');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000303');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000304');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000305');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000401');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000402');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000403');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000405');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000406');
INSERT INTO `tbl_auth_role_permission` VALUES ('2', '2000407');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '100');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '200');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '200');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '300');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '300');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '400');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '500');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '10001');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20001');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20001');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20002');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20002');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20003');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20003');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20004');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '20004');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '30001');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '30002');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '40001');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '40002');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '50001');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '50002');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000301');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000301');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000302');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000302');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000303');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000303');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000304');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000304');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000305');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000305');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000306');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000401');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000401');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000402');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000402');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000403');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000403');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000405');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000405');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000406');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000406');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000407');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '2000407');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '3000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '4000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '4000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '4000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '4000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000102');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000103');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000104');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000105');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000106');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000107');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000108');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000201');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000202');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000203');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000204');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000205');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000206');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000207');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000208');
INSERT INTO `tbl_auth_role_permission` VALUES ('4', '5000209');
INSERT INTO `tbl_auth_role_permission` VALUES ('83', '2000101');
INSERT INTO `tbl_auth_role_permission` VALUES ('83', '2000102');

-- ----------------------------
-- Table structure for tbl_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_user`;
CREATE TABLE `tbl_auth_user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` int DEFAULT NULL COMMENT '所属租户ID',
  `account` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录账号',
  `password` char(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '登录密码',
  `user_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户名称',
  `mobile` varchar(24) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '手机号码',
  `email` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '电子邮箱',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '状态 0-禁用 1-启用  99-删除',
  `nickname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '昵称',
  `gender` tinyint DEFAULT '2' COMMENT '0 女  1 男   2 未知',
  `language` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'english' COMMENT '语言',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_by` int NOT NULL COMMENT '账号创建人       -1 系统初始化创建   -2 注册生成',
  `is_auto` tinyint(1) DEFAULT '0' COMMENT '0管理员创建。1 前台注册时自动创建',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uni_tenant_account` (`tenant_id`,`account`) USING BTREE,
  KEY `idx_username` (`user_name`),
  KEY `idx_account` (`account`),
  CONSTRAINT `FK3yxxcykrdam9t85krngb3ix4t` FOREIGN KEY (`tenant_id`) REFERENCES `tbl_tenant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='保存操作员信息';

-- ----------------------------
-- Records of tbl_auth_user
-- ----------------------------
INSERT INTO `tbl_auth_user` VALUES ('1', '1', 'superadmin1', '$2a$10$9OQryn7Y1j.sVM/hNxwEzu91G2ktlGP1fQODkQoXgS2vwSEbDr.U6', '超级管理员', null, 'super@hotmail.com', '1', 'super admin', '2', 'english', '2023-10-27 14:32:39', '-1', '0');
INSERT INTO `tbl_auth_user` VALUES ('2', '1', 'jack', '$2a$10$9OQryn7Y1j.sVM/hNxwEzu91G2ktlGP1fQODkQoXgS2vwSEbDr.U6', 'jack li', null, 'jack@hotmail.com', '1', 'jack', '2', 'english', '2023-10-29 20:32:16', '-1', '0');
INSERT INTO `tbl_auth_user` VALUES ('326', '2', 'lucy', '$2a$10$9OQryn7Y1j.sVM/hNxwEzu91G2ktlGP1fQODkQoXgS2vwSEbDr.U6', 'lucy zhang', null, 'lucy@hotmail.com', '1', null, '2', 'english', '2023-11-01 10:37:14', '-1', '0');

-- ----------------------------
-- Table structure for tbl_auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_auth_user_role`;
CREATE TABLE `tbl_auth_user_role` (
  `user_id` int NOT NULL COMMENT '用户表id',
  `role_id` int NOT NULL COMMENT '角色表id',
  KEY `user_role_index` (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='保存用户和角色的对应关系信息';

-- ----------------------------
-- Records of tbl_auth_user_role
-- ----------------------------
INSERT INTO `tbl_auth_user_role` VALUES ('1', '1');
INSERT INTO `tbl_auth_user_role` VALUES ('2', '2');
INSERT INTO `tbl_auth_user_role` VALUES ('326', '4');

-- ----------------------------
-- Table structure for tbl_org
-- ----------------------------
DROP TABLE IF EXISTS `tbl_org`;
CREATE TABLE `tbl_org` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tenant_id` int NOT NULL COMMENT '租户ID',
  `code` varchar(6) NOT NULL COMMENT '组织编码',
  `name` varchar(20) NOT NULL COMMENT '组织名称',
  `type` tinyint(1) NOT NULL COMMENT '组织类型  1 企业 2 部门  3 分公司 ',
  `status` tinyint(1) NOT NULL COMMENT '状态 1 启用 0 禁用',
  `parent_org` int DEFAULT NULL COMMENT '上级组织  type!=1 的，上级组织不能为空',
  `leader` int DEFAULT NULL COMMENT '负责人',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `classification` int NOT NULL,
  `fullname` varchar(40) NOT NULL,
  `gender` int NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `org_id` int NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COMMENT='组织';

-- ----------------------------
-- Records of tbl_org
-- ----------------------------
INSERT INTO `tbl_org` VALUES ('1', '1', '001', '云服务商', '1', '1', null, '0', '1', '2023-11-03 05:50:24', '0', '', '0', null, '0', '0');
INSERT INTO `tbl_org` VALUES ('2', '2', '001', '友商公司', '1', '1', null, '0', '1', '2023-11-03 14:18:58', '0', '', '0', null, '0', '0');
INSERT INTO `tbl_org` VALUES ('21', '1', '010', '财务部', '3', '1', '1', null, '1', '2024-06-14 10:28:11', '0', '', '0', null, '0', '0');
INSERT INTO `tbl_org` VALUES ('22', '1', '200', '合肥分公司', '2', '1', '1', null, '1', '2024-06-14 10:27:58', '0', '', '0', null, '0', '0');

-- ----------------------------
-- Table structure for tbl_org_depart
-- ----------------------------
DROP TABLE IF EXISTS `tbl_org_depart`;
CREATE TABLE `tbl_org_depart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '离职申请ID 主键',
  `employee_id` int NOT NULL COMMENT '雇员ID',
  `tenant_id` int NOT NULL COMMENT '租户ID',
  `leave_time` datetime DEFAULT NULL COMMENT '离职时间',
  `reason` varchar(255) DEFAULT NULL COMMENT '离职原因',
  `status` tinyint DEFAULT NULL COMMENT '0 待离职  1  已离职  2 撤回',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idex_tenant_employee` (`employee_id`,`tenant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='离职申请表';

-- ----------------------------
-- Records of tbl_org_depart
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_org_employee
-- ----------------------------
DROP TABLE IF EXISTS `tbl_org_employee`;
CREATE TABLE `tbl_org_employee` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '员工主键',
  `tenant_id` int NOT NULL COMMENT '所属租户',
  `code` varchar(20) NOT NULL COMMENT '员工编号',
  `fullname` varchar(40) NOT NULL COMMENT '姓名',
  `gender` tinyint NOT NULL COMMENT '性别  1 男 0 女',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号',
  `org_id` int NOT NULL COMMENT '所属部门',
  `position_id` int NOT NULL COMMENT '岗位',
  `classification` tinyint NOT NULL COMMENT '雇员类型 1 全职  2 兼职  3 实习',
  `join_time` datetime NOT NULL COMMENT '入职时间',
  `status` tinyint NOT NULL COMMENT '1 正式  2 试用  3 已离职',
  `create_by` int DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `un_tenant_code` (`tenant_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3 COMMENT='员工';

-- ----------------------------
-- Records of tbl_org_employee
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_org_position
-- ----------------------------
DROP TABLE IF EXISTS `tbl_org_position`;
CREATE TABLE `tbl_org_position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tenant_id` int NOT NULL COMMENT '租户ID',
  `code` varchar(6) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '职位编码',
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '职位名称',
  `status` tinyint NOT NULL COMMENT '状态  1 启用  0 禁用',
  `create_by` int NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `un_tenant_code` (`tenant_id`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='职位';

-- ----------------------------
-- Records of tbl_org_position
-- ----------------------------
INSERT INTO `tbl_org_position` VALUES ('1', '1', '010', '开发', '1', '1', '2023-11-08 14:09:24');
INSERT INTO `tbl_org_position` VALUES ('2', '1', '020', '测试', '1', '1', '2023-11-08 15:03:38');
INSERT INTO `tbl_org_position` VALUES ('12', '2', '060', '美工', '1', '326', '2023-11-10 13:54:47');
INSERT INTO `tbl_org_position` VALUES ('13', '2', '070', '行政总监', '1', '326', '2023-11-10 13:55:27');
INSERT INTO `tbl_org_position` VALUES ('24', '1', '030', '运维', '1', '1', '2024-06-14 10:26:24');

-- ----------------------------
-- Table structure for tbl_tenant
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tenant`;
CREATE TABLE `tbl_tenant` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(80) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '入驻用户',
  `domain` varchar(40) DEFAULT NULL COMMENT '域名',
  `code` char(6) DEFAULT NULL COMMENT '租户识别码  app 用于中用于区分不同的租户',
  `contact` varchar(20) NOT NULL COMMENT '联系人',
  `phone` varchar(20) NOT NULL COMMENT '联系电话',
  `type` tinyint NOT NULL DEFAULT '2' COMMENT '1 平台商  2 租户 3 试用租户',
  `settled_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `create_by` int NOT NULL DEFAULT '-1' COMMENT '-1  平台初始化',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='入驻用户';

-- ----------------------------
-- Records of tbl_tenant
-- ----------------------------
INSERT INTO `tbl_tenant` VALUES ('1', 'NYTKM 平台商', null, '000', '开发商', '010-00001', '1', null, '2023-10-26 15:56:18', '-1');
INSERT INTO `tbl_tenant` VALUES ('2', '  新希望公司', null, '100', 'joss', '000-10001', '2', null, '2023-10-30 20:21:04', '1');
