/*
Navicat MySQL Data Transfer

Source Server         : 182.18.34.77
Source Server Version : 50547
Source Host           : 182.18.34.77:3306
Source Database       : qinsheng

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-08-11 09:45:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `about`
-- ----------------------------
DROP TABLE IF EXISTS `about`;
CREATE TABLE `about` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名称',
  `content` text COLLATE utf8_unicode_ci COMMENT '内容',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0为激活 1位禁用',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '0 公司介绍  1 联系我们  2常见问题  3用户协议 4意见反馈  5微博  6微信      ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='单页 关于我们 公司介绍';

-- ----------------------------
-- Records of about
-- ----------------------------
INSERT INTO `about` VALUES ('1', '公司介绍', '<p><img alt=\"1470714316528409.png\" src=\"/ueditor/php/upload/image/20160809/1470714316528409.png\" title=\"1470714316528409.png\" height=\"306\" width=\"627\" border=\"0\" vspace=\"0\" style=\"text-align: center; width: 627px; height: 306px;\"/></p><p><br/></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;致力于打造成为国内一流的科技生活服务商，服务方式包括科技生活新媒垂直分发售后服务与消费者实验室的散打业务模块，通过闭环战略，输出行业标准、引导科学消费、建构生活潮流。</p><p><br/></p><p>上传服务条款</p><ul class=\" list-paddingleft-2\"><p>《互联网信息服务管理办法》所严禁的九类信息<br/>（一）反对宪法所确定的基本原则的；</p><p>（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>\r\n （三）损害国家荣誉和利益的；<br/>\r\n （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br/>（五）破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>（六）散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>\r\n （七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>\r\n （八）侮辱或者诽谤他人，侵害他人合法权益的；<br/>\r\n （九）含有法律、行政法规禁止的其他内容的。</p><li><p>若您的视频被屏蔽，屏蔽理由为：含有淫秽色情内容；含有网络低俗内容；根据视听管理规定处理；按照相关规定 ,限制传播；<br/>&nbsp;\r\n 请注意：<br/>&nbsp;\r\n 不得上传任何有违国家法律法规的视频。<br/>\r\n &nbsp; 不得上传具有色情内容的视频。<br/>\r\n &nbsp; 不得上传内容低俗，格调不高的视频。<br/>\r\n &nbsp; 不得上传具有色情诱导性内容的视频。<br/>\r\n &nbsp; 不得在视频画面、词曲，视频标题、简介和标签等处出现任何具有低俗色情含义的字眼。<br/>\r\n &nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介。<br/>\r\n &nbsp; 为保证视频显示效果，避免上传含有其他网站水印的视频。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：遭版权投诉。<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 视频中的画面、词曲等内容不得含有未经授权或遭相关版权方投诉的新闻资讯、影视、音乐、动漫、教育、体育等节目片段。<br/></p></li><li><p>若您的视频被屏蔽，屏蔽理由为：涉嫌垃圾广告、恶意推广类内容；标题不规范<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 不得上传含有垃圾广告、恶意推广、刷屏灌水类内容的视频；<br/>\r\n &nbsp;&nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介；<br/>\r\n &nbsp;&nbsp; 不得将广告函件、促销资料、 &quot;垃圾邮件 &quot;等，加以上载、张贴、发送电子邮件或以其他方式传送。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：转码失败，黑屏、花屏；<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 若您的视频转码失败或者转码后显示黑屏、花屏，请先修复源文件再尝试上传 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p></li><p><br/>\r\n 为响应国家九部委联合开展深入整治互联网和手机媒体淫秽色情及低俗信息专项行动的号召，营造一个健康文明的网络环境，给大家一个和谐积极的家园。</p><li><p>不得上传任何有违国家法律法规的视频。</p></li><li><p>不得上传具有色情内容的视频。</p></li><li><p>不得上传内容低俗，格调不高的视频。</p></li><li><p>不得上传具有色情诱导性内容的视频。</p></li><li><p>不得在标题、简介和标签中出现任何具有低俗色情含义的字眼。</p></li><li><p>不含有涉及版权问题的影视片段。<br/>如果您上传了这些内容，我们将一律予以删除，我们希望我们最珍贵的网友们，理解并监督我们。</p></li></ul><p><br/></p><p><br/></p><p><br/></p>', '0', '2016-07-01 14:21:54', '2016-08-09 17:12:21', '0');
INSERT INTO `about` VALUES ('4', '用户协议', '<p>上传服务条款</p><ul class=\" list-paddingleft-2\"><p>《互联网信息服务管理办法》所严禁的九类信息<br/>（一）反对宪法所确定的基本原则的；</p><p>（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>\r\n （三）损害国家荣誉和利益的；<br/>\r\n （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br/>（五）破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>（六）散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>\r\n （七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>\r\n （八）侮辱或者诽谤他人，侵害他人合法权益的；<br/>\r\n （九）含有法律、行政法规禁止的其他内容的。</p><li><p>若您的视频被屏蔽，屏蔽理由为：含有淫秽色情内容；含有网络低俗内容；根据视听管理规定处理；按照相关规定 ,限制传播；<br/>&nbsp;\r\n 请注意：<br/>&nbsp;\r\n 不得上传任何有违国家法律法规的视频。<br/>\r\n &nbsp; 不得上传具有色情内容的视频。<br/>\r\n &nbsp; 不得上传内容低俗，格调不高的视频。<br/>\r\n &nbsp; 不得上传具有色情诱导性内容的视频。<br/>\r\n &nbsp; 不得在视频画面、词曲，视频标题、简介和标签等处出现任何具有低俗色情含义的字眼。<br/>\r\n &nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介。<br/>\r\n &nbsp; 为保证视频显示效果，避免上传含有其他网站水印的视频。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：遭版权投诉。<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 视频中的画面、词曲等内容不得含有未经授权或遭相关版权方投诉的新闻资讯、影视、音乐、动漫、教育、体育等节目片段。<br/></p></li><li><p>若您的视频被屏蔽，屏蔽理由为：涉嫌垃圾广告、恶意推广类内容；标题不规范<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 不得上传含有垃圾广告、恶意推广、刷屏灌水类内容的视频；<br/>\r\n &nbsp;&nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介；<br/>\r\n &nbsp;&nbsp; 不得将广告函件、促销资料、 &quot;垃圾邮件 &quot;等，加以上载、张贴、发送电子邮件或以其他方式传送。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：转码失败，黑屏、花屏；<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 若您的视频转码失败或者转码后显示黑屏、花屏，请先修复源文件再尝试上传 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p></li><p><br/>\r\n 为响应国家九部委联合开展深入整治互联网和手机媒体淫秽色情及低俗信息专项行动的号召，营造一个健康文明的网络环境，给大家一个和谐积极的家园。</p><li><p>不得上传任何有违国家法律法规的视频。</p></li><li><p>不得上传具有色情内容的视频。</p></li><li><p>不得上传内容低俗，格调不高的视频。</p></li><li><p>不得上传具有色情诱导性内容的视频。</p></li><li><p>不得在标题、简介和标签中出现任何具有低俗色情含义的字眼。</p></li><li><p>不含有涉及版权问题的影视片段。<br/>如果您上传了这些内容，我们将一律予以删除，我们希望我们最珍贵的网友们，理解并监督我们。</p></li></ul><p><br/></p><p><br/></p><p><br/></p>', '0', '2016-07-04 17:02:31', '2016-08-04 11:29:48', '3');
INSERT INTO `about` VALUES ('2', '联系我们', '<p><br/></p><p><br/></p><p>地址： 北京是海淀区硅谷亮城8号楼，服务热线:(010)82850335</p><p><br/></p><p>上传服务条款</p><ul class=\" list-paddingleft-2\"><p>《互联网信息服务管理办法》所严禁的九类信息<br/>（一）反对宪法所确定的基本原则的；</p><p>（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>\r\n （三）损害国家荣誉和利益的；<br/>\r\n （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br/>（五）破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>（六）散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>\r\n （七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>\r\n （八）侮辱或者诽谤他人，侵害他人合法权益的；<br/>\r\n （九）含有法律、行政法规禁止的其他内容的。</p><li><p>若您的视频被屏蔽，屏蔽理由为：含有淫秽色情内容；含有网络低俗内容；根据视听管理规定处理；按照相关规定 ,限制传播；<br/>&nbsp;\r\n 请注意：<br/>&nbsp;\r\n 不得上传任何有违国家法律法规的视频。<br/>\r\n &nbsp; 不得上传具有色情内容的视频。<br/>\r\n &nbsp; 不得上传内容低俗，格调不高的视频。<br/>\r\n &nbsp; 不得上传具有色情诱导性内容的视频。<br/>\r\n &nbsp; 不得在视频画面、词曲，视频标题、简介和标签等处出现任何具有低俗色情含义的字眼。<br/>\r\n &nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介。<br/>\r\n &nbsp; 为保证视频显示效果，避免上传含有其他网站水印的视频。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：遭版权投诉。<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 视频中的画面、词曲等内容不得含有未经授权或遭相关版权方投诉的新闻资讯、影视、音乐、动漫、教育、体育等节目片段。<br/></p></li><li><p>若您的视频被屏蔽，屏蔽理由为：涉嫌垃圾广告、恶意推广类内容；标题不规范<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 不得上传含有垃圾广告、恶意推广、刷屏灌水类内容的视频；<br/>\r\n &nbsp;&nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介；<br/>\r\n &nbsp;&nbsp; 不得将广告函件、促销资料、 &quot;垃圾邮件 &quot;等，加以上载、张贴、发送电子邮件或以其他方式传送。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：转码失败，黑屏、花屏；<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 若您的视频转码失败或者转码后显示黑屏、花屏，请先修复源文件再尝试上传 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p></li><p><br/>\r\n 为响应国家九部委联合开展深入整治互联网和手机媒体淫秽色情及低俗信息专项行动的号召，营造一个健康文明的网络环境，给大家一个和谐积极的家园。</p><li><p>不得上传任何有违国家法律法规的视频。</p></li><li><p>不得上传具有色情内容的视频。</p></li><li><p>不得上传内容低俗，格调不高的视频。</p></li><li><p>不得上传具有色情诱导性内容的视频。</p></li><li><p>不得在标题、简介和标签中出现任何具有低俗色情含义的字眼。</p></li><li><p>不含有涉及版权问题的影视片段。<br/>如果您上传了这些内容，我们将一律予以删除，我们希望我们最珍贵的网友们，理解并监督我们。</p></li></ul><p><br/></p><p><br/></p><p><br/></p>', '0', '2016-07-04 16:34:16', '2016-08-04 11:30:51', '1');
INSERT INTO `about` VALUES ('3', '常见问题', '<p><img src=\"/ueditor/php/upload/image/20160809/1470714371294077.png\" title=\"1470714371294077.png\" alt=\"图层 2(1).png\" style=\"width: 627px; height: 306px;\" border=\"0\" height=\"306\" vspace=\"0\" width=\"627\"/></p><p><br/></p><p>这是常见问题 请提出您的宝贵问题</p><p><br/></p><p>上传服务条款</p><ul class=\" list-paddingleft-2\"><p>《互联网信息服务管理办法》所严禁的九类信息<br/>（一）反对宪法所确定的基本原则的；</p><p>（二）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；<br/>\r\n （三）损害国家荣誉和利益的；<br/>\r\n （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br/>（五）破坏国家宗教政策，宣扬邪教和封建迷信的；<br/>（六）散布谣言，扰乱社会秩序，破坏社会稳定的；<br/>\r\n （七）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；<br/>\r\n （八）侮辱或者诽谤他人，侵害他人合法权益的；<br/>\r\n （九）含有法律、行政法规禁止的其他内容的。</p><li><p>若您的视频被屏蔽，屏蔽理由为：含有淫秽色情内容；含有网络低俗内容；根据视听管理规定处理；按照相关规定 ,限制传播；<br/>&nbsp;\r\n 请注意：<br/>&nbsp;\r\n 不得上传任何有违国家法律法规的视频。<br/>\r\n &nbsp; 不得上传具有色情内容的视频。<br/>\r\n &nbsp; 不得上传内容低俗，格调不高的视频。<br/>\r\n &nbsp; 不得上传具有色情诱导性内容的视频。<br/>\r\n &nbsp; 不得在视频画面、词曲，视频标题、简介和标签等处出现任何具有低俗色情含义的字眼。<br/>\r\n &nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介。<br/>\r\n &nbsp; 为保证视频显示效果，避免上传含有其他网站水印的视频。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：遭版权投诉。<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 视频中的画面、词曲等内容不得含有未经授权或遭相关版权方投诉的新闻资讯、影视、音乐、动漫、教育、体育等节目片段。<br/></p></li><li><p>若您的视频被屏蔽，屏蔽理由为：涉嫌垃圾广告、恶意推广类内容；标题不规范<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 不得上传含有垃圾广告、恶意推广、刷屏灌水类内容的视频；<br/>\r\n &nbsp;&nbsp; 不要使用无意义、难于理解或带有欺骗性质的内容做为视频标题、标签和简介；<br/>\r\n &nbsp;&nbsp; 不得将广告函件、促销资料、 &quot;垃圾邮件 &quot;等，加以上载、张贴、发送电子邮件或以其他方式传送。</p></li><li><p>若您的视频被屏蔽，屏蔽理由为：转码失败，黑屏、花屏；<br/>\r\n &nbsp;&nbsp; 请注意：<br/>\r\n &nbsp;&nbsp; 若您的视频转码失败或者转码后显示黑屏、花屏，请先修复源文件再尝试上传 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/></p></li><p><br/>\r\n 为响应国家九部委联合开展深入整治互联网和手机媒体淫秽色情及低俗信息专项行动的号召，营造一个健康文明的网络环境，给大家一个和谐积极的家园。</p><li><p>不得上传任何有违国家法律法规的视频。</p></li><li><p>不得上传具有色情内容的视频。</p></li><li><p>不得上传内容低俗，格调不高的视频。</p></li><li><p>不得上传具有色情诱导性内容的视频。</p></li><li><p>不得在标题、简介和标签中出现任何具有低俗色情含义的字眼。</p></li><li><p>不含有涉及版权问题的影视片段。<br/>如果您上传了这些内容，我们将一律予以删除，我们希望我们最珍贵的网友们，理解并监督我们。</p></li></ul><p><br/></p><p><br/></p><p><br/></p>', '0', '2016-07-04 16:34:44', '2016-08-09 11:46:15', '2');
INSERT INTO `about` VALUES ('7', '微博', '<p>http://www.sina.com.cn/</p>', '0', '2016-07-19 14:58:12', '2016-07-21 13:31:28', '5');
INSERT INTO `about` VALUES ('8', '微信', '<p><img src=\"/ueditor/php/upload/image/20160718/gzh.png\" title=\"gzh.png\" alt=\"weixin.png\"/></p>', '0', '2016-07-19 14:58:26', '2016-07-19 15:02:01', '6');

-- ----------------------------
-- Table structure for `activity`
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `beginTime` date DEFAULT NULL COMMENT '活动开始时间',
  `endTime` date DEFAULT NULL COMMENT '活动结束时间',
  `activityRrom` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '活动举办方（来源）',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/admin/image/activity/moren.png' COMMENT '图片地址',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0未上线 1进行中 2 未开始  3  已结束',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='首页滚动banner';

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '秦皇岛市2016第二届钢琴公开赛', '2016-07-14', '2016-07-16', '秦皇岛市钢琴协会', '/admin/image/activity/152f3daaa0877d887625842699b25cb5.png', 'www.baidu.com', '1', '2016-08-04 17:02:54', '2016-08-05 13:14:12');
INSERT INTO `activity` VALUES ('2', '第五届国际青少年钢琴家比赛（日本滨松）', '2016-07-15', '2016-07-20', '中国赛事组委会', '/admin/image/activity/0c8088ec4d0d04109b0f3b2327d87d47.png', 'www.baidu.com', '1', '2016-08-04 17:03:57', '2016-08-05 13:14:21');
INSERT INTO `activity` VALUES ('3', '2016亚洲钢琴艺术节暨“海顿艺术奖”国际青少年钢琴公开赛', '2016-08-02', '2016-08-11', '中国钢琴艺术研究会', '/admin/image/activity/7798df98b648c488e15edcc8f6695166.png', 'www.12306.com', '1', '2016-08-04 17:05:56', '2016-08-05 13:15:30');
INSERT INTO `activity` VALUES ('4', '巴西里约奥运会', '2016-08-06', '2016-08-22', '联合国', 'admin/image/activity/fafe3f39d41ebc262302678d62b1d288.png', 'http://2016.cctv.com/', '2', '2016-08-05 15:22:21', '2016-08-05 15:29:07');

-- ----------------------------
-- Table structure for `applycourse`
-- ----------------------------
DROP TABLE IF EXISTS `applycourse`;
CREATE TABLE `applycourse` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `orderSn` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `courseTitle` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '演奏视频标题',
  `userId` int(10) DEFAULT NULL,
  `courseLowPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频低路径',
  `courseMediumPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频中路径',
  `courseHighPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频高路径',
  `coursePic` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT '封面图',
  `lastCheckTime` datetime DEFAULT NULL COMMENT '最近审核时间',
  `state` tinyint(1) DEFAULT '1' COMMENT '演奏视频状态(0:审核未通过1:审核中2:审核通过)',
  `teacherId` int(10) DEFAULT '0' COMMENT '点评名师',
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '学员留言',
  `courseView` int(10) DEFAULT '0' COMMENT '视频浏览数',
  `coursePlayView` int(10) DEFAULT '0' COMMENT '视频观看数，视频播放统计',
  `courseFav` int(10) DEFAULT '0' COMMENT '视频收藏数',
  `courseStatus` tinyint(1) DEFAULT '0' COMMENT '课程状态 0为激活 1为锁定',
  `courseIsDel` tinyint(1) DEFAULT '0' COMMENT '删除标识 0为正常显示 1为虚拟删除',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `fileID` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='学员演奏视频 申请点评视频';

-- ----------------------------
-- Records of applycourse
-- ----------------------------
INSERT INTO `applycourse` VALUES ('1', '2016080457a307ff34aa9', '第一次测试~~~~', '3', '5d05fb518b314e4e8552c00992b55bba', '', '', '', '2016-08-04 17:29:33', '2', '5', '好兴奋~~~~~', '0', '0', '0', '0', '0', '2016-08-04 17:18:49', '2016-08-04 17:28:04', 'a546266543844437ab23d2ab8c06a3ad');
INSERT INTO `applycourse` VALUES ('2', '2016080457a308f702e78', '第二次测试~~', '3', '5d05fb518b314e4e8552c00992b55bba', '', '', '', '2016-08-04 17:29:19', '2', '5', '好期待~~', '0', '0', '0', '0', '0', '2016-08-04 17:21:27', '2016-08-04 17:28:17', 'd45f2c5fe36641c98ce8e7b5160d79c8');
INSERT INTO `applycourse` VALUES ('3', '2016080457a30b9bd9a6b', '梦中的婚礼', '7', '9bf94263ef9f4a15b08dac16850cd816', null, null, '', '2016-08-04 17:48:01', '2', '5', 'RichardClayderman-梦中的婚礼饭制版.mkvRichardClayderman-梦中的婚礼饭制版.mkv', '0', '0', '0', '0', '0', '2016-08-04 17:34:52', '2016-08-04 17:34:52', '31efbe9155cc4b59888271d80aa6f9c9');
INSERT INTO `applycourse` VALUES ('7', '2016080457a320c8c8bab', '测试2', '3', 'c3fdedfdcab94fd9886fb227e51a7d3a', null, null, '', '2016-08-04 19:03:33', '2', '5', '', '0', '0', '0', '0', '0', '2016-08-04 19:03:19', '2016-08-04 19:03:19', '1552ed06fb2c4bb3a0402afada1ca21f');
INSERT INTO `applycourse` VALUES ('5', '2016080457a31018dd85b', '~~~~~~~~~~~~', '3', '5d05fb518b314e4e8552c00992b55bba', null, null, '/home/image/lessonSubject/fba6001b76ca7390ccc1560bb2c53660.jpg', '2016-08-04 17:52:33', '2', '5', '', '0', '0', '0', '0', '0', '2016-08-04 17:52:17', '2016-08-04 17:52:17', 'c5c9d48088a6461faf59957da18d3fa1');
INSERT INTO `applycourse` VALUES ('6', '2016080457a31d0b462ce', '动漫', '7', 'c3fdedfdcab94fd9886fb227e51a7d3a', null, null, '', '2016-08-04 18:47:52', '2', '5', '动漫动漫动漫动漫动漫', '0', '0', '0', '0', '0', '2016-08-04 18:47:41', '2016-08-04 18:47:41', '7c632ded410c4d35ab9081af16af5694');
INSERT INTO `applycourse` VALUES ('8', '2016080457a326378d00d', '通知1', '9', 'c3fdedfdcab94fd9886fb227e51a7d3a', null, null, '/home/image/lessonSubject/b265957e281cc42b31fdfe340b4d7c65.jpg', '2016-08-04 19:28:22', '2', '5', '学员能否收到点评通知', '0', '0', '0', '0', '0', '2016-08-04 19:27:34', '2016-08-04 19:39:08', 'b45e4fb8b0634e6191e63b80796849c5');
INSERT INTO `applycourse` VALUES ('9', '2016080557a3fcb9d1f10', '弹指教学', '2', 'c15afd25a63145b389f7a930928d6adc', '', '', '', '2016-08-05 10:49:32', '2', '10', '', '0', '0', '0', '0', '0', '2016-08-05 10:46:03', '2016-08-05 10:49:02', 'fa8736ae0d0c48369551b950e9f750ee');
INSERT INTO `applycourse` VALUES ('10', '2016080557a4082f773f3', '《梨花又开放》', '2', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', '', '', '2016-08-05 11:31:45', '2', '8', '', '0', '0', '0', '0', '0', '2016-08-05 11:30:58', '2016-08-05 11:31:37', '9a8f2c3d1a024ba6888f82d97338c63c');
INSERT INTO `applycourse` VALUES ('11', '2016080557a44490d481c', '童话', '6', 'd59a654085534457bdee0f478f2b34da', '49b35f1fb5974c8c9625500d0f71f3cd', null, '', '2016-08-05 15:49:15', '2', '10', '请老师指出指法和掌握基础的不足', '0', '0', '0', '0', '0', '2016-08-05 15:48:26', '2016-08-05 15:48:26', 'd39d07bd4997485fa49871d69605e650');
INSERT INTO `applycourse` VALUES ('12', '2016080557a4462c13ac8', '变态王子与不笑猫', '9', 'c3fdedfdcab94fd9886fb227e51a7d3a', '', '', '/home/image/lessonSubject/6383e5d514cd4b9eaf4ea65eb2cb4548.png', '2016-08-05 16:01:06', '2', '13', '动漫专属-BabySweetBerryLove钢琴版#变态王子与不笑猫#ED.mkv', '0', '0', '0', '0', '0', '2016-08-05 15:57:19', '2016-08-05 15:59:44', 'a7f81de1653a4e9c9cf2c20191e01ef4');
INSERT INTO `applycourse` VALUES ('13', '2016080557a4621623bd5', '梁祝', '2', 'a4ef95305a6044a5855afff17674ea3b', '6c55c146f7204936b7730e53d0c0cdfc', null, '', '2016-08-05 17:56:28', '2', '10', '', '0', '0', '0', '0', '0', '2016-08-05 17:54:36', '2016-08-05 17:54:36', 'd389ead10d574d6b9e8bf24cd411c0a9');
INSERT INTO `applycourse` VALUES ('14', '2016080557a463f67565e', '刘静~~~~~~', '3', '5d05fb518b314e4e8552c00992b55bba', null, null, '/home/image/lessonSubject/afe21457c16e9ff2ed4679ccc296560f.jpg', '2016-08-05 18:03:07', '2', '5', '', '0', '0', '0', '0', '0', '2016-08-05 18:02:02', '2016-08-05 18:08:54', 'b51da48508914144afa24ddca86035e0');
INSERT INTO `applycourse` VALUES ('15', '2016080557a464a84d0b7', '刘静~~~~~~', '3', '5d05fb518b314e4e8552c00992b55bba', null, null, '/home/image/lessonSubject/205f4c22d10963e35b90d7d3df2ce5dd.jpg', '2016-08-05 18:05:39', '2', '5', '', '0', '0', '0', '0', '0', '2016-08-05 18:05:30', '2016-08-05 18:08:45', 'f4528a29af0848dbacec2873004e50cf');
INSERT INTO `applycourse` VALUES ('16', '2016080557a466901ab3b', '你好吗~', '3', '5d05fb518b314e4e8552c00992b55bba', null, null, '/home/image/lessonSubject/282a3b5bba5ba4a2c7cd9c5cc0b3d23b.jpg', '2016-08-05 18:13:32', '2', '5', '墙上静止的钟是为谁停留？', '0', '0', '0', '0', '0', '2016-08-05 18:13:26', '2016-08-05 18:13:42', 'f8f21c51b8744118993869eb70179df2');
INSERT INTO `applycourse` VALUES ('17', '2016080557a467838f3d0', '测试两个id', '2', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', null, '', '2016-08-05 18:17:21', '2', '8', '', '0', '0', '0', '0', '0', '2016-08-05 18:17:13', '2016-08-05 18:17:13', '141815e84ce949f7a7b1036b51ce8ca3');
INSERT INTO `applycourse` VALUES ('18', '2016080857a7e3afc5486', '《天黑黑》', '2', '333b0ff554bb443292341c2a89c7a2c5', 'dff031d6e7b84332a0b3ea67352ff04d', null, '', '2016-08-08 09:45:47', '2', '8', '', '0', '0', '0', '0', '0', '2016-08-08 09:45:26', '2016-08-08 09:45:26', 'f6f07423e796448c8a864b7406aea51d');
INSERT INTO `applycourse` VALUES ('19', '2016080857a7f2408d4d7', '《前世情人》', '6', '6fff3ef4111348b589615951629de68d', '1cd96ab8acb1424e87cf07830aff74a7', null, '/home/image/lessonSubject/3c0eda7e2af2a3ffd7153c40e2b97977.png', '2016-08-08 10:47:45', '2', '8', '', '0', '0', '0', '0', '0', '2016-08-08 10:47:31', '2016-08-08 10:47:57', 'e977dc9112fa47d1a9982f5d509898a9');
INSERT INTO `applycourse` VALUES ('20', '2016080857a7f6326140d', '《寻找莫扎特》', '6', '17e9f6d2b13649cf83bf6110538380e0', '859aa6a3845846f28ebe096095a44ceb', null, '', '2016-08-08 11:03:01', '2', '13', '', '0', '0', '0', '0', '0', '2016-08-08 11:02:50', '2016-08-08 11:02:50', 'e1ecbc52251440678b2c44510efcdc68');
INSERT INTO `applycourse` VALUES ('21', '2016080857a7fb8a28085', '《有没有》', '2', '7c33e8b67a0642a09ee7afbc04f64e0f', '7b1f9eccfb874347834d8f4ab45ddbf8', null, '', '2016-08-08 11:26:40', '2', '10', '', '0', '0', '0', '0', '0', '2016-08-08 11:26:32', '2016-08-08 11:26:32', '400e9155ed3448b1a24aa08748fa0d83');
INSERT INTO `applycourse` VALUES ('22', '2016080857a80068cc599', '《太阳的后裔》主题曲', '2', '32c54f1420b44bbf9a021f6ef89a6e85', 'bc1be1189c334102bec1771d84251589', null, '', '2016-08-08 13:42:13', '2', '10', '', '0', '0', '0', '0', '0', '2016-08-08 11:48:03', '2016-08-08 11:48:03', '5541c01457174b01802189992c941f48');
INSERT INTO `applycourse` VALUES ('23', '2016080857a81a6e274e5', '莫扎特', '9', '781b0799e568442c8be53de3d65c5a5a', '', '', '', '2016-08-08 13:56:40', '2', '13', '清晰度还不错的 通过吧铜鼓吧', '0', '0', '0', '0', '0', '2016-08-08 13:39:05', '2016-08-08 13:56:05', '2b8d72e1597443dda07073aed2799867');
INSERT INTO `applycourse` VALUES ('24', '2016080857a81b1737eda', 'apologize_标清.flv', '9', 'ef2c02a3281d46c4bc8ed9a0d4668282', null, null, '', '2016-08-08 13:49:58', '2', '8', '鋼琴演奏apologize_标清.flv', '0', '0', '0', '0', '0', '2016-08-08 13:41:25', '2016-08-08 13:41:25', '6b20b67954e941bca46fad554dea4eeb');
INSERT INTO `applycourse` VALUES ('25', '2016080857a834d441713', '《寻找莫扎特》', '2', '17e9f6d2b13649cf83bf6110538380e0', '859aa6a3845846f28ebe096095a44ceb', '', '', '2016-08-08 15:37:31', '2', '13', '我说的是啥', '0', '0', '0', '0', '0', '2016-08-08 15:31:04', '2016-08-08 15:37:19', '8fb90a8961354064bf060bbc3bd4cfb4');
INSERT INTO `applycourse` VALUES ('26', '2016080857a837b0c79d5', '《小薇》', '2', '6b97d9efbc90422594c53e512e443abf', '7f6864e184fe4333a95302faf8f2e402', null, '', '2016-08-08 15:49:55', '2', '10', '请老师点评下指法', '0', '0', '0', '0', '0', '2016-08-08 15:44:16', '2016-08-08 15:44:16', 'f8093e85375a45e6a6ca437682709911');
INSERT INTO `applycourse` VALUES ('27', '2016080857a83a2231e0b', '《梦中的婚礼》', '6', 'c67d3f4f206c40ea83f5fc72912d31cb', null, null, '', '2016-08-08 15:53:47', '2', '10', '啛啛喳喳', '0', '0', '0', '0', '0', '2016-08-08 15:53:34', '2016-08-08 15:53:34', '55f8cd3f3a6c436592eac63792e37942');
INSERT INTO `applycourse` VALUES ('28', '2016080857a83e358adfe', '梨花又开放', '6', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', null, '', null, '1', '8', '费vffffv凤飞飞', '0', '0', '0', '0', '1', '2016-08-08 16:10:14', '2016-08-08 16:10:14', 'e543c725ae37430b8fb0d2d7e8a00cee');
INSERT INTO `applycourse` VALUES ('29', '2016080857a8408f8a65f', 'nininini', '6', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', null, '', null, '1', '17', '飞凤飞飞', '0', '0', '0', '0', '0', '2016-08-08 16:20:13', '2016-08-08 16:20:13', '0814b0904309421daeeb3da952e30fd5');
INSERT INTO `applycourse` VALUES ('30', '2016080857a841d558826', 'kkkk', '2', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', null, '', '2016-08-08 16:26:46', '2', '17', 'vvv', '0', '0', '0', '0', '0', '2016-08-08 16:25:57', '2016-08-08 16:25:57', '9dfa82afd17440e6b6701e28fc003283');
INSERT INTO `applycourse` VALUES ('31', '2016080857a844b249274', 'vvvvv', '2', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', null, '', '2016-08-08 16:38:02', '2', '17', '嘎嘎嘎嘎', '0', '0', '0', '0', '0', '2016-08-08 16:37:40', '2016-08-08 16:37:40', '1972960c6a8e432b8cf8fe91e3ec4e92');
INSERT INTO `applycourse` VALUES ('32', '2016080857a8469292d49', 'qqqqq', '6', 'd59a654085534457bdee0f478f2b34da', '49b35f1fb5974c8c9625500d0f71f3cd', null, '', '2016-08-08 16:47:41', '2', '17', '不不不', '0', '0', '0', '0', '1', '2016-08-08 16:47:20', '2016-08-08 16:47:20', '0a42aca153eb4de2bbd1a49c16600d1a');
INSERT INTO `applycourse` VALUES ('33', '2016080957a96a306b33b', '拖卡塔', '21', '896ee41e0daa4ceba031bbb4dd1b04b7', null, null, '', '2016-08-09 13:35:11', '2', '20', '手速怎样调整', '0', '0', '0', '0', '0', '2016-08-09 13:34:36', '2016-08-09 13:34:36', '05cc410d2b7e43ed917297bb712801bb');
INSERT INTO `applycourse` VALUES ('34', '2016080957a96cb6d4916', '《悲怆》第三乐章', '24', 'ec8719c16e1a473d9b7f5b4ebb7aef36', null, null, '', '2016-08-09 13:47:43', '2', '20', '请老师指点下指法节奏和', '0', '0', '0', '0', '0', '2016-08-09 13:47:01', '2016-08-09 13:47:01', '062a6008623f4a2d847e9272df4e3f54');
INSERT INTO `applycourse` VALUES ('35', '2016080957a970bd87639', 'aaa', '14', 'c2860714917449f38882a9fc50abcc33', '331310e7cae34e1c9555c6d99f8b4781', null, '', null, '1', '20', 'aaa', '0', '0', '0', '0', '0', '2016-08-09 13:58:35', '2016-08-09 13:58:35', 'cad0b21948f24c598941ad5683530674');
INSERT INTO `applycourse` VALUES ('36', '2016080957a96f74ca4d1', '《月光奏鸣曲》', '25', 'd0ceb9ec3e2c4080a6f1175fab51ad7a', null, null, '', '2016-08-09 14:05:10', '2', '20', '请老师指点下指法节奏', '0', '0', '0', '0', '0', '2016-08-09 14:04:55', '2016-08-09 14:04:55', '4630842eeb734e32abd779aa7b70517c');
INSERT INTO `applycourse` VALUES ('37', '2016080957a9736fd876b', '小步舞曲', '26', '069415569b644c039dca0d6c0429cbff', null, null, '', '2016-08-09 14:12:15', '2', '20', '如何控制声音，把我音律，', '0', '0', '0', '0', '0', '2016-08-09 14:10:32', '2016-08-09 14:10:32', 'ccd0e7aa6933494faac857811b5f5d5c');
INSERT INTO `applycourse` VALUES ('38', '111', '1111', '111', null, null, null, '', null, '1', '111', '', '0', '0', '0', '0', '0', '2016-08-09 15:53:52', '2016-08-09 15:53:52', null);
INSERT INTO `applycourse` VALUES ('39', '2016080957a9a0c55bbb1', '测试视频', '16', '6daf9e13ae8348cdb220c8adfbb85865', null, null, '/home/image/lessonSubject/7ef20a3a6a3ae7552800fdbb9f6b439b.jpg', '2016-08-09 17:25:16', '2', '20', '看看能播放吗？', '0', '0', '0', '0', '0', '2016-08-09 17:24:14', '2016-08-09 18:06:24', '3e5da725d04d48a4b1fd6d3bf7445c06');
INSERT INTO `applycourse` VALUES ('40', '2016081057aa8f877622e', 'Sugar~~', '3', '5d05fb518b314e4e8552c00992b55bba', null, null, '', '2016-08-10 10:24:17', '2', '20', '', '0', '0', '0', '0', '0', '2016-08-10 10:21:36', '2016-08-10 10:21:36', '660edbb6b9184dbe863ba2649d441c4f');
INSERT INTO `applycourse` VALUES ('41', '2016081057aacad49af59', '转码转码', '21', 'ba149d26bc824c0588b3eb67842b69fa', null, null, '', '2016-08-10 17:35:40', '1', '20', '转码转码转码转码转码转码转码转码', '0', '0', '0', '0', '0', '2016-08-10 14:47:27', '2016-08-10 14:47:27', 'd7fd52d13ee34e5fa937d296d46fefd9');
INSERT INTO `applycourse` VALUES ('42', '2016081057aacfb625df2', '转码转码', '21', '8357ee98bdd748de921f30096a8901af', 'a6f211ecc65145b5b967cd688290d8e9', '9ad63325f97448cb9275c8e3ef91aca4', '', '2016-08-10 17:36:30', '2', '8', '冰雪奇缘', '0', '0', '0', '0', '0', '2016-08-10 15:06:02', '2016-08-10 15:06:02', '83b0669f1aae47d79e12d7d8c3703595');
INSERT INTO `applycourse` VALUES ('43', '2016081057aad2b020987', '华尔街之狼_clip(1).avi', '21', 'b8c538b2afdc43adb8349eb5c5430ecc', 'e3173b81cdbf498faeec6527a63e6f45', '81eacac2aa0f458d8b3898c9a38a0baa', '', '2016-08-10 17:05:18', '2', '10', '华尔街之狼_clip(1).avi华尔街之狼_clip(1).avi华尔街之狼_clip(1).avi', '0', '0', '0', '0', '0', '2016-08-10 15:09:33', '2016-08-10 15:09:33', 'a109a72716c24da18bdd4472b52d79bf');
INSERT INTO `applycourse` VALUES ('44', '2016081057aad34242565', '华尔街之狼_clip(1).flv', '21', 'a1daf874d9624093bb91d512445bf53d', '877708cc384c4eb2b92ca800974e6c3e', '945bd9cc3f5a410e81387e25f8191b4d', '', '2016-08-10 17:03:27', '2', '13', '华尔街之狼_clip(1).flv华尔街之狼_clip(1).flv华尔街之狼_clip(1).flv', '0', '0', '0', '0', '0', '2016-08-10 15:12:34', '2016-08-10 15:12:34', 'faa945a94a154d749322eff79a5f54fa');
INSERT INTO `applycourse` VALUES ('45', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', '', '2016-08-10 16:55:16', '2', '13', 'san次', '0', '0', '0', '0', '0', '2016-08-10 15:15:08', '2016-08-10 16:51:01', '4d0553101747426ba62ef35e6e38213a');
INSERT INTO `applycourse` VALUES ('50', '2016080957a9906c76422', '错乱（大长）', '2', '97201b7a6f1145eeaffd1bdd60f686fc', null, null, '/home/image/lessonSubject/b5f7181e19e3007c8840966603c61af3.jpg', '2016-08-10 17:19:06', '2', '20', '嘎嘎嘎旷工旷工看看', '0', '0', '0', '0', '0', '2016-08-10 17:18:55', '2016-08-10 17:24:34', '2ede03687fc1438987e707afc56dde6a');
INSERT INTO `applycourse` VALUES ('46', '2016081057aac37e0ba21', '贝多芬交响乐', '2', 'af02ea7019784975a11c57c8f6e4fde9', null, null, '', '2016-08-10 15:24:27', '2', '20', '帮vbvbvbbv', '0', '0', '0', '0', '0', '2016-08-10 15:24:04', '2016-08-10 15:24:04', '11745fa2ceae4a5ab55d7d12558d4c22');
INSERT INTO `applycourse` VALUES ('47', '2016081057aad0831f54f', '一个非常大的视频', '3', 'bb1b78e27d894294bd2dd09477239128', null, null, '', '2016-08-10 15:41:06', '2', '20', '', '0', '0', '0', '0', '0', '2016-08-10 15:36:21', '2016-08-10 15:36:21', 'a6b697a4a3654e988b97f00e61856437');
INSERT INTO `applycourse` VALUES ('49', '2016081057aa87ec3010d', '钢琴视频', '2', '97201b7a6f1145eeaffd1bdd60f686fc', null, null, '', '2016-08-10 17:18:16', '2', '20', '大全', '0', '0', '0', '0', '0', '2016-08-10 16:47:51', '2016-08-10 16:47:51', 'c9e9a76b259c4e669504b54e80ddf593');
INSERT INTO `applycourse` VALUES ('51', '2016081057aaf81d6c511', 'MP4', '21', '5d2b3db485504600bb6b59fa4dc8a04b', 'bc8a60af290349ae8e7804cabf350e02', null, '', '2016-08-10 17:55:20', '2', '13', '', '0', '0', '0', '0', '0', '2016-08-10 17:50:51', '2016-08-10 17:50:51', '355e127df3734738a9f88d45161f45f2');
INSERT INTO `applycourse` VALUES ('52', '2016081157abd49b3bc91', 'wmv', '26', 'dad5e0ce3669401d87b97ea23bda07b9', 'ae965c6eee92486ebb4e119854e84237', null, '', '2016-08-11 09:34:09', '2', '10', '名师邀请的通知呢通知呢', '0', '0', '0', '0', '0', '2016-08-11 09:30:50', '2016-08-11 09:30:50', 'b292448af95a41778e63fc83cab06928');

-- ----------------------------
-- Table structure for `applycoursecomment`
-- ----------------------------
DROP TABLE IF EXISTS `applycoursecomment`;
CREATE TABLE `applycoursecomment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `commentContent` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源类型名称',
  `courseId` tinyint(1) DEFAULT NULL COMMENT '资源ID',
  `parentId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被回复的评论id （可为空）',
  `fromUserId` int(10) DEFAULT NULL COMMENT '评论用户',
  `toUserId` int(10) DEFAULT NULL COMMENT '回复给某个用户',
  `likeNum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checks` tinyint(1) DEFAULT '0' COMMENT '审核状态 0为通过 1为未审核状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='演奏点评视频评论';

-- ----------------------------
-- Records of applycoursecomment
-- ----------------------------
INSERT INTO `applycoursecomment` VALUES ('1', 'dasdasdasd', '2', null, '5', null, null, '0', '2016-08-04 17:58:27');
INSERT INTO `applycoursecomment` VALUES ('2', '学员可以收到通知', '9', null, '9', null, null, '0', '2016-08-04 19:32:41');
INSERT INTO `applycoursecomment` VALUES ('3', '关注者也可收到点评的信息', '9', null, '6', null, null, '0', '2016-08-04 19:37:48');
INSERT INTO `applycoursecomment` VALUES ('4', '从播放页面购买点评课程时 二维码加载不全', '9', null, '6', null, null, '0', '2016-08-04 19:38:25');
INSERT INTO `applycoursecomment` VALUES ('5', '谢谢老师评价~~', '2', '1', '3', '5', '16', '0', '2016-08-05 09:51:25');
INSERT INTO `applycoursecomment` VALUES ('6', '购买用户方能进行反馈操作', '70', null, '9', null, null, '0', '2016-08-05 14:22:13');
INSERT INTO `applycoursecomment` VALUES ('7', '我是在评论你哟\n', '70', null, '6', null, null, '0', '2016-08-05 15:46:07');
INSERT INTO `applycoursecomment` VALUES ('8', '购买但未观看  等待退款', '70', null, '9', null, null, '0', '2016-08-05 17:42:52');
INSERT INTO `applycoursecomment` VALUES ('9', '嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎', '80', null, '8', null, null, '0', '2016-08-08 09:58:14');
INSERT INTO `applycoursecomment` VALUES ('10', '嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎', '80', null, '8', null, null, '0', '2016-08-08 09:58:17');
INSERT INTO `applycoursecomment` VALUES ('11', '飞凤飞飞飞凤飞飞凤飞飞凤飞飞凤飞飞凤飞飞凤飞飞', '80', null, '8', null, null, '0', '2016-08-08 09:58:20');
INSERT INTO `applycoursecomment` VALUES ('12', '顶顶顶顶顶', '80', '11', '6', '8', null, '0', '2016-08-08 09:59:48');
INSERT INTO `applycoursecomment` VALUES ('13', '上海市上海市挥挥手', '80', '10', '6', '8', null, '0', '2016-08-08 10:00:28');
INSERT INTO `applycoursecomment` VALUES ('14', '你你你你你你您', '80', '12', '2', '6', null, '0', '2016-08-08 10:01:31');
INSERT INTO `applycoursecomment` VALUES ('15', 'vvvvvvvvvvvvvvvvvvvvvv          ', '80', '14', '6', '2', null, '0', '2016-08-08 10:03:15');
INSERT INTO `applycoursecomment` VALUES ('23', '我是贝多芬\n', '91', null, '17', null, null, '0', '2016-08-08 16:55:10');
INSERT INTO `applycoursecomment` VALUES ('17', '在啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧啧', '80', '16', '2', '10', null, '0', '2016-08-08 10:04:39');
INSERT INTO `applycoursecomment` VALUES ('18', '我来了\n', '78', null, '10', null, null, '0', '2016-08-08 10:09:18');
INSERT INTO `applycoursecomment` VALUES ('19', '回复名师', '78', '18', '6', '10', null, '0', '2016-08-08 10:10:14');
INSERT INTO `applycoursecomment` VALUES ('20', '回复学员', '78', '19', '2', '6', null, '0', '2016-08-08 10:11:06');
INSERT INTO `applycoursecomment` VALUES ('21', '和嘿嘿嘿嘿和', '80', null, '13', null, null, '0', '2016-08-08 10:27:36');
INSERT INTO `applycoursecomment` VALUES ('22', '回复杰伦', '80', '21', '6', '13', null, '0', '2016-08-08 10:28:20');
INSERT INTO `applycoursecomment` VALUES ('24', '啥叫贝多芬', '91', '23', '6', '17', null, '0', '2016-08-08 16:55:42');
INSERT INTO `applycoursecomment` VALUES ('25', '必须的  技术还是不错滴', '9', '3', '9', '6', null, '0', '2016-08-09 10:01:14');
INSERT INTO `applycoursecomment` VALUES ('26', '8', '84', null, '27', null, null, '0', '2016-08-09 16:57:52');
INSERT INTO `applycoursecomment` VALUES ('27', '~~~~~~~~', '119', null, '16', null, '16', '0', '2016-08-09 18:19:07');
INSERT INTO `applycoursecomment` VALUES ('28', '我没有买呀？', '71', null, '16', null, '16', '0', '2016-08-10 10:25:57');
INSERT INTO `applycoursecomment` VALUES ('29', '怎么可以发布评论呢？', '71', null, '16', null, '16,2', '0', '2016-08-10 10:26:06');
INSERT INTO `applycoursecomment` VALUES ('30', 'vvvvvvvvvv ', '71', null, '2', null, '16', '0', '2016-08-10 10:28:29');
INSERT INTO `applycoursecomment` VALUES ('31', '飞凤飞飞飞凤飞飞', '71', null, '2', null, '16', '0', '2016-08-10 10:28:57');
INSERT INTO `applycoursecomment` VALUES ('32', 'vvvvvvvvvvvvv ', '80', null, '2', null, null, '0', '2016-08-10 10:33:05');
INSERT INTO `applycoursecomment` VALUES ('33', 'what?', '71', '29', '2', '16', null, '0', '2016-08-10 11:21:24');

-- ----------------------------
-- Table structure for `banner`
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin/image/contentManager/banner/jiayuguan.jpg' COMMENT '图片地址',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'url地址',
  `bgColor` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='首页滚动banner';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('6', 'bannera', '/admin/image/contentManager/banner/7572b3db5fb008e56c810902783720a2.png', '0', '2016-08-05 16:51:00', 'www.baidu.com', '#1D1D1B');
INSERT INTO `banner` VALUES ('7', 'bannerb', '/admin/image/contentManager/banner/7a0312a7ac622958688d65601faff12a.png', '0', '2016-08-05 16:51:24', 'www.baidu.com', '#DFD5CB');
INSERT INTO `banner` VALUES ('10', '菜菜', '/admin/image/contentManager/banner/43f4a45952c3d736a65e72683365316a.jpg', '1', '2016-08-09 10:24:09', 'www.baidu.com', '#CCFFFF');

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `provincecode` varchar(6) NOT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '0激活 1锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=347 DEFAULT CHARSET=utf8 COMMENT='城市表';

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES ('1', '110100', '北京市', '110000', '0');
INSERT INTO `city` VALUES ('2', '130100', '石家庄市', '130000', '0');
INSERT INTO `city` VALUES ('3', '130200', '唐山市', '130000', '0');
INSERT INTO `city` VALUES ('4', '130300', '秦皇岛市', '130000', '0');
INSERT INTO `city` VALUES ('5', '130400', '邯郸市', '130000', '0');
INSERT INTO `city` VALUES ('6', '130500', '邢台市', '130000', '0');
INSERT INTO `city` VALUES ('7', '130600', '保定市', '130000', '0');
INSERT INTO `city` VALUES ('8', '130700', '张家口市', '130000', '0');
INSERT INTO `city` VALUES ('9', '130800', '承德市', '130000', '0');
INSERT INTO `city` VALUES ('10', '130900', '沧州市', '130000', '0');
INSERT INTO `city` VALUES ('11', '131000', '廊坊市', '130000', '0');
INSERT INTO `city` VALUES ('12', '131100', '衡水市', '130000', '0');
INSERT INTO `city` VALUES ('13', '140100', '太原市', '140000', '0');
INSERT INTO `city` VALUES ('14', '140200', '大同市', '140000', '0');
INSERT INTO `city` VALUES ('15', '140300', '阳泉市', '140000', '0');
INSERT INTO `city` VALUES ('16', '140400', '长治市', '140000', '0');
INSERT INTO `city` VALUES ('17', '140500', '晋城市', '140000', '0');
INSERT INTO `city` VALUES ('18', '140600', '朔州市', '140000', '0');
INSERT INTO `city` VALUES ('19', '140700', '晋中市', '140000', '0');
INSERT INTO `city` VALUES ('20', '140800', '运城市', '140000', '0');
INSERT INTO `city` VALUES ('21', '140900', '忻州市', '140000', '0');
INSERT INTO `city` VALUES ('22', '141000', '临汾市', '140000', '0');
INSERT INTO `city` VALUES ('23', '141100', '吕梁市', '140000', '0');
INSERT INTO `city` VALUES ('24', '150100', '呼和浩特市', '150000', '0');
INSERT INTO `city` VALUES ('25', '150200', '包头市', '150000', '0');
INSERT INTO `city` VALUES ('26', '150300', '乌海市', '150000', '0');
INSERT INTO `city` VALUES ('27', '150400', '赤峰市', '150000', '0');
INSERT INTO `city` VALUES ('28', '150500', '通辽市', '150000', '0');
INSERT INTO `city` VALUES ('29', '150600', '鄂尔多斯市', '150000', '0');
INSERT INTO `city` VALUES ('30', '150700', '呼伦贝尔市', '150000', '0');
INSERT INTO `city` VALUES ('31', '150800', '巴彦淖尔市', '150000', '0');
INSERT INTO `city` VALUES ('32', '150900', '乌兰察布市', '150000', '0');
INSERT INTO `city` VALUES ('33', '152200', '兴安盟', '150000', '0');
INSERT INTO `city` VALUES ('34', '152500', '锡林郭勒盟', '150000', '0');
INSERT INTO `city` VALUES ('35', '152900', '阿拉善盟', '150000', '0');
INSERT INTO `city` VALUES ('36', '210100', '沈阳市', '210000', '0');
INSERT INTO `city` VALUES ('37', '210200', '大连市', '210000', '0');
INSERT INTO `city` VALUES ('38', '210300', '鞍山市', '210000', '0');
INSERT INTO `city` VALUES ('39', '210400', '抚顺市', '210000', '0');
INSERT INTO `city` VALUES ('40', '210500', '本溪市', '210000', '0');
INSERT INTO `city` VALUES ('41', '210600', '丹东市', '210000', '0');
INSERT INTO `city` VALUES ('42', '210700', '锦州市', '210000', '0');
INSERT INTO `city` VALUES ('43', '210800', '营口市', '210000', '0');
INSERT INTO `city` VALUES ('44', '210900', '阜新市', '210000', '0');
INSERT INTO `city` VALUES ('45', '211000', '辽阳市', '210000', '0');
INSERT INTO `city` VALUES ('46', '211100', '盘锦市', '210000', '0');
INSERT INTO `city` VALUES ('47', '211200', '铁岭市', '210000', '0');
INSERT INTO `city` VALUES ('48', '211300', '朝阳市', '210000', '0');
INSERT INTO `city` VALUES ('49', '211400', '葫芦岛市', '210000', '0');
INSERT INTO `city` VALUES ('50', '220100', '长春市', '220000', '0');
INSERT INTO `city` VALUES ('51', '220200', '吉林市', '220000', '0');
INSERT INTO `city` VALUES ('52', '220300', '四平市', '220000', '0');
INSERT INTO `city` VALUES ('53', '220400', '辽源市', '220000', '0');
INSERT INTO `city` VALUES ('54', '220500', '通化市', '220000', '0');
INSERT INTO `city` VALUES ('55', '220600', '白山市', '220000', '0');
INSERT INTO `city` VALUES ('56', '220700', '松原市', '220000', '0');
INSERT INTO `city` VALUES ('57', '220800', '白城市', '220000', '0');
INSERT INTO `city` VALUES ('58', '222400', '延边朝鲜族自治州', '220000', '0');
INSERT INTO `city` VALUES ('59', '230100', '哈尔滨市', '230000', '0');
INSERT INTO `city` VALUES ('60', '230200', '齐齐哈尔市', '230000', '0');
INSERT INTO `city` VALUES ('61', '230300', '鸡西市', '230000', '0');
INSERT INTO `city` VALUES ('62', '230400', '鹤岗市', '230000', '0');
INSERT INTO `city` VALUES ('63', '230500', '双鸭山市', '230000', '0');
INSERT INTO `city` VALUES ('64', '230600', '大庆市', '230000', '0');
INSERT INTO `city` VALUES ('65', '230700', '伊春市', '230000', '0');
INSERT INTO `city` VALUES ('66', '230800', '佳木斯市', '230000', '0');
INSERT INTO `city` VALUES ('67', '230900', '七台河市', '230000', '0');
INSERT INTO `city` VALUES ('68', '231000', '牡丹江市', '230000', '0');
INSERT INTO `city` VALUES ('69', '231100', '黑河市', '230000', '0');
INSERT INTO `city` VALUES ('70', '231200', '绥化市', '230000', '0');
INSERT INTO `city` VALUES ('71', '232700', '大兴安岭地区', '230000', '0');
INSERT INTO `city` VALUES ('72', '310100', '上海市', '310000', '0');
INSERT INTO `city` VALUES ('74', '320100', '南京市', '320000', '0');
INSERT INTO `city` VALUES ('75', '320200', '无锡市', '320000', '0');
INSERT INTO `city` VALUES ('76', '320300', '徐州市', '320000', '0');
INSERT INTO `city` VALUES ('77', '320400', '常州市', '320000', '0');
INSERT INTO `city` VALUES ('78', '320500', '苏州市', '320000', '0');
INSERT INTO `city` VALUES ('79', '320600', '南通市', '320000', '0');
INSERT INTO `city` VALUES ('80', '320700', '连云港市', '320000', '0');
INSERT INTO `city` VALUES ('81', '320800', '淮安市', '320000', '0');
INSERT INTO `city` VALUES ('82', '320900', '盐城市', '320000', '0');
INSERT INTO `city` VALUES ('83', '321000', '扬州市', '320000', '0');
INSERT INTO `city` VALUES ('84', '321100', '镇江市', '320000', '0');
INSERT INTO `city` VALUES ('85', '321200', '泰州市', '320000', '0');
INSERT INTO `city` VALUES ('86', '321300', '宿迁市', '320000', '0');
INSERT INTO `city` VALUES ('87', '330100', '杭州市', '330000', '0');
INSERT INTO `city` VALUES ('88', '330200', '宁波市', '330000', '0');
INSERT INTO `city` VALUES ('89', '330300', '温州市', '330000', '0');
INSERT INTO `city` VALUES ('90', '330400', '嘉兴市', '330000', '0');
INSERT INTO `city` VALUES ('91', '330500', '湖州市', '330000', '0');
INSERT INTO `city` VALUES ('92', '330600', '绍兴市', '330000', '0');
INSERT INTO `city` VALUES ('93', '330700', '金华市', '330000', '0');
INSERT INTO `city` VALUES ('94', '330800', '衢州市', '330000', '0');
INSERT INTO `city` VALUES ('95', '330900', '舟山市', '330000', '0');
INSERT INTO `city` VALUES ('96', '331000', '台州市', '330000', '0');
INSERT INTO `city` VALUES ('97', '331100', '丽水市', '330000', '0');
INSERT INTO `city` VALUES ('98', '340100', '合肥市', '340000', '0');
INSERT INTO `city` VALUES ('99', '340200', '芜湖市', '340000', '0');
INSERT INTO `city` VALUES ('100', '340300', '蚌埠市', '340000', '0');
INSERT INTO `city` VALUES ('101', '340400', '淮南市', '340000', '0');
INSERT INTO `city` VALUES ('102', '340500', '马鞍山市', '340000', '0');
INSERT INTO `city` VALUES ('103', '340600', '淮北市', '340000', '0');
INSERT INTO `city` VALUES ('104', '340700', '铜陵市', '340000', '0');
INSERT INTO `city` VALUES ('105', '340800', '安庆市', '340000', '0');
INSERT INTO `city` VALUES ('106', '341000', '黄山市', '340000', '0');
INSERT INTO `city` VALUES ('107', '341100', '滁州市', '340000', '0');
INSERT INTO `city` VALUES ('108', '341200', '阜阳市', '340000', '0');
INSERT INTO `city` VALUES ('109', '341300', '宿州市', '340000', '0');
INSERT INTO `city` VALUES ('110', '341400', '巢湖市', '340000', '0');
INSERT INTO `city` VALUES ('111', '341500', '六安市', '340000', '0');
INSERT INTO `city` VALUES ('112', '341600', '亳州市', '340000', '0');
INSERT INTO `city` VALUES ('113', '341700', '池州市', '340000', '0');
INSERT INTO `city` VALUES ('114', '341800', '宣城市', '340000', '0');
INSERT INTO `city` VALUES ('115', '350100', '福州市', '350000', '0');
INSERT INTO `city` VALUES ('116', '350200', '厦门市', '350000', '0');
INSERT INTO `city` VALUES ('117', '350300', '莆田市', '350000', '0');
INSERT INTO `city` VALUES ('118', '350400', '三明市', '350000', '0');
INSERT INTO `city` VALUES ('119', '350500', '泉州市', '350000', '0');
INSERT INTO `city` VALUES ('120', '350600', '漳州市', '350000', '0');
INSERT INTO `city` VALUES ('121', '350700', '南平市', '350000', '0');
INSERT INTO `city` VALUES ('122', '350800', '龙岩市', '350000', '0');
INSERT INTO `city` VALUES ('123', '350900', '宁德市', '350000', '0');
INSERT INTO `city` VALUES ('124', '360100', '南昌市', '360000', '0');
INSERT INTO `city` VALUES ('125', '360200', '景德镇市', '360000', '0');
INSERT INTO `city` VALUES ('126', '360300', '萍乡市', '360000', '0');
INSERT INTO `city` VALUES ('127', '360400', '九江市', '360000', '0');
INSERT INTO `city` VALUES ('128', '360500', '新余市', '360000', '0');
INSERT INTO `city` VALUES ('129', '360600', '鹰潭市', '360000', '0');
INSERT INTO `city` VALUES ('130', '360700', '赣州市', '360000', '0');
INSERT INTO `city` VALUES ('131', '360800', '吉安市', '360000', '0');
INSERT INTO `city` VALUES ('132', '360900', '宜春市', '360000', '0');
INSERT INTO `city` VALUES ('133', '361000', '抚州市', '360000', '0');
INSERT INTO `city` VALUES ('134', '361100', '上饶市', '360000', '0');
INSERT INTO `city` VALUES ('135', '370100', '济南市', '370000', '0');
INSERT INTO `city` VALUES ('136', '370200', '青岛市', '370000', '0');
INSERT INTO `city` VALUES ('137', '370300', '淄博市', '370000', '0');
INSERT INTO `city` VALUES ('138', '370400', '枣庄市', '370000', '0');
INSERT INTO `city` VALUES ('139', '370500', '东营市', '370000', '0');
INSERT INTO `city` VALUES ('140', '370600', '烟台市', '370000', '0');
INSERT INTO `city` VALUES ('141', '370700', '潍坊市', '370000', '0');
INSERT INTO `city` VALUES ('142', '370800', '济宁市', '370000', '0');
INSERT INTO `city` VALUES ('143', '370900', '泰安市', '370000', '0');
INSERT INTO `city` VALUES ('144', '371000', '威海市', '370000', '0');
INSERT INTO `city` VALUES ('145', '371100', '日照市', '370000', '0');
INSERT INTO `city` VALUES ('146', '371200', '莱芜市', '370000', '0');
INSERT INTO `city` VALUES ('147', '371300', '临沂市', '370000', '0');
INSERT INTO `city` VALUES ('148', '371400', '德州市', '370000', '0');
INSERT INTO `city` VALUES ('149', '371500', '聊城市', '370000', '0');
INSERT INTO `city` VALUES ('150', '371600', '滨州市', '370000', '0');
INSERT INTO `city` VALUES ('151', '371700', '荷泽市', '370000', '0');
INSERT INTO `city` VALUES ('152', '410100', '郑州市', '410000', '0');
INSERT INTO `city` VALUES ('153', '410200', '开封市', '410000', '0');
INSERT INTO `city` VALUES ('154', '410300', '洛阳市', '410000', '0');
INSERT INTO `city` VALUES ('155', '410400', '平顶山市', '410000', '0');
INSERT INTO `city` VALUES ('156', '410500', '安阳市', '410000', '0');
INSERT INTO `city` VALUES ('157', '410600', '鹤壁市', '410000', '0');
INSERT INTO `city` VALUES ('158', '410700', '新乡市', '410000', '0');
INSERT INTO `city` VALUES ('159', '410800', '焦作市', '410000', '0');
INSERT INTO `city` VALUES ('160', '410900', '濮阳市', '410000', '0');
INSERT INTO `city` VALUES ('161', '411000', '许昌市', '410000', '0');
INSERT INTO `city` VALUES ('162', '411100', '漯河市', '410000', '0');
INSERT INTO `city` VALUES ('163', '411200', '三门峡市', '410000', '0');
INSERT INTO `city` VALUES ('164', '411300', '南阳市', '410000', '0');
INSERT INTO `city` VALUES ('165', '411400', '商丘市', '410000', '0');
INSERT INTO `city` VALUES ('166', '411500', '信阳市', '410000', '0');
INSERT INTO `city` VALUES ('167', '411600', '周口市', '410000', '0');
INSERT INTO `city` VALUES ('168', '411700', '驻马店市', '410000', '0');
INSERT INTO `city` VALUES ('169', '420100', '武汉市', '420000', '0');
INSERT INTO `city` VALUES ('170', '420200', '黄石市', '420000', '0');
INSERT INTO `city` VALUES ('171', '420300', '十堰市', '420000', '0');
INSERT INTO `city` VALUES ('172', '420500', '宜昌市', '420000', '0');
INSERT INTO `city` VALUES ('173', '420600', '襄樊市', '420000', '0');
INSERT INTO `city` VALUES ('174', '420700', '鄂州市', '420000', '0');
INSERT INTO `city` VALUES ('175', '420800', '荆门市', '420000', '0');
INSERT INTO `city` VALUES ('176', '420900', '孝感市', '420000', '0');
INSERT INTO `city` VALUES ('177', '421000', '荆州市', '420000', '0');
INSERT INTO `city` VALUES ('178', '421100', '黄冈市', '420000', '0');
INSERT INTO `city` VALUES ('179', '421200', '咸宁市', '420000', '0');
INSERT INTO `city` VALUES ('180', '421300', '随州市', '420000', '0');
INSERT INTO `city` VALUES ('181', '422800', '恩施土家族苗族自治州', '420000', '0');
INSERT INTO `city` VALUES ('182', '429000', '省直辖行政单位', '420000', '0');
INSERT INTO `city` VALUES ('183', '430100', '长沙市', '430000', '0');
INSERT INTO `city` VALUES ('184', '430200', '株洲市', '430000', '0');
INSERT INTO `city` VALUES ('185', '430300', '湘潭市', '430000', '0');
INSERT INTO `city` VALUES ('186', '430400', '衡阳市', '430000', '0');
INSERT INTO `city` VALUES ('187', '430500', '邵阳市', '430000', '0');
INSERT INTO `city` VALUES ('188', '430600', '岳阳市', '430000', '0');
INSERT INTO `city` VALUES ('189', '430700', '常德市', '430000', '0');
INSERT INTO `city` VALUES ('190', '430800', '张家界市', '430000', '0');
INSERT INTO `city` VALUES ('191', '430900', '益阳市', '430000', '0');
INSERT INTO `city` VALUES ('192', '431000', '郴州市', '430000', '0');
INSERT INTO `city` VALUES ('193', '431100', '永州市', '430000', '0');
INSERT INTO `city` VALUES ('194', '431200', '怀化市', '430000', '0');
INSERT INTO `city` VALUES ('195', '431300', '娄底市', '430000', '0');
INSERT INTO `city` VALUES ('196', '433100', '湘西土家族苗族自治州', '430000', '0');
INSERT INTO `city` VALUES ('197', '440100', '广州市', '440000', '0');
INSERT INTO `city` VALUES ('198', '440200', '韶关市', '440000', '0');
INSERT INTO `city` VALUES ('199', '440300', '深圳市', '440000', '0');
INSERT INTO `city` VALUES ('200', '440400', '珠海市', '440000', '0');
INSERT INTO `city` VALUES ('201', '440500', '汕头市', '440000', '0');
INSERT INTO `city` VALUES ('202', '440600', '佛山市', '440000', '0');
INSERT INTO `city` VALUES ('203', '440700', '江门市', '440000', '0');
INSERT INTO `city` VALUES ('204', '440800', '湛江市', '440000', '0');
INSERT INTO `city` VALUES ('205', '440900', '茂名市', '440000', '0');
INSERT INTO `city` VALUES ('206', '441200', '肇庆市', '440000', '0');
INSERT INTO `city` VALUES ('207', '441300', '惠州市', '440000', '0');
INSERT INTO `city` VALUES ('208', '441400', '梅州市', '440000', '0');
INSERT INTO `city` VALUES ('209', '441500', '汕尾市', '440000', '0');
INSERT INTO `city` VALUES ('210', '441600', '河源市', '440000', '0');
INSERT INTO `city` VALUES ('211', '441700', '阳江市', '440000', '0');
INSERT INTO `city` VALUES ('212', '441800', '清远市', '440000', '0');
INSERT INTO `city` VALUES ('213', '441900', '东莞市', '440000', '0');
INSERT INTO `city` VALUES ('214', '442000', '中山市', '440000', '0');
INSERT INTO `city` VALUES ('215', '445100', '潮州市', '440000', '0');
INSERT INTO `city` VALUES ('216', '445200', '揭阳市', '440000', '0');
INSERT INTO `city` VALUES ('217', '445300', '云浮市', '440000', '0');
INSERT INTO `city` VALUES ('218', '450100', '南宁市', '450000', '0');
INSERT INTO `city` VALUES ('219', '450200', '柳州市', '450000', '0');
INSERT INTO `city` VALUES ('220', '450300', '桂林市', '450000', '0');
INSERT INTO `city` VALUES ('221', '450400', '梧州市', '450000', '0');
INSERT INTO `city` VALUES ('222', '450500', '北海市', '450000', '0');
INSERT INTO `city` VALUES ('223', '450600', '防城港市', '450000', '0');
INSERT INTO `city` VALUES ('224', '450700', '钦州市', '450000', '0');
INSERT INTO `city` VALUES ('225', '450800', '贵港市', '450000', '0');
INSERT INTO `city` VALUES ('226', '450900', '玉林市', '450000', '0');
INSERT INTO `city` VALUES ('227', '451000', '百色市', '450000', '0');
INSERT INTO `city` VALUES ('228', '451100', '贺州市', '450000', '0');
INSERT INTO `city` VALUES ('229', '451200', '河池市', '450000', '0');
INSERT INTO `city` VALUES ('230', '451300', '来宾市', '450000', '0');
INSERT INTO `city` VALUES ('231', '451400', '崇左市', '450000', '0');
INSERT INTO `city` VALUES ('232', '460100', '海口市', '460000', '0');
INSERT INTO `city` VALUES ('233', '460200', '三亚市', '460000', '0');
INSERT INTO `city` VALUES ('234', '469000', '省直辖县级行政单位', '460000', '0');
INSERT INTO `city` VALUES ('235', '500100', '市辖区', '500000', '0');
INSERT INTO `city` VALUES ('236', '500200', '县', '500000', '0');
INSERT INTO `city` VALUES ('237', '500300', '市', '500000', '0');
INSERT INTO `city` VALUES ('238', '510100', '成都市', '510000', '0');
INSERT INTO `city` VALUES ('239', '510300', '自贡市', '510000', '0');
INSERT INTO `city` VALUES ('240', '510400', '攀枝花市', '510000', '0');
INSERT INTO `city` VALUES ('241', '510500', '泸州市', '510000', '0');
INSERT INTO `city` VALUES ('242', '510600', '德阳市', '510000', '0');
INSERT INTO `city` VALUES ('243', '510700', '绵阳市', '510000', '0');
INSERT INTO `city` VALUES ('244', '510800', '广元市', '510000', '0');
INSERT INTO `city` VALUES ('245', '510900', '遂宁市', '510000', '0');
INSERT INTO `city` VALUES ('246', '511000', '内江市', '510000', '0');
INSERT INTO `city` VALUES ('247', '511100', '乐山市', '510000', '0');
INSERT INTO `city` VALUES ('248', '511300', '南充市', '510000', '0');
INSERT INTO `city` VALUES ('249', '511400', '眉山市', '510000', '0');
INSERT INTO `city` VALUES ('250', '511500', '宜宾市', '510000', '0');
INSERT INTO `city` VALUES ('251', '511600', '广安市', '510000', '0');
INSERT INTO `city` VALUES ('252', '511700', '达州市', '510000', '0');
INSERT INTO `city` VALUES ('253', '511800', '雅安市', '510000', '0');
INSERT INTO `city` VALUES ('254', '511900', '巴中市', '510000', '0');
INSERT INTO `city` VALUES ('255', '512000', '资阳市', '510000', '0');
INSERT INTO `city` VALUES ('256', '513200', '阿坝藏族羌族自治州', '510000', '0');
INSERT INTO `city` VALUES ('257', '513300', '甘孜藏族自治州', '510000', '0');
INSERT INTO `city` VALUES ('258', '513400', '凉山彝族自治州', '510000', '0');
INSERT INTO `city` VALUES ('259', '520100', '贵阳市', '520000', '0');
INSERT INTO `city` VALUES ('260', '520200', '六盘水市', '520000', '0');
INSERT INTO `city` VALUES ('261', '520300', '遵义市', '520000', '0');
INSERT INTO `city` VALUES ('262', '520400', '安顺市', '520000', '0');
INSERT INTO `city` VALUES ('263', '522200', '铜仁地区', '520000', '0');
INSERT INTO `city` VALUES ('264', '522300', '黔西南布依族苗族自治州', '520000', '0');
INSERT INTO `city` VALUES ('265', '522400', '毕节地区', '520000', '0');
INSERT INTO `city` VALUES ('266', '522600', '黔东南苗族侗族自治州', '520000', '0');
INSERT INTO `city` VALUES ('267', '522700', '黔南布依族苗族自治州', '520000', '0');
INSERT INTO `city` VALUES ('268', '530100', '昆明市', '530000', '0');
INSERT INTO `city` VALUES ('269', '530300', '曲靖市', '530000', '0');
INSERT INTO `city` VALUES ('270', '530400', '玉溪市', '530000', '0');
INSERT INTO `city` VALUES ('271', '530500', '保山市', '530000', '0');
INSERT INTO `city` VALUES ('272', '530600', '昭通市', '530000', '0');
INSERT INTO `city` VALUES ('273', '530700', '丽江市', '530000', '0');
INSERT INTO `city` VALUES ('274', '530800', '思茅市', '530000', '0');
INSERT INTO `city` VALUES ('275', '530900', '临沧市', '530000', '0');
INSERT INTO `city` VALUES ('276', '532300', '楚雄彝族自治州', '530000', '0');
INSERT INTO `city` VALUES ('277', '532500', '红河哈尼族彝族自治州', '530000', '0');
INSERT INTO `city` VALUES ('278', '532600', '文山壮族苗族自治州', '530000', '0');
INSERT INTO `city` VALUES ('279', '532800', '西双版纳傣族自治州', '530000', '0');
INSERT INTO `city` VALUES ('280', '532900', '大理白族自治州', '530000', '0');
INSERT INTO `city` VALUES ('281', '533100', '德宏傣族景颇族自治州', '530000', '0');
INSERT INTO `city` VALUES ('282', '533300', '怒江傈僳族自治州', '530000', '0');
INSERT INTO `city` VALUES ('283', '533400', '迪庆藏族自治州', '530000', '0');
INSERT INTO `city` VALUES ('284', '540100', '拉萨市', '540000', '0');
INSERT INTO `city` VALUES ('285', '542100', '昌都地区', '540000', '0');
INSERT INTO `city` VALUES ('286', '542200', '山南地区', '540000', '0');
INSERT INTO `city` VALUES ('287', '542300', '日喀则地区', '540000', '0');
INSERT INTO `city` VALUES ('288', '542400', '那曲地区', '540000', '0');
INSERT INTO `city` VALUES ('289', '542500', '阿里地区', '540000', '0');
INSERT INTO `city` VALUES ('290', '542600', '林芝地区', '540000', '0');
INSERT INTO `city` VALUES ('291', '610100', '西安市', '610000', '0');
INSERT INTO `city` VALUES ('292', '610200', '铜川市', '610000', '0');
INSERT INTO `city` VALUES ('293', '610300', '宝鸡市', '610000', '0');
INSERT INTO `city` VALUES ('294', '610400', '咸阳市', '610000', '0');
INSERT INTO `city` VALUES ('295', '610500', '渭南市', '610000', '0');
INSERT INTO `city` VALUES ('296', '610600', '延安市', '610000', '0');
INSERT INTO `city` VALUES ('297', '610700', '汉中市', '610000', '0');
INSERT INTO `city` VALUES ('298', '610800', '榆林市', '610000', '0');
INSERT INTO `city` VALUES ('299', '610900', '安康市', '610000', '0');
INSERT INTO `city` VALUES ('300', '611000', '商洛市', '610000', '0');
INSERT INTO `city` VALUES ('301', '620100', '兰州市', '620000', '0');
INSERT INTO `city` VALUES ('302', '620200', '嘉峪关市', '620000', '0');
INSERT INTO `city` VALUES ('303', '620300', '金昌市', '620000', '0');
INSERT INTO `city` VALUES ('304', '620400', '白银市', '620000', '0');
INSERT INTO `city` VALUES ('305', '620500', '天水市', '620000', '0');
INSERT INTO `city` VALUES ('306', '620600', '武威市', '620000', '0');
INSERT INTO `city` VALUES ('307', '620700', '张掖市', '620000', '0');
INSERT INTO `city` VALUES ('308', '620800', '平凉市', '620000', '0');
INSERT INTO `city` VALUES ('309', '620900', '酒泉市', '620000', '0');
INSERT INTO `city` VALUES ('310', '621000', '庆阳市', '620000', '0');
INSERT INTO `city` VALUES ('311', '621100', '定西市', '620000', '0');
INSERT INTO `city` VALUES ('312', '621200', '陇南市', '620000', '0');
INSERT INTO `city` VALUES ('313', '622900', '临夏回族自治州', '620000', '0');
INSERT INTO `city` VALUES ('314', '623000', '甘南藏族自治州', '620000', '0');
INSERT INTO `city` VALUES ('315', '630100', '西宁市', '630000', '0');
INSERT INTO `city` VALUES ('316', '632100', '海东地区', '630000', '0');
INSERT INTO `city` VALUES ('317', '632200', '海北藏族自治州', '630000', '0');
INSERT INTO `city` VALUES ('318', '632300', '黄南藏族自治州', '630000', '0');
INSERT INTO `city` VALUES ('319', '632500', '海南藏族自治州', '630000', '0');
INSERT INTO `city` VALUES ('320', '632600', '果洛藏族自治州', '630000', '0');
INSERT INTO `city` VALUES ('321', '632700', '玉树藏族自治州', '630000', '0');
INSERT INTO `city` VALUES ('322', '632800', '海西蒙古族藏族自治州', '630000', '0');
INSERT INTO `city` VALUES ('323', '640100', '银川市', '640000', '0');
INSERT INTO `city` VALUES ('324', '640200', '石嘴山市', '640000', '0');
INSERT INTO `city` VALUES ('325', '640300', '吴忠市', '640000', '0');
INSERT INTO `city` VALUES ('326', '640400', '固原市', '640000', '0');
INSERT INTO `city` VALUES ('327', '640500', '中卫市', '640000', '0');
INSERT INTO `city` VALUES ('328', '650100', '乌鲁木齐市', '650000', '0');
INSERT INTO `city` VALUES ('329', '650200', '克拉玛依市', '650000', '0');
INSERT INTO `city` VALUES ('330', '652100', '吐鲁番地区', '650000', '0');
INSERT INTO `city` VALUES ('331', '652200', '哈密地区', '650000', '0');
INSERT INTO `city` VALUES ('332', '652300', '昌吉回族自治州', '650000', '0');
INSERT INTO `city` VALUES ('333', '652700', '博尔塔拉蒙古自治州', '650000', '0');
INSERT INTO `city` VALUES ('334', '652800', '巴音郭楞蒙古自治州', '650000', '0');
INSERT INTO `city` VALUES ('335', '652900', '阿克苏地区', '650000', '0');
INSERT INTO `city` VALUES ('336', '653000', '克孜勒苏柯尔克孜自治州', '650000', '0');
INSERT INTO `city` VALUES ('337', '653100', '喀什地区', '650000', '0');
INSERT INTO `city` VALUES ('338', '653200', '和田地区', '650000', '0');
INSERT INTO `city` VALUES ('339', '654000', '伊犁哈萨克自治州', '650000', '0');
INSERT INTO `city` VALUES ('340', '654200', '塔城地区', '650000', '0');
INSERT INTO `city` VALUES ('341', '654300', '阿勒泰地区', '650000', '0');
INSERT INTO `city` VALUES ('342', '659000', '省直辖行政单位', '650000', '0');
INSERT INTO `city` VALUES ('343', '120100', '天津市', '120000', '0');
INSERT INTO `city` VALUES ('344', '711000', '台湾', '710000', '0');
INSERT INTO `city` VALUES ('345', '811000', '香港', '810000', '0');
INSERT INTO `city` VALUES ('346', '821000', '澳门', '820000', '0');

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` tinyint(1) DEFAULT NULL COMMENT '课程类型  0专家课程 1点评课程',
  `courseId` int(10) DEFAULT NULL COMMENT '课程ID',
  `userId` int(10) DEFAULT NULL COMMENT '收藏用户',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户收藏';

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('11', '0', '9', '14', '2016-08-08 11:01:32');
INSERT INTO `collection` VALUES ('3', '0', '9', '9', '2016-08-05 11:05:15');
INSERT INTO `collection` VALUES ('59', '0', '1', '16', '2016-08-10 10:27:31');
INSERT INTO `collection` VALUES ('5', '1', '8', '9', '2016-08-05 12:40:48');
INSERT INTO `collection` VALUES ('6', '1', '9', '9', '2016-08-05 13:34:28');
INSERT INTO `collection` VALUES ('7', '0', '7', '9', '2016-08-05 13:34:46');
INSERT INTO `collection` VALUES ('8', '0', '3', '9', '2016-08-05 13:34:54');
INSERT INTO `collection` VALUES ('9', '1', '6', '2', '2016-08-05 15:34:51');
INSERT INTO `collection` VALUES ('10', '0', '10', '2', '2016-08-05 17:07:54');
INSERT INTO `collection` VALUES ('14', '0', '15', '6', '2016-08-08 13:56:46');
INSERT INTO `collection` VALUES ('15', '0', '16', '10', '2016-08-08 15:24:26');
INSERT INTO `collection` VALUES ('18', '1', '78', '17', '2016-08-08 17:52:30');
INSERT INTO `collection` VALUES ('19', '0', '8', '2', '2016-08-08 17:57:29');
INSERT INTO `collection` VALUES ('50', '1', '95', '0', '2016-08-09 16:11:27');
INSERT INTO `collection` VALUES ('54', '0', '19', '16', '2016-08-09 16:39:33');
INSERT INTO `collection` VALUES ('56', '1', '95', '2', '2016-08-09 16:53:03');
INSERT INTO `collection` VALUES ('70', '0', '13', '16', '2016-08-11 09:38:57');
INSERT INTO `collection` VALUES ('71', '0', '14', '16', '2016-08-11 09:39:27');
INSERT INTO `collection` VALUES ('72', '0', '15', '16', '2016-08-11 09:39:31');
INSERT INTO `collection` VALUES ('74', '1', '9', '16', '2016-08-11 09:44:26');
INSERT INTO `collection` VALUES ('76', '1', '83', '16', '2016-08-11 09:44:47');

-- ----------------------------
-- Table structure for `commentcourse`
-- ----------------------------
DROP TABLE IF EXISTS `commentcourse`;
CREATE TABLE `commentcourse` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `orderSn` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `courseTitle` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `userId` int(10) DEFAULT NULL COMMENT '演奏视频用户',
  `username` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coursePic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图',
  `courseLowPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频低路径',
  `courseMediumPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频中路径',
  `courseHighPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频高路径',
  `lastCheckTime` datetime DEFAULT NULL COMMENT '最近审核时间',
  `state` tinyint(1) DEFAULT '1' COMMENT '点评视频状态(0:审核未通过1:审核中2:审核通过)',
  `teacherId` int(10) DEFAULT '0' COMMENT '点评名师',
  `teachername` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '点评名师姓名',
  `suitlevel` char(6) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '钢琴适用等级',
  `courseView` int(10) DEFAULT '0' COMMENT '视频浏览数',
  `coursePlayView` int(10) DEFAULT '0' COMMENT '学习数(false)',
  `courseStudyNum` int(10) DEFAULT '0' COMMENT '学习数(true)',
  `courseFav` int(10) DEFAULT '0' COMMENT '视频收藏数',
  `coursePrice` int(10) unsigned DEFAULT '0',
  `courseStatus` tinyint(1) DEFAULT '0' COMMENT '课程状态 0为激活 1为锁定',
  `courseType` int(8) DEFAULT '0' COMMENT '专题课程标题分类 0位无促销',
  `courseDiscount` int(5) DEFAULT '0' COMMENT '课程折扣 折扣乘以1000 存储',
  `courseIsDel` tinyint(1) DEFAULT '0' COMMENT '删除标识 0为正常显示 1为虚拟删除',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `fileID` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=137 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='老师点评视频';

-- ----------------------------
-- Records of commentcourse
-- ----------------------------
INSERT INTO `commentcourse` VALUES ('1', '2016080457a308f702e78', '第二次测试~~', '3', 'wangchenkai', '/home/image/lessonSubject/6841dca39cf6c953af98dce828734189.png', '32e2881f8cc34009bebd6fff95d27e55', 'acb029d07bab4efeab88cf5c53628eba', 'fcd1a7f6176743cca2979468af6bd1fa', '2016-08-04 17:52:44', null, '5', '罗宁', '9,10,8', '5', '1', '1', '0', '1', '0', '3', '0', '0', '2016-08-04 17:36:39', '2016-08-05 12:55:51', '024f64938d3f449896afb1fc2c06887f');
INSERT INTO `commentcourse` VALUES ('2', '2016080457a31018dd85b', '~~~~~~~~~~~~', '3', 'wangchenkai', '/home/image/lessonSubject/4fe08e7c4f3ed75f2a1acd07fe7a1100.png', '32e2881f8cc34009bebd6fff95d27e55', 'acb029d07bab4efeab88cf5c53628eba', 'fcd1a7f6176743cca2979468af6bd1fa', '2016-08-04 17:54:01', '2', '5', '罗宁', '8,9,10', '62', '1', '99', '0', '1', '0', '0', '0', '0', '2016-08-04 17:53:42', '2016-08-05 12:55:39', '2a2f931809824ec8b27640cdd39241db');
INSERT INTO `commentcourse` VALUES ('8', '2016080457a320c8c8bab', '测试2', '3', 'wangchenkai', '/home/image/lessonSubject/02de8582c772820afae08f818a5e27aa.png', 'c3fdedfdcab94fd9886fb227e51a7d3a', '', '', '2016-08-05 11:00:44', '2', '5', '罗宁', '7,8', '8', '11', '4', '1', '0', '0', '0', '0', '0', '2016-08-04 19:04:30', '2016-08-05 12:55:08', '93a1ce140b1b47159c778c107d688dab');
INSERT INTO `commentcourse` VALUES ('6', '2016080457a30b9bd9a6b', '梦中的婚礼', '7', 'xueyuan', '/home/image/lessonSubject/45ebdf564faa1e7443e1b8060f0e5180.png', 'c3fdedfdcab94fd9886fb227e51a7d3a', '', '', '2016-08-05 13:05:18', '2', '5', '罗宁', '7,8,9', '5', '3', '2', '1', '0', '0', '0', '0', '0', '2016-08-04 18:43:58', '2016-08-05 12:55:29', '85f05e44faea44129c879711484ee4bf');
INSERT INTO `commentcourse` VALUES ('7', '2016080457a31d0b462ce', '动漫', '7', 'xueyuan', '/home/image/lessonSubject/74d8eb55dabe1995bb3431f27e65764f.png', 'c3fdedfdcab94fd9886fb227e51a7d3a', '', '', '2016-08-04 19:15:39', '2', '5', '罗宁', '3,4', '25', '3', '2', '0', '1', '0', '2', '0', '0', '2016-08-04 18:49:54', '2016-08-05 12:55:20', '3547d2a3cc8a481f8b4d2d15b024e0f1');
INSERT INTO `commentcourse` VALUES ('9', '2016080457a326378d00d', '通知1', '9', 'qinying', '/home/image/lessonSubject/d8d5b365a6ac8fdb56d063b37e9a975f.png', '47d2a37f8244458ebf2bee957a438707', '', '', '2016-08-04 19:30:52', '2', '5', '罗宁', '3,4', '36', '14', '3', '2', '1', '0', '2', '0', '0', '2016-08-04 19:29:45', '2016-08-05 12:54:58', '6cec6c7b35544b6dbfb706f5a4fe78a5');
INSERT INTO `commentcourse` VALUES ('10', '2016080557a3fcb9d1f10', '弹指教学', '2', 'ceshi1', '/home/image/lessonSubject/ddc702b7ba79af0c7317b2cb5bea6b86.png', 'a4ef95305a6044a5855afff17674ea3b', '6c55c146f7204936b7730e53d0c0cdfc', '', '2016-08-05 13:03:20', '2', '10', 'yundi', '6,7,8', '9', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 10:54:21', '2016-08-05 12:54:46', 'f96daf6d6037459a883549b47c303f64');
INSERT INTO `commentcourse` VALUES ('71', '2016080557a44490d481c', '童话', '6', 'ceshi2', '/home/image/lessonSubject/afb08cecab10f8c64fc779294b0875ea.png', '97b6253ff4e54d809ba1fb59064635f9', '6c55c146f7204936b7730e53d0c0cdfc', '', '2016-08-05 16:20:06', '2', '10', 'yundi', '1,2', '21', '0', '0', '0', '1', '0', '3', '0', '0', '2016-08-05 16:19:53', '2016-08-05 16:27:04', 'c5420867d814442fbd5113606d2c70e4');
INSERT INTO `commentcourse` VALUES ('72', '2016080557a4621623bd5', '梁祝', '2', 'ceshi1', null, '97b6253ff4e54d809ba1fb59064635f9', '', '', null, '1', '10', 'yundi', '6,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 17:58:01', '2016-08-05 17:58:01', '05d7940613fc4da2be6014ff78f17c3a');
INSERT INTO `commentcourse` VALUES ('73', '2016080557a4621623bd5', '梁祝', '2', 'ceshi1', null, '97b6253ff4e54d809ba1fb59064635f9', '', '', null, '1', '10', 'yundi', '6,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 17:58:04', '2016-08-05 17:58:04', '05d7940613fc4da2be6014ff78f17c3a');
INSERT INTO `commentcourse` VALUES ('74', '2016080557a4621623bd5', '梁祝', '2', 'ceshi1', null, '97b6253ff4e54d809ba1fb59064635f9', '', '', null, '1', '10', 'yundi', '6,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 17:58:05', '2016-08-05 17:58:05', '05d7940613fc4da2be6014ff78f17c3a');
INSERT INTO `commentcourse` VALUES ('75', '2016080557a4621623bd5', '梁祝', '2', 'ceshi1', null, '97b6253ff4e54d809ba1fb59064635f9', '', '', null, '1', '10', 'yundi', '6,7', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 17:58:05', '2016-08-05 17:58:05', '05d7940613fc4da2be6014ff78f17c3a');
INSERT INTO `commentcourse` VALUES ('76', '2016080557a463f67565e', '刘静~~~~~~', '3', 'wangchenkai', '/home/image/lessonSubject/286bb5cbfe8c005639af595fba05ce75.jpg', '5d05fb518b314e4e8552c00992b55bba', '', '', '2016-08-05 18:07:12', '2', '5', '罗宁', '10,9,8', '10', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 18:03:29', '2016-08-05 18:07:38', '37654bebf4154cefa4389801b36beda2');
INSERT INTO `commentcourse` VALUES ('77', '2016080557a464a84d0b7', '刘静~~~~~~', '3', 'wangchenkai', '/home/image/lessonSubject/b98393a5ebd0435f4ee65d2161fd9b09.jpg', '5d05fb518b314e4e8552c00992b55bba', '', '', '2016-08-05 18:06:59', '2', '5', '罗宁', '9,8,3', '2', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 18:06:30', '2016-08-05 18:16:20', '720d0c6ab87a4bd982e12350b043d5c7');
INSERT INTO `commentcourse` VALUES ('78', '2016080557a466901ab3b', '你好吗~', '3', 'wangchenkai', '/home/image/lessonSubject/36faf6b93c8b1076484e3de93322f9eb.jpg', '5d05fb518b314e4e8552c00992b55bba', '', '', '2016-08-05 18:15:54', '2', '5', '罗宁', '2,7,3', '88', '2', '2', '1', '1', '0', '0', '0', '0', '2016-08-05 18:15:46', '2016-08-05 18:17:02', '1719856cf27f46d7bb45643b4335df6b');
INSERT INTO `commentcourse` VALUES ('79', '2016080557a467838f3d0', '测试两个id', '2', 'ceshi1', null, '4e57232ec9e6475f93237aefa8dfc13e', 'e1ba1b5b49a8415cb5d0897dfc0ba26e', '', null, '1', '8', 'langlang', '1,2,3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-05 18:24:08', '2016-08-05 18:24:08', '0c61a58621e543afafa372794eaa0812');
INSERT INTO `commentcourse` VALUES ('80', '2016080857a7e3afc5486', '《天黑黑》', '2', 'ceshi1', '/home/image/lessonSubject/c7d918c0e2efe8631ab3e68880c8d63c.png', 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', '', '2016-08-08 09:49:59', '2', '8', 'langlang', '1,6,7', '30', '10', '0', '12', '2000', '0', '0', '0', '0', '2016-08-08 09:48:36', '2016-08-08 09:50:33', '573a40f6d81c465aaaeac61062852247');
INSERT INTO `commentcourse` VALUES ('81', '2016080857a7f6326140d', '《寻找莫扎特》', '6', 'ceshi2', null, 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', '', '2016-08-08 11:12:30', '2', '13', '周杰伦', '1', '13', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-08 11:11:56', '2016-08-08 11:11:56', '3b8f22aab2f14761a3a5d1799ed9485e');
INSERT INTO `commentcourse` VALUES ('82', '2016080857a7fb8a28085', '《有没有》', '2', 'ceshi1', '/home/image/lessonSubject/b302cf0e0e713274effe06a696390e26.png', '7c33e8b67a0642a09ee7afbc04f64e0f', '7b1f9eccfb874347834d8f4ab45ddbf8', '', '2016-08-08 11:29:20', '2', '10', 'yundi', '1', '10', '10', '0', '20', '1', '0', '2', '0', '0', '2016-08-08 11:28:59', '2016-08-08 11:29:41', '763bae629ffc4cd8b2c2d4aad4b7446a');
INSERT INTO `commentcourse` VALUES ('83', '2016080857a80068cc599', '《太阳的后裔》主题曲', '2', 'ceshi1', '/home/image/lessonSubject/ec8a95549e5481a5ff57e6ad06098457.png', '9e42a8e8348f416ebef2960750ecee9f', 'ee08135fcf4342a6abebecbc5b0ecd67', '', '2016-08-08 13:48:02', '2', '10', 'yundi', '6,7', '11', '23', '1', '1', '1', '0', '3', '0', '0', '2016-08-08 13:47:47', '2016-08-09 14:32:04', '3c2f4d95693f4bb8806cdbf87ac349aa');
INSERT INTO `commentcourse` VALUES ('89', '2016080857a841d558826', 'kkkk', '2', 'ceshi1', null, 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', '', null, '1', '17', '贝多芬', '1,2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-08 16:36:26', '2016-08-08 16:36:26', '03552138a2ef43ef9bf352945d6530b3');
INSERT INTO `commentcourse` VALUES ('131', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:33', '2016-08-10 16:59:33', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('121', '2016081057aac37e0ba21', '贝多芬交响乐', '2', 'ceshi1', null, '6d90ebf621834b12a33d17769e40b214', '', '', '2016-08-10 15:28:44', '2', '20', '李民', '6,7', '6', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 15:28:34', '2016-08-10 15:28:34', '6d02e1f16ba1404988fbd729380d7c73');
INSERT INTO `commentcourse` VALUES ('120', '2016081057aa8f877622e', 'Sugar~~', '3', 'wangchenkai', '/home/image/lessonSubject/f9ea583dccf5b2696e735a883b38587e.jpg', 'b9d0d63fe74d47daaa21141510fe4715', 'cbc1bb2755574996871373b9b8be4f11', 'fb6cbc6d937d490d8307805b7099e049', null, '1', '20', '李民', '1,2,3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 10:30:25', '2016-08-10 10:30:57', 'a465799c5ef545099651c178274feaa6');
INSERT INTO `commentcourse` VALUES ('130', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:32', '2016-08-10 16:59:32', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('122', '2016081057aa87ec3010d', '钢琴视频', '2', 'ceshi1', null, '97201b7a6f1145eeaffd1bdd60f686fc', '', '', '2016-08-10 16:49:52', '2', '20', '李民', '1,2', '6', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:49:43', '2016-08-10 16:49:43', '0fec6886b6904dbc885070cb83c3b537');
INSERT INTO `commentcourse` VALUES ('123', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:11', '2016-08-10 16:59:11', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('119', '2016080957a9a0c55bbb1', '测试视频', '16', 'whrcfzzj', '/home/image/lessonSubject/b1c6581d84326ee674ceae31c181dc64.png', '57c3d12eb84f43e8aa23ab4a8c92ff32', '', '', '2016-08-09 17:58:53', '2', '20', '李民', '10,9,8', '12', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-09 17:58:03', '2016-08-09 18:05:13', '08c26ba755ef4614866c3b74e4eca6a2');
INSERT INTO `commentcourse` VALUES ('124', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:15', '2016-08-10 16:59:15', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('125', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:17', '2016-08-10 16:59:17', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('126', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:21', '2016-08-10 16:59:21', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('127', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:21', '2016-08-10 16:59:21', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('128', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:30', '2016-08-10 16:59:30', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('129', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:31', '2016-08-10 16:59:31', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('92', '2016080557a4462c13ac8', '变态王子与不笑猫', '9', 'qinying', null, '31a5386871864eb1ad95236a0dcb964a', '', '', null, '1', '13', '周杰伦', '7,8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-09 11:27:17', '2016-08-09 11:27:17', 'c05ab86aeac34825bb4f08609f340a73');
INSERT INTO `commentcourse` VALUES ('93', '2016080957a96a306b33b', '拖卡塔', '21', 'liliang', '/home/image/lessonSubject/b004d94ee48fd4b40e0bcd88ff072bb8.png', '9ae0c6c9c0e346f3a55cfdf32b244395', '', '', '2016-08-09 14:01:29', '2', '20', '李民', '4,5', '6', '15', '0', '0', '1', '0', '2', '0', '0', '2016-08-09 13:46:46', '2016-08-09 14:06:17', 'a3e345f24bf64380ae846f3fb506ba31');
INSERT INTO `commentcourse` VALUES ('94', '2016080957a96cb6d4916', '《悲怆》第三乐章', '24', '徐孟', '/home/image/lessonSubject/526253d4fe72442a89355746360b1810.png', '737d0ccd69c14b129d91a88f50961b31', '', '', '2016-08-09 13:50:19', '2', '20', '李民', '6,7', '12', '20', '0', '50', '1', '0', '2', '0', '0', '2016-08-09 13:50:08', '2016-08-09 14:07:20', '61feb2d25e254c09a8815830a55bd51c');
INSERT INTO `commentcourse` VALUES ('95', '2016080957a96f74ca4d1', '《月光奏鸣曲》', '25', '宗硕琪', '/home/image/lessonSubject/d2c883f9613fba970c07f3490091f284.png', '78965ac1a3874a2ca0c51e4bc26be9bb', '', '', '2016-08-09 14:06:26', '2', '20', '李民', '3,4', '8', '47', '1', '57', '1', '0', '2', '0', '0', '2016-08-09 14:06:14', '2016-08-09 14:07:54', '5f7c9f733b1745319a340c1dabd6c4af');
INSERT INTO `commentcourse` VALUES ('96', '2016080957a9736fd876b', '小步舞曲', '26', '王秋实', '/home/image/lessonSubject/e74acb71d2118b0d0cdfca48e75695fa.png', '4e27f2320a894452bac43f1ead0bb573', '', '', '2016-08-09 14:19:56', '2', '20', '李民', '4,5', '39', '66', '0', '0', '0', '0', '2', '0', '0', '2016-08-09 14:17:36', '2016-08-09 14:31:05', '7e1f177c1d4a4910a34469b8e4929f5b');
INSERT INTO `commentcourse` VALUES ('132', '2016081057aad407cc8dd', '华尔街之狼_clip(1).mp4', '21', 'liliang', null, '213ff6ab6105450aa6912cb0f944f48d', '8f93b693d76a46e68cc6bc1be8a7a744', '', null, '1', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 16:59:33', '2016-08-10 16:59:33', '58e60d3d1ea94fcc9b67076456045987');
INSERT INTO `commentcourse` VALUES ('133', '2016081057aad2b020987', '华尔街之狼_clip(1).avi', '21', 'liliang', null, '929abeb6102a43e1bef213499624f606', '40cb952c19604af1abfd20749d8fb88f', '', null, '1', '10', 'yundi', '2,3,8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 17:08:07', '2016-08-10 17:08:07', '28ae57d86f964bc3b33e77cb9be56447');
INSERT INTO `commentcourse` VALUES ('134', '2016080957a9906c76422', '错乱（大长）', '2', 'ceshi1', null, '4871b2f2f9ae47e5a5caa338695a39aa', '', '', '2016-08-10 17:19:49', '2', '20', '李民', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 17:19:42', '2016-08-10 17:19:42', 'af6b3b083a6e4f2490287dfd42e1ed2d');
INSERT INTO `commentcourse` VALUES ('135', '2016081057aad0831f54f', '一个非常大的视频', '3', 'wangchenkai', null, 'c2860714917449f38882a9fc50abcc33', '331310e7cae34e1c9555c6d99f8b4781', '', '2016-08-10 17:26:16', '2', '20', '李民', '1', '3', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-10 17:25:49', '2016-08-10 17:25:49', '65b9ccdeee87408d9e1ebbe28451303b');
INSERT INTO `commentcourse` VALUES ('136', '2016081157abd49b3bc91', 'wmv', '26', '王秋实', null, 'dad5e0ce3669401d87b97ea23bda07b9', 'ae965c6eee92486ebb4e119854e84237', '', '2016-08-11 09:43:25', '0', '10', 'yundi', '3,4,5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-11 09:36:42', '2016-08-11 09:43:12', 'cfa1296edcfc480abace790a4b7d7bb8');
INSERT INTO `commentcourse` VALUES ('70', '2016080557a4082f773f3', '《梨花又开放》', '2', 'ceshi1', '/home/image/lessonSubject/bca192016bdb141d38e88a4ebd8bffad.png', 'd59a654085534457bdee0f478f2b34da', '49b35f1fb5974c8c9625500d0f71f3cd', '', '2016-08-05 11:37:14', '2', '8', 'langlang', '6,7,8', '23', '2', '2', '0', '1', '0', '2', '0', '0', '2016-08-05 11:34:39', '2016-08-05 12:54:31', '3e52eff3206f4772abcae29d4a23ca5e');
INSERT INTO `commentcourse` VALUES ('84', '2016080857a81b1737eda', 'apologize_标清.flv', '9', 'qinying', '/home/image/lessonSubject/b7bc2c64199684669630227d28d563d3.png', '35d7256ed77b42a183282c571376be78', '', '', '2016-08-08 13:57:26', '2', '8', 'langlang', '5,6,7', '16', '0', '0', '0', '1', '0', '0', '0', '0', '2016-08-08 13:51:31', '2016-08-08 14:00:12', '4f9b8b209c7c4776b50364f608f217f6');
INSERT INTO `commentcourse` VALUES ('85', '2016080857a834d441713', '《寻找莫扎特》', '2', 'ceshi1', null, '7c33e8b67a0642a09ee7afbc04f64e0f', '7b1f9eccfb874347834d8f4ab45ddbf8', '', '2016-08-08 15:39:27', '0', '13', '周杰伦', '3,4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-08 15:38:50', '2016-08-08 15:38:50', '288299d292c349209b890e4cb463a30a');
INSERT INTO `commentcourse` VALUES ('86', '2016080857a83a2231e0b', '《梦中的婚礼》', '6', 'ceshi2', '/home/image/lessonSubject/a5925ccf69849ead157db95630f96681.png', 'c67d3f4f206c40ea83f5fc72912d31cb', '', '', '2016-08-08 16:01:24', '2', '10', 'yundi', '6,7', '19', '44', '0', '0', '1', '0', '2', '0', '0', '2016-08-08 15:54:52', '2016-08-09 14:31:38', 'be4cff2e2fa3485299859be776218266');
INSERT INTO `commentcourse` VALUES ('87', '2016080857a7f2408d4d7', '《前世情人》', '6', 'ceshi2', null, 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', '', null, '1', '8', 'langlang', '1,2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-08 16:02:15', '2016-08-08 16:02:15', '5209bbc127a34dbba48fb0096737420c');
INSERT INTO `commentcourse` VALUES ('88', '2016080857a841d558826', 'kkkk', '2', 'ceshi1', null, 'd59a654085534457bdee0f478f2b34da', '49b35f1fb5974c8c9625500d0f71f3cd', '', null, '1', '17', '贝多芬', '1,6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-08 16:33:09', '2016-08-08 16:33:09', '8c428cc8a1da4e6b9f1846e1b0435bb7');
INSERT INTO `commentcourse` VALUES ('90', '2016080857a844b249274', 'vvvvv', '2', 'ceshi1', null, '4e57232ec9e6475f93237aefa8dfc13e', 'e1ba1b5b49a8415cb5d0897dfc0ba26e', '', null, '1', '17', '贝多芬', '1,2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2016-08-08 16:38:46', '2016-08-08 16:38:46', 'f46423356f38483ea30873cb3fbb8eda');
INSERT INTO `commentcourse` VALUES ('91', '2016080857a8469292d49', 'qqqqq', '6', 'ceshi2', null, 'd59a654085534457bdee0f478f2b34da', '49b35f1fb5974c8c9625500d0f71f3cd', '', '2016-08-08 16:51:06', '2', '17', '贝多芬', '1,2', '7', '0', '0', '0', '0', '0', '0', '0', '1', '2016-08-08 16:49:39', '2016-08-08 16:50:57', 'e68bed52c3d04543b05cb9310acebc09');

-- ----------------------------
-- Table structure for `companyuser`
-- ----------------------------
DROP TABLE IF EXISTS `companyuser`;
CREATE TABLE `companyuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '年度信息报告主键ID',
  `postId` int(8) DEFAULT NULL COMMENT '岗位ID',
  `departId` int(8) DEFAULT NULL COMMENT '部门ID',
  `userId` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='公司后台用户';

-- ----------------------------
-- Records of companyuser
-- ----------------------------

-- ----------------------------
-- Table structure for `course`
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `courseTitle` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专题课程标题',
  `courseIntro` text COLLATE utf8_unicode_ci NOT NULL COMMENT '专题课程标题描述',
  `courseType` int(8) DEFAULT '0' COMMENT '专题课程标题分类 0位无促销',
  `courseFormat` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频格式',
  `teacherId` int(10) DEFAULT NULL COMMENT '讲师ID',
  `coursePic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源封面图',
  `courseDiscount` int(5) DEFAULT '0' COMMENT '课程折扣 折扣乘以1000 存储',
  `coursePrice` int(10) DEFAULT NULL COMMENT '资源价格  真实价格乘以1000存储',
  `courseView` int(10) NOT NULL DEFAULT '0' COMMENT '课程浏览数',
  `courseStudyNum` int(10) DEFAULT '0' COMMENT '课程学习数',
  `coursePlayView` int(10) DEFAULT '0' COMMENT '课程观看数，视频播放统计',
  `completecount` int(10) DEFAULT '0' COMMENT '观看完成数学习数(true)',
  `courseFav` int(10) DEFAULT '0' COMMENT '资源收藏数',
  `courseStatus` tinyint(1) DEFAULT NULL COMMENT '课程状态 0为激活 1为锁定',
  `courseIsDel` tinyint(1) DEFAULT '0' COMMENT '资源删除标识 0为正常显示 1为虚拟删除',
  `courseNotice` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '课程公告',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `fileID` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='专题课程表';

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '基础视频演奏', '讲解老师是第一位受聘于世界顶级的柏林爱乐乐团和美国五大交响乐团的中国钢琴家，获得古典音乐类多项权威奖项，包括德国古典回声大奖等。这课主要让跟多的人了解钢琴 认识钢琴', '0', null, '8', '/home/image/lessonSubject/218ae726907e23f2fa67021b170dd915.png', '0', '1', '33', '0', '39', '0', '1', '0', '0', '讲解老师是第一位受聘于世界顶级的柏林爱乐乐团和美国五大交响乐团的中国钢琴家，获得古典音乐类多项权威奖项，包括德国古典回声大奖等。这课主要让跟多的人了解钢琴 认识钢琴', '2016-08-04 17:50:37', '2016-08-05 17:20:18', null);
INSERT INTO `course` VALUES ('2', '郎朗-柴可夫斯基第一钢琴协奏曲第一讲', '郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴', '2', null, '8', '/home/image/lessonSubject/3c8cebc02322d1b8ecfafae207021360.png', '0', '1', '63', '1', '45', '1', '0', '0', '0', '郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基第一钢琴协奏曲郎朗—柴可夫斯基', '2016-08-04 19:46:18', '2016-08-05 17:17:09', null);
INSERT INTO `course` VALUES ('3', '郎朗——D大调', '郎朗——D大调郎朗——D大调郎朗——D大调郎朗——D大调', '2', null, '8', '/home/image/lessonSubject/d3fbe8d231bdeeb8c588743754ffc266.png', '0', '1', '60', '0', '15', '0', '1', '0', '0', '郎朗——D大调郎朗——D大调郎朗——D大调郎朗——D大调郎朗——D大调', '2016-08-04 19:57:46', '2016-08-05 17:16:27', null);
INSERT INTO `course` VALUES ('4', '郎朗——圆周率钢琴曲', '郎朗——圆周率钢琴曲郎朗——圆周率钢琴曲郎朗——圆周率钢琴曲郎朗——圆周率钢琴曲', '0', null, '8', '/home/image/lessonSubject/3fe9d91f103f018cea1790fa25052796.png', '0', '0', '52', '0', '35', '0', '0', '0', '0', '郎朗——圆周率钢琴曲郎朗——圆周率钢琴曲郎朗——圆周率钢琴曲郎朗——圆周率钢琴曲', '2016-08-05 09:27:16', '2016-08-05 17:15:59', null);
INSERT INTO `course` VALUES ('5', '郎朗演出专辑', '讲解老师是第一位受聘于世界顶级的柏林爱乐乐团和美国五大交响乐团的中国钢琴家，获得古典音乐类多项权威奖项，包括德国古典回声大奖等。这课主要让跟多的人了解钢琴 认识钢琴', '2', null, '8', '/home/image/lessonSubject/70862985c7c1c7b390ff80356ee8e9dd.png', '0', '1', '41', '0', '31', '0', '0', '0', '1', '讲解老师是第一位受聘于世界顶级的柏林爱乐乐团和美国五大交响乐团的中国钢琴家，获得古典音乐类多项权威奖项，包括德国古典回声大奖等。这课主要让跟多的人了解钢琴 认识钢琴', '2016-08-05 09:37:41', '2016-08-05 17:15:33', null);
INSERT INTO `course` VALUES ('6', '周杰伦——mine钢琴演奏版', '周杰伦——mine钢琴演奏版周杰伦——mine钢琴演奏版', '0', null, '13', '/home/image/lessonSubject/0241808f6099edd4b4ff71932418dc5c.png', '0', '1', '99', '3', '19', '1', '0', '0', '0', '周杰伦——mine钢琴演奏版周杰伦——mine钢琴演奏版', '2016-08-05 10:28:00', '2016-08-10 16:15:44', null);
INSERT INTO `course` VALUES ('7', '周杰伦——皮影戏钢琴演奏版', '周杰伦——皮影戏钢琴演奏版周杰伦——皮影戏钢琴演奏版周杰伦——皮影戏钢琴演奏版周杰伦——皮影戏钢琴演奏版', '3', null, '13', '/home/image/lessonSubject/2ae9639f52529e87d53fc85422ab545f.png', '0', '1', '67', '2', '31', '2', '1', '0', '0', '周杰伦——皮影戏钢琴演奏版周杰伦——皮影戏钢琴演奏版周杰伦——皮影戏钢琴演奏版周杰伦——皮影戏钢琴演奏版', '2016-08-05 10:35:22', '2016-08-05 17:10:19', null);
INSERT INTO `course` VALUES ('8', '周杰伦——世界末日', '周杰伦——世界末日周杰伦——世界末日周杰伦——世界末日', '3', null, '13', '/home/image/lessonSubject/edfffd76608da402b428d28f2329dc30.png', '0', '1', '69', '4', '52', '4', '1', '0', '0', '周杰伦——世界末日周杰伦——世界末日周杰伦——世界末日', '2016-08-05 10:41:56', '2016-08-05 17:07:31', null);
INSERT INTO `course` VALUES ('9', '周杰伦——一路向北', '周杰伦——一路向北周杰伦——一路向北', '2', null, '13', '/home/image/lessonSubject/2b4be8db8a9ce6599341674ec9de9afe.png', '0', '0', '89', '4', '28', '0', '2', '0', '0', '周杰伦——一路向北周杰伦——一路向北周杰伦——一路向北', '2016-08-05 10:46:31', '2016-08-05 17:06:14', null);
INSERT INTO `course` VALUES ('10', '李云迪——在那遥远的地方', '李云迪——在那遥远的地方李云迪——在那遥远的地方李云迪——在那遥远的地方', '0', null, '10', '/home/image/lessonSubject/d23bab18762cf14f45aa441bc9e1204d.png', '0', '1', '69', '1', '18', '1', '1', '0', '0', '李云迪——在那遥远的地方李云迪——在那遥远的地方', '2016-08-05 14:44:03', '2016-08-05 17:06:00', null);
INSERT INTO `course` VALUES ('11', '贝多芬系列交响乐', '贝多芬系列交岣音乐会(G大调第四钢琴协奏曲)钢琴演奏', '2', null, '10', '/home/image/lessonSubject/54a5ab31fce4e525e01d5ad5df5573b8.png', '0', '3', '26', '4', '11', '4', '0', '0', '0', '贝多芬系列交岣音乐会(G大调第四钢琴协奏曲)钢琴演奏', '2016-08-05 16:37:04', '2016-08-08 14:23:42', null);
INSERT INTO `course` VALUES ('12', '李云迪——花儿为什么那样红', '李云迪——花儿为什么那样红李云迪——花儿为什么那样红李云迪——花儿为什么那样红', '1', null, '10', '/home/image/lessonSubject/0ec322fce6083c25beca5ae78f6388f8.png', '9000', '10000', '25', '2', '8', '1', '0', '0', '0', '李云迪——花儿为什么那样红李云迪——花儿为什么那样红', '2016-08-05 17:57:46', '2016-08-10 16:26:15', null);
INSERT INTO `course` VALUES ('13', '李云迪——雨滴', '李云迪——雨滴李云迪——雨滴李云迪——雨滴', '0', null, '10', '/home/image/lessonSubject/0cd74e00b681bcb35d2df209566b38af.png', '0', '2', '47', '6', '10', '3', '1', '0', '0', '', '2016-08-05 18:06:49', '2016-08-10 14:28:14', null);
INSERT INTO `course` VALUES ('14', '优惠大放送', '优惠大放送优惠大放送', '0', null, '13', '/home/image/lessonSubject/7e69f3a1a3371cf0b50fe5785cb6e25e.jpg', '0', '0', '118', '13', '51', '0', '1', '0', '0', '优惠大放送优惠大放送', '2016-08-05 18:31:41', '2016-08-08 10:41:40', null);
INSERT INTO `course` VALUES ('15', '超高标转换', '超高标转换超高标转换超高标转换', '0', null, '13', '/home/image/lessonSubject/a87d5ad5c324a702f35c1a36fa6db243.png', '0', '3', '121', '2', '28', '1', '2', '0', '0', '超高标转换超高标转换超高标转换超高标转换', '2016-08-08 10:46:54', '2016-08-08 14:35:38', null);
INSERT INTO `course` VALUES ('16', '免费大放送', '免费大放送免费大放送免费大放送', '0', null, '8', '/home/image/lessonSubject/7d3c03b4e83d89451ecd0531652a660f.png', '0', '0', '117', '1', '57', '0', '1', '0', '0', '免费大放送免费大放送免费大放送', '2016-08-08 10:51:49', '2016-08-08 10:51:49', null);
INSERT INTO `course` VALUES ('17', '已学验证1', '已学验证已学验证已学验证', '0', null, '13', '/home/image/lessonSubject/9dc9b92fe625d1bb0fd3e6516b971038.png', '0', '2', '56', '2', '5', '1', '0', '0', '1', '已学验证已学验证已学验证', '2016-08-08 14:51:35', '2016-08-08 17:02:17', null);
INSERT INTO `course` VALUES ('18', '第一次验证', '验证验证', '2', null, '10', '/home/image/lessonSubject/2be69d85b2a60dd586a2179c6e622f31.png', '0', '0', '183', '6', '2', '0', '0', '0', '0', '就是验证呢', '2016-08-08 18:01:11', '2016-08-08 18:01:11', null);
INSERT INTO `course` VALUES ('19', '顺序播放', '顺序播放顺序播放', '2', null, '13', '/home/image/lessonSubject/bd4adbdf7feb6957954bbe8d4f06d985.png', '0', '3', '143', '14', '26', '1', '1', '0', '0', '顺序播放顺序播放顺序播放', '2016-08-09 10:40:38', '2016-08-09 10:57:21', null);
INSERT INTO `course` VALUES ('20', '巩固基础', '巩固基础反复练习 ', '2', null, '10', '/home/image/lessonSubject/ba61baaf57f76e6e6e5a082daf8d7280.png', '0', '1', '15', '12', '0', '1', '0', '0', '0', '巩固基础反复练习   很好的课程哟', '2016-08-10 11:43:03', '2016-08-10 11:43:21', null);

-- ----------------------------
-- Table structure for `coursechapter`
-- ----------------------------
DROP TABLE IF EXISTS `coursechapter`;
CREATE TABLE `coursechapter` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '章节名称 章和节递归循环',
  `courseId` int(8) DEFAULT NULL,
  `parentId` int(8) DEFAULT NULL COMMENT '0位章 大于0位主键ID',
  `coursePath` int(8) DEFAULT NULL COMMENT '专题课程原始路径',
  `courseTime` datetime DEFAULT NULL COMMENT '课程长度',
  `courseLowPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转码低路径',
  `courseMediumPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转码中路径',
  `courseHighPath` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '转码高路径',
  `courseSize` int(8) DEFAULT NULL COMMENT '课程大小',
  `status` tinyint(1) DEFAULT '0' COMMENT '章节状态 0位正常 1位锁定',
  `coursePlayView` int(8) DEFAULT NULL COMMENT '章节课程播放数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `fileID` char(32) CHARACTER SET utf8 DEFAULT NULL,
  `coursePic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图',
  `isTrylearn` int(1) DEFAULT '0' COMMENT '0:否1：是',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='专题课程目录表';

-- ----------------------------
-- Records of coursechapter
-- ----------------------------
INSERT INTO `coursechapter` VALUES ('1', '第一章', '1', '0', null, null, null, null, null, null, '0', null, '2016-08-04 17:50:56', '2016-08-04 17:50:56', null, null, '0');
INSERT INTO `coursechapter` VALUES ('3', 'rhsdgsdgd', '1', '0', null, null, null, null, null, null, '0', null, '2016-08-04 18:40:18', '2016-08-04 18:40:18', null, null, '0');
INSERT INTO `coursechapter` VALUES ('4', 'dfh', '1', '0', null, null, null, null, null, null, '0', null, '2016-08-04 18:41:55', '2016-08-04 18:41:55', null, null, '0');
INSERT INTO `coursechapter` VALUES ('5', 'dfg', '1', '0', null, null, null, null, null, null, '0', null, '2016-08-04 18:42:03', '2016-08-04 18:42:03', null, null, '0');
INSERT INTO `coursechapter` VALUES ('10', '', '1', '1', null, null, '73f42be2e6854b13827fa012b94fad7b', null, null, null, '0', null, '2016-08-04 18:46:19', '2016-08-04 18:46:19', '30a6709f078347bda97fe3b817c6c35e', null, '0');
INSERT INTO `coursechapter` VALUES ('11', 'dfh', '1', '0', null, null, null, null, null, null, '0', null, '2016-08-04 18:47:03', '2016-08-04 18:47:03', null, null, '0');
INSERT INTO `coursechapter` VALUES ('12', 'T1', '1', '1', null, null, '48ff75dae7cf482db2cbe5644482b644', '09bfc2dc46e1415b8c47705972ace58e', '4648f5fe63024e28a3ba0d5cf4424704', null, '0', null, '2016-08-04 19:04:41', '2016-08-04 19:04:41', 'bdbe6f322dd941259b898fd0c312b68f', null, '0');
INSERT INTO `coursechapter` VALUES ('13', 'T2', '1', '1', null, null, '4c40190bccf04f24924cd45cf890d3d9', '7c6430b4428546c9a363620fae2c7e28', '6b2b7e8b99694ca4be06ab4ec9826296', null, '0', null, '2016-08-04 19:04:44', '2016-08-04 19:04:44', '44adc57a91c24cc5bd2103f8c884a3c6', null, '0');
INSERT INTO `coursechapter` VALUES ('14', 'T3', '1', '1', null, null, '5cdd9990cf564a768fda7ea0a960ae56', 'dcc3c78f21c24c24a06226813e68324d', '5de11512375447c8a707ea184f6c3e8b', null, '0', null, '2016-08-04 19:04:47', '2016-08-04 19:04:47', '8274a5e8170f43908bbf9b1bd73027f3', null, '0');
INSERT INTO `coursechapter` VALUES ('15', 'T4', '1', '1', null, null, '3e79a99b38ed478d8dd0981d15f5746a', '1db60706776b49cfa430a4932140bec9', '30f3453d57824f5f82f88560a1f31514', null, '0', null, '2016-08-04 19:04:50', '2016-08-04 19:04:50', '0d935e1deac44997b9010db58039f5cf', null, '0');
INSERT INTO `coursechapter` VALUES ('16', 'T5', '1', '1', null, null, '6f55b73f39a549349e69c0d6fccc1fcc', 'f03b2496ba9e49449106c7a9e0a0eb49', '3fe3c97f5adf4c92ba30032a467c20e9', null, '0', null, '2016-08-04 19:04:52', '2016-08-04 19:04:52', '21ef5ce3f8d640bb81c9c38d5b996305', null, '0');
INSERT INTO `coursechapter` VALUES ('17', '第一章', '2', '0', null, null, null, null, null, null, '0', null, '2016-08-04 19:47:56', '2016-08-04 19:47:56', null, null, '0');
INSERT INTO `coursechapter` VALUES ('18', 'one', '2', '17', null, null, '5a6441123fc241c088a1260e4936af74', null, null, null, '0', null, '2016-08-04 19:54:11', '2016-08-04 19:54:11', 'd30254d981624b54a1f190091d1ae95b', null, '1');
INSERT INTO `coursechapter` VALUES ('19', 'two', '2', '17', null, null, '2f36cc89fac1464192c058791919b822', null, null, null, '0', null, '2016-08-04 19:56:47', '2016-08-04 19:56:47', 'c0470b671a4e4b018676b06a80617203', null, '0');
INSERT INTO `coursechapter` VALUES ('20', 'zhang', '3', '0', null, null, null, null, null, null, '0', null, '2016-08-04 19:58:02', '2016-08-04 19:58:02', null, null, '0');
INSERT INTO `coursechapter` VALUES ('21', '一', '3', '20', null, null, '4275c1a4db9b44a78b159beff723c3a8', null, null, null, '0', null, '2016-08-04 20:00:30', '2016-08-04 20:00:30', '08a5f9575b904793afe4e9055deef835', null, '0');
INSERT INTO `coursechapter` VALUES ('22', '二', '3', '20', null, null, null, null, null, null, '1', null, '2016-08-04 20:10:25', '2016-08-04 20:10:25', '19b5ceafb8f74337bdc682a2c34e67ff', null, '1');
INSERT INTO `coursechapter` VALUES ('23', 'A1', '1', '0', null, null, null, null, null, null, '1', null, '2016-08-04 23:33:20', '2016-08-04 23:33:20', 'cbdf0564554b4b74bdd2536c08d2d9c3', null, '0');
INSERT INTO `coursechapter` VALUES ('24', 'A2', '1', '1', null, null, '41feeb81f327440b91a7cedd3749c500', '0eb9dccb2822433e80bf2a7690fab0ea', 'c1296c38ed7e4d8b90c3d7df6ce6dc6a', null, '0', null, '2016-08-04 23:33:29', '2016-08-04 23:33:29', '7645d1d3fb6c4fd7a78ae97e398c2f9e', null, '0');
INSERT INTO `coursechapter` VALUES ('25', 'A6', '1', '1', null, null, 'e0adc7a06df44771a915c23fa176dd90', '97a628d6cdb74062b4b49080436ce013', 'e1bafa7eae8d4c0dada53a44122fec91', null, '0', null, '2016-08-04 23:34:27', '2016-08-04 23:34:27', '20c1f80585244d8d967af8b941691b1d', null, '0');
INSERT INTO `coursechapter` VALUES ('26', 'A5', '1', '1', null, null, '1030c774b2ed400cbef01b5f082d5f40', 'd1ed33e2caa346ae96a74e62f1b4012c', '1c9dbbd00e894daa8513878f6cb76b49', null, '0', null, '2016-08-04 23:37:24', '2016-08-04 23:37:24', '76ffc4c11fcf491f8767c8391d491d5d', null, '0');
INSERT INTO `coursechapter` VALUES ('27', 'A3', '1', '1', null, null, '44764ea5686c46cca611d1656fa43534', '04e06417fbf54c72bd9e96ac20889f5a', 'ec26389647fa49919c8996851b1ca5e2', null, '0', null, '2016-08-04 23:37:58', '2016-08-04 23:37:58', '251d7b492a37473989a5ce7c8522ab67', null, '0');
INSERT INTO `coursechapter` VALUES ('28', 'A4', '1', '1', null, null, '4c1d08516f5d4be1a59c99fdd0d9f15f', '2e8f806622b3407bac128bd6ea5df8d9', '5c3f77d1c4584e0694ad70820cdc1171', null, '0', null, '2016-08-04 23:38:22', '2016-08-04 23:38:22', 'cb73155fb6644d42b47aa6d5eecbf0d8', null, '0');
INSERT INTO `coursechapter` VALUES ('29', 'D7', '1', '1', null, null, '3b3aabbca2c2440fb1ce9a911addf8a7', null, null, null, '0', null, '2016-08-05 01:59:56', '2016-08-05 01:59:56', 'dbe80c49c3094e8893c73f69ee445818', null, '0');
INSERT INTO `coursechapter` VALUES ('30', 'D8', '1', '1', null, null, 'ae4c9d9b2948401f82f0cf774d53ea92', null, null, null, '0', null, '2016-08-05 02:00:01', '2016-08-05 02:00:01', 'bfe7a206887f41dda26486a4c54bea9e', null, '0');
INSERT INTO `coursechapter` VALUES ('31', 'D2', '1', '1', null, null, '29a29254eefd42f4892cd3ff62f826ae', null, null, null, '0', null, '2016-08-05 02:08:18', '2016-08-05 02:08:18', '8be2cdc322db4316b7599bdc2d420bba', null, '0');
INSERT INTO `coursechapter` VALUES ('32', 'D6', '1', '1', null, null, '8418bf7b80b446cfbf0f8aa5c2c79c03', null, null, null, '0', null, '2016-08-05 02:47:33', '2016-08-05 02:47:33', '9dc110c2fbdc41059c4efc48440cdbcb', null, '0');
INSERT INTO `coursechapter` VALUES ('33', 'D1', '1', '1', null, null, 'e2ecd90e289d429b8e97e724e706218b', null, null, null, '0', null, '2016-08-05 03:02:59', '2016-08-05 03:02:59', '419054e65a534141a79350e1c7f7d642', null, '0');
INSERT INTO `coursechapter` VALUES ('34', 'D3', '1', '1', null, null, '121da4387d7d442abcdc16b6ad4e615c', null, null, null, '0', null, '2016-08-05 03:03:02', '2016-08-05 03:03:02', 'f94c88b920e24b4dbcf04a87aecbc4a6', null, '0');
INSERT INTO `coursechapter` VALUES ('35', 'D5', '1', '1', null, null, '0e51f2b8284c4afab36ebeff18a6e923', null, null, null, '0', null, '2016-08-05 03:06:19', '2016-08-05 03:06:19', '16d3d7a2395b49b7b6bd7b1ba6ddcc9e', null, '0');
INSERT INTO `coursechapter` VALUES ('36', 'D4', '1', '1', null, null, '8467f343ebcf4f1cbc812237b6a5d6c1', null, null, null, '0', null, '2016-08-05 03:10:52', '2016-08-05 03:10:52', 'baa372d835b545c4bfa91a8c7ac3b037', null, '0');
INSERT INTO `coursechapter` VALUES ('37', 'h', '4', '0', null, null, null, null, null, null, '0', null, '2016-08-05 09:27:34', '2016-08-05 09:27:34', null, null, '0');
INSERT INTO `coursechapter` VALUES ('38', 'j', '4', '37', null, null, '0c537f183ae24d62a5ebe3e2ce47d9a0', null, null, null, '0', null, '2016-08-05 09:28:26', '2016-08-05 09:28:26', '3533ae0862f54c35b6ae2932e7f24150', null, '0');
INSERT INTO `coursechapter` VALUES ('39', '第一章', '5', '0', null, null, null, null, null, null, '0', null, '2016-08-05 09:38:02', '2016-08-05 09:38:02', null, null, '0');
INSERT INTO `coursechapter` VALUES ('40', '《夜的钢琴曲五》', '5', '39', null, null, '17e9f6d2b13649cf83bf6110538380e0', '859aa6a3845846f28ebe096095a44ceb', null, null, '0', null, '2016-08-05 09:39:39', '2016-08-05 09:39:39', 'e499499d12d543e685cf516907d69545', null, '1');
INSERT INTO `coursechapter` VALUES ('41', '《梨花又开放》', '5', '39', null, null, 'b63676701846441f97f2f359554e4d54', '52d23264faee450d983574fbd2bb99a7', null, null, '0', null, '2016-08-05 09:41:45', '2016-08-05 09:41:45', 'c92038f8ec71497eb559123c267df372', null, '1');
INSERT INTO `coursechapter` VALUES ('42', 'ads', '5', '39', null, null, '89cf7a79864243599bbfd32bff6eab33', 'a66a5a35d6de4ba6a0502f741a7cec30', null, null, '0', null, '2016-08-05 10:02:13', '2016-08-05 10:02:13', 'fbbfaa876096462e8d3a5b35b581b93d', null, '0');
INSERT INTO `coursechapter` VALUES ('43', 'one', '6', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:28:20', '2016-08-05 10:28:20', null, null, '0');
INSERT INTO `coursechapter` VALUES ('44', '1', '6', '43', null, null, '0bb770b8ba1c4cfd8126c1a895626bec', null, null, null, '0', null, '2016-08-05 10:29:48', '2016-08-05 10:29:48', '98d72096e2134fa5a648ad1b6821c32b', null, '0');
INSERT INTO `coursechapter` VALUES ('45', '2', '6', '43', null, null, '0bb770b8ba1c4cfd8126c1a895626bec', null, null, null, '0', null, '2016-08-05 10:30:13', '2016-08-05 10:30:13', '510c719786eb4bf7b87e5aaea008b24b', null, '1');
INSERT INTO `coursechapter` VALUES ('46', '3', '6', '43', null, null, '0bb770b8ba1c4cfd8126c1a895626bec', null, null, null, '0', null, '2016-08-05 10:30:57', '2016-08-05 10:30:57', '7e901fe37d4447528a1b01a362b7ec3f', null, '0');
INSERT INTO `coursechapter` VALUES ('47', '4', '6', '43', null, null, '0bb770b8ba1c4cfd8126c1a895626bec', null, null, null, '0', null, '2016-08-05 10:31:18', '2016-08-05 10:31:18', '2bbabd79de69472ba09100cf5b8dbdbb', null, '0');
INSERT INTO `coursechapter` VALUES ('48', '5', '6', '43', null, null, '0bb770b8ba1c4cfd8126c1a895626bec', null, null, null, '0', null, '2016-08-05 10:31:54', '2016-08-05 10:31:54', 'dfd888dcd188473fa059fcd20ed54bcb', null, '0');
INSERT INTO `coursechapter` VALUES ('49', '6', '6', '43', null, null, '0bb770b8ba1c4cfd8126c1a895626bec', null, null, null, '0', null, '2016-08-05 10:34:21', '2016-08-05 10:34:21', '2cc3dff364424735871b58fb8a752e01', null, '1');
INSERT INTO `coursechapter` VALUES ('50', '第一章', '7', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:35:40', '2016-08-05 10:35:40', null, null, '0');
INSERT INTO `coursechapter` VALUES ('51', '第一节', '7', '50', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:36:35', '2016-08-05 10:36:35', 'c24a77f857fe4f3cba1a4739d802c4d3', null, '1');
INSERT INTO `coursechapter` VALUES ('52', '第二节', '7', '50', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:36:54', '2016-08-05 10:36:54', '3aed5f8057dd46e59987d78325efb521', null, '0');
INSERT INTO `coursechapter` VALUES ('53', '第三节', '7', '50', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:37:20', '2016-08-05 10:37:20', '30a85930832b4e6cb70db530c5d15839', null, '0');
INSERT INTO `coursechapter` VALUES ('54', '第二章', '7', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:37:30', '2016-08-05 10:37:30', null, null, '0');
INSERT INTO `coursechapter` VALUES ('55', '第一节', '7', '54', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:37:49', '2016-08-05 10:37:49', 'cea1b62665f94ca2941cd06af15a494e', null, '1');
INSERT INTO `coursechapter` VALUES ('56', '第二节', '7', '54', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:38:10', '2016-08-05 10:38:10', 'c71a294d1e2c4723befd1c93f040dd2d', null, '0');
INSERT INTO `coursechapter` VALUES ('58', '第三节', '7', '54', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:40:07', '2016-08-05 10:40:07', 'f592f9bac8934b9e9f49c4ad7bdeab11', null, '1');
INSERT INTO `coursechapter` VALUES ('59', '第三章', '7', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:40:21', '2016-08-05 10:40:21', null, null, '0');
INSERT INTO `coursechapter` VALUES ('60', '第一节', '7', '59', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:40:48', '2016-08-05 10:40:48', '0a5b82f7810745f7929c8ddcdcc4283a', null, '0');
INSERT INTO `coursechapter` VALUES ('61', '第二节', '7', '59', null, null, '461edad4d8c94b69a0d88e0e007d56be', null, null, null, '0', null, '2016-08-05 10:41:07', '2016-08-05 10:41:07', 'aaebd66ba3c1414eb6b085a7bb7509a4', null, '0');
INSERT INTO `coursechapter` VALUES ('62', '第一章 世界末日1', '8', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:42:16', '2016-08-05 10:42:16', null, null, '0');
INSERT INTO `coursechapter` VALUES ('63', '世界末日1', '8', '62', null, null, '4ad42403e1c1428e9501b4baeda51808', null, null, null, '0', null, '2016-08-05 10:43:04', '2016-08-05 10:43:04', '927ddbb40e19435cabd6073b422e0a7d', null, '0');
INSERT INTO `coursechapter` VALUES ('64', '世界末日2', '8', '62', null, null, '4ad42403e1c1428e9501b4baeda51808', null, null, null, '0', null, '2016-08-05 10:43:31', '2016-08-05 10:43:31', '7d69c08587cd4c5d8d324837f1946087', null, '1');
INSERT INTO `coursechapter` VALUES ('65', '世界末日3', '8', '62', null, null, '4ad42403e1c1428e9501b4baeda51808', null, null, null, '0', null, '2016-08-05 10:44:11', '2016-08-05 10:44:11', 'a5082ea1ca0f4ea9b4bd1076a4c7df04', null, '0');
INSERT INTO `coursechapter` VALUES ('66', '第二章  世界末日2', '8', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:44:33', '2016-08-05 10:44:33', null, null, '0');
INSERT INTO `coursechapter` VALUES ('67', '世界末日4', '8', '66', null, null, '4ad42403e1c1428e9501b4baeda51808', null, null, null, '0', null, '2016-08-05 10:45:45', '2016-08-05 10:45:45', '671405a5a677456b860ba28face042ae', null, '0');
INSERT INTO `coursechapter` VALUES ('68', '1', '9', '0', null, null, null, null, null, null, '0', null, '2016-08-05 10:47:03', '2016-08-05 10:47:03', null, null, '0');
INSERT INTO `coursechapter` VALUES ('69', '1', '9', '68', null, null, '1449adb56f584475ac5dbca690d64130', null, null, null, '0', null, '2016-08-05 10:47:53', '2016-08-05 11:13:39', '4799707d40104eeaa5f5a583399d4604', null, '0');
INSERT INTO `coursechapter` VALUES ('70', 'z1', '1', '1', null, null, '0068a85a26b145aa814f361d03c0ff78', 'e8157f7e296d4286ac7d5f58421f533e', '2d4fa478d7d34d3c87f436e619243955', null, '0', null, '2016-08-05 11:12:54', '2016-08-05 11:12:54', '8e66e82261e74972807de507bf9e815d', null, '0');
INSERT INTO `coursechapter` VALUES ('71', 'z2', '1', '1', null, null, '3ae8c73a15dd467fbe9b05664d7d5de8', '7bbbace93fb34f74a74f2947013e3d68', '4be28a884d084878b679b2fc4203ab4a', null, '0', null, '2016-08-05 11:13:01', '2016-08-05 11:13:01', '72d251dfcbb648a58d93eb03887e27f4', null, '0');
INSERT INTO `coursechapter` VALUES ('72', 'z3', '1', '1', null, null, '382c095b854943b7b79f231d0c701e34', '51b2b518a532488d89af8ee5353fbbad', '01efd1dcbff2489087e5cc694fae33e4', null, '0', null, '2016-08-05 11:13:08', '2016-08-05 11:13:08', '0b833b9f00bc4ea3aa13def5d8566b72', null, '0');
INSERT INTO `coursechapter` VALUES ('73', 'z4', '1', '1', null, null, 'd2f941f2b7fb4add9da213195e2307b5', 'e9fd89b4b86948dd84d46ff1dd2c9f56', '12f67628a81f4770a9e48b1bc23dac6d', null, '0', null, '2016-08-05 11:13:12', '2016-08-05 11:13:12', '77cc7603fcd5463ab9152ca503d5bc77', null, '0');
INSERT INTO `coursechapter` VALUES ('74', 'z5', '1', '1', null, null, '8372e24746e746a5b191409ce5cb8003', 'f20d1468e6ca40018f61b3a76d979ce0', '1f34710fc3334b9eabcadacca73f0567', null, '0', null, '2016-08-05 11:13:18', '2016-08-05 11:13:18', 'b9da7d8a2c544b2f80fdfd6f414af889', null, '0');
INSERT INTO `coursechapter` VALUES ('75', 'z6', '1', '1', null, null, '5606fdf9f6424a55a029d86f6c16706c', '8907e926043b4be697fb2f66d9aaadef', '8ae9b42a839b4e079fee46325a67eabd', null, '0', null, '2016-08-05 11:13:21', '2016-08-05 11:13:21', 'f43cb47d9d57469dacb6e3d3103b9a05', null, '0');
INSERT INTO `coursechapter` VALUES ('76', '第一章', '10', '0', null, null, null, null, null, null, '0', null, '2016-08-05 14:44:22', '2016-08-05 14:44:22', null, null, '0');
INSERT INTO `coursechapter` VALUES ('77', '第一节', '10', '76', null, null, '04cceb9ac5854d80b9ab67e15168cf04', null, null, null, '0', null, '2016-08-05 14:47:40', '2016-08-05 14:47:40', 'e51b09b3e2aa48d69627e0e5ec8030c3', null, '0');
INSERT INTO `coursechapter` VALUES ('78', '第三节', '10', '76', null, null, 'b5a97e9695fb4c6ca960b63f63eb6312', null, null, null, '0', null, '2016-08-05 15:00:42', '2016-08-05 15:00:42', '2a1b529e352a4b35951cfe72192fad2d', null, '1');
INSERT INTO `coursechapter` VALUES ('79', '第二节', '10', '76', null, null, null, null, null, null, '0', null, '2016-08-05 15:48:33', '2016-08-05 15:48:33', 'd5afa6a3639a4a51820efa7ea8de49b1', null, '1');
INSERT INTO `coursechapter` VALUES ('80', 'G1', '1', '1', null, null, 'e2ecd90e289d429b8e97e724e706218b', null, null, null, '0', null, '2016-08-05 15:52:37', '2016-08-05 15:52:37', 'e5a8e8e8ace34eb1a1ef5452ffba8d96', null, '0');
INSERT INTO `coursechapter` VALUES ('81', 'G3', '1', '1', null, null, '121da4387d7d442abcdc16b6ad4e615c', null, null, null, '0', null, '2016-08-05 15:53:01', '2016-08-05 15:53:01', 'cf06132a62a44d9da1a0a5f92b275670', null, '0');
INSERT INTO `coursechapter` VALUES ('82', 'G4', '1', '1', null, null, '8467f343ebcf4f1cbc812237b6a5d6c1', null, null, null, '0', null, '2016-08-05 15:53:04', '2016-08-05 15:53:04', '1f574e50d469477c930b0ed99a1e8c26', null, '0');
INSERT INTO `coursechapter` VALUES ('83', 'G5', '1', '1', null, null, '0e51f2b8284c4afab36ebeff18a6e923', null, null, null, '0', null, '2016-08-05 15:53:07', '2016-08-05 15:53:07', '125676cf63c24fe9821adc38b853a021', null, '0');
INSERT INTO `coursechapter` VALUES ('84', 'G6', '1', '1', null, null, '8418bf7b80b446cfbf0f8aa5c2c79c03', null, null, null, '0', null, '2016-08-05 15:53:15', '2016-08-05 15:53:15', 'cd75d14509f547aaa7ea1c4d9d761e1f', null, '0');
INSERT INTO `coursechapter` VALUES ('85', 'G7', '1', '1', null, null, '3b3aabbca2c2440fb1ce9a911addf8a7', null, null, null, '0', null, '2016-08-05 15:53:20', '2016-08-05 15:53:20', '0d75aebf81b2497b90d51190787837bd', null, '0');
INSERT INTO `coursechapter` VALUES ('86', 'G8', '1', '1', null, null, 'ae4c9d9b2948401f82f0cf774d53ea92', null, null, null, '0', null, '2016-08-05 15:53:24', '2016-08-05 15:53:24', 'c7419b80036d4cf2ad36cf6658beaba6', null, '0');
INSERT INTO `coursechapter` VALUES ('87', 'G9', '1', '1', null, null, '2be15bfb79dd4e10952699e287be984b', null, null, null, '0', null, '2016-08-05 15:54:17', '2016-08-05 15:54:17', 'd4d4eb8956064e638b269374673d839f', null, '0');
INSERT INTO `coursechapter` VALUES ('88', 'G10', '1', '1', null, null, '28b419246ef547ca82560a95854cbaf0', null, null, null, '0', null, '2016-08-05 15:54:24', '2016-08-05 15:54:24', '9746eab0d7b44a7596e622c15bc03022', null, '0');
INSERT INTO `coursechapter` VALUES ('89', 'H2', '1', '1', null, null, '103bb90da9bb428d9aa8be04018b9810', null, null, null, '0', null, '2016-08-05 15:54:56', '2016-08-05 15:54:56', 'f69bfa6d131f4d6d812ef26e2229272a', null, '0');
INSERT INTO `coursechapter` VALUES ('90', 'H1', '1', '1', null, null, 'fd6589366f1645dd94d25a0350749b7c', null, null, null, '0', null, '2016-08-05 15:54:59', '2016-08-05 15:54:59', '0a49f4c9abff41c98938848b39538b6d', null, '0');
INSERT INTO `coursechapter` VALUES ('91', 'H3', '1', '1', null, null, '8236c71f5f954d38bf658fa6a4eb0f66', null, null, null, '0', null, '2016-08-05 15:55:10', '2016-08-05 15:55:10', 'a357b5ae6ea54f88a432e85eb0fdf9ea', null, '0');
INSERT INTO `coursechapter` VALUES ('92', 'H4', '1', '1', null, null, 'c01f8b356a964bae8c1eb999e97dfcb8', null, null, null, '0', null, '2016-08-05 15:55:16', '2016-08-05 15:55:16', '7bdd8192af8b4c4f8c3595ffac7cf9fc', null, '0');
INSERT INTO `coursechapter` VALUES ('93', 'H9', '1', '1', null, null, '2be15bfb79dd4e10952699e287be984b', null, null, null, '0', null, '2016-08-05 16:31:09', '2016-08-05 16:31:09', 'd15f1843f3a34f7c9940f72908e7eb6c', null, '0');
INSERT INTO `coursechapter` VALUES ('94', 'one', '11', '0', null, null, null, null, null, null, '0', null, '2016-08-05 16:38:00', '2016-08-05 16:38:00', null, null, '0');
INSERT INTO `coursechapter` VALUES ('95', '贝多芬交响乐', '11', '94', null, null, null, null, null, null, '1', null, '2016-08-05 17:40:55', '2016-08-05 17:40:55', '345dc18397074ffda52263d062b3cf6d', null, '0');
INSERT INTO `coursechapter` VALUES ('96', '第一章', '12', '0', null, null, null, null, null, null, '0', null, '2016-08-05 17:58:01', '2016-08-05 17:58:01', null, null, '0');
INSERT INTO `coursechapter` VALUES ('97', '第二节', '12', '96', null, null, '67bf6e2691e443c499be695d0a1e0ac2', null, null, null, '0', null, '2016-08-05 17:58:39', '2016-08-05 17:58:39', 'c8d570886a884ae29b5a2ea21da9cfe9', null, '1');
INSERT INTO `coursechapter` VALUES ('98', '第二节', '12', '96', null, null, '3cb210052e92402b890e1ed532f2bee5', null, null, null, '0', null, '2016-08-05 17:59:20', '2016-08-05 17:59:20', 'b61ab4d3437d4cdd9ccfea5471dd573f', null, '0');
INSERT INTO `coursechapter` VALUES ('99', '第三节', '12', '96', null, null, '376a60323034430fba018035abe6a36d', null, null, null, '0', null, '2016-08-05 18:00:05', '2016-08-05 18:00:05', '6d36058023a048c2867585df109d4ea4', null, '0');
INSERT INTO `coursechapter` VALUES ('100', '第四节', '12', '96', null, null, 'ed84941b1af84f34898038b45a71ee6b', null, null, null, '0', null, '2016-08-05 18:00:50', '2016-08-05 18:00:50', '85366280face409b92e7b72866314a5a', null, '0');
INSERT INTO `coursechapter` VALUES ('101', '第一章', '13', '0', null, null, null, null, null, null, '0', null, '2016-08-05 18:07:08', '2016-08-05 18:07:08', null, null, '0');
INSERT INTO `coursechapter` VALUES ('102', '第一节', '13', '101', null, null, '4c4dee8e2edc4506abfaeb8c935315c3', null, null, null, '0', null, '2016-08-05 18:08:30', '2016-08-05 18:08:30', '50e5743c830c4273bd97b6a970b4e815', null, '0');
INSERT INTO `coursechapter` VALUES ('103', '第二节', '13', '101', null, null, 'cb9bc04d0c5c46ec8313c051a1b45fe7', null, null, null, '0', null, '2016-08-05 18:09:15', '2016-08-05 18:09:15', 'd75f5346f398412795b62f7583fe4c57', null, '1');
INSERT INTO `coursechapter` VALUES ('104', '第三节', '13', '101', null, null, '15e3119d79c74130ad85dc3e9ce40ac7', null, null, null, '0', null, '2016-08-05 18:10:08', '2016-08-05 18:11:43', '301cc86e6b394a509353ec4d79e5f015', null, '0');
INSERT INTO `coursechapter` VALUES ('106', 'V1', '1', '1', null, null, 'bdab398b15bf404ab57e5608e37ad039', null, null, null, '0', null, '2016-08-05 18:36:14', '2016-08-05 18:36:14', '928fd125d66a4f49aa06465984fc1726', null, '0');
INSERT INTO `coursechapter` VALUES ('153', '第一节', '20', '152', null, null, '0fe228f7e505458baa06c56d008f4bb6', '93eeba2c921b4a8083b2519ccfad176e', 'a030641ea05c40fd8238a35db79f44c2', null, '0', null, '2016-08-10 15:18:48', '2016-08-10 17:03:39', null, null, '1');
INSERT INTO `coursechapter` VALUES ('108', 'V2', '1', '1', null, null, null, null, null, null, '1', null, '2016-08-05 19:23:13', '2016-08-05 19:23:13', '143471fd5d0c437ab1ff1817d5ba2a20', null, '0');
INSERT INTO `coursechapter` VALUES ('109', 'dfh', '11', '0', null, null, null, null, null, null, '0', null, '2016-08-05 20:20:11', '2016-08-05 20:20:11', null, null, '0');
INSERT INTO `coursechapter` VALUES ('110', 'dsg', '11', '0', null, null, null, null, null, null, '0', null, '2016-08-05 20:20:20', '2016-08-05 20:20:20', null, null, '0');
INSERT INTO `coursechapter` VALUES ('152', '第一章', '20', '0', null, null, null, null, null, null, '0', null, '2016-08-10 11:43:31', '2016-08-10 11:43:31', null, null, '0');
INSERT INTO `coursechapter` VALUES ('151', '第一章 基础指法练习', '14', '0', null, null, null, null, null, null, '0', null, '2016-08-10 11:37:48', '2016-08-10 11:37:48', null, null, '0');
INSERT INTO `coursechapter` VALUES ('142', '第一章', '19', '0', null, null, null, null, null, null, '0', null, '2016-08-09 10:40:53', '2016-08-09 10:40:53', null, null, '0');
INSERT INTO `coursechapter` VALUES ('143', '1.1', '19', '142', null, null, '250d51fbb2894327998cb5fcce8d72f9', '52140d135f134834968064ca97256573', '436d8a7af9e744d0bba33c58f6a4c0ee', null, '0', null, '2016-08-09 10:41:35', '2016-08-09 10:41:35', null, null, '0');
INSERT INTO `coursechapter` VALUES ('127', '第一乐章', '15', '0', null, null, null, null, null, null, '0', null, '2016-08-08 10:47:10', '2016-08-08 10:47:10', null, null, '0');
INSERT INTO `coursechapter` VALUES ('128', '1', '15', '127', null, null, '048099d123a942c79f2e9a9b50661f93', 'e39ac9b3a8c84e52a7da64655c24f676', '4e4214a1fc22417db2ebce01a1cd1088', null, '0', null, '2016-08-08 10:48:06', '2016-08-08 10:48:06', null, null, '1');
INSERT INTO `coursechapter` VALUES ('129', '2', '15', '127', null, null, 'bd42b6680a9f42c0b678d3a4ad99455e', '891d5c5f26134d5ea8730cebe7c54fbe', '98401e979c8544d0a5a88554a56f0c74', null, '0', null, '2016-08-08 10:49:09', '2016-08-08 10:49:09', null, null, '0');
INSERT INTO `coursechapter` VALUES ('130', '一', '16', '0', null, null, null, null, null, null, '0', null, '2016-08-08 10:52:08', '2016-08-08 10:52:08', null, null, '0');
INSERT INTO `coursechapter` VALUES ('131', '1', '16', '130', null, null, 'e831db2938484dffb250ce6723f14f9c', '5c6a94aa6e50457286d3df5de5110b6e', 'e3be08e9bc9a45bcafd17911e2caf2d4', null, '0', null, '2016-08-08 10:53:47', '2016-08-08 14:47:19', null, null, '1');
INSERT INTO `coursechapter` VALUES ('134', '3', '15', '127', null, null, 'a8d2c1ef12964412a0b374a7e74225c6', '27024ce884fa44edba57778d9ce8b9ef', '17e65b949e6e440b93ff35c80c775c92', null, '0', null, '2016-08-08 14:30:29', '2016-08-08 14:30:29', null, null, '0');
INSERT INTO `coursechapter` VALUES ('135', '4', '15', '127', null, null, 'ad1441b4ecaa4d59b9ca6fed3b1b4338', '154cb10892c843bc9e66894427f2d56e', 'e4dcc5bf79664e01b3b82905c46453e4', null, '0', null, '2016-08-08 14:34:21', '2016-08-08 14:34:21', null, null, '0');
INSERT INTO `coursechapter` VALUES ('136', '第一章', '17', '0', null, null, null, null, null, null, '0', null, '2016-08-08 14:51:48', '2016-08-08 14:51:48', null, null, '0');
INSERT INTO `coursechapter` VALUES ('137', '第一节', '17', '136', null, null, 'ddc272b7cd744040802a60d122202bdf', '7bd0de21e3a64737944c445a05ef020a', '448247792cd044689d181516775650c9', null, '0', null, '2016-08-08 14:52:57', '2016-08-08 14:52:57', null, null, '0');
INSERT INTO `coursechapter` VALUES ('138', '第二节', '17', '136', null, null, '1f4a9c5ee0ea45249f159b361ad4fea0', '969fa0e0ac5e4d2297ea0a24b5cd54f6', '686e47aaa4644d0aba1f12c976853d16', null, '0', null, '2016-08-08 14:54:10', '2016-08-08 14:54:10', null, null, '1');
INSERT INTO `coursechapter` VALUES ('139', '第一章', '18', '0', null, null, null, null, null, null, '0', null, '2016-08-08 18:01:21', '2016-08-08 18:01:21', null, null, '0');
INSERT INTO `coursechapter` VALUES ('140', '第一节', '18', '139', null, null, '9b06a9dc49744bec8e9b746e3b29b872', '022a9ceea8654dc59acc56c6061c5c33', 'b15b207a9ddc4e67ad9222b393ae5585', null, '0', null, '2016-08-08 18:04:07', '2016-08-08 18:04:07', null, null, '1');
INSERT INTO `coursechapter` VALUES ('141', '第二节', '18', '139', null, null, '5a0edeb7d2a24bcf89e4a15e572547b0', '9744745596354242a293f7a1ef32e0e6', '6e89f486839746839f5a133dc43760fc', null, '0', null, '2016-08-08 18:07:23', '2016-08-08 18:07:23', null, null, '1');
INSERT INTO `coursechapter` VALUES ('144', '第二节', '19', '142', null, null, 'c7704a113d024457bcc6bee8353554a4', '28cf03467cdd497fbfb871c615f83f25', '36942c49c215466394de1bfad7ac1ee3', null, '0', null, '2016-08-09 10:42:07', '2016-08-09 10:42:07', null, null, '0');
INSERT INTO `coursechapter` VALUES ('145', '1.3', '19', '142', null, null, '40e0e4767db44590a72d93469f42df82', 'd9958297890d4389832cb35b8f08d3ad', '40ae11a63be541b3ab63f3d67ccd63d1', null, '0', null, '2016-08-09 10:42:48', '2016-08-09 10:42:48', null, null, '1');
INSERT INTO `coursechapter` VALUES ('146', '第二章', '19', '0', null, null, null, null, null, null, '0', null, '2016-08-09 10:43:01', '2016-08-09 10:43:01', null, null, '0');
INSERT INTO `coursechapter` VALUES ('147', '2.1', '19', '146', null, null, 'cdff98f1b0674d3cbaac27baf8be571c', '252fbe071f56430faed5da7553313aef', '0370cf4a5598418d943c2b0dac07d0d5', null, '0', null, '2016-08-09 10:43:25', '2016-08-09 10:43:25', null, null, '0');
INSERT INTO `coursechapter` VALUES ('150', 'gg', '19', '142', null, null, 'c006c9934b4746f3b2eacc8594d9080a', '4219945d61ef4db4ac1e708c49340fbf', '62bf15708e8847cebe82b2c689d94683', null, '0', null, '2016-08-09 11:04:18', '2016-08-09 11:04:18', null, null, '0');
INSERT INTO `coursechapter` VALUES ('149', '2.3', '19', '146', null, null, 'f1c8f10460ae4069a05fbd0a82c4aaad', '5a174a064ea9469a8c9ac710c237631d', '2b91bae6db51458aab43e232f0b462e8', null, '0', null, '2016-08-09 10:44:16', '2016-08-09 10:44:16', null, null, '1');

-- ----------------------------
-- Table structure for `coursecomment`
-- ----------------------------
DROP TABLE IF EXISTS `coursecomment`;
CREATE TABLE `coursecomment` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `commentContent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '资源类型名称',
  `courseId` tinyint(1) DEFAULT NULL COMMENT '资源ID',
  `parentId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '被回复的评论id （可为空）',
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '评论用户',
  `tousername` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回复给某个用户',
  `likeNum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '点赞人ID',
  `checks` tinyint(1) DEFAULT '0' COMMENT '审核状态 0为通过 1为未审核状态 ',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '评论状态 0正常 1锁定',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程评论';

-- ----------------------------
-- Records of coursecomment
-- ----------------------------
INSERT INTO `coursecomment` VALUES ('1', '谢谢', '4', null, 'qinying', null, null, '0', '2016-08-05 09:50:43', '2016-08-05 09:50:43', '0');
INSERT INTO `coursecomment` VALUES ('2', '21111111111这个还可以还哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈啊哈哈哈哈啊哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈啊哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', '9', null, 'ceshi3', null, '14', '0', '2016-08-08 11:00:25', '2016-08-08 11:00:32', '0');
INSERT INTO `coursecomment` VALUES ('3', '一体一魂有一个', '4', null, 'ceshi1', null, null, '0', '2016-08-10 10:18:59', '2016-08-10 10:18:59', '0');
INSERT INTO `coursecomment` VALUES ('4', '不不不', '9', null, 'langlang', null, null, '0', '2016-08-10 11:16:31', '2016-08-10 11:16:31', '0');
INSERT INTO `coursecomment` VALUES ('5', 'uu你', '18', null, 'ceshi1', null, '16,1', '0', '2016-08-10 11:16:42', '2016-08-10 13:46:53', '0');
INSERT INTO `coursecomment` VALUES ('6', 'It is still have many bugs.....', '18', null, 'whrcfzzj', null, '16,1', '0', '2016-08-10 11:29:22', '2016-08-10 13:46:48', '0');
INSERT INTO `coursecomment` VALUES ('7', 'you should work hard.....', '18', '5', 'whrcfzzj', 'ceshi1', '16,1', '0', '2016-08-10 11:29:52', '2016-08-10 13:42:40', '0');
INSERT INTO `coursecomment` VALUES ('17', 'ZXV', '4', null, 'ceshi1', null, null, '0', '2016-08-10 14:09:15', '2016-08-10 14:09:15', '0');
INSERT INTO `coursecomment` VALUES ('18', 'GG', '4', null, 'ceshi1', null, null, '0', '2016-08-10 14:09:24', '2016-08-10 14:09:24', '0');
INSERT INTO `coursecomment` VALUES ('23', '坎坎坷坷', '14', null, '李民', null, null, '0', '2016-08-10 16:11:08', '2016-08-10 16:11:08', '0');

-- ----------------------------
-- Table structure for `coursedata`
-- ----------------------------
DROP TABLE IF EXISTS `coursedata`;
CREATE TABLE `coursedata` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `courseId` int(8) DEFAULT NULL COMMENT '专题课程id',
  `dataName` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT '资料名称',
  `dataPath` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '资料路径',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态(0:激活1:锁定)',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='专题课程资料表';

-- ----------------------------
-- Records of coursedata
-- ----------------------------
INSERT INTO `coursedata` VALUES ('1', '7', '资料一', '/uploads/heads/74850ac49fc101a6b57995df5d24858a.txt', '0', '2016-08-05 11:10:09', '2016-08-05 11:10:09');
INSERT INTO `coursedata` VALUES ('2', '8', 'sdf', '/uploads/heads/7fa03114e388a03416dd897dea93629f.jpg', '0', '2016-08-05 11:11:14', '2016-08-05 11:11:14');
INSERT INTO `coursedata` VALUES ('3', '7', 'qq使用手册', '/uploads/heads/4ca01362bfb4ca1cb3a2a45a57066a43.pdf', '0', '2016-08-05 11:17:45', '2016-08-05 11:17:45');
INSERT INTO `coursedata` VALUES ('4', '7', '数据库练习题', '/uploads/heads/79458a19b90b1b3a8f71843b6b26ee88.docx', '0', '2016-08-05 11:18:21', '2016-08-05 11:18:21');
INSERT INTO `coursedata` VALUES ('5', '7', '童书库存 7-7号.xlsx', '/uploads/heads/8d09d9fe2d6d2340d1aeff5f2ba8d451.xlsx', '0', '2016-08-05 11:19:14', '2016-08-05 11:19:14');

-- ----------------------------
-- Table structure for `coursefeedback`
-- ----------------------------
DROP TABLE IF EXISTS `coursefeedback`;
CREATE TABLE `coursefeedback` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `backType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '反馈类型（内容无关 播放不了 其他问题） 三种类型',
  `courseType` tinyint(1) DEFAULT NULL COMMENT '课程反馈类型 0专家课程 1点评课程',
  `courseId` tinyint(1) DEFAULT NULL COMMENT '课程ID',
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '反馈用户',
  `backContent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '问题描述',
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系方式',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0为未处理 1为已经处理',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程反馈内容表';

-- ----------------------------
-- Records of coursefeedback
-- ----------------------------
INSERT INTO `coursefeedback` VALUES ('1', '播放不了', '1', '83', 'yundi', 'u影也一样云隐云翳云隐云翳云隐云翳云隐云翳云隐云翳', '语言', null, '2016-08-08 14:27:55');
INSERT INTO `coursefeedback` VALUES ('2', '播放不了', '1', '83', 'yundi', 'vvvv', '远额v', null, '2016-08-08 14:30:57');
INSERT INTO `coursefeedback` VALUES ('3', '播放不了', '1', '83', 'yundi', '‘、\n’、\n‘', '2222', null, '2016-08-08 14:31:38');
INSERT INTO `coursefeedback` VALUES ('4', '内容无关', '0', '16', 'ceshi1', '我我我我', '12345232', '0', '2016-08-08 17:24:13');
INSERT INTO `coursefeedback` VALUES ('5', '播放不了', '1', '86', 'ceshi2', '顶顶顶顶顶顶顶顶顶', '顶顶顶顶', null, '2016-08-09 11:02:46');
INSERT INTO `coursefeedback` VALUES ('6', '内容无关', '1', '78', 'wangchenkai', '11111111111', '13119116241', null, '2016-08-09 11:19:13');
INSERT INTO `coursefeedback` VALUES ('7', '内容无关', '1', '78', 'wangchenkai', '11111111111111111', 'adasdasdasd', null, '2016-08-09 11:31:04');
INSERT INTO `coursefeedback` VALUES ('8', '内容无关', '0', '9', '李民', '我微课我忙完我我', '13582222', '0', '2016-08-09 13:41:20');
INSERT INTO `coursefeedback` VALUES ('9', '内容无关', '0', '18', 'ceshi1', '1', '1111111', '0', '2016-08-09 14:07:45');
INSERT INTO `coursefeedback` VALUES ('10', '内容无关', '0', '9', 'ceshi1', '111', '111111', '0', '2016-08-09 14:09:26');
INSERT INTO `coursefeedback` VALUES ('11', '内容无关', '1', '96', 'wangchenkai', 'ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd1', '121321312312312', null, '2016-08-09 17:14:33');
INSERT INTO `coursefeedback` VALUES ('12', '内容无关', '1', '96', 'wangchenkai', '123123123', '111111', null, '2016-08-09 17:14:46');

-- ----------------------------
-- Table structure for `coursetype`
-- ----------------------------
DROP TABLE IF EXISTS `coursetype`;
CREATE TABLE `coursetype` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `typeName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='专题课程分类 折扣课程  新课上线  热门课程';

-- ----------------------------
-- Records of coursetype
-- ----------------------------
INSERT INTO `coursetype` VALUES ('1', '打折课程');
INSERT INTO `coursetype` VALUES ('2', '热门课程');
INSERT INTO `coursetype` VALUES ('3', '新课上线');

-- ----------------------------
-- Table structure for `courseview`
-- ----------------------------
DROP TABLE IF EXISTS `courseview`;
CREATE TABLE `courseview` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `courseId` int(10) NOT NULL COMMENT '课程ID',
  `courseType` tinyint(1) NOT NULL COMMENT '课程类型 0 -> 专题 1 -> 点评',
  `userId` int(10) NOT NULL COMMENT '用户ID',
  `chapterId` int(10) DEFAULT NULL COMMENT '专题课程章节ID（点评课程可为空）',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='课程观看统计表';

-- ----------------------------
-- Records of courseview
-- ----------------------------
INSERT INTO `courseview` VALUES ('1', '1', '0', '1', '0');
INSERT INTO `courseview` VALUES ('2', '3', '0', '2', '0');
INSERT INTO `courseview` VALUES ('3', '1', '0', '8', '10');
INSERT INTO `courseview` VALUES ('4', '3', '0', '5', '21');
INSERT INTO `courseview` VALUES ('5', '2', '0', '5', '0');
INSERT INTO `courseview` VALUES ('6', '2', '0', '5', '18');
INSERT INTO `courseview` VALUES ('7', '1', '0', '5', '10');
INSERT INTO `courseview` VALUES ('8', '1', '0', '5', '12');
INSERT INTO `courseview` VALUES ('9', '1', '0', '5', '14');
INSERT INTO `courseview` VALUES ('10', '1', '0', '5', '15');
INSERT INTO `courseview` VALUES ('11', '1', '0', '5', '27');
INSERT INTO `courseview` VALUES ('12', '2', '0', '1', '18');
INSERT INTO `courseview` VALUES ('13', '1', '0', '5', '29');
INSERT INTO `courseview` VALUES ('14', '1', '0', '8', '12');
INSERT INTO `courseview` VALUES ('15', '1', '0', '8', '13');
INSERT INTO `courseview` VALUES ('16', '1', '0', '5', '36');
INSERT INTO `courseview` VALUES ('17', '1', '0', '8', '14');
INSERT INTO `courseview` VALUES ('18', '1', '0', '5', '13');
INSERT INTO `courseview` VALUES ('19', '1', '0', '5', '16');
INSERT INTO `courseview` VALUES ('20', '1', '0', '5', '24');
INSERT INTO `courseview` VALUES ('21', '1', '0', '5', '25');
INSERT INTO `courseview` VALUES ('22', '1', '0', '5', '26');
INSERT INTO `courseview` VALUES ('23', '4', '0', '5', '38');
INSERT INTO `courseview` VALUES ('24', '4', '0', '9', '38');
INSERT INTO `courseview` VALUES ('25', '5', '0', '8', '40');
INSERT INTO `courseview` VALUES ('26', '4', '0', '3', '38');
INSERT INTO `courseview` VALUES ('27', '5', '0', '2', '40');
INSERT INTO `courseview` VALUES ('28', '2', '0', '6', '18');
INSERT INTO `courseview` VALUES ('29', '5', '0', '2', '41');
INSERT INTO `courseview` VALUES ('30', '2', '0', '2', '18');
INSERT INTO `courseview` VALUES ('31', '1', '0', '2', '0');
INSERT INTO `courseview` VALUES ('32', '4', '0', '2', '38');
INSERT INTO `courseview` VALUES ('33', '4', '0', '8', '38');
INSERT INTO `courseview` VALUES ('34', '1', '0', '5', '30');
INSERT INTO `courseview` VALUES ('35', '1', '0', '9', '0');
INSERT INTO `courseview` VALUES ('36', '3', '0', '9', '0');
INSERT INTO `courseview` VALUES ('37', '3', '0', '8', '21');
INSERT INTO `courseview` VALUES ('38', '5', '0', '9', '40');
INSERT INTO `courseview` VALUES ('39', '1', '0', '10', '10');
INSERT INTO `courseview` VALUES ('40', '8', '0', '9', '64');
INSERT INTO `courseview` VALUES ('41', '7', '0', '9', '51');
INSERT INTO `courseview` VALUES ('42', '6', '0', '9', '45');
INSERT INTO `courseview` VALUES ('43', '8', '0', '6', '64');
INSERT INTO `courseview` VALUES ('44', '9', '0', '2', '0');
INSERT INTO `courseview` VALUES ('45', '5', '0', '10', '40');
INSERT INTO `courseview` VALUES ('46', '9', '0', '9', '0');
INSERT INTO `courseview` VALUES ('47', '9', '0', '9', '69');
INSERT INTO `courseview` VALUES ('48', '9', '0', '2', '69');
INSERT INTO `courseview` VALUES ('49', '8', '0', '2', '64');
INSERT INTO `courseview` VALUES ('50', '7', '0', '2', '51');
INSERT INTO `courseview` VALUES ('51', '9', '0', '1', '69');
INSERT INTO `courseview` VALUES ('52', '6', '0', '2', '45');
INSERT INTO `courseview` VALUES ('53', '8', '0', '1', '64');
INSERT INTO `courseview` VALUES ('54', '8', '0', '13', '63');
INSERT INTO `courseview` VALUES ('55', '9', '0', '13', '69');
INSERT INTO `courseview` VALUES ('56', '8', '0', '16', '65');
INSERT INTO `courseview` VALUES ('57', '10', '0', '2', '78');
INSERT INTO `courseview` VALUES ('58', '10', '0', '6', '78');
INSERT INTO `courseview` VALUES ('59', '10', '0', '9', '78');
INSERT INTO `courseview` VALUES ('60', '10', '0', '1', '78');
INSERT INTO `courseview` VALUES ('61', '11', '0', '3', '0');
INSERT INTO `courseview` VALUES ('62', '11', '0', '10', '0');
INSERT INTO `courseview` VALUES ('63', '10', '0', '10', '77');
INSERT INTO `courseview` VALUES ('64', '10', '0', '6', '77');
INSERT INTO `courseview` VALUES ('65', '11', '0', '9', '0');
INSERT INTO `courseview` VALUES ('66', '11', '0', '6', '0');
INSERT INTO `courseview` VALUES ('67', '2', '0', '9', '18');
INSERT INTO `courseview` VALUES ('68', '12', '0', '9', '97');
INSERT INTO `courseview` VALUES ('69', '13', '0', '2', '103');
INSERT INTO `courseview` VALUES ('70', '13', '0', '1', '103');
INSERT INTO `courseview` VALUES ('71', '14', '0', '9', '107');
INSERT INTO `courseview` VALUES ('72', '13', '0', '9', '103');
INSERT INTO `courseview` VALUES ('73', '14', '0', '1', '107');
INSERT INTO `courseview` VALUES ('74', '14', '0', '9', '126');
INSERT INTO `courseview` VALUES ('75', '13', '0', '5', '102');
INSERT INTO `courseview` VALUES ('76', '8', '0', '2', '63');
INSERT INTO `courseview` VALUES ('77', '3', '0', '1', '0');
INSERT INTO `courseview` VALUES ('78', '4', '0', '1', '38');
INSERT INTO `courseview` VALUES ('79', '5', '0', '1', '40');
INSERT INTO `courseview` VALUES ('80', '2', '0', '13', '18');
INSERT INTO `courseview` VALUES ('81', '2', '0', '13', '19');
INSERT INTO `courseview` VALUES ('82', '15', '0', '9', '128');
INSERT INTO `courseview` VALUES ('109', '14', '0', '2', '107');
INSERT INTO `courseview` VALUES ('84', '9', '0', '14', '69');
INSERT INTO `courseview` VALUES ('85', '15', '0', '6', '128');
INSERT INTO `courseview` VALUES ('86', '14', '0', '6', '107');
INSERT INTO `courseview` VALUES ('87', '8', '0', '9', '63');
INSERT INTO `courseview` VALUES ('88', '8', '0', '9', '65');
INSERT INTO `courseview` VALUES ('89', '8', '0', '9', '67');
INSERT INTO `courseview` VALUES ('110', '14', '0', '2', '123');
INSERT INTO `courseview` VALUES ('96', '14', '0', '8', '107');
INSERT INTO `courseview` VALUES ('92', '15', '0', '10', '128');
INSERT INTO `courseview` VALUES ('93', '9', '0', '10', '69');
INSERT INTO `courseview` VALUES ('94', '14', '0', '10', '107');
INSERT INTO `courseview` VALUES ('104', '10', '0', '2', '79');
INSERT INTO `courseview` VALUES ('97', '15', '0', '8', '128');
INSERT INTO `courseview` VALUES ('108', '16', '0', '16', '131');
INSERT INTO `courseview` VALUES ('103', '7', '0', '2', '52');
INSERT INTO `courseview` VALUES ('105', '13', '0', '9', '102');
INSERT INTO `courseview` VALUES ('106', '13', '0', '9', '104');
INSERT INTO `courseview` VALUES ('156', '12', '0', '20', '99');
INSERT INTO `courseview` VALUES ('111', '14', '0', '2', '124');
INSERT INTO `courseview` VALUES ('112', '14', '0', '2', '126');
INSERT INTO `courseview` VALUES ('113', '14', '0', '2', '125');
INSERT INTO `courseview` VALUES ('114', '16', '0', '10', '131');
INSERT INTO `courseview` VALUES ('115', '8', '0', '8', '63');
INSERT INTO `courseview` VALUES ('116', '8', '0', '2', '65');
INSERT INTO `courseview` VALUES ('154', '12', '0', '20', '97');
INSERT INTO `courseview` VALUES ('155', '12', '0', '20', '98');
INSERT INTO `courseview` VALUES ('157', '12', '0', '20', '100');
INSERT INTO `courseview` VALUES ('120', '5', '0', '17', '40');
INSERT INTO `courseview` VALUES ('123', '18', '0', '2', '141');
INSERT INTO `courseview` VALUES ('122', '18', '0', '2', '140');
INSERT INTO `courseview` VALUES ('124', '18', '0', '5', '141');
INSERT INTO `courseview` VALUES ('125', '17', '0', '2', '138');
INSERT INTO `courseview` VALUES ('126', '78', '1', '17', '78');
INSERT INTO `courseview` VALUES ('127', '15', '0', '9', '129');
INSERT INTO `courseview` VALUES ('128', '7', '1', '9', '7');
INSERT INTO `courseview` VALUES ('129', '14', '0', '9', '123');
INSERT INTO `courseview` VALUES ('130', '14', '0', '9', '124');
INSERT INTO `courseview` VALUES ('131', '14', '0', '9', '125');
INSERT INTO `courseview` VALUES ('132', '6', '0', '16', '45');
INSERT INTO `courseview` VALUES ('133', '17', '0', '16', '138');
INSERT INTO `courseview` VALUES ('134', '15', '0', '16', '128');
INSERT INTO `courseview` VALUES ('135', '19', '0', '9', '145');
INSERT INTO `courseview` VALUES ('136', '19', '0', '9', '143');
INSERT INTO `courseview` VALUES ('137', '19', '0', '9', '144');
INSERT INTO `courseview` VALUES ('138', '19', '0', '9', '147');
INSERT INTO `courseview` VALUES ('139', '17', '0', '9', '138');
INSERT INTO `courseview` VALUES ('140', '19', '0', '9', '150');
INSERT INTO `courseview` VALUES ('141', '19', '0', '9', '149');
INSERT INTO `courseview` VALUES ('142', '18', '0', '6', '140');
INSERT INTO `courseview` VALUES ('143', '16', '0', '6', '131');
INSERT INTO `courseview` VALUES ('144', '19', '0', '13', '143');
INSERT INTO `courseview` VALUES ('145', '19', '0', '13', '144');
INSERT INTO `courseview` VALUES ('146', '19', '0', '13', '145');
INSERT INTO `courseview` VALUES ('147', '19', '0', '13', '147');
INSERT INTO `courseview` VALUES ('148', '19', '0', '13', '150');
INSERT INTO `courseview` VALUES ('149', '19', '0', '13', '149');
INSERT INTO `courseview` VALUES ('150', '19', '0', '2', '145');
INSERT INTO `courseview` VALUES ('165', '18', '0', '16', '140');
INSERT INTO `courseview` VALUES ('152', '17', '0', '2', '137');
INSERT INTO `courseview` VALUES ('153', '19', '0', '16', '149');
INSERT INTO `courseview` VALUES ('158', '12', '0', '21', '97');
INSERT INTO `courseview` VALUES ('159', '12', '0', '21', '98');
INSERT INTO `courseview` VALUES ('160', '19', '0', '16', '145');
INSERT INTO `courseview` VALUES ('166', '18', '0', '16', '141');
INSERT INTO `courseview` VALUES ('164', '12', '0', '21', '99');
INSERT INTO `courseview` VALUES ('167', '9', '0', '16', '69');
INSERT INTO `courseview` VALUES ('168', '8', '0', '6', '63');
INSERT INTO `courseview` VALUES ('169', '9', '1', '21', '9');
INSERT INTO `courseview` VALUES ('170', '13', '0', '6', '103');
INSERT INTO `courseview` VALUES ('171', '19', '0', '6', '145');
INSERT INTO `courseview` VALUES ('172', '78', '1', '21', '78');
INSERT INTO `courseview` VALUES ('173', '18', '0', '27', '140');
INSERT INTO `courseview` VALUES ('174', '17', '0', '27', '138');
INSERT INTO `courseview` VALUES ('175', '18', '0', '1', '140');
INSERT INTO `courseview` VALUES ('176', '6', '0', '1', '45');
INSERT INTO `courseview` VALUES ('177', '15', '0', '20', '128');
INSERT INTO `courseview` VALUES ('178', '15', '0', '20', '129');
INSERT INTO `courseview` VALUES ('179', '6', '0', '20', '44');
INSERT INTO `courseview` VALUES ('180', '6', '0', '20', '45');
INSERT INTO `courseview` VALUES ('181', '14', '0', '16', '125');
INSERT INTO `courseview` VALUES ('182', '14', '0', '16', '124');
INSERT INTO `courseview` VALUES ('183', '14', '0', '16', '107');
INSERT INTO `courseview` VALUES ('184', '14', '0', '16', '126');
INSERT INTO `courseview` VALUES ('185', '9', '0', '8', '69');
INSERT INTO `courseview` VALUES ('186', '14', '0', '1', '126');
INSERT INTO `courseview` VALUES ('187', '16', '0', '1', '131');
INSERT INTO `courseview` VALUES ('188', '18', '0', '26', '140');
INSERT INTO `courseview` VALUES ('189', '13', '0', '20', '102');
INSERT INTO `courseview` VALUES ('190', '13', '0', '20', '103');
INSERT INTO `courseview` VALUES ('191', '13', '0', '20', '104');
INSERT INTO `courseview` VALUES ('192', '13', '0', '21', '103');
INSERT INTO `courseview` VALUES ('193', '20', '0', '2', '153');
INSERT INTO `courseview` VALUES ('194', '13', '0', '21', '102');
INSERT INTO `courseview` VALUES ('195', '6', '0', '2', '49');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '年度信息报告主键ID',
  `departName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '部门名称',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 1为锁定 0为激活',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='部门信息表';

-- ----------------------------
-- Records of department
-- ----------------------------

-- ----------------------------
-- Table structure for `friends`
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `fromUserId` int(8) DEFAULT NULL COMMENT '关注用户',
  `toUserId` int(8) DEFAULT NULL COMMENT '被关注用户',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='好友粉丝';

-- ----------------------------
-- Records of friends
-- ----------------------------
INSERT INTO `friends` VALUES ('1', '3', '5', '2016-08-04 17:16:13');
INSERT INTO `friends` VALUES ('2', '7', '5', '2016-08-04 17:36:35');
INSERT INTO `friends` VALUES ('3', '6', '7', '2016-08-04 19:09:30');
INSERT INTO `friends` VALUES ('4', '6', '9', '2016-08-04 19:23:59');
INSERT INTO `friends` VALUES ('5', '9', '5', '2016-08-04 19:25:28');
INSERT INTO `friends` VALUES ('23', '2', '10', '2016-08-09 14:39:09');
INSERT INTO `friends` VALUES ('7', '9', '13', '2016-08-05 10:51:25');
INSERT INTO `friends` VALUES ('8', '2', '6', '2016-08-05 13:41:26');
INSERT INTO `friends` VALUES ('9', '6', '2', '2016-08-05 13:59:02');
INSERT INTO `friends` VALUES ('10', '9', '8', '2016-08-05 14:14:09');
INSERT INTO `friends` VALUES ('11', '13', '9', '2016-08-05 16:09:15');
INSERT INTO `friends` VALUES ('12', '6', '8', '2016-08-08 09:42:44');
INSERT INTO `friends` VALUES ('20', '2', '8', '2016-08-09 14:00:29');
INSERT INTO `friends` VALUES ('14', '8', '13', '2016-08-08 13:27:24');
INSERT INTO `friends` VALUES ('15', '13', '6', '2016-08-08 15:51:46');
INSERT INTO `friends` VALUES ('16', '8', '2', '2016-08-08 16:03:42');
INSERT INTO `friends` VALUES ('17', '17', '3', null);
INSERT INTO `friends` VALUES ('18', '21', '20', '2016-08-09 13:29:11');
INSERT INTO `friends` VALUES ('19', '24', '20', '2016-08-09 13:40:01');
INSERT INTO `friends` VALUES ('21', '26', '20', '2016-08-09 14:08:39');
INSERT INTO `friends` VALUES ('25', '20', '13', '2016-08-09 16:06:28');
INSERT INTO `friends` VALUES ('26', '6', '13', '2016-08-09 16:07:03');
INSERT INTO `friends` VALUES ('28', '20', '1', '2016-08-09 16:44:48');
INSERT INTO `friends` VALUES ('29', '3', '20', '2016-08-10 14:57:12');
INSERT INTO `friends` VALUES ('30', '3', '17', '2016-08-10 15:37:05');

-- ----------------------------
-- Table structure for `hotcourse`
-- ----------------------------
DROP TABLE IF EXISTS `hotcourse`;
CREATE TABLE `hotcourse` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `courseName` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '课程名称',
  `courseId` int(8) DEFAULT NULL COMMENT '课程id',
  `sort` tinyint(1) DEFAULT NULL COMMENT '推荐课程排序',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='首页推荐专题课程';

-- ----------------------------
-- Records of hotcourse
-- ----------------------------
INSERT INTO `hotcourse` VALUES ('2', '周杰伦——世界末日', '8', '2', '2016-08-05 11:29:40', '2016-08-05 11:29:40');
INSERT INTO `hotcourse` VALUES ('3', '周杰伦——皮影戏钢琴演奏版', '7', '3', '2016-08-05 11:29:48', '2016-08-05 11:29:48');
INSERT INTO `hotcourse` VALUES ('4', '周杰伦——mine钢琴演奏版', '6', '4', '2016-08-05 11:29:56', '2016-08-05 11:29:56');
INSERT INTO `hotcourse` VALUES ('6', '郎朗-柴可夫斯基第一钢琴协奏曲第一讲', '2', '8', '2016-08-05 11:30:13', '2016-08-10 17:06:33');

-- ----------------------------
-- Table structure for `hotreviewcourse`
-- ----------------------------
DROP TABLE IF EXISTS `hotreviewcourse`;
CREATE TABLE `hotreviewcourse` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `courseName` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '点评视频名称',
  `courseId` int(8) DEFAULT NULL COMMENT '点评视频id',
  `sort` tinyint(1) DEFAULT NULL COMMENT '推荐课程排序',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='首页推荐点评视频';

-- ----------------------------
-- Records of hotreviewcourse
-- ----------------------------
INSERT INTO `hotreviewcourse` VALUES ('11', '《月光奏鸣曲》', '95', '2', '2016-08-09 14:28:45', '2016-08-09 14:28:45');
INSERT INTO `hotreviewcourse` VALUES ('12', '《悲怆》第三乐章', '94', '3', '2016-08-09 14:28:53', '2016-08-09 14:28:53');
INSERT INTO `hotreviewcourse` VALUES ('7', '动漫', '7', '6', '2016-08-05 12:59:51', '2016-08-10 11:04:21');
INSERT INTO `hotreviewcourse` VALUES ('10', '小步舞曲', '96', '1', '2016-08-09 14:28:38', '2016-08-09 14:28:38');

-- ----------------------------
-- Table structure for `hotteacher`
-- ----------------------------
DROP TABLE IF EXISTS `hotteacher`;
CREATE TABLE `hotteacher` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `teacherId` int(8) DEFAULT NULL COMMENT '推荐专家ID',
  `teacher` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐专家姓名',
  `sort` tinyint(1) DEFAULT NULL COMMENT '推荐专家显示排序',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='推荐视频表';

-- ----------------------------
-- Records of hotteacher
-- ----------------------------
INSERT INTO `hotteacher` VALUES ('8', '8', '朗朗', '5', '2016-08-08 17:39:20', '2016-08-08 17:39:20');
INSERT INTO `hotteacher` VALUES ('3', '5', '罗宁', '0', '2016-08-05 11:19:56', '2016-08-05 11:21:00');
INSERT INTO `hotteacher` VALUES ('4', '10', '李云迪', '2', '2016-08-05 11:20:10', '2016-08-05 11:20:46');
INSERT INTO `hotteacher` VALUES ('10', '20', '李民', '1', '2016-08-09 11:35:59', '2016-08-10 10:58:51');

-- ----------------------------
-- Table structure for `hotvideo`
-- ----------------------------
DROP TABLE IF EXISTS `hotvideo`;
CREATE TABLE `hotvideo` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '章节名称 章和节递归循环',
  `coursePath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '专题课程原始路径',
  `courseTime` datetime DEFAULT NULL COMMENT '课程长度',
  `courseSize` int(8) DEFAULT NULL COMMENT '课程大小',
  `status` tinyint(1) DEFAULT NULL COMMENT '章节状态 0位正常 1位锁定',
  `courseView` int(8) DEFAULT NULL,
  `coursePlayView` int(8) DEFAULT NULL COMMENT '章节课程播放数',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `videoIntro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '视频内容介绍',
  `sort` int(11) DEFAULT NULL COMMENT '排序控制',
  `cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'admin/image/contentManager/hotvideo/jiayuguan.jpg' COMMENT '视频封面',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='推荐视频表';

-- ----------------------------
-- Records of hotvideo
-- ----------------------------
INSERT INTO `hotvideo` VALUES ('2', '《夜的钢琴曲第五章》', '/admin/hotvideo/bc59bd7e0ee90e87065c460ae42f5954.mp4', null, null, '0', null, null, '2016-08-05 14:46:35', null, '《夜的钢琴曲第五章》', '5', '/admin/image/contentManager/hotvideo/11f8175d8b0fa640691b95fdda34f3a1.png');
INSERT INTO `hotvideo` VALUES ('4', '五月天《我不愿让你一个人》', '/admin/hotvideo/5e002794c8c4dd3b86edf93d24493849.mp4', null, null, '0', null, null, '2016-08-05 15:10:56', null, '五月天《我不愿让你一个人》夜色钢琴曲', '3', '/admin/image/contentManager/hotvideo/5153a77429b88d8a106e605109f4bba2.png');
INSERT INTO `hotvideo` VALUES ('5', '【有没有】向阳 韦礼安', '/admin/hotvideo/64ca9d029dd981787550b1ad894c76b3.flv', null, null, '0', null, null, '2016-08-05 15:12:18', null, '【有没有】向阳 韦礼安 中国新歌声 钢琴版 钢琴曲', '2', '/admin/image/contentManager/hotvideo/0f078adc47790bdc86bacaffbbea6526.png');
INSERT INTO `hotvideo` VALUES ('6', '钢琴教学视频', '/admin/hotvideo/69e028e6f6f74f37fa069c20088c9f39.mp4', null, null, '0', null, null, '2016-08-05 15:18:38', null, '钢琴教学视频', '0', '/admin/image/contentManager/hotvideo/826e81734461d87c431011f0a2943030.png');
INSERT INTO `hotvideo` VALUES ('7', '改为mp4', '/admin/hotvideo/8de0476a01fe8766616ae99616df391b.mp4', null, null, '0', null, null, '2016-08-05 15:52:02', null, '改为mp4', '6', '/admin/image/contentManager/hotvideo/a6c9780fb0b564d3a9e1d89a4f2fb54f.png');
INSERT INTO `hotvideo` VALUES ('8', 'xxxxx', '/admin/hotvideo/d9404ef373036bee659d0d4bf276fcec.mp4', null, null, '0', null, null, '2016-08-05 15:58:43', null, 'xingxingxingxing', '0', '/admin/image/contentManager/hotvideo/8954f9d11b6e33f18317df150eceddc5.jpg');
INSERT INTO `hotvideo` VALUES ('9', '原生mp4', '/admin/hotvideo/7d3da13aa419b32d6b0c3331ddb85829.mp4', null, null, '0', null, null, '2016-08-05 16:10:31', null, '男男女女', '4', '/admin/image/contentManager/hotvideo/a1656c8f05567072dc8594af3c52992f.png');
INSERT INTO `hotvideo` VALUES ('26', '213424', 'c3cf34eba4df4b5d96e8729dc9844c42', null, null, '0', null, null, '2016-08-10 16:49:04', null, '3242', '0', '/admin/image/contentManager/hotvideo/3a9ee6cb03803f472bb829b7ecde0b49.jpg');
INSERT INTO `hotvideo` VALUES ('27', 'mmmppp4', '6b0b28738a7c48e3a77d32493e56145e', null, null, '0', null, null, '2016-08-10 16:52:55', null, 'eefffde', '0', '/admin/image/contentManager/hotvideo/982ac9563071da73f047febc83c51261.jpg');
INSERT INTO `hotvideo` VALUES ('28', 'flvflv', '0803c0d3774646059e3d5d42f26554a9', null, null, '0', null, null, '2016-08-10 16:58:26', null, 'dfsdafsf', '0', '/admin/image/contentManager/hotvideo/a480cb86949fb9f196c0d63b37c47a4d.jpg');
INSERT INTO `hotvideo` VALUES ('29', '93adce', '93adce5387824145a7b6c1abf8c34064', null, null, '0', null, null, '2016-08-10 17:22:42', null, '93adce93adce93adce', '0', '/admin/image/contentManager/hotvideo/c7a5a9eb5375e2549afd3f29c7310a97.jpg');
INSERT INTO `hotvideo` VALUES ('30', '童话', '6525cdbe344f4696acb89151260d95cc', null, null, '0', null, null, '2016-08-10 17:25:44', null, '222', '1', '/admin/image/contentManager/hotvideo/e944c049528888e5548a632a869181e1.png');

-- ----------------------------
-- Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接名称',
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/admin/image/aboutus/friendlink/gangqin.png' COMMENT '图片地址',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `postion` int(2) DEFAULT NULL COMMENT '排序位置',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0为激活 1位禁用',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='友情链接';

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', '中央音乐学院', '/admin/image/aboutus/friendlink/f6da1e13d8464b485876d0f8449c87b1.png', 'www.baidu.com', null, '0', '2016-08-05 09:04:40');
INSERT INTO `link` VALUES ('2', '人民音乐出版社', '/admin/image/aboutus/friendlink/1660980aa73bd51dc106859cddd45c99.png', 'www.baidu.com', null, '0', '2016-08-05 09:05:08');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻标题',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻描述',
  `source` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '新闻来源',
  `author` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作者',
  `pic` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '封面图 新闻',
  `typeId` int(8) DEFAULT NULL COMMENT '新闻分类ID',
  `content` text COLLATE utf8_unicode_ci COMMENT '新闻内容',
  `clickNum` int(8) DEFAULT NULL,
  `favNum` int(8) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0' COMMENT '新闻状态 0为正常1锁定',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sort` decimal(10,0) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新闻表';

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '习近平总书记考察唐山回访', '小康路上再创辉煌  ', null, null, null, null, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">央视网消息(新闻联播):唐山抗震救灾和新唐山建设40年之际，习近平总书记来到这里，他说他这次来，主要是看一看这座英雄的城市，看一看这里英雄的人民。他要求大家弘扬抗震精神，为全面建成小康社会而奋斗。这两天，本台记者走访唐山，当地百姓说，他们记住了总书记的嘱托，小康路上，唐山还要再创辉煌。<br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">1976年7月28日，唐山地震，24万人遇难、16万人重伤，一个百年工业城市夷为平地，这是新中国成立以来我国发生的最大一次灾难。40年后的7月28日，习近平总书记来到唐山。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">唐山地震局局长郭彦徽，当时负责为总书记讲解。在地震纪念墙，总书记问了一句话，现在想起来她都觉得很温暖。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">河北唐山地震局局长 郭彦徽:总书记问，24万多罹难者的同胞都刻上了吗?有没有遗漏啊?我告诉总书记，有啊 ，我说我们每年都有补刻和勘误。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">罹难同胞、救灾英雄，不能忘记。郭彦徽说，这是总书记问题背后的深意，地震发生时有不少流动人口，他们每年都在找、都在补。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">当年地震，让杨玉芳、高志宏夫妇变成了高位截瘫，总书记来疗养院看大家，夫妇俩向总书记汇报了疗养院里大家丰富多彩的生活，还朗诵了他自己写的诗--《见了你们格外亲》。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">这几天，夫妻俩见人就说一件事--就是当时给总书记朗诵的诗，上了报纸。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">杨玉芳说，他给总书记汇报了，诗是写给解放军的，因为他的命是解放军救的，当年，地震造成人高位截瘫，当时的一些国外专家说:基于治疗技术等因素，这些人最多能活15年，但是40年来，除自然减员外，至今有人还健在，年龄最大的都97岁了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">疗养院院长杨震生是地震当天出生的，总书记见他的第一句话就说:“杨院长，你是为残疾人事业而生的!”还要求他把大家的生活照顾好。总书记走后，杨院长忙起来了，他说他要落实总书记的嘱托，把疗养院的软硬件，有条件的都弄好点。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">这两天记者走访疗养院，大家说，现在大家锻炼、学习的劲头更足了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">在祥富里社区，总书记看望了社区百姓，他要求社区整合资源，服务好百姓。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">2010年，总书记来过一次唐山，对唐山发展，提出了三个目标，要求唐山建成东北亚地区经济合作的窗口城市、环渤海地区的新型工业化基地、首都经济圈的重要支点。这次来唐山，总书记还了解了当地落实的举措和成效。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">当年的地震废墟上，现在崛起了一座现代化的新城市。大家说，能在废墟上崛起，就一定能在小康路上再创辉煌。</p><p><br/></p>', null, null, '0', '2016-08-05 10:15:59', null, '0');
INSERT INTO `news` VALUES ('2', '最年轻现役上将中将少将纪录一一刷新', '最年轻现役上将中将少将纪录一一刷新', null, null, null, null, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">今年“八一”前后的军衔晋升，可谓是将星云集。长安街知事发现，经过此次晋衔，最年轻现役上将中将少将纪录竟然同时被刷新。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\"><a href=\"http://mil.btime.com/news/20160804/n354294.shtml\" target=\"_blank\" style=\"color: rgb(70, 70, 70); cursor: pointer; outline: none; text-decoration: none;\"><span style=\"color: rgb(0, 112, 192);\">【延伸阅读】陆军举行将官晋衔仪式:8人升中将 32人升少将</span></a></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">最年轻的现役上将，是出生于1958年的乙晓光，现任军委联合参谋部副参谋长，他曾是解放军最年轻的现役中将和最年轻的正大军区级将领。此前，最年轻的现役上将为出生于1955年的海军政委苗华，他于去年八一前晋升。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 617px; background-color: rgb(250, 250, 252);\"><img src=\"http://p8.qhimg.com/dmfd/__90/t0175b375fdd74b7da5.jpg?size=617x428\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">晋升上将仪式上的乙晓光与军委主席习近平合影</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 622px; background-color: rgb(250, 250, 252);\"><img src=\"http://p4.qhimg.com/dmfd/__90/t01dceb6c16ab08804c.jpg?size=622x427\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">中间穿蓝色将官服装的为乙晓光，肩章已经变为三颗星</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">最年轻的现役中将，是出生于1964年的陆军参谋长刘振立。刘振立是军改中冉冉升起的新星，他22岁参加对越自卫反击战，带领连队在前沿阵地坚守一年多，36次击退敌人进攻，战后荣立一等战功。此后他先后出任两大王牌军65军和38军军长。值得关注的是，近一年时间里，他连续获得重用，先从38军军长转任武警部队参谋长，提任大区副，不到半年又到新成立的陆军担任参谋长，全军瞩目。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\"><a href=\"http://mil.btime.com/voice/20160804/n354232.shtml\" target=\"_blank\" style=\"color: rgb(70, 70, 70); cursor: pointer; outline: none; text-decoration: none;\"><span style=\"color: rgb(0, 112, 192);\">【延伸阅读】南海刚去了4上将 东海又来了5上将</span></a></p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 594px; background-color: rgb(250, 250, 252);\"><img src=\"http://p5.qhimg.com/dmfd/__90/t0148ef2d001237f5ce.jpg?size=594x309\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">刘振立在人代会上总是积极发言</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">在2013年之前，最年轻现役中将是上文提到的乙晓光。2013年“八一”前后，全军一次性诞生了4位“60后”中将，分别是现任东部战区领导杨晖、国防科技大学校长杨学军、空军参谋长麻振军和军委科技委主任刘国治。其中，杨晖、杨学军出生于1963年，是当时最年轻的两位现役中将。如今，现役中将中最年轻的是刘振立。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">目前，空军晋升中将的消息尚未发布。长安街知事(微信ID:Capitalnews)此前曾经介绍过，空军中有一位年轻的大区副，他就是出生于1967年的常丁求，现任南部战区副司令。常丁求于2012年晋升少将，距今已有4年。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 437px; background-color: rgb(250, 250, 252);\"><img src=\"http://p7.qhimg.com/dmfd/__90/t016cf4ae0f6dfa00a7.jpg?size=437x291\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">常丁求是2015年9.3阅兵中最年轻的参阅将领</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">今年以前，两位出生于1970年1月的少将被外界视为“最年轻”。一位是伟人之后毛新宇，另一位是臭名昭著的郭正钢。而此次陆军晋衔，出生于1970年12月的38军副军长苏荣成为少将。基于公开信息，他或许只是“最年轻”之一。但不可否认:最年轻现役少将的纪录已经被刷新。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 623px; background-color: rgb(250, 250, 252);\"><img src=\"http://p2.qhimg.com/dmfd/__90/t010a7e8cf54add5374.jpg?size=623x478\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">苏荣接受央视采访</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">此苏荣并非彼苏荣，他是一位战斗英雄。曾在北京军区装甲部队任职的他，率领中国陆军第一支专业信息化蓝军部队参加军事演习(知事注:蓝军即演习中的假想敌军)，媒体亦称其为“北京军区蓝军司令” 。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">《解放军报》对苏荣率领的“蓝军”曾有报道:担任“蓝军”任务的北京军区某装甲团，是全军信息化建设先进单位。1999年以来，经过艰苦的探索，他们在全军率先完成了主战装备的信息化改造，具备了复杂电磁环境下的作战能力。随着部队训练转变和使命任务拓展，北京军区决定让他们担任“蓝军”，用战斗力最强的“磨刀石”砥砺“红军”，提高部队信息化条件下的作战能力。“蓝军”指挥员、团长苏荣说:“目前，我们正在集中精力研究‘红军’，全团官兵将尽最大努力，构设更多的难局、危局、险局，为‘红军’的战斗力全面提升出力尽责。”</p><p><img alt=\"\" src=\"http://p9.qhimg.com/t011542dec461d43872.jpg?size=600x600\" style=\"border: 0px; vertical-align: middle; display: inline-block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; max-height: 100%;\"/></p><p>1/8</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(255, 255, 255); float: left; font-size: 14px; height: 38px; width: 600px;\">四分钟了解解放军军衔,你不知道的都在这里</p><p><span class=\"img-prev\" style=\"cursor: pointer; height: 50px; position: absolute; top: 190px; width: 35px; left: 0px; background: url(http://p7.qhimg.com/d/inn/703f1842/img/gallery_arr.png) 0px -396px no-repeat;\"></span><span class=\"img-next\" style=\"cursor: pointer; height: 50px; position: absolute; top: 190px; width: 35px; right: 0px; background: url(http://p7.qhimg.com/d/inn/703f1842/img/gallery_arr.png) -42px -396px no-repeat;\"></span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img data-imgtxt=\"四分钟了解解放军军衔,你不知道的都在这里\" data-src=\"http://p9.qhimg.com/t011542dec461d43872.jpg?size=600x600\" alt=\"四分钟了解解放军军衔,你不知道的都在这里\" src=\"http://p9.qhimg.com/dmfd/102_68_/t011542dec461d43872.jpg?size=600x600\" style=\"border: 2px solid rgb(204, 31, 18); vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; font-size: 12px; height: 64px; line-height: 20px; padding: 0px; width: 98px;\"/></p></li><li><p><img data-imgtxt=\"四分钟了解解放军军衔,你不知道的都在这里\" data-src=\"http://p3.qhimg.com/t0189e23580d0c75f9d.jpg?size=593x600\" alt=\"四分钟了解解放军军衔,你不知道的都在这里\" src=\"http://p3.qhimg.com/dmfd/102_68_/t0189e23580d0c75f9d.jpg?size=593x600\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; font-size: 12px; height: 68px; line-height: 20px; padding: 0px; width: 102px;\"/></p></li><li><p><img data-imgtxt=\"四分钟了解解放军军衔,你不知道的都在这里\" data-src=\"http://p0.qhimg.com/t01f24c081643bffbc5.jpg?size=599x600\" alt=\"四分钟了解解放军军衔,你不知道的都在这里\" src=\"http://p0.qhimg.com/dmfd/102_68_/t01f24c081643bffbc5.jpg?size=599x600\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; font-size: 12px; height: 68px; line-height: 20px; padding: 0px; width: 102px;\"/></p></li><li><p><img data-imgtxt=\"四分钟了解解放军军衔,你不知道的都在这里\" data-src=\"http://p4.qhimg.com/t0121c793ac0ff15a2f.jpg?size=597x600\" alt=\"四分钟了解解放军军衔,你不知道的都在这里\" src=\"http://p4.qhimg.com/dmfd/102_68_/t0121c793ac0ff15a2f.jpg?size=597x600\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; font-size: 12px; height: 68px; line-height: 20px; padding: 0px; width: 102px;\"/></p></li><li><p><img data-imgtxt=\"四分钟了解解放军军衔,你不知道的都在这里\" data-src=\"http://p7.qhimg.com/t01963834aa22c80e97.jpg?size=593x600\" alt=\"四分钟了解解放军军衔,你不知道的都在这里\" src=\"http://p7.qhimg.com/dmfd/102_68_/t01963834aa22c80e97.jpg?size=593x600\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; font-size: 12px; height: 68px; line-height: 20px; padding: 0px; width: 102px;\"/></p></li><li><p><img data-imgtxt=\"四分钟了解解放军军衔,你不知道的都在这里\" data-src=\"http://p4.qhimg.com/t011c1ca24f6c1e83b3.jpg?size=600x600\" alt=\"四分钟了解解放军军衔,你不知道的都在这里\" src=\"http://p4.qhimg.com/dmfd/102_68_/t011c1ca24f6c1e83b3.jpg?size=600x600\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important; font-size: 12px; height: 68px; line-height: 20px; padding: 0px; width: 102px;\"/></p></li><li><p><br/></p></li><li><p><br/></p></li></ul><p><span class=\"list-prev disabled\" style=\"cursor: pointer; bottom: 30px; height: 20px; position: absolute; width: 17px; left: 0px; background: url(http://p7.qhimg.com/d/inn/703f1842/img/gallery_arr.png) 0px -513px no-repeat;\"></span><span class=\"list-next\" style=\"cursor: pointer; bottom: 30px; height: 20px; position: absolute; width: 17px; right: 0px; background: url(http://p7.qhimg.com/d/inn/703f1842/img/gallery_arr.png) -30px -513px no-repeat;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">军衔的晋升，与将领的任职有直接关系。提拔得越快，晋衔的机会也就越大。不难发现，军改中被委以重任的将领，此次大多获得晋升。乙晓光、刘振立、苏荣都是从最基层的作战单位起步，屡立军功，一步一步成长为优秀的指挥员，堪为官兵表率。他们获得晋升，也为全军树立了良好的用人导向。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">从晋升的年龄看，乙晓光58岁当上将，刘振立52岁当中将，苏荣45岁当少将，这在以前并不算很快。1955年授衔时，最年轻上将肖华39岁，最年轻少将吴忠33岁，这是对他们战争年代功绩的褒扬。在和平年代，晋衔较快的将军亦不乏其人，比如现任中央军委副主席许其亮晋升少将时41岁、晋升上将时57岁。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\"><a href=\"http://mil.btime.com/news/20160731/n343917.shtml\" target=\"_blank\" style=\"color: rgb(70, 70, 70); cursor: pointer; outline: none; text-decoration: none;\"><span style=\"color: rgb(0, 112, 192);\">【延伸阅读】上将是怎样&quot;诞生&quot;的?十八大以来这些高级将领晋级</span></a></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">长安街知事(微信ID:Capitalnews)此前也曾介绍过，军队系统比地方党政机关更讲究逐级晋升，临近退休能当上将军的是凤毛麟角。上世纪90年代，为储备后备人才，解放军曾快速提拔过一批年轻将领，此后又恢复了逐级晋升的常态。在常态之下依然能脱颖而出的，必是同一批将领中的佼佼者。按现在的标准，他们的过人之处，正是能打仗、会打仗、打胜仗。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">今年各大军种的晋衔仪式，最受关注的无疑是陆军。因为这一军种的指挥机构军改后刚刚成立，首次独立晋衔。其中第一批晋升中将的人，自然备受关注。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">目前，陆军司令为李作成上将，政委为刘雷中将。副司令彭勃、尤海涛和纪委书记吴刚也是中将。此次晋衔，副司令周松和、参谋长刘振立、政治部主任张书国晋升中将。至此，陆军领导机关主要成员均为中将以上军衔。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">值得一提的是，2016年2月1日，新疆军区正式转隶陆军领导。此次陆军的晋衔仪式上，就有来自新疆军区的将领，该军区政委李伟晋升中将。</p><p><br/></p>', null, null, '0', '2016-08-05 10:17:17', null, '2');
INSERT INTO `news` VALUES ('3', '最高检:清理纠正判处实刑罪犯未执行刑罚案件', '最高检:清理纠正判处实刑罪犯未执行刑罚案件', null, null, null, null, '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">新华社北京8月4日电(记者陈菲)最高检4日召开电视电话会议，要求各地检察机关大力推进集中清理判处实刑罪犯未执行刑罚专项活动，对本地核查出的被判处死缓、无期徒刑的罪犯未执行刑罚案件的具体情况，要“一案一报”上报最高检挂牌督办。<br/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">今年5月，最高检会同最高法院、公安部、司法部在全国范围部署开展了集中清理判处实刑罪犯未执行刑罚专项活动，截至目前，专项活动取得阶段性成效。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">最高检要求，下一步，各地检察机关要进一步做好核查摸底工作，查漏补缺，全面核查摸准判处实刑未执行刑罚罪犯的底数，保证上报数据和台账全面准确。同时，加大清理纠正的力度，加强个案协调指导，落实挂牌督办制度。各省级院执检部门对本地判处有期徒刑10年以上刑罚的罪犯未执行案件和人民群众反映强烈以及新闻媒体广泛报道的未执行刑罚案件要挂牌督办，列出清理时间表，逐步督促清理纠正。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\"><strong>案件流程监控人员不得干预办案</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">最高人民检察院官方网站昨天发布《人民检察院案件流程监控工作规定(试行)》，对人民检察院正在受理或办理的案件(包括对控告、举报、申诉、国家赔偿申请材料的处理活动)，在办理程序上是否合法、规范、及时、完备，进行实时、动态的监督、提示、防控。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">最高检负责人表示，案件流程监控的对象是案件程序性问题，重点解决司法办案不规范、不及时、不完备等明显违反诉讼程序的行为，涉及案件受理、强制措施、涉案财物、法律文书、办案期限、权利保障、信息公开、网上办案等方面存在的问题。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">《规定》明确负有流程监控职责的人员，应当依照规定履行工作职责，遵守工作纪律和有关保密规定，不得干预正常办案。因故意或重大过失怠于或者不当履行流程监控职责，造成严重后果的，应当承担相应的司法责任。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">目前，全国四级检察机关都已全面运用统一业务应用系统开展办案活动，实现了办案信息网上录入，办案活动网上管理，办案行为网上监督，办案数据网上统计，下一步将根据《规定》要求，进一步强化系统的流程监控功能，提升监控的智能化、自动化水平，为全面开展流程工作提供有力保障。</p><p><br/></p>', null, null, '0', '2016-08-05 10:18:10', null, '3');
INSERT INTO `news` VALUES ('4', '女排延续奥运特别“传统” 已缺席四届开幕式', '女排延续奥运特别“传统” 已缺席四届开幕式', null, null, null, null, '<p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 568px; background-color: rgb(250, 250, 252);\"><img src=\"http://p6.qhimg.com/dmfd/__90/t0124b8f06c0abc8e3c.png?size=568x375\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">里约奥运会开幕在即，万众期待的开幕式将在6日早晨7点揭开神秘面纱。不过，中国女排由于第一天就有比赛，将不会出现在开幕式上。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">值得一提的是，这已经不是女排队员们第一次缺席奥运开幕，队伍已经有连续几届未参加奥运的传统，包括2012年伦敦奥运会。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">本次奥运会，中国女排跟美国、塞尔维亚、意大利、荷兰和波多黎各同在B组，单循环后小组前四入围八强进行淘汰赛。中国女排将力争小组第一，为能走得更远创造有利条件。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">中国女排将在北京时间8月6日22点35分迎战小组第一个对手荷兰队，也就是开幕式结束十几个小时之后，为了能够充分休息以及做好比赛准备，主教练郎平透露球队将不会参加开幕式。事实上，因为女排赛程的原因，中国女排已经缺席过几届奥运会开幕式了。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">郎平4日晚还发了一条微博，写道：“Good morning，everybody！（大家早上好）”图片应该是她带领女排队员去训练。照片中的郎导背着一个小绿背包，背影显得有些憔悴，网友们纷纷表示“郎导辛苦了”。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">女排在里约的训练并不顺，里约当地时间8月2日下午，中国女排在马拉卡纳体育馆进行了唯一一次适应性训练，训练途中竟然遭遇停电。</p><p><br/></p>', null, null, '0', '2016-08-05 10:18:58', null, '4');
INSERT INTO `news` VALUES ('5', '今日头条遭苹果应用商店下架 官方称正在沟通', '今日头条遭苹果应用商店下架 官方称正在沟通', null, null, null, null, '<p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 640px; background-color: rgb(250, 250, 252);\"><img src=\"http://p9.qhimg.com/dmfd/__90/t01b0dd7fa838a1b2b8.jpg?size=640x642\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">北京时间科技讯 今日头条8月5日早间发布公告称，苹果应用商店自凌晨起，用户无法搜到今日头条app，且目前尚未恢复。今日头条表示，目前正在与苹果官方沟通，但已安装今日头条的苹果用户不影响使用。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">不过，今日头条在公告中，并未说明苹果应用商店搜不到的原因。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\"><strong>以下为今日头条公告全文：</strong></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">2016年8月5日凌晨，我们发现苹果商店开始无法搜到今日头条。目前尚未恢复。已安装今日头条的苹果用户不影响使用。我们正与苹果官方积极沟通。今日头条一直致力于为用户提供快速、全面的资讯服务，深受用户的喜爱。我们对于暂时无法为苹果用户提供下载表示歉意。一旦获取更多信息，我们将第一时间告知大家。</p><p><br/></p>', null, null, '0', '2016-08-05 10:19:52', null, '0');
INSERT INTO `news` VALUES ('6', '太阳系再现第九大行星 竟是冥王星5000倍', '太阳系再现第九大行星 竟是冥王星5000倍', null, null, null, null, '<p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">【科技讯】8月4日消息，太阳系再现第九大行星，竟是冥王星5000倍震惊?曾经的太阳系是有九大行星的，但是在2006年的时候一切都变了，九大行星冥王星被踢出了太阳九大行星，被降为矮行星，就在近日，有专家称太阳系有望重现太阳系第九大行星，质量竟可大冥王星5000倍这是真的吗?</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 550px; background-color: rgb(250, 250, 252);\"><img src=\"http://imgtech.gmw.cn/attachement/jpg/site2/20160804/2654637107792753138.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">近日，天文学家找到了太阳系第九大行星存在的证据，就在太阳系边缘的柯伊伯带中，专家发现里面的天体都有奇怪的轨道，一共有6个而且已不同的速率在运转，怪异的是怎么转指针都在同一个位置，专家推测里面会有第九大行星的存在。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 550px; background-color: rgb(250, 250, 252);\"><img src=\"http://imgtech.gmw.cn/attachement/jpg/site2/20160804/8698834663033517873.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">天文学家认为，这颗昵称为“行星九”的星体质量约是冥王星的5000倍，因此，其引力足以影响位于太阳系边缘几个“矮行星”的运行，对太阳系边缘柯伊伯带中的天体运行产生根本性的“干扰”。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 550px; background-color: rgb(250, 250, 252);\"><img src=\"http://imgtech.gmw.cn/attachement/jpg/site2/20160804/418911229318940099.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">巴特金说：“我们发现了潜藏在太阳系边缘‘行星九’的引力信号。”布朗说：“我们感觉到了这个(引)力的干扰作用。”</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 550px; background-color: rgb(250, 250, 252);\"><img src=\"http://imgtech.gmw.cn/attachement/jpg/site2/20160804/2142228611998331230.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">在美国《天文学杂志》20日刊载的报告中，布朗和巴特金说，目前未能直接观测到“行星九”，但他们通过数学模型和计算机模拟找到了“行星九”的“铁证”，并认为“行星九”属于气态巨行星。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 550px; background-color: rgb(250, 250, 252);\"><img src=\"http://imgtech.gmw.cn/attachement/jpg/site2/20160804/6152492431635166761.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">这比冥王星大5000倍的星体，真的可以代替冥王星成为太阳系中的第九大行星吗?科学家还在进一步研究，专家称有85%的可能性他将会成为太阳系第九大行星。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 550px; background-color: rgb(250, 250, 252);\"><img src=\"http://imgtech.gmw.cn/attachement/jpg/site2/20160804/1670805449110801575.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p><br/></p>', null, null, '0', '2016-08-05 10:20:24', null, '6');
INSERT INTO `news` VALUES ('7', '百度腾讯退出万达电商：一年半烧光50亿', '百度腾讯退出万达电商：一年半烧光50亿', null, null, null, null, '<p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 483px; background-color: rgb(250, 250, 252);\"><img src=\"/ueditor/php/upload/image/20160805/1470363651909298.png\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p class=\"pictext\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">　　原标题：一年半烧光50亿！“腾百万”拆伙万达电商，百度腾讯退出</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">王健林、马化腾和李彦宏三个大富豪两年前豪掷50亿的电商平台拆伙了。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">8月1日，有知情人士告诉澎湃新闻，目前腾讯和百度已经从万达电商“飞凡网”的运营公司中退出，万达将自己继续做电商平台。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">2014年8月，万达宣布联合腾讯、百度共同搭建电商平台，总投资50亿元。在股权比例分配方面，万达持股70%，腾讯和百度分别持股15%。彼时，三方宣告，计划5年投资200亿元，打造全球最大O2O电商公司。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">上述知情人士称，之前投资的50亿元花了，在之后启动第二轮注资时，腾讯和百度两方均不愿意再投资，于是这两家选择退出，万达自己重新注册了一家名为“新飞凡”的公司继续运营飞凡电商。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">澎湃新闻查询资料发现，上海新飞凡电子商务有限公司类型为有限责任公司(法人独资)，法定代表人为曲德君，注册资本10亿元，成立于2015年3月25日，股东为上海万达网络金融服务有限公司。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">在投资人股权变更一栏中，在2016年7月7日变更前，投资人中除了王健林之外，还有百度和腾讯两家公司，而变更后仅有万达网络金融一家公司。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">除了投资人股权变更之外，在同一天时间，企业类型也从“其他有限责任公司”变更为“一人有限责任公司(自然人投资或控股的法人独资)”，董事备案由王思聪、曲德君、向海龙、吴宵光、丁本锡、王贵亚和Dong William CE变为曲德君、王思聪和李进岭三人。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">万达集团官方数据显示，截至7月31日，飞凡APP上线一周年，公司累计开放合作项目数超过3000个，累计注册会员数1.2亿，累计APP下载量1200万。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">飞凡旨在对平台产品进行了智慧场景、飞凡通、金融服务三大方面规划，凭借“实体+互联网”的场景互动+快捷支付的创新营销方式，通过给购物中心搭建WiFi、Beacon等信息化基础设施，利用飞凡App实现找车、找店、排队等功能，同时提供覆盖购物、会员、积分、大数据、促销优惠等服务。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">在6月3日至19日，飞凡联合3000多家联盟成员，举办了“618全国百城千店疯狂年中庆”。飞凡商业联盟618疯狂年中庆总结大会上公布的活动数据显示，活动期间共吸引线下客流5亿人次，销售额达到120亿，刷新零售行业全国大型联动活动的规模记录。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">万达电商在成立两年的时间内，唯一的项目就是“飞凡”，在公司成立之后，除了合作时高调宣布三家投资的50亿之外，飞凡和腾讯、百度两家并未有过较大的互动与合作。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">在2016年初万达年会上，王健林就曾表示，今年是万达转型关键年。从万达“期中考试成绩单”中可以发现，万达“去地产化”正在提速，文化、金融、旅游等板块发力迅猛，万达正在努力褪去钢筋和水泥味。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">2016年作为万达的“转型关键年”，文化和金融将成为商业地产之外万达新的支柱产业。据万达集团公布的数据显示，2016年上半年万达文化集团收入占万达集团总收入比重已攀至24.2%。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">以“万达城”为例，5月28日，万达首个以“万达城”命名的超大型文旅商综合项目落户江西南昌，王健林更是亲自为该项目站台，项目占地200公顷，总建筑面积80万平方米，文化旅游投资220亿元。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">“万达城”包括核心业态超大型万达茂、大型室外主题乐园、室内主题乐园、顶级舞台秀、酒店群、酒吧街等内容。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">而在文化旅游方面，在王健林的数次讲话中，均提及要超过迪士尼。王健林此前在央视《对话》栏目中曾称“要让迪士尼中国的这一块财务十年到二十年之内盈不了利”。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 30px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: justify; background-color: rgb(250, 250, 252);\">不知是否为了体现万达对上海市场的重视。7月8日，万达集团在上海为南昌万达城举办宣传活动，这也是万达集团转型文旅后万达城的首次亮相。</p><p><br/></p>', null, null, '0', '2016-08-05 10:20:56', null, '7');
INSERT INTO `news` VALUES ('8', '终于来了！安卓版Apple Music正式版上架', '终于来了！安卓版Apple Music正式版上架', null, null, null, null, '<p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">北京时间8月4日消息，Apple Music自去年11月份以测试版登陆安卓平台以来，经过多个版本的测试后，苹果终于决定去掉其“测试版”标签，上架正式版Apple Music应用。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 640px; background-color: rgb(250, 250, 252);\"><img src=\"http://article.fd.zol-img.com.cn/t_s640x2000/g5/M00/03/03/ChMkJ1ejA1WIIYw9AAHudxTzUvkAAUJ6QMkJncAAe6P077.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: center; background-color: rgb(250, 250, 252);\">　　<strong>终于来了！安卓版Apple Music正式版上架（图片来自The Verge）</strong></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">据悉，Apple Music于2015年6月份推出，苹果为了推广Apple Music，采用了前三个月免费试用的措施，安卓版Apple Music也同样拥有三个月免费试用体验期。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">据了解，安卓版Apple Music正式版提高了性能、回放功能和稳定性，同时增加了均衡器设置。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">由于安卓和iOS平台的不同，安卓版Apple Music有一些特别的功能，包括桌面插件和下载离线音乐至SD卡等，这对于小容量机型的用户来说可谓是福音。</p><p><br/></p>', null, null, '0', '2016-08-05 10:24:03', null, '8');
INSERT INTO `news` VALUES ('9', '必要商城指责网易严选有态度没尺度', '必要商城指责网易严选有态度没尺度', null, null, null, null, '<p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">8月3日晚间，必要商城方面发表了一封题为《有态度没尺度》的公开信，指向网易公司和其CEO丁磊，谴责网易通过购买关键词实现不正当竞争。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">事件起因是8月2日必要用户体验群里有用户声称搜索“必要商城”会首先得到网易严选的网站推荐，其后这种情况得到进一步证实，严选方面确实在百度搜索和搜狗搜索购买了“必要商城”关键词。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">有意思的是，必要商城创始人毕胜此前的身份是前百度总裁助理、前百度市场总监，而这一次自己创业做电商，遭遇了被竞争对手竞购自己公司名称关键词。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 630px; background-color: rgb(250, 250, 252);\"><img src=\"/ueditor/php/upload/image/20160805/1470363871106840.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">不过，网易和网易严选方面并未就此发表回应，但8月4日的情况来看，网易方面已经撤销了对“必要商城”的关键词竞购。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">而这背后，必要商城和网易自营电商品牌网易严选都是主打“供应链”电商，通过用户直达工厂的C2M模式打掉中间经销渠道，直接对接大牌的ODM或OEM供应商。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 630px; background-color: rgb(250, 250, 252);\"><img src=\"/ueditor/php/upload/image/20160805/1470363871880915.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">　　<strong>以下为必要商城给网易严选公开信内容：</strong></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">网易并丁磊先生：</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">你好，今天给贵公司以及你本人发公开信，纯粹出于气愤，望你、网易以及网易严选的童鞋们认真听听，尤其是丁磊先生，更要认真一些，看看你的下属们都干了什么勾当。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">丁磊兄，可能你忙着在猪场给猪们喂饲料，没注意到你的属下干的事儿，在这儿我就多唠叨几句给你听：这些天，在搜索引擎搜“必要商城”，没想到第一条跳出来的都是“网易严选”。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">起初，我以及我的同事们还以为百度又坏了。没想到，原来是你们给了百度大把大把的钱，明明白白买了我们“必要商城”四个字，然后只要用户搜索我们必要商城，品牌露出、流量啥的就都跑到你们那里了。丁磊兄，请允许我爆个粗口，这事儿真特么不仗义，毫无商道。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">丁先生，我知道你们网易家大业大，揪根毫毛都比很多创业公司的腰粗。可是，你知道吗，我们这些小公司创业不易，所以拿口碑和尊严当作品牌的所有力量，我们倍感珍惜。因此，腰再细都能挺起来。你呢，不能因为腰粗了，就可以拿它当屁股随便找地拉屎。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">作为网易的老大，你可能也没时间学习法律知识，那作为一个小公司的小职员，我想给你普及一点法律常识，拿去，不谢——</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">“必要商城”既不是网易的商号，网易也并不拥有与之相关的任何产品和服务，更从未注册任何相关商标。在这种情况下，网易公司抢买“必要商城”竞价排名关键词，显然是希望利用必要商城网站在业内和消费者心中的良好商誉，为自己的网站增加流量，是一种非法搭便车的行为。这种做法严重误导消费者点击非自己所期望网站。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">另一方面，也损害了我们必要商城的声誉和利益。《中华人民共和国反不正当竞争法》第二条明确规定：经营者在市场交易中，应当遵循自愿、平等、公平、诚实信用的原则，遵守公认的商业道德。不正当竞争，是指经营者违反本法规定，损害其他经营者的合法权益，扰乱社会经济秩序的行为。对照上述法律规定，显然网易公司抢买“必要商城”竞价排名的做法是一种不正当竞争行为。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">好吧，法律常识给你普及完了，我们再说说贵司一直倡导的“有态度”。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">看你们的slogan说：好的生活，真的不贵。但经此一事，我建议贵公司将它改为：好的竞争，真的不难。以便警钟长鸣。好好做生意，不要总想偷鸡摸狗的事儿。要知道，亵渎别人，往往最终亵渎的正是你自己。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">你知道，企业名称是有严格保护的，我们的名字就是我们的，这是法律上的事儿，不是闹着玩的。把别人的名字和附带的良好声誉拿来用，纵是你有钱，也是缺德的事儿啊，这种事儿是要被画个圈圈诅咒的。请问，有态度的网站的态度在哪儿呢?</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">如果贵司把我们当成对手了，我们荣幸，也非常欢迎在商场上一较高下。但请别用这种下三滥的手段，我们必要商城虽小，但真心敢于对你们的做法表达不屑。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">丁先生，改革开放之后，中国富起来了很多人，也包括你。但是不能为富不仁，请珍惜你们的钱，别把它用在偷鸡摸狗的事儿上。如果实在钱多的没处花，多给网易的员工涨涨工资也是好的。小编求你，给诸多创业公司留条生路吧，大叔。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">如果你自认为是个误会，那我这封信算是主动提醒一下，请消除误会，放过“必要商城”这四个字吧，别拿我们的名号在百度、搜狗上招摇了。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">必要商城作为一家创业公司，我们一直致力于消除行业暴利。我们的态度就是千方百计满足我们的用户，在这个利益核心上，谁动我们一下，我们都会给丫一个大嘴巴，不管你有多强大，我们都要还手。因为，你们动的不是必要，动的是信赖我们的老百姓。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">最后，还是忍不住提醒一下丁先生慎用“有态度”，因为，没有必要的态度就什么也不是。</p><p><br/></p>', null, null, '0', '2016-08-05 10:24:35', null, '9');
INSERT INTO `news` VALUES ('10', 'iPhone 7 Plus海军蓝首曝光：让人眼前一亮', 'iPhone 7 Plus海军蓝首曝光：让人眼前一亮', null, null, null, null, '<p><span style=\"color: rgb(153, 153, 153); float: right; font-size: 12px;\"></span></p><h2 style=\"margin: 0px; padding: 0px; font-size: 14px; color: rgb(153, 153, 153); float: left; font-weight: 400; overflow: hidden; width: 450px;\">iPhone 7 Plus海军蓝首曝光：让人眼前一亮</h2><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">除了玫瑰金、土豪金、银色外，今年iPhone 7据说要增加两个新配色，一个是深空灰（或者是磨砂黑），而另外一个就是海军蓝，相比深色系来说，后者更让果粉期待。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">现在，有外媒送上了一个所谓iPhone 7 Plus的原型模型视频，跟之前不同的是，<strong>这次出镜的可是全新的蓝色，其颜色看起来没有之前曝光的那么暗，整体非常活泼。</strong></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">目前还不清楚这个机模是否是就是7 Plus最终的模样，<strong>但从曝光者给出的信息看，苹果最终呈现的实物也是这样。相比其它几个配色来说，这个蓝色的新iPhone真是美爆了。PS：配色拯救iPhone 7没跑了....</strong></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">此外，这组新配色iPhone 7 Plus模型还透露出了一些信息，比如提供双摄像头、背部下部有三个连接点，可能支持无线充电等等。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">或许iPhone 7 Plus的新配色就是如此了，你买不买？</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; text-align: center; background-color: rgb(250, 250, 252);\"><br/></p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 500px; background-color: rgb(250, 250, 252);\"><img src=\"http://p2.qhimg.com/dmfd/__90/t0135aaae21542bc119.jpg?size=500x240\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 500px; background-color: rgb(250, 250, 252);\"><img src=\"http://p7.qhimg.com/dmfd/__90/t01a957262ca4fa397e.jpg?size=500x295\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 500px; background-color: rgb(250, 250, 252);\"><img src=\"http://p6.qhimg.com/dmfd/__90/t01bef446bcd6b9ffc0.jpg?size=500x252\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 499px; background-color: rgb(250, 250, 252);\"><img src=\"http://p6.qhimg.com/dmfd/__90/t01af2d0a66deb0cdf6.jpg?size=499x242\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p><br/></p>', null, null, '0', '2016-08-05 10:25:03', null, '10');
INSERT INTO `news` VALUES ('11', '中国网上旅行用户2.64亿 近30%网上买火车票', '中国网上旅行用户2.64亿 近30%网上买火车票', null, null, null, null, '<p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">8月3日消息，中国互联网络信息中心（CNNIC）今日发布第38次《中国互联网络发展状况统计报告》。报告显示，截至2016年6月，在网上预订过机票、酒店、火车票或旅游度假产品的网民规模达到2.64亿，较2015年底增长406万人，增长率为1.6%。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">在网上预订火车票、机票、酒店和旅游度假产品的网民分别占比28.9%，14.4%，15.5%和6.1%。其中，手机预订机票、酒店、火车票或旅游度假产品的网民规模达到2.32亿，较2015年底增长2236万人，增长率为10.7%。我国网民使用手机在线旅行预订的比例由33.9%提升至35.4%。</p><p class=\"content-img\" style=\"margin: 0px auto; padding: 15px 0px; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; width: 547px; background-color: rgb(250, 250, 252);\"><img src=\"http://p3.qhimg.com/dmfd/__90/t015d39fb9b9cc4a2c1.jpg?size=547x326\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; max-width: 100%; word-wrap: break-word !important;\"/></p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">2016年在线旅行预订机票、酒店、旅游度假业务的竞争已进入“红海”，企业纷纷谋求破局之道，具体表现在以下三个方面：</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">机票业务方面，航空公司在线机票预订业务将成为主导，进入“提直降代”时期。由于航空服务者资源相对集中，自身会员体系较为成熟，对于OTA依赖度较低，促使各个航空公司有能力进行直销业务。而对于OTA企业而言，其庞大的用户规模以及出行服务的全面化将促使其对于机票直销流量引入作用更大。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">酒店业务方面，地域、品牌更为分散的酒店服务商对于在线预订企业的依赖依然会持续。而对于在线预订企业而言，与酒店服务商的博弈以及在线预订企业之间竞争将更为激烈：一方面，以佣金制为主的在线预订企业对酒店服务商收入造成一定压力，部分酒店已经注重直销；另一方面，搜索、团购、电商应用对于酒店预订业务的进入以及各个在线预订企业之间的竞争将更为激烈。</p><p style=\"margin: 0px 3px 15px; padding: 12px 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, Tahoma, arial, sans-serif; line-height: 36px; white-space: normal; widows: 1; background-color: rgb(250, 250, 252);\">旅游度假业务方面，OTA企业在资本的支持下实现产业链上下游的贯通。渠道方面，与景区深度合作，从规划设计到项目投资再到景区运营，拥有足够的话语权和掌控能力。服务方面，通过投资重构，在酒店、美食、购物等方面打造品质化的旅游享受，拥有独特的服务品牌和口碑。产品方面，通过投资、品牌授权、委托经营的模式开发风景区项目和主题旅游活动。</p><p><br/></p>', null, null, '0', '2016-08-05 10:26:16', null, '5');
INSERT INTO `news` VALUES ('12', '中国音乐家协会钢琴学会在宜昌正式成立', '中国音乐家协会钢琴学会在宜昌正式成立', null, null, null, null, '<p><br/></p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 9月14日下午5时许，宜昌市均瑶大酒店白玉兰厅，华灯璀璨，群星闪烁，来自全国各省市音乐家协会推荐的理事成员、老一辈钢琴艺术家缓缓步入大厅，他们肩\r\n \r\n负着全国数万名钢琴艺术家、教育家和数千万钢琴学子所赋予的寄托，中国钢琴音乐家和音乐工作者终于有了自己的行业组织—中国音乐家协会钢琴学会。这是第三\r\n届中国宜昌长江钢琴音乐节的一大盛事，更这是中国钢琴界的一件大事，它标志着中国钢琴界有了属于自己的专家型专业学术组织。<p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385330621069.jpg\"/></p><p style=\"line-height:26px; margin:2em 0; text-indent:2em;\">\r\n	中国音乐家协会分党组成员、秘书长韩新安、副秘书长田晓耕，宜昌市委市政府副市长王应华，著名钢琴演奏家、教育家周广仁先生、柏斯音乐集团总裁吴雅玲、吴\r\n天延等大会相关领导及嘉宾出席钢琴学会成立大会。会议由中国音乐学协办公室主任王宏主持。中央和全国各地及湖北省宜昌市50多家媒体记者参加成立大会。</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385332265190.jpg\"/></p><p style=\"text-align:left;line-height:26px; margin:2em 0; text-indent:2em;\">\r\n	会议先由东道主-宜昌市政府致欢迎词，接着，中国音乐家协会二级学会负责人于萍及副秘书长田晓耕介绍并宣布了中国音协钢琴学会的发起、筹备、组织机构产生\r\n过程及第一届中国音协钢琴学会组织机构名单，理事会名单。钢琴学会理事会的构成是由九大音乐学院、全国各省自治区、直辖市音乐家协会以及钢琴学会筹备组、\r\n专家组推荐，经专家会议严格审核，从286名理事推荐人选中最终确立由马思红、马小红、王小力、王小强等174名钢琴演奏家组成的中国音协钢琴学会第一届\r\n理事会。名誉会长：周广仁、刘诗昆、鲍蕙荞；　 \r\n顾问：（以姓氏笔划为序）丁芷诺、王建中、石叔诚、李民铎、李名强、李淇、李其芳、但昭义、杨汉果、周铭孙、郭志鸿、盛一奇；　 \r\n会长：吴迎；　副会长（以姓氏笔划为序）：韦丹文、许忠、杜泰航、李民、李坚、黎颂文；　秘书长：李民（兼），副秘书长：唐哲，黄天东；　发展委员会主\r\n任：吴天延。</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385334972177.jpg\"/></p><p style=\"text-align:center;line-height:30px;  padding:10px 0 40px 0;\">\r\n	中国音乐家协会分党组成员、秘书长韩新安</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385334791139.jpg\"/></p><p style=\"text-align:center;line-height:30px; padding:10px 0 40px 0;\">\r\n	中国音乐家协会分党组成员、副秘书长田晓耕</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385335818353.jpg\"/></p><p style=\"text-align:center;line-height:30px; padding:10px 0 40px 0;\">\r\n	著名钢琴演奏家、教育家周广仁</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385336200412.jpg\"/></p><p style=\"text-align:center;line-height:30px; padding:10px 0 40px 0;\">\r\n	中央音乐学院教授吴迎</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385336776833.jpg\"/></p><p style=\"text-align:center;line-height:30px; padding:10px 0 40px 0;\">\r\n	柏斯音乐集团总裁吴天延</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385337673229.jpg\"/></p><p style=\"line-height:26px; margin:2em 0; text-indent:2em;\">\r\n	在宣布中国音协钢琴学会领导成员并颁发聘书后，韩新安、田晓耕、周广仁、吴迎、吴雅玲、吴天延共同为第一届中国音协钢琴学会揭牌。李民副会长兼秘书长宣读\r\n了中国音乐家协会20余个二级学会、全国30余所艺术院校及各地音乐学协会，钢琴学会、钢琴专业委员会发来的贺词贺信。</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385337701063.jpg\"/></p><p style=\"line-height:26px; margin:2em 0; text-indent:2em;\">\r\n	接着，柏斯音乐集团总裁吴天延、新任会长吴迎、名誉会长周广仁、中国音协秘书长韩新安分别讲话。吴天延说：“柏斯音乐集团多年来始终秉承推广音乐文化，培\r\n养音乐人才的宗旨，开展各项音乐推广活动，为钢琴教育的普及与提高做出了贡献。共同的目标，使我们与钢琴艺术界的同仁们建立了长期持久的关系，从而让中国\r\n钢琴艺术事业更加辉煌。今后柏斯音乐集团将会在自己的事业做大做强的同时，一如既往地履行自己的社会责任，为中国钢琴艺术的发展尽自己的微薄之力。”周广\r\n仁说：“钢琴学会的成立是钢琴界的一件大事，有着深远的历史意义，在这样的日子里，我想到了第一代钢琴家，我是第二代，现在我们已经有了第三代，第四代，\r\n第五代，现在我们国家钢琴事业在专业教育和业余教育方面有了大大的推广，这和钢琴制造事业有很大的关系，钢琴学会的成立是中国钢琴事业的新阶段、里程碑。\r\n今后中国钢琴事业一定会蓬勃发展。”韩新安说：“中国音协钢琴学会的成立，不仅是钢琴界的大事，也是音乐界的大事，喜事。中国音协钢琴学会的成立实质上是\r\n代替中国音协行使钢琴事业发展各项工作的职责，是中国音协工作的拓展和延伸。办好一个学会，关键是团结、奉献、合作。中国宜昌长江钢琴音乐节为钢琴学会成\r\n立提供了契机，柏斯音乐集团在财力上、组织上为学会的成立给予了很大的帮助和支持。现在十八大的召开，文化强国战略为音乐发展提供了很好的机会，钢琴是音\r\n乐艺术事业中的大项，有了国家需要，领导重视，我们钢琴学会会越办越好，希望中国音协钢琴学会成为中国音协会的典范学会。”吴迎说：“中国音协钢琴学会成\r\n立，使我们能够团结一致，传承老一辈钢琴音乐家的理想和精神，开创中国钢琴事业美好的未来，共同迎接钢琴音乐艺术中国纪元的到来。”?</p><p style=\"line-height:26px; margin:2em 0; text-indent:2em;\">\r\n	吴迎会长还宣读了表彰中国钢琴杰出贡献奖名单，朱雅芬、郭志鸿、凌远、王建中；中国钢琴终身成就奖：周广仁。</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385338842054.jpg\"/></p><p style=\"line-height:26px; margin:2em 0; text-indent:2em;\">\r\n	会议结束后，近200位钢琴艺术家们相聚在闪光灯下，拍了有史以来钢琴界人数最多的“全家福”，预示着中国钢琴艺术界将紧紧地团结在一起，齐心协力，迈向美好的明天！</p><p style=\"text-align:center;\"><img alt=\"\" src=\"/ueditor/php/upload/image/20160805/1470385338581141.jpg\"/></p><p><br/></p>', null, null, '0', '2016-08-08 11:05:12', null, '1');

-- ----------------------------
-- Table structure for `newstype`
-- ----------------------------
DROP TABLE IF EXISTS `newstype`;
CREATE TABLE `newstype` (
  `id` int(8) NOT NULL,
  `typeName` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `crated_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='新闻分类表';

-- ----------------------------
-- Records of newstype
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_01`
-- ----------------------------
DROP TABLE IF EXISTS `operation_01`;
CREATE TABLE `operation_01` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_01
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_02`
-- ----------------------------
DROP TABLE IF EXISTS `operation_02`;
CREATE TABLE `operation_02` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_02
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_03`
-- ----------------------------
DROP TABLE IF EXISTS `operation_03`;
CREATE TABLE `operation_03` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_03
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_04`
-- ----------------------------
DROP TABLE IF EXISTS `operation_04`;
CREATE TABLE `operation_04` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_04
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_05`
-- ----------------------------
DROP TABLE IF EXISTS `operation_05`;
CREATE TABLE `operation_05` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_05
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_06`
-- ----------------------------
DROP TABLE IF EXISTS `operation_06`;
CREATE TABLE `operation_06` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_06
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_07`
-- ----------------------------
DROP TABLE IF EXISTS `operation_07`;
CREATE TABLE `operation_07` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_07
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_08`
-- ----------------------------
DROP TABLE IF EXISTS `operation_08`;
CREATE TABLE `operation_08` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` text COLLATE utf8_unicode_ci COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_08
-- ----------------------------
INSERT INTO `operation_08` VALUES ('1', 'admin', '0', '登陆了后台', '106.2.164.226', '1470300567');
INSERT INTO `operation_08` VALUES ('2', 'admin', '0', '登陆了后台', '106.2.164.226', '1470300663');
INSERT INTO `operation_08` VALUES ('3', 'admin', '0', '登陆了后台', '106.2.164.226', '1470300701');
INSERT INTO `operation_08` VALUES ('4', 'admin', '0', '登陆了后台', '106.2.164.226', '1470300744');
INSERT INTO `operation_08` VALUES ('5', 'admin', '1', '添加了“95, 96, 97, 103”角色权限', '106.2.164.226', '1470300998');
INSERT INTO `operation_08` VALUES ('6', 'admin', '1', '新增了赛事管理ID为1的信息', '106.2.164.226', '1470301374');
INSERT INTO `operation_08` VALUES ('7', 'admin', '1', '添加了“107, 106, 108, 109”角色权限', '106.2.164.226', '1470301437');
INSERT INTO `operation_08` VALUES ('8', 'admin', '1', '新增了赛事管理ID为2的信息', '106.2.164.226', '1470301437');
INSERT INTO `operation_08` VALUES ('9', 'admin', '1', '添加了“88, 90, 91”角色权限', '106.2.164.226', '1470301474');
INSERT INTO `operation_08` VALUES ('10', 'admin', '1', '添加了“89”角色权限', '106.2.164.226', '1470301481');
INSERT INTO `operation_08` VALUES ('11', 'admin', '1', '添加了“92, 102, 93, 94”角色权限', '106.2.164.226', '1470301508');
INSERT INTO `operation_08` VALUES ('12', 'admin', '1', '添加了“98”角色权限', '106.2.164.226', '1470301549');
INSERT INTO `operation_08` VALUES ('13', 'admin', '1', '新增了赛事管理ID为3的信息', '106.2.164.226', '1470301556');
INSERT INTO `operation_08` VALUES ('14', 'admin', '1', '添加了“99, 100, 101”角色权限', '106.2.164.226', '1470301580');
INSERT INTO `operation_08` VALUES ('15', 'admin', '1', '新增加了用户ID为4的名师', '106.2.164.226', '1470301665');
INSERT INTO `operation_08` VALUES ('16', 'admin', '1', '新增了用户ID为6的学员', '106.2.164.226', '1470301798');
INSERT INTO `operation_08` VALUES ('17', 'admin', '1', '修改了id为1演奏视频的审核状态', '106.2.164.226', '1470302455');
INSERT INTO `operation_08` VALUES ('18', 'admin', '0', '登陆了后台', '106.2.164.226', '1470302632');
INSERT INTO `operation_08` VALUES ('19', 'admin', '1', '修改了id为2演奏视频的审核状态', '106.2.164.226', '1470302858');
INSERT INTO `operation_08` VALUES ('20', 'admin', '1', '修改了id为2演奏视频的审核状态', '106.2.164.226', '1470302959');
INSERT INTO `operation_08` VALUES ('21', 'admin', '1', '修改了id为1演奏视频的审核状态', '106.2.164.226', '1470302973');
INSERT INTO `operation_08` VALUES ('22', 'admin', '0', '登陆了后台', '106.2.164.226', '1470303667');
INSERT INTO `operation_08` VALUES ('23', 'admin', '1', '删除了用户ID为4的名师', '106.2.164.226', '1470303772');
INSERT INTO `operation_08` VALUES ('24', 'admin', '1', '新增加了用户ID为8的名师', '106.2.164.226', '1470303977');
INSERT INTO `operation_08` VALUES ('25', 'admin', '1', '修改了id为3演奏视频的审核状态', '106.2.164.226', '1470304081');
INSERT INTO `operation_08` VALUES ('26', 'admin', '1', '添加了id为1的专题课程', '106.2.164.226', '1470304237');
INSERT INTO `operation_08` VALUES ('27', 'admin', '1', '添加了id为1的课程章节', '106.2.164.226', '1470304256');
INSERT INTO `operation_08` VALUES ('28', 'admin', '1', '修改了id为5演奏视频的审核状态', '106.2.164.226', '1470304353');
INSERT INTO `operation_08` VALUES ('29', 'admin', '1', '修改了id为4演奏视频的审核状态', '106.2.164.226', '1470304357');
INSERT INTO `operation_08` VALUES ('30', 'admin', '1', '修改了id为1点评视频的审核状态', '106.2.164.226', '1470304364');
INSERT INTO `operation_08` VALUES ('31', 'admin', '1', '修改了id为2点评视频的审核状态', '106.2.164.226', '1470304441');
INSERT INTO `operation_08` VALUES ('32', 'admin', '0', '登陆了后台', '127.0.0.1', '1470306299');
INSERT INTO `operation_08` VALUES ('33', 'admin', '0', '登陆了后台', '106.2.164.226', '1470306406');
INSERT INTO `operation_08` VALUES ('34', 'admin', '1', '修改了id为2的订单状态', '127.0.0.1', '1470306412');
INSERT INTO `operation_08` VALUES ('35', 'admin', '1', '添加了“104”角色权限', '127.0.0.1', '1470306458');
INSERT INTO `operation_08` VALUES ('36', 'admin', '1', '添加了“105”角色权限', '127.0.0.1', '1470306483');
INSERT INTO `operation_08` VALUES ('37', 'admin', '1', '修改了id为5的订单状态', '127.0.0.1', '1470306527');
INSERT INTO `operation_08` VALUES ('38', 'admin', '1', '修改了id为5的订单应退金额', '106.2.164.226', '1470306743');
INSERT INTO `operation_08` VALUES ('39', 'admin', '0', '登陆了后台', '106.2.164.226', '1470306928');
INSERT INTO `operation_08` VALUES ('40', 'admin', '1', '修改了id为5的订单状态', '106.2.164.226', '1470306966');
INSERT INTO `operation_08` VALUES ('41', 'admin', '1', '删除了id为5的点评视频', '106.2.164.226', '1470306986');
INSERT INTO `operation_08` VALUES ('42', 'admin', '1', '添加了id为2的课程章节', '106.2.164.226', '1470307043');
INSERT INTO `operation_08` VALUES ('43', 'admin', '1', '删除了id为2的课程章节', '106.2.164.226', '1470307051');
INSERT INTO `operation_08` VALUES ('44', 'admin', '1', '删除了id为4的点评视频', '106.2.164.226', '1470307201');
INSERT INTO `operation_08` VALUES ('45', 'admin', '1', '删除了id为3的点评视频', '106.2.164.226', '1470307207');
INSERT INTO `operation_08` VALUES ('46', 'admin', '1', '添加了id为3的课程章节', '106.2.164.226', '1470307218');
INSERT INTO `operation_08` VALUES ('47', 'admin', '1', '回收站还原了id为4的演奏视频', '106.2.164.226', '1470307229');
INSERT INTO `operation_08` VALUES ('48', 'admin', '1', '删除了id为5的点评视频', '106.2.164.226', '1470307281');
INSERT INTO `operation_08` VALUES ('49', 'admin', '1', '删除了id为4的点评视频', '106.2.164.226', '1470307287');
INSERT INTO `operation_08` VALUES ('50', 'admin', '1', '删除了id为3的点评视频', '106.2.164.226', '1470307302');
INSERT INTO `operation_08` VALUES ('51', 'admin', '1', '添加了id为4的课程章节', '106.2.164.226', '1470307315');
INSERT INTO `operation_08` VALUES ('52', 'admin', '1', '添加了id为5的课程章节', '106.2.164.226', '1470307323');
INSERT INTO `operation_08` VALUES ('53', 'admin', '1', '回收站删除了id为4的演奏视频', '106.2.164.226', '1470307325');
INSERT INTO `operation_08` VALUES ('54', 'admin', '1', '添加了id为6的课程章节', '106.2.164.226', '1470307344');
INSERT INTO `operation_08` VALUES ('55', 'admin', '1', '删除了id为6的课程章节', '106.2.164.226', '1470307349');
INSERT INTO `operation_08` VALUES ('56', 'admin', '1', '添加了id为7的课程章节', '106.2.164.226', '1470307377');
INSERT INTO `operation_08` VALUES ('57', 'admin', '1', '添加了id为8的课程章节', '106.2.164.226', '1470307382');
INSERT INTO `operation_08` VALUES ('58', 'admin', '1', '添加了id为9的课程章节', '106.2.164.226', '1470307392');
INSERT INTO `operation_08` VALUES ('59', 'admin', '1', '删除了id为9的课程章节', '106.2.164.226', '1470307396');
INSERT INTO `operation_08` VALUES ('60', 'admin', '1', '删除了id为8的课程章节', '106.2.164.226', '1470307400');
INSERT INTO `operation_08` VALUES ('61', 'admin', '1', '删除了id为7的课程章节', '106.2.164.226', '1470307404');
INSERT INTO `operation_08` VALUES ('62', 'admin', '1', '添加了id为10的课程章节', '106.2.164.226', '1470307579');
INSERT INTO `operation_08` VALUES ('63', 'admin', '1', '添加了id为11的课程章节', '106.2.164.226', '1470307623');
INSERT INTO `operation_08` VALUES ('64', 'admin', '1', '修改了id为6演奏视频的审核状态', '106.2.164.226', '1470307672');
INSERT INTO `operation_08` VALUES ('65', 'admin', '1', '修改了id为7点评视频的审核状态', '106.2.164.226', '1470307851');
INSERT INTO `operation_08` VALUES ('66', 'admin', '1', '修改了id为7点评视频的审核状态', '106.2.164.226', '1470308225');
INSERT INTO `operation_08` VALUES ('67', 'admin', '1', '修改了id为7点评视频的审核状态', '106.2.164.226', '1470308393');
INSERT INTO `operation_08` VALUES ('68', 'admin', '1', '修改了id为7演奏视频的审核状态', '106.2.164.226', '1470308613');
INSERT INTO `operation_08` VALUES ('69', 'admin', '1', '修改了用户ID为8的名师信息', '127.0.0.1', '1470308664');
INSERT INTO `operation_08` VALUES ('70', 'admin', '1', '添加了id为12的课程章节', '106.2.164.226', '1470308681');
INSERT INTO `operation_08` VALUES ('71', 'admin', '1', '添加了id为13的课程章节', '106.2.164.226', '1470308684');
INSERT INTO `operation_08` VALUES ('72', 'admin', '1', '添加了id为14的课程章节', '106.2.164.226', '1470308687');
INSERT INTO `operation_08` VALUES ('73', 'admin', '1', '添加了id为15的课程章节', '106.2.164.226', '1470308690');
INSERT INTO `operation_08` VALUES ('74', 'admin', '1', '添加了id为16的课程章节', '106.2.164.226', '1470308692');
INSERT INTO `operation_08` VALUES ('75', 'admin', '1', '修改了用户ID为8的名师信息', '127.0.0.1', '1470308768');
INSERT INTO `operation_08` VALUES ('76', 'admin', '1', '修改了用户ID为8的名师信息', '127.0.0.1', '1470308874');
INSERT INTO `operation_08` VALUES ('77', 'admin', '1', '修改了id为7点评视频的审核状态', '106.2.164.226', '1470309256');
INSERT INTO `operation_08` VALUES ('78', 'admin', '1', '修改了id为7点评视频的审核状态', '106.2.164.226', '1470309339');
INSERT INTO `operation_08` VALUES ('79', 'admin', '1', '修改了id为7的点评视频信息', '106.2.164.226', '1470309429');
INSERT INTO `operation_08` VALUES ('80', 'admin', '1', '修改了id为2的点评视频信息', '106.2.164.226', '1470309460');
INSERT INTO `operation_08` VALUES ('81', 'admin', '1', '修改了id为1的点评视频信息', '106.2.164.226', '1470309488');
INSERT INTO `operation_08` VALUES ('82', 'admin', '1', '修改了用户ID为7的信息', '106.2.164.226', '1470309666');
INSERT INTO `operation_08` VALUES ('83', 'admin', '1', '新增了用户ID为9的学员', '106.2.164.226', '1470309818');
INSERT INTO `operation_08` VALUES ('84', 'admin', '1', '修改了id为8演奏视频的审核状态', '106.2.164.226', '1470310102');
INSERT INTO `operation_08` VALUES ('85', 'admin', '1', '修改了id为9点评视频的审核状态', '106.2.164.226', '1470310252');
INSERT INTO `operation_08` VALUES ('86', 'admin', '1', '修改了用户ID为8的名师信息', '127.0.0.1', '1470310277');
INSERT INTO `operation_08` VALUES ('87', 'admin', '1', '修改了id为9的点评视频信息', '106.2.164.226', '1470310332');
INSERT INTO `operation_08` VALUES ('88', 'admin', '1', '修改了id为3的订单状态', '127.0.0.1', '1470310589');
INSERT INTO `operation_08` VALUES ('89', 'admin', '1', '修改了id为3的订单应退金额', '127.0.0.1', '1470310599');
INSERT INTO `operation_08` VALUES ('90', 'admin', '1', '修改了id为3的订单已退金额', '127.0.0.1', '1470310609');
INSERT INTO `operation_08` VALUES ('91', 'admin', '1', '修改了id为8演奏视频的信息', '106.2.164.226', '1470310748');
INSERT INTO `operation_08` VALUES ('92', 'admin', '1', '添加了id为2的专题课程', '106.2.164.226', '1470311178');
INSERT INTO `operation_08` VALUES ('93', 'admin', '1', '添加了id为17的课程章节', '106.2.164.226', '1470311276');
INSERT INTO `operation_08` VALUES ('94', 'admin', '1', '添加了id为18的课程章节', '106.2.164.226', '1470311651');
INSERT INTO `operation_08` VALUES ('95', 'admin', '1', '添加了id为19的课程章节', '106.2.164.226', '1470311807');
INSERT INTO `operation_08` VALUES ('96', 'admin', '1', '添加了id为3的专题课程', '106.2.164.226', '1470311866');
INSERT INTO `operation_08` VALUES ('97', 'admin', '1', '添加了id为20的课程章节', '106.2.164.226', '1470311882');
INSERT INTO `operation_08` VALUES ('98', 'admin', '1', '添加了id为21的课程章节', '106.2.164.226', '1470312030');
INSERT INTO `operation_08` VALUES ('99', 'admin', '1', '添加了id为22的课程章节', '106.2.164.226', '1470312625');
INSERT INTO `operation_08` VALUES ('100', 'admin', '0', '登陆了后台', '114.248.198.203', '1470324543');
INSERT INTO `operation_08` VALUES ('101', 'admin', '1', '添加了id为23的课程章节', '114.248.198.203', '1470324800');
INSERT INTO `operation_08` VALUES ('102', 'admin', '1', '添加了id为24的课程章节', '114.248.198.203', '1470324809');
INSERT INTO `operation_08` VALUES ('103', 'admin', '1', '添加了id为25的课程章节', '114.248.198.203', '1470324867');
INSERT INTO `operation_08` VALUES ('104', 'admin', '1', '添加了id为26的课程章节', '114.248.198.203', '1470325044');
INSERT INTO `operation_08` VALUES ('105', 'admin', '1', '添加了id为27的课程章节', '114.248.198.203', '1470325078');
INSERT INTO `operation_08` VALUES ('106', 'admin', '1', '添加了id为28的课程章节', '114.248.198.203', '1470325102');
INSERT INTO `operation_08` VALUES ('107', 'admin', '1', '添加了id为29的课程章节', '114.248.198.203', '1470333596');
INSERT INTO `operation_08` VALUES ('108', 'admin', '1', '添加了id为30的课程章节', '114.248.198.203', '1470333601');
INSERT INTO `operation_08` VALUES ('109', 'admin', '1', '添加了id为31的课程章节', '114.248.198.203', '1470334098');
INSERT INTO `operation_08` VALUES ('110', 'admin', '1', '添加了id为32的课程章节', '114.248.198.203', '1470336453');
INSERT INTO `operation_08` VALUES ('111', 'admin', '1', '添加了id为33的课程章节', '114.248.198.203', '1470337379');
INSERT INTO `operation_08` VALUES ('112', 'admin', '1', '添加了id为34的课程章节', '114.248.198.203', '1470337382');
INSERT INTO `operation_08` VALUES ('113', 'admin', '1', '添加了id为35的课程章节', '114.248.198.203', '1470337579');
INSERT INTO `operation_08` VALUES ('114', 'admin', '1', '添加了id为36的课程章节', '114.248.198.203', '1470337852');
INSERT INTO `operation_08` VALUES ('115', 'admin', '0', '登陆了后台', '106.2.164.226', '1470359038');
INSERT INTO `operation_08` VALUES ('116', 'admin', '1', '新增了友情链接ID为1的学员', '106.2.164.226', '1470359080');
INSERT INTO `operation_08` VALUES ('117', 'admin', '1', '新增了友情链接ID为2的学员', '106.2.164.226', '1470359108');
INSERT INTO `operation_08` VALUES ('118', 'admin', '1', '新增了友情链接ID为3的学员', '106.2.164.226', '1470359553');
INSERT INTO `operation_08` VALUES ('119', 'admin', '1', '删除了友情链接ID为3的信息', '106.2.164.226', '1470359704');
INSERT INTO `operation_08` VALUES ('120', 'admin', '1', '添加了id为8的名师推荐', '106.2.164.226', '1470359785');
INSERT INTO `operation_08` VALUES ('121', 'admin', '1', '添加了id为5的名师推荐', '106.2.164.226', '1470359797');
INSERT INTO `operation_08` VALUES ('122', 'admin', '1', '新增了bannerID为1的信息', '106.2.164.226', '1470359867');
INSERT INTO `operation_08` VALUES ('123', 'admin', '1', '新增了bannerID为2的信息', '106.2.164.226', '1470359889');
INSERT INTO `operation_08` VALUES ('124', 'admin', '1', '新增了bannerID为3的信息', '106.2.164.226', '1470359906');
INSERT INTO `operation_08` VALUES ('125', 'admin', '1', '新增了bannerID为4的信息', '106.2.164.226', '1470359949');
INSERT INTO `operation_08` VALUES ('126', 'admin', '1', '修改了bannerID为4的状态', '106.2.164.226', '1470360160');
INSERT INTO `operation_08` VALUES ('127', 'admin', '1', '新增了bannerID为5的信息', '106.2.164.226', '1470360207');
INSERT INTO `operation_08` VALUES ('128', 'admin', '0', '登陆了后台', '106.2.164.226', '1470360247');
INSERT INTO `operation_08` VALUES ('129', 'admin', '1', '添加了id为4的专题课程', '106.2.164.226', '1470360436');
INSERT INTO `operation_08` VALUES ('130', 'admin', '1', '添加了id为37的课程章节', '106.2.164.226', '1470360454');
INSERT INTO `operation_08` VALUES ('131', 'admin', '1', '添加了id为38的课程章节', '106.2.164.226', '1470360506');
INSERT INTO `operation_08` VALUES ('132', 'admin', '0', '登陆了后台', '106.2.164.226', '1470360618');
INSERT INTO `operation_08` VALUES ('133', 'admin', '0', '登陆了后台', '127.0.0.1', '1470360716');
INSERT INTO `operation_08` VALUES ('134', 'admin', '0', '登陆了后台', '106.2.164.226', '1470360874');
INSERT INTO `operation_08` VALUES ('135', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470360897');
INSERT INTO `operation_08` VALUES ('136', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470360917');
INSERT INTO `operation_08` VALUES ('137', 'admin', '1', '添加了id为5的专题课程', '106.2.164.226', '1470361061');
INSERT INTO `operation_08` VALUES ('138', 'admin', '1', '添加了id为39的课程章节', '106.2.164.226', '1470361082');
INSERT INTO `operation_08` VALUES ('139', 'admin', '1', '添加了id为40的课程章节', '106.2.164.226', '1470361179');
INSERT INTO `operation_08` VALUES ('140', 'admin', '1', '修改了赛事管理ID为1的信息', '106.2.164.226', '1470361191');
INSERT INTO `operation_08` VALUES ('141', 'admin', '1', '修改了赛事管理ID为2的信息', '106.2.164.226', '1470361201');
INSERT INTO `operation_08` VALUES ('142', 'admin', '1', '修改了赛事管理ID为3的信息', '106.2.164.226', '1470361210');
INSERT INTO `operation_08` VALUES ('143', 'admin', '1', '添加了id为41的课程章节', '106.2.164.226', '1470361305');
INSERT INTO `operation_08` VALUES ('144', 'admin', '1', '修改了id为2的专题课程', '106.2.164.226', '1470361700');
INSERT INTO `operation_08` VALUES ('145', 'admin', '1', '修改了id为2的专题课程', '106.2.164.226', '1470361746');
INSERT INTO `operation_08` VALUES ('146', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470362174');
INSERT INTO `operation_08` VALUES ('147', 'admin', '1', '新增加了用户ID为10的名师', '106.2.164.226', '1470362372');
INSERT INTO `operation_08` VALUES ('148', 'admin', '0', '登陆了后台', '127.0.0.1', '1470362426');
INSERT INTO `operation_08` VALUES ('149', 'admin', '1', '添加了id为42的课程章节', '127.0.0.1', '1470362533');
INSERT INTO `operation_08` VALUES ('150', 'admin', '1', '修改了用户ID为10的名师信息', '127.0.0.1', '1470362862');
INSERT INTO `operation_08` VALUES ('151', 'admin', '1', '修改了用户ID为8的名师信息', '127.0.0.1', '1470362890');
INSERT INTO `operation_08` VALUES ('152', 'admin', '1', '新增了新闻资讯ID为1的信息', '106.2.164.226', '1470363359');
INSERT INTO `operation_08` VALUES ('153', 'admin', '1', '新增了新闻资讯ID为2的信息', '106.2.164.226', '1470363437');
INSERT INTO `operation_08` VALUES ('154', 'admin', '1', '新增了新闻资讯ID为3的信息', '106.2.164.226', '1470363490');
INSERT INTO `operation_08` VALUES ('155', 'admin', '1', '新增了新闻资讯ID为4的信息', '106.2.164.226', '1470363538');
INSERT INTO `operation_08` VALUES ('156', 'admin', '1', '新增加了用户ID为11的名师', '127.0.0.1', '1470363564');
INSERT INTO `operation_08` VALUES ('157', 'admin', '1', '新增了新闻资讯ID为5的信息', '106.2.164.226', '1470363592');
INSERT INTO `operation_08` VALUES ('158', 'admin', '0', '登陆了后台', '106.2.164.226', '1470363593');
INSERT INTO `operation_08` VALUES ('159', 'admin', '1', '新增了新闻资讯ID为6的信息', '106.2.164.226', '1470363624');
INSERT INTO `operation_08` VALUES ('160', 'admin', '1', '新增了新闻资讯ID为7的信息', '106.2.164.226', '1470363656');
INSERT INTO `operation_08` VALUES ('161', 'admin', '0', '登陆了后台', '127.0.0.1', '1470363686');
INSERT INTO `operation_08` VALUES ('162', 'admin', '1', '删除了用户ID为11的名师', '127.0.0.1', '1470363697');
INSERT INTO `operation_08` VALUES ('163', 'admin', '1', '新增加了用户ID为12的名师', '106.2.164.226', '1470363710');
INSERT INTO `operation_08` VALUES ('164', 'admin', '1', '删除了用户ID为12的名师', '106.2.164.226', '1470363721');
INSERT INTO `operation_08` VALUES ('165', 'admin', '1', '新增加了用户ID为13的名师', '106.2.164.226', '1470363802');
INSERT INTO `operation_08` VALUES ('166', 'admin', '1', '新增了新闻资讯ID为8的信息', '106.2.164.226', '1470363843');
INSERT INTO `operation_08` VALUES ('167', 'admin', '1', '新增了新闻资讯ID为9的信息', '106.2.164.226', '1470363875');
INSERT INTO `operation_08` VALUES ('168', 'admin', '1', '新增了新闻资讯ID为10的信息', '106.2.164.226', '1470363903');
INSERT INTO `operation_08` VALUES ('169', 'admin', '1', '新增了合作伙伴ID为1的信息', '106.2.164.226', '1470363947');
INSERT INTO `operation_08` VALUES ('170', 'admin', '1', '修改了合作伙伴ID为1的状态', '106.2.164.226', '1470363972');
INSERT INTO `operation_08` VALUES ('171', 'admin', '1', '新增了新闻资讯ID为11的信息', '106.2.164.226', '1470363976');
INSERT INTO `operation_08` VALUES ('172', 'admin', '1', '新增了社区名师推荐ID为1的信息', '106.2.164.226', '1470364029');
INSERT INTO `operation_08` VALUES ('173', 'admin', '1', '新增了社区名师推荐ID为2的信息', '106.2.164.226', '1470364033');
INSERT INTO `operation_08` VALUES ('174', 'admin', '1', '新增了社区名师推荐ID为3的信息', '106.2.164.226', '1470364040');
INSERT INTO `operation_08` VALUES ('175', 'admin', '1', '新增了社区名师推荐ID为4的信息', '106.2.164.226', '1470364046');
INSERT INTO `operation_08` VALUES ('176', 'admin', '1', '修改了社区名师推荐ID为1的信息', '106.2.164.226', '1470364066');
INSERT INTO `operation_08` VALUES ('177', 'admin', '1', '新增了合作伙伴ID为2的信息', '106.2.164.226', '1470364072');
INSERT INTO `operation_08` VALUES ('178', 'admin', '1', '添加了id为6的专题课程', '106.2.164.226', '1470364080');
INSERT INTO `operation_08` VALUES ('179', 'admin', '1', '新增了合作伙伴ID为3的信息', '106.2.164.226', '1470364089');
INSERT INTO `operation_08` VALUES ('180', 'admin', '1', '添加了id为43的课程章节', '106.2.164.226', '1470364100');
INSERT INTO `operation_08` VALUES ('181', 'admin', '1', '新增了合作伙伴ID为4的信息', '106.2.164.226', '1470364107');
INSERT INTO `operation_08` VALUES ('182', 'admin', '1', '修改了合作伙伴ID为4的状态', '106.2.164.226', '1470364136');
INSERT INTO `operation_08` VALUES ('183', 'admin', '1', '修改了合作伙伴ID为2的状态', '106.2.164.226', '1470364139');
INSERT INTO `operation_08` VALUES ('184', 'admin', '1', '修改了合作伙伴ID为3的状态', '106.2.164.226', '1470364160');
INSERT INTO `operation_08` VALUES ('185', 'admin', '1', '添加了id为44的课程章节', '106.2.164.226', '1470364188');
INSERT INTO `operation_08` VALUES ('186', 'admin', '1', '添加了id为45的课程章节', '106.2.164.226', '1470364213');
INSERT INTO `operation_08` VALUES ('187', 'admin', '1', '添加了id为46的课程章节', '106.2.164.226', '1470364257');
INSERT INTO `operation_08` VALUES ('188', 'admin', '1', '修改了用户ID为10的名师信息', '106.2.164.226', '1470364271');
INSERT INTO `operation_08` VALUES ('189', 'admin', '1', '添加了id为47的课程章节', '106.2.164.226', '1470364278');
INSERT INTO `operation_08` VALUES ('190', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470364307');
INSERT INTO `operation_08` VALUES ('191', 'admin', '1', '添加了id为48的课程章节', '106.2.164.226', '1470364314');
INSERT INTO `operation_08` VALUES ('192', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470364397');
INSERT INTO `operation_08` VALUES ('193', 'admin', '1', '添加了id为49的课程章节', '106.2.164.226', '1470364461');
INSERT INTO `operation_08` VALUES ('194', 'admin', '1', '添加了id为7的专题课程', '106.2.164.226', '1470364522');
INSERT INTO `operation_08` VALUES ('195', 'admin', '1', '添加了id为50的课程章节', '106.2.164.226', '1470364540');
INSERT INTO `operation_08` VALUES ('196', 'admin', '1', '添加了id为51的课程章节', '106.2.164.226', '1470364595');
INSERT INTO `operation_08` VALUES ('197', 'admin', '1', '添加了id为52的课程章节', '106.2.164.226', '1470364614');
INSERT INTO `operation_08` VALUES ('198', 'admin', '1', '添加了id为53的课程章节', '106.2.164.226', '1470364640');
INSERT INTO `operation_08` VALUES ('199', 'admin', '0', '登陆了后台', '106.2.164.226', '1470364643');
INSERT INTO `operation_08` VALUES ('200', 'admin', '1', '添加了id为54的课程章节', '106.2.164.226', '1470364650');
INSERT INTO `operation_08` VALUES ('201', 'admin', '1', '添加了id为55的课程章节', '106.2.164.226', '1470364669');
INSERT INTO `operation_08` VALUES ('202', 'admin', '1', '添加了id为56的课程章节', '106.2.164.226', '1470364690');
INSERT INTO `operation_08` VALUES ('203', 'admin', '1', '添加了id为57的课程章节', '106.2.164.226', '1470364729');
INSERT INTO `operation_08` VALUES ('204', 'admin', '1', '删除了id为57的课程章节', '106.2.164.226', '1470364785');
INSERT INTO `operation_08` VALUES ('205', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470364796');
INSERT INTO `operation_08` VALUES ('206', 'admin', '1', '添加了id为58的课程章节', '106.2.164.226', '1470364807');
INSERT INTO `operation_08` VALUES ('207', 'admin', '1', '添加了id为59的课程章节', '106.2.164.226', '1470364821');
INSERT INTO `operation_08` VALUES ('208', 'admin', '1', '添加了id为60的课程章节', '106.2.164.226', '1470364848');
INSERT INTO `operation_08` VALUES ('209', 'admin', '1', '添加了id为61的课程章节', '106.2.164.226', '1470364867');
INSERT INTO `operation_08` VALUES ('210', 'admin', '1', '添加了id为8的专题课程', '106.2.164.226', '1470364916');
INSERT INTO `operation_08` VALUES ('211', 'admin', '1', '添加了id为62的课程章节', '106.2.164.226', '1470364936');
INSERT INTO `operation_08` VALUES ('212', 'admin', '1', '添加了id为63的课程章节', '106.2.164.226', '1470364984');
INSERT INTO `operation_08` VALUES ('213', 'admin', '1', '添加了id为64的课程章节', '106.2.164.226', '1470365011');
INSERT INTO `operation_08` VALUES ('214', 'admin', '1', '添加了id为65的课程章节', '106.2.164.226', '1470365051');
INSERT INTO `operation_08` VALUES ('215', 'admin', '1', '添加了id为66的课程章节', '106.2.164.226', '1470365073');
INSERT INTO `operation_08` VALUES ('216', 'admin', '1', '添加了id为67的课程章节', '106.2.164.226', '1470365145');
INSERT INTO `operation_08` VALUES ('217', 'admin', '1', '添加了id为9的专题课程', '106.2.164.226', '1470365191');
INSERT INTO `operation_08` VALUES ('218', 'admin', '1', '添加了id为68的课程章节', '106.2.164.226', '1470365223');
INSERT INTO `operation_08` VALUES ('219', 'admin', '1', '修改了id为9演奏视频的审核状态', '106.2.164.226', '1470365269');
INSERT INTO `operation_08` VALUES ('220', 'admin', '1', '添加了id为69的课程章节', '106.2.164.226', '1470365273');
INSERT INTO `operation_08` VALUES ('221', 'admin', '0', '登陆了后台', '106.2.164.226', '1470365301');
INSERT INTO `operation_08` VALUES ('222', 'admin', '1', '修改了id为9演奏视频的审核状态', '106.2.164.226', '1470365372');
INSERT INTO `operation_08` VALUES ('223', 'admin', '1', '修改了id为8点评视频的审核状态', '106.2.164.226', '1470366044');
INSERT INTO `operation_08` VALUES ('224', 'admin', '1', '修改了id为8的点评视频信息', '106.2.164.226', '1470366094');
INSERT INTO `operation_08` VALUES ('225', 'admin', '0', '登陆了后台', '182.18.34.74', '1470366493');
INSERT INTO `operation_08` VALUES ('226', 'admin', '0', '登陆了后台', '106.2.164.226', '1470366501');
INSERT INTO `operation_08` VALUES ('227', 'admin', '1', '添加了id为1的课程资料', '106.2.164.226', '1470366609');
INSERT INTO `operation_08` VALUES ('228', 'admin', '1', '添加了通知ID为35的信息', '106.2.164.226', '1470366650');
INSERT INTO `operation_08` VALUES ('229', 'admin', '1', '添加了id为2的课程资料', '106.2.164.226', '1470366674');
INSERT INTO `operation_08` VALUES ('230', 'admin', '1', '添加了id为70的课程章节', '182.18.34.74', '1470366774');
INSERT INTO `operation_08` VALUES ('231', 'admin', '1', '添加了id为71的课程章节', '182.18.34.74', '1470366781');
INSERT INTO `operation_08` VALUES ('232', 'admin', '1', '添加了id为72的课程章节', '182.18.34.74', '1470366788');
INSERT INTO `operation_08` VALUES ('233', 'admin', '1', '添加了id为73的课程章节', '182.18.34.74', '1470366792');
INSERT INTO `operation_08` VALUES ('234', 'admin', '1', '添加了id为74的课程章节', '182.18.34.74', '1470366798');
INSERT INTO `operation_08` VALUES ('235', 'admin', '1', '添加了id为75的课程章节', '182.18.34.74', '1470366801');
INSERT INTO `operation_08` VALUES ('236', 'admin', '1', '修改了合作伙伴ID为4的信息', '106.2.164.226', '1470366841');
INSERT INTO `operation_08` VALUES ('237', 'admin', '1', '修改了合作伙伴ID为3的信息', '106.2.164.226', '1470366851');
INSERT INTO `operation_08` VALUES ('238', 'admin', '1', '修改了合作伙伴ID为2的信息', '106.2.164.226', '1470366862');
INSERT INTO `operation_08` VALUES ('239', 'admin', '1', '修改了合作伙伴ID为1的信息', '106.2.164.226', '1470366874');
INSERT INTO `operation_08` VALUES ('240', 'admin', '1', '添加了通知ID为36的信息', '106.2.164.226', '1470366961');
INSERT INTO `operation_08` VALUES ('241', 'admin', '1', '添加了通知模板ID为1的信息', '106.2.164.226', '1470367050');
INSERT INTO `operation_08` VALUES ('242', 'admin', '1', '添加了id为3的课程资料', '106.2.164.226', '1470367065');
INSERT INTO `operation_08` VALUES ('243', 'admin', '1', '添加了通知模板ID为2的信息', '106.2.164.226', '1470367069');
INSERT INTO `operation_08` VALUES ('244', 'admin', '1', '添加了通知模板ID为3的信息', '106.2.164.226', '1470367082');
INSERT INTO `operation_08` VALUES ('245', 'admin', '1', '添加了通知模板ID为4的信息', '106.2.164.226', '1470367096');
INSERT INTO `operation_08` VALUES ('246', 'admin', '1', '添加了id为4的课程资料', '106.2.164.226', '1470367101');
INSERT INTO `operation_08` VALUES ('247', 'admin', '1', '添加了通知模板ID为5的信息', '106.2.164.226', '1470367110');
INSERT INTO `operation_08` VALUES ('248', 'admin', '1', '添加了通知模板ID为6的信息', '106.2.164.226', '1470367120');
INSERT INTO `operation_08` VALUES ('249', 'admin', '1', '添加了通知模板ID为7的信息', '106.2.164.226', '1470367129');
INSERT INTO `operation_08` VALUES ('250', 'admin', '1', '修改了通知模板ID为7的信息', '106.2.164.226', '1470367135');
INSERT INTO `operation_08` VALUES ('251', 'admin', '1', '添加了通知模板ID为8的信息', '106.2.164.226', '1470367150');
INSERT INTO `operation_08` VALUES ('252', 'admin', '1', '添加了id为5的课程资料', '106.2.164.226', '1470367154');
INSERT INTO `operation_08` VALUES ('253', 'admin', '1', '添加了通知模板ID为9的信息', '106.2.164.226', '1470367164');
INSERT INTO `operation_08` VALUES ('254', 'admin', '1', '添加了通知模板ID为10的信息', '106.2.164.226', '1470367177');
INSERT INTO `operation_08` VALUES ('255', 'admin', '1', '修改了通知模板ID为9的信息', '106.2.164.226', '1470367187');
INSERT INTO `operation_08` VALUES ('256', 'admin', '1', '添加了id为5的名师推荐', '106.2.164.226', '1470367196');
INSERT INTO `operation_08` VALUES ('257', 'admin', '1', '添加了通知模板ID为11的信息', '106.2.164.226', '1470367201');
INSERT INTO `operation_08` VALUES ('258', 'admin', '1', '添加了id为10的名师推荐', '106.2.164.226', '1470367210');
INSERT INTO `operation_08` VALUES ('259', 'admin', '1', '添加了id为13的名师推荐', '106.2.164.226', '1470367228');
INSERT INTO `operation_08` VALUES ('260', 'admin', '1', '修改了id为4的名师推荐', '106.2.164.226', '1470367246');
INSERT INTO `operation_08` VALUES ('261', 'admin', '1', '修改了id为1的名师推荐', '106.2.164.226', '1470367253');
INSERT INTO `operation_08` VALUES ('262', 'admin', '1', '修改了id为3的名师推荐', '106.2.164.226', '1470367260');
INSERT INTO `operation_08` VALUES ('263', 'admin', '1', '修改了用户ID为2的信息', '106.2.164.226', '1470367315');
INSERT INTO `operation_08` VALUES ('264', 'admin', '1', '添加了通知模板ID为12的信息', '106.2.164.226', '1470367326');
INSERT INTO `operation_08` VALUES ('265', 'admin', '1', '修改了id为2的专题课程', '106.2.164.226', '1470367326');
INSERT INTO `operation_08` VALUES ('266', 'admin', '1', '修改了id为9的专题课程', '106.2.164.226', '1470367348');
INSERT INTO `operation_08` VALUES ('267', 'admin', '1', '添加了通知ID为37的信息', '106.2.164.226', '1470367360');
INSERT INTO `operation_08` VALUES ('268', 'admin', '1', '修改了合作伙伴ID为2的状态', '106.2.164.226', '1470367428');
INSERT INTO `operation_08` VALUES ('269', 'admin', '1', '修改了合作伙伴ID为4的状态', '106.2.164.226', '1470367433');
INSERT INTO `operation_08` VALUES ('270', 'admin', '1', '更改了用户ID为2的状态', '106.2.164.226', '1470367458');
INSERT INTO `operation_08` VALUES ('271', 'admin', '1', '更改了用户ID为2的状态', '106.2.164.226', '1470367462');
INSERT INTO `operation_08` VALUES ('272', 'admin', '1', '修改了合作伙伴ID为4的状态', '106.2.164.226', '1470367536');
INSERT INTO `operation_08` VALUES ('273', 'admin', '1', '添加了通知ID为38的信息', '106.2.164.226', '1470367539');
INSERT INTO `operation_08` VALUES ('274', 'admin', '1', '修改了合作伙伴ID为2的状态', '106.2.164.226', '1470367540');
INSERT INTO `operation_08` VALUES ('275', 'admin', '1', '修改了id为8的专题课程', '106.2.164.226', '1470367631');
INSERT INTO `operation_08` VALUES ('276', 'admin', '1', '修改了id为7的专题课程', '106.2.164.226', '1470367744');
INSERT INTO `operation_08` VALUES ('277', 'admin', '1', '修改了id为6的专题课程', '106.2.164.226', '1470367758');
INSERT INTO `operation_08` VALUES ('278', 'admin', '1', '添加了id为1的专题课程推荐', '106.2.164.226', '1470367772');
INSERT INTO `operation_08` VALUES ('279', 'admin', '1', '添加了id为2的专题课程推荐', '106.2.164.226', '1470367780');
INSERT INTO `operation_08` VALUES ('280', 'admin', '1', '添加了id为3的专题课程推荐', '106.2.164.226', '1470367788');
INSERT INTO `operation_08` VALUES ('281', 'admin', '1', '添加了id为4的专题课程推荐', '106.2.164.226', '1470367796');
INSERT INTO `operation_08` VALUES ('282', 'admin', '1', '添加了id为5的专题课程推荐', '106.2.164.226', '1470367805');
INSERT INTO `operation_08` VALUES ('283', 'admin', '1', '添加了id为6的专题课程推荐', '106.2.164.226', '1470367813');
INSERT INTO `operation_08` VALUES ('284', 'admin', '1', '添加了id为7的专题课程推荐', '106.2.164.226', '1470367822');
INSERT INTO `operation_08` VALUES ('285', 'admin', '1', '添加了id为8的专题课程推荐', '106.2.164.226', '1470367830');
INSERT INTO `operation_08` VALUES ('286', 'admin', '1', '修改了id为10演奏视频的审核状态', '106.2.164.226', '1470367875');
INSERT INTO `operation_08` VALUES ('287', 'admin', '1', '修改了id为3的专题课程', '106.2.164.226', '1470367892');
INSERT INTO `operation_08` VALUES ('288', 'admin', '1', '修改了id为10演奏视频的审核状态', '106.2.164.226', '1470367905');
INSERT INTO `operation_08` VALUES ('289', 'admin', '1', '修改了id为9的点评视频信息', '106.2.164.226', '1470367953');
INSERT INTO `operation_08` VALUES ('290', 'admin', '1', '修改了id为10的点评视频信息', '106.2.164.226', '1470367965');
INSERT INTO `operation_08` VALUES ('291', 'admin', '1', '修改了id为6的点评视频信息', '106.2.164.226', '1470367976');
INSERT INTO `operation_08` VALUES ('292', 'admin', '1', '修改了id为70点评视频的审核状态', '106.2.164.226', '1470368132');
INSERT INTO `operation_08` VALUES ('293', 'admin', '1', '修改了id为70点评视频的审核状态', '106.2.164.226', '1470368234');
INSERT INTO `operation_08` VALUES ('294', 'admin', '1', '修改了id为70的点评视频信息', '106.2.164.226', '1470368269');
INSERT INTO `operation_08` VALUES ('295', 'admin', '1', '添加了id为1的点评视频推荐', '106.2.164.226', '1470368408');
INSERT INTO `operation_08` VALUES ('296', 'admin', '1', '修改了id为70的点评视频信息', '106.2.164.226', '1470368413');
INSERT INTO `operation_08` VALUES ('297', 'admin', '1', '添加了id为2的点评视频推荐', '106.2.164.226', '1470368419');
INSERT INTO `operation_08` VALUES ('298', 'admin', '1', '添加了id为3的点评视频推荐', '106.2.164.226', '1470368472');
INSERT INTO `operation_08` VALUES ('299', 'admin', '1', '添加了id为4的点评视频推荐', '106.2.164.226', '1470368483');
INSERT INTO `operation_08` VALUES ('300', 'admin', '1', '删除了id为2的点评视频推荐', '106.2.164.226', '1470368506');
INSERT INTO `operation_08` VALUES ('301', 'admin', '1', '修改了id为1的点评视频推荐', '106.2.164.226', '1470368731');
INSERT INTO `operation_08` VALUES ('302', 'admin', '1', '新增了用户ID为14的学员', '106.2.164.226', '1470368979');
INSERT INTO `operation_08` VALUES ('303', 'admin', '1', '修改了bannerID为2的状态', '106.2.164.226', '1470369349');
INSERT INTO `operation_08` VALUES ('304', 'admin', '1', '修改了bannerID为3的状态', '106.2.164.226', '1470369373');
INSERT INTO `operation_08` VALUES ('305', 'admin', '1', '新增了用户ID为15的学员', '106.2.164.226', '1470369415');
INSERT INTO `operation_08` VALUES ('306', 'admin', '1', '删除了用户ID为15的学员', '106.2.164.226', '1470369443');
INSERT INTO `operation_08` VALUES ('307', 'admin', '1', '修改了id为9的专题课程', '106.2.164.226', '1470369560');
INSERT INTO `operation_08` VALUES ('308', 'admin', '1', '修改了id为8的专题课程', '106.2.164.226', '1470369674');
INSERT INTO `operation_08` VALUES ('309', 'admin', '1', '修改了id为7的专题课程', '106.2.164.226', '1470369687');
INSERT INTO `operation_08` VALUES ('310', 'admin', '1', '修改了id为6的专题课程', '106.2.164.226', '1470369701');
INSERT INTO `operation_08` VALUES ('311', 'admin', '1', '修改了id为5的专题课程', '106.2.164.226', '1470369726');
INSERT INTO `operation_08` VALUES ('312', 'admin', '1', '修改了id为3的专题课程', '106.2.164.226', '1470369739');
INSERT INTO `operation_08` VALUES ('313', 'admin', '1', '修改了id为2的专题课程', '106.2.164.226', '1470369750');
INSERT INTO `operation_08` VALUES ('314', 'admin', '1', '修改了id为1的专题课程', '106.2.164.226', '1470372525');
INSERT INTO `operation_08` VALUES ('315', 'admin', '1', '修改了id为2的专题课程', '106.2.164.226', '1470372537');
INSERT INTO `operation_08` VALUES ('316', 'admin', '1', '修改了id为4的专题课程', '106.2.164.226', '1470372608');
INSERT INTO `operation_08` VALUES ('317', 'admin', '1', '修改了id为70的点评视频信息', '106.2.164.226', '1470372871');
INSERT INTO `operation_08` VALUES ('318', 'admin', '1', '修改了id为10的点评视频信息', '106.2.164.226', '1470372886');
INSERT INTO `operation_08` VALUES ('319', 'admin', '1', '修改了id为9的点评视频信息', '106.2.164.226', '1470372898');
INSERT INTO `operation_08` VALUES ('320', 'admin', '1', '修改了id为8的点评视频信息', '106.2.164.226', '1470372908');
INSERT INTO `operation_08` VALUES ('321', 'admin', '1', '修改了id为7的点评视频信息', '106.2.164.226', '1470372920');
INSERT INTO `operation_08` VALUES ('322', 'admin', '1', '修改了id为6的点评视频信息', '106.2.164.226', '1470372929');
INSERT INTO `operation_08` VALUES ('323', 'admin', '1', '修改了id为2的点评视频信息', '106.2.164.226', '1470372939');
INSERT INTO `operation_08` VALUES ('324', 'admin', '1', '修改了id为1的点评视频信息', '106.2.164.226', '1470372951');
INSERT INTO `operation_08` VALUES ('325', 'admin', '1', '删除了id为1的点评视频推荐', '106.2.164.226', '1470373063');
INSERT INTO `operation_08` VALUES ('326', 'admin', '1', '添加了id为5的点评视频推荐', '106.2.164.226', '1470373075');
INSERT INTO `operation_08` VALUES ('327', 'admin', '1', '删除了id为4的点评视频推荐', '106.2.164.226', '1470373090');
INSERT INTO `operation_08` VALUES ('328', 'admin', '1', '添加了id为6的点评视频推荐', '106.2.164.226', '1470373107');
INSERT INTO `operation_08` VALUES ('329', 'admin', '1', '添加了id为7的点评视频推荐', '106.2.164.226', '1470373191');
INSERT INTO `operation_08` VALUES ('330', 'admin', '1', '添加了id为8的点评视频推荐', '106.2.164.226', '1470373215');
INSERT INTO `operation_08` VALUES ('331', 'admin', '1', '修改了id为10点评视频的审核状态', '106.2.164.226', '1470373400');
INSERT INTO `operation_08` VALUES ('332', 'admin', '1', '修改了id为6点评视频的审核状态', '106.2.164.226', '1470373518');
INSERT INTO `operation_08` VALUES ('333', 'admin', '1', '修改了用户ID为13的名师信息', '106.2.164.226', '1470373581');
INSERT INTO `operation_08` VALUES ('334', 'admin', '1', '修改了用户ID为5的名师信息', '106.2.164.226', '1470373620');
INSERT INTO `operation_08` VALUES ('335', 'admin', '1', '修改了用户ID为10的名师信息', '106.2.164.226', '1470373650');
INSERT INTO `operation_08` VALUES ('336', 'admin', '1', '修改了赛事管理ID为1的信息', '106.2.164.226', '1470373797');
INSERT INTO `operation_08` VALUES ('337', 'admin', '1', '修改了赛事管理ID为2的信息', '106.2.164.226', '1470373878');
INSERT INTO `operation_08` VALUES ('338', 'admin', '1', '修改了赛事管理ID为2的信息', '106.2.164.226', '1470373891');
INSERT INTO `operation_08` VALUES ('339', 'admin', '0', '登陆了后台', '106.2.164.226', '1470373929');
INSERT INTO `operation_08` VALUES ('340', 'admin', '1', '修改了赛事管理ID为1的信息', '106.2.164.226', '1470374052');
INSERT INTO `operation_08` VALUES ('341', 'admin', '1', '修改了赛事管理ID为2的信息', '106.2.164.226', '1470374061');
INSERT INTO `operation_08` VALUES ('342', 'admin', '1', '修改了赛事管理ID为3的信息', '106.2.164.226', '1470374070');
INSERT INTO `operation_08` VALUES ('343', 'admin', '1', '修改了赛事管理ID为3的信息', '106.2.164.226', '1470374130');
INSERT INTO `operation_08` VALUES ('344', 'admin', '0', '登陆了后台', '106.2.164.226', '1470375562');
INSERT INTO `operation_08` VALUES ('345', 'admin', '1', '修改了bannerID为4的状态', '106.2.164.226', '1470376101');
INSERT INTO `operation_08` VALUES ('346', 'admin', '1', '修改了bannerID为4的状态', '106.2.164.226', '1470376114');
INSERT INTO `operation_08` VALUES ('347', 'admin', '1', '修改了bannerID为2的状态', '106.2.164.226', '1470376117');
INSERT INTO `operation_08` VALUES ('348', 'admin', '1', '新增了热门视频ID为1的信息', '106.2.164.226', '1470376763');
INSERT INTO `operation_08` VALUES ('349', 'admin', '1', '修改了用户ID为8的名师信息', '106.2.164.226', '1470377727');
INSERT INTO `operation_08` VALUES ('350', 'admin', '0', '登陆了后台', '106.2.164.226', '1470377741');
INSERT INTO `operation_08` VALUES ('351', 'admin', '1', '修改了id为9的专题课程', '106.2.164.226', '1470378067');
INSERT INTO `operation_08` VALUES ('352', 'admin', '1', '删除了热门视频ID为1的信息', '106.2.164.226', '1470379381');
INSERT INTO `operation_08` VALUES ('353', 'admin', '1', '添加了id为10的专题课程', '106.2.164.226', '1470379443');
INSERT INTO `operation_08` VALUES ('354', 'admin', '1', '添加了id为76的课程章节', '106.2.164.226', '1470379462');
INSERT INTO `operation_08` VALUES ('355', 'admin', '1', '新增了热门视频ID为2的信息', '106.2.164.226', '1470379595');
INSERT INTO `operation_08` VALUES ('356', 'admin', '1', '添加了id为77的课程章节', '106.2.164.226', '1470379660');
INSERT INTO `operation_08` VALUES ('357', 'admin', '0', '登陆了后台', '106.2.164.226', '1470379706');
INSERT INTO `operation_08` VALUES ('358', 'admin', '1', '新增了热门视频ID为3的信息', '106.2.164.226', '1470380294');
INSERT INTO `operation_08` VALUES ('359', 'admin', '1', '添加了id为78的课程章节', '106.2.164.226', '1470380442');
INSERT INTO `operation_08` VALUES ('360', 'admin', '1', '删除了热门视频ID为3的信息', '106.2.164.226', '1470380752');
INSERT INTO `operation_08` VALUES ('361', 'admin', '1', '新增了热门视频ID为4的信息', '106.2.164.226', '1470381056');
INSERT INTO `operation_08` VALUES ('362', 'admin', '1', '新增了热门视频ID为5的信息', '106.2.164.226', '1470381138');
INSERT INTO `operation_08` VALUES ('363', 'admin', '1', '新增了热门视频ID为6的信息', '106.2.164.226', '1470381518');
INSERT INTO `operation_08` VALUES ('364', 'admin', '1', '新增了赛事管理ID为4的信息', '106.2.164.226', '1470381741');
INSERT INTO `operation_08` VALUES ('365', 'admin', '1', '修改了赛事管理ID为4的信息', '106.2.164.226', '1470381787');
INSERT INTO `operation_08` VALUES ('366', 'admin', '1', '修改了赛事管理ID为4的信息', '106.2.164.226', '1470382078');
INSERT INTO `operation_08` VALUES ('367', 'admin', '1', '修改了赛事管理ID为4的信息', '106.2.164.226', '1470382147');
INSERT INTO `operation_08` VALUES ('368', 'admin', '0', '登陆了后台', '182.18.34.74', '1470383152');
INSERT INTO `operation_08` VALUES ('369', 'admin', '1', '添加了id为79的课程章节', '106.2.164.226', '1470383313');
INSERT INTO `operation_08` VALUES ('370', 'admin', '1', '修改了id为11演奏视频的审核状态', '106.2.164.226', '1470383355');
INSERT INTO `operation_08` VALUES ('371', 'admin', '1', '新增了热门视频ID为7的信息', '106.2.164.226', '1470383522');
INSERT INTO `operation_08` VALUES ('372', 'admin', '1', '添加了id为80的课程章节', '182.18.34.74', '1470383557');
INSERT INTO `operation_08` VALUES ('373', 'admin', '1', '添加了id为81的课程章节', '182.18.34.74', '1470383581');
INSERT INTO `operation_08` VALUES ('374', 'admin', '1', '添加了id为82的课程章节', '182.18.34.74', '1470383584');
INSERT INTO `operation_08` VALUES ('375', 'admin', '1', '添加了id为83的课程章节', '182.18.34.74', '1470383587');
INSERT INTO `operation_08` VALUES ('376', 'admin', '1', '添加了id为84的课程章节', '182.18.34.74', '1470383595');
INSERT INTO `operation_08` VALUES ('377', 'admin', '1', '添加了id为85的课程章节', '182.18.34.74', '1470383600');
INSERT INTO `operation_08` VALUES ('378', 'admin', '1', '添加了id为86的课程章节', '182.18.34.74', '1470383604');
INSERT INTO `operation_08` VALUES ('379', 'admin', '1', '添加了id为87的课程章节', '182.18.34.74', '1470383657');
INSERT INTO `operation_08` VALUES ('380', 'admin', '1', '添加了id为88的课程章节', '182.18.34.74', '1470383664');
INSERT INTO `operation_08` VALUES ('381', 'admin', '1', '添加了id为89的课程章节', '182.18.34.74', '1470383696');
INSERT INTO `operation_08` VALUES ('382', 'admin', '1', '添加了id为90的课程章节', '182.18.34.74', '1470383699');
INSERT INTO `operation_08` VALUES ('383', 'admin', '1', '添加了id为91的课程章节', '182.18.34.74', '1470383710');
INSERT INTO `operation_08` VALUES ('384', 'admin', '1', '添加了id为92的课程章节', '182.18.34.74', '1470383716');
INSERT INTO `operation_08` VALUES ('385', 'admin', '1', '新增了热门视频ID为8的信息', '106.2.164.226', '1470383801');
INSERT INTO `operation_08` VALUES ('386', 'admin', '1', '修改了id为12演奏视频的信息', '106.2.164.226', '1470383917');
INSERT INTO `operation_08` VALUES ('387', 'admin', '1', '修改了热门视频ID为8的信息', '106.2.164.226', '1470383923');
INSERT INTO `operation_08` VALUES ('388', 'admin', '1', '修改了id为12演奏视频的审核状态', '106.2.164.226', '1470383943');
INSERT INTO `operation_08` VALUES ('389', 'admin', '1', '修改了id为12演奏视频的审核状态', '106.2.164.226', '1470384066');
INSERT INTO `operation_08` VALUES ('390', 'admin', '1', '新增了热门视频ID为9的信息', '106.2.164.226', '1470384631');
INSERT INTO `operation_08` VALUES ('391', 'admin', '1', '修改了id为71点评视频的审核状态', '106.2.164.226', '1470385206');
INSERT INTO `operation_08` VALUES ('392', 'admin', '1', '新增了新闻资讯ID为12的信息', '106.2.164.226', '1470385426');
INSERT INTO `operation_08` VALUES ('393', 'admin', '1', '修改了id为71的点评视频信息', '106.2.164.226', '1470385624');
INSERT INTO `operation_08` VALUES ('394', 'admin', '0', '登陆了后台', '127.0.0.1', '1470385755');
INSERT INTO `operation_08` VALUES ('395', 'admin', '1', '添加了id为93的课程章节', '182.18.34.74', '1470385869');
INSERT INTO `operation_08` VALUES ('396', 'admin', '0', '登陆了后台', '106.2.164.226', '1470386000');
INSERT INTO `operation_08` VALUES ('397', 'admin', '1', '添加了id为11的专题课程', '106.2.164.226', '1470386224');
INSERT INTO `operation_08` VALUES ('398', 'admin', '1', '添加了id为94的课程章节', '106.2.164.226', '1470386280');
INSERT INTO `operation_08` VALUES ('399', 'admin', '0', '登陆了后台', '106.2.164.226', '1470386885');
INSERT INTO `operation_08` VALUES ('400', 'admin', '0', '登陆了后台', '106.2.164.226', '1470386942');
INSERT INTO `operation_08` VALUES ('401', 'admin', '1', '删除了bannerID为1的信息', '106.2.164.226', '1470386992');
INSERT INTO `operation_08` VALUES ('402', 'admin', '1', '删除了bannerID为5的信息', '106.2.164.226', '1470387000');
INSERT INTO `operation_08` VALUES ('403', 'admin', '1', '删除了bannerID为4的信息', '106.2.164.226', '1470387008');
INSERT INTO `operation_08` VALUES ('404', 'admin', '1', '删除了bannerID为3的信息', '106.2.164.226', '1470387014');
INSERT INTO `operation_08` VALUES ('405', 'admin', '1', '删除了bannerID为2的信息', '106.2.164.226', '1470387020');
INSERT INTO `operation_08` VALUES ('406', 'admin', '1', '新增了bannerID为6的信息', '106.2.164.226', '1470387060');
INSERT INTO `operation_08` VALUES ('407', 'admin', '1', '新增了bannerID为7的信息', '106.2.164.226', '1470387084');
INSERT INTO `operation_08` VALUES ('408', 'admin', '1', '新增了bannerID为8的信息', '127.0.0.1', '1470387679');
INSERT INTO `operation_08` VALUES ('409', 'admin', '1', '修改了id为11的专题课程', '106.2.164.226', '1470387911');
INSERT INTO `operation_08` VALUES ('410', 'admin', '1', '修改了id为10的专题课程', '106.2.164.226', '1470387960');
INSERT INTO `operation_08` VALUES ('411', 'admin', '1', '修改了id为9的专题课程', '106.2.164.226', '1470387974');
INSERT INTO `operation_08` VALUES ('412', 'admin', '1', '修改了id为8的专题课程', '106.2.164.226', '1470388051');
INSERT INTO `operation_08` VALUES ('413', 'admin', '1', '修改了id为7的专题课程', '106.2.164.226', '1470388066');
INSERT INTO `operation_08` VALUES ('414', 'admin', '1', '修改了id为7的专题课程', '106.2.164.226', '1470388219');
INSERT INTO `operation_08` VALUES ('415', 'admin', '1', '修改了id为6的专题课程', '106.2.164.226', '1470388520');
INSERT INTO `operation_08` VALUES ('416', 'admin', '1', '修改了id为5的专题课程', '106.2.164.226', '1470388533');
INSERT INTO `operation_08` VALUES ('417', 'admin', '1', '修改了id为4的专题课程', '106.2.164.226', '1470388559');
INSERT INTO `operation_08` VALUES ('418', 'admin', '1', '修改了id为3的专题课程', '106.2.164.226', '1470388587');
INSERT INTO `operation_08` VALUES ('419', 'admin', '1', '修改了id为2的专题课程', '106.2.164.226', '1470388629');
INSERT INTO `operation_08` VALUES ('420', 'admin', '1', '修改了id为1的专题课程', '106.2.164.226', '1470388697');
INSERT INTO `operation_08` VALUES ('421', 'admin', '1', '修改了id为1的专题课程', '106.2.164.226', '1470388818');
INSERT INTO `operation_08` VALUES ('422', 'admin', '1', '添加了通知ID为55的信息', '106.2.164.226', '1470389743');
INSERT INTO `operation_08` VALUES ('423', 'admin', '1', '添加了id为95的课程章节', '106.2.164.226', '1470390055');
INSERT INTO `operation_08` VALUES ('424', 'admin', '1', '修改了id为13演奏视频的审核状态', '106.2.164.226', '1470390988');
INSERT INTO `operation_08` VALUES ('425', 'admin', '1', '添加了id为12的专题课程', '106.2.164.226', '1470391066');
INSERT INTO `operation_08` VALUES ('426', 'admin', '1', '添加了id为96的课程章节', '106.2.164.226', '1470391081');
INSERT INTO `operation_08` VALUES ('427', 'admin', '1', '添加了id为97的课程章节', '106.2.164.226', '1470391119');
INSERT INTO `operation_08` VALUES ('428', 'admin', '1', '添加了id为98的课程章节', '106.2.164.226', '1470391160');
INSERT INTO `operation_08` VALUES ('429', 'admin', '1', '添加了id为99的课程章节', '106.2.164.226', '1470391205');
INSERT INTO `operation_08` VALUES ('430', 'admin', '1', '添加了id为100的课程章节', '106.2.164.226', '1470391250');
INSERT INTO `operation_08` VALUES ('431', 'admin', '0', '登陆了后台', '106.2.164.226', '1470391368');
INSERT INTO `operation_08` VALUES ('432', 'admin', '1', '修改了id为14演奏视频的审核状态', '106.2.164.226', '1470391387');
INSERT INTO `operation_08` VALUES ('433', 'admin', '1', '修改了id为15演奏视频的审核状态', '106.2.164.226', '1470391539');
INSERT INTO `operation_08` VALUES ('434', 'admin', '1', '添加了id为13的专题课程', '106.2.164.226', '1470391609');
INSERT INTO `operation_08` VALUES ('435', 'admin', '1', '修改了id为77点评视频的审核状态', '106.2.164.226', '1470391619');
INSERT INTO `operation_08` VALUES ('436', 'admin', '1', '添加了id为101的课程章节', '106.2.164.226', '1470391628');
INSERT INTO `operation_08` VALUES ('437', 'admin', '1', '修改了id为76点评视频的审核状态', '106.2.164.226', '1470391632');
INSERT INTO `operation_08` VALUES ('438', 'admin', '1', '修改了id为76的点评视频信息', '106.2.164.226', '1470391658');
INSERT INTO `operation_08` VALUES ('439', 'admin', '1', '修改了id为77的点评视频信息', '106.2.164.226', '1470391671');
INSERT INTO `operation_08` VALUES ('440', 'admin', '1', '添加了id为102的课程章节', '106.2.164.226', '1470391710');
INSERT INTO `operation_08` VALUES ('441', 'admin', '1', '修改了id为15演奏视频的信息', '106.2.164.226', '1470391725');
INSERT INTO `operation_08` VALUES ('442', 'admin', '1', '修改了id为14演奏视频的信息', '106.2.164.226', '1470391734');
INSERT INTO `operation_08` VALUES ('443', 'admin', '1', '添加了id为103的课程章节', '106.2.164.226', '1470391755');
INSERT INTO `operation_08` VALUES ('444', 'admin', '1', '添加了id为104的课程章节', '106.2.164.226', '1470391808');
INSERT INTO `operation_08` VALUES ('445', 'admin', '1', '修改了用户ID为3的信息', '106.2.164.226', '1470391903');
INSERT INTO `operation_08` VALUES ('446', 'admin', '1', '修改了id为104的课程章节', '106.2.164.226', '1470391903');
INSERT INTO `operation_08` VALUES ('447', 'admin', '1', '修改了id为16演奏视频的审核状态', '106.2.164.226', '1470392012');
INSERT INTO `operation_08` VALUES ('448', 'admin', '1', '修改了id为16演奏视频的信息', '106.2.164.226', '1470392022');
INSERT INTO `operation_08` VALUES ('449', 'admin', '1', '修改了id为78点评视频的审核状态', '106.2.164.226', '1470392154');
INSERT INTO `operation_08` VALUES ('450', 'admin', '1', '修改了id为78的点评视频信息', '106.2.164.226', '1470392169');
INSERT INTO `operation_08` VALUES ('451', 'admin', '1', '修改了id为77的点评视频信息', '106.2.164.226', '1470392180');
INSERT INTO `operation_08` VALUES ('452', 'admin', '1', '修改了id为78的点评视频信息', '106.2.164.226', '1470392222');
INSERT INTO `operation_08` VALUES ('453', 'admin', '1', '修改了id为17演奏视频的审核状态', '106.2.164.226', '1470392241');
INSERT INTO `operation_08` VALUES ('454', 'admin', '1', '添加了id为14的专题课程', '106.2.164.226', '1470393101');
INSERT INTO `operation_08` VALUES ('455', 'admin', '1', '添加了id为105的课程章节', '106.2.164.226', '1470393111');
INSERT INTO `operation_08` VALUES ('456', 'admin', '1', '添加了id为106的课程章节', '106.2.164.226', '1470393374');
INSERT INTO `operation_08` VALUES ('457', 'admin', '1', '添加了id为107的课程章节', '106.2.164.226', '1470393853');
INSERT INTO `operation_08` VALUES ('458', 'admin', '1', '添加了id为108的课程章节', '106.2.164.226', '1470396193');
INSERT INTO `operation_08` VALUES ('459', 'admin', '0', '登陆了后台', '106.2.164.226', '1470397699');
INSERT INTO `operation_08` VALUES ('460', 'admin', '1', '添加了id为109的课程章节', '127.0.0.1', '1470399611');
INSERT INTO `operation_08` VALUES ('461', 'admin', '1', '添加了id为110的课程章节', '127.0.0.1', '1470399620');
INSERT INTO `operation_08` VALUES ('462', 'admin', '1', '添加了id为111的课程章节', '127.0.0.1', '1470399697');
INSERT INTO `operation_08` VALUES ('463', 'admin', '1', '添加了id为112的课程章节', '127.0.0.1', '1470399738');
INSERT INTO `operation_08` VALUES ('464', 'admin', '1', '删除了id为111的课程章节', '127.0.0.1', '1470399770');
INSERT INTO `operation_08` VALUES ('465', 'admin', '1', '删除了id为112的课程章节', '127.0.0.1', '1470399776');
INSERT INTO `operation_08` VALUES ('466', 'admin', '1', '添加了id为113的课程章节', '127.0.0.1', '1470400476');
INSERT INTO `operation_08` VALUES ('467', 'admin', '1', '添加了id为114的课程章节', '127.0.0.1', '1470400921');
INSERT INTO `operation_08` VALUES ('468', 'admin', '1', '添加了id为115的课程章节', '127.0.0.1', '1470401303');
INSERT INTO `operation_08` VALUES ('469', 'admin', '1', '添加了id为116的课程章节', '127.0.0.1', '1470401509');
INSERT INTO `operation_08` VALUES ('470', 'admin', '1', '添加了id为117的课程章节', '106.2.164.226', '1470401661');
INSERT INTO `operation_08` VALUES ('471', 'admin', '1', '添加了id为118的课程章节', '106.2.164.226', '1470401742');
INSERT INTO `operation_08` VALUES ('472', 'admin', '1', '添加了id为119的课程章节', '127.0.0.1', '1470401941');
INSERT INTO `operation_08` VALUES ('473', 'admin', '1', '添加了id为120的课程章节', '127.0.0.1', '1470402065');
INSERT INTO `operation_08` VALUES ('474', 'admin', '1', '添加了id为121的课程章节', '127.0.0.1', '1470402135');
INSERT INTO `operation_08` VALUES ('475', 'admin', '1', '添加了id为122的课程章节', '127.0.0.1', '1470402252');
INSERT INTO `operation_08` VALUES ('476', 'admin', '1', '添加了id为123的课程章节', '127.0.0.1', '1470403352');
INSERT INTO `operation_08` VALUES ('477', 'admin', '1', '添加了id为124的课程章节', '127.0.0.1', '1470403550');
INSERT INTO `operation_08` VALUES ('478', 'admin', '1', '修改了id为122的课程章节', '127.0.0.1', '1470404370');
INSERT INTO `operation_08` VALUES ('479', 'admin', '1', '修改了id为122的课程章节', '127.0.0.1', '1470404413');
INSERT INTO `operation_08` VALUES ('480', 'admin', '1', '修改了id为122的课程章节', '127.0.0.1', '1470404651');
INSERT INTO `operation_08` VALUES ('481', 'admin', '1', '修改了id为124的课程章节', '127.0.0.1', '1470405632');
INSERT INTO `operation_08` VALUES ('482', 'admin', '1', '添加了id为125的课程章节', '106.2.164.226', '1470405888');
INSERT INTO `operation_08` VALUES ('483', 'admin', '1', '修改了id为124的课程章节', '106.2.164.226', '1470405923');
INSERT INTO `operation_08` VALUES ('484', 'admin', '0', '登陆了后台', '106.2.164.226', '1470618365');
INSERT INTO `operation_08` VALUES ('485', 'admin', '0', '登陆了后台', '106.2.164.226', '1470618436');
INSERT INTO `operation_08` VALUES ('486', 'admin', '1', '修改了id为13的专题课程', '106.2.164.226', '1470618455');
INSERT INTO `operation_08` VALUES ('487', 'admin', '1', '修改了id为11的专题课程', '106.2.164.226', '1470618514');
INSERT INTO `operation_08` VALUES ('488', 'admin', '1', '修改了id为12的专题课程', '106.2.164.226', '1470618554');
INSERT INTO `operation_08` VALUES ('489', 'admin', '0', '登陆了后台', '127.0.0.1', '1470619129');
INSERT INTO `operation_08` VALUES ('490', 'admin', '1', '修改了新闻资讯ID为12的信息', '106.2.164.226', '1470619166');
INSERT INTO `operation_08` VALUES ('491', 'admin', '0', '登陆了后台', '127.0.0.1', '1470619604');
INSERT INTO `operation_08` VALUES ('492', 'admin', '0', '登陆了后台', '106.2.164.226', '1470619975');
INSERT INTO `operation_08` VALUES ('493', 'admin', '1', '修改了id为18演奏视频的审核状态', '106.2.164.226', '1470620747');
INSERT INTO `operation_08` VALUES ('494', 'admin', '0', '登陆了后台', '106.2.164.226', '1470620827');
INSERT INTO `operation_08` VALUES ('495', 'admin', '0', '登陆了后台', '106.2.164.226', '1470620923');
INSERT INTO `operation_08` VALUES ('496', 'admin', '1', '修改了id为80点评视频的审核状态', '106.2.164.226', '1470620955');
INSERT INTO `operation_08` VALUES ('497', 'admin', '1', '修改了id为80点评视频的审核状态', '106.2.164.226', '1470620999');
INSERT INTO `operation_08` VALUES ('498', 'admin', '1', '修改了id为80的点评视频信息', '106.2.164.226', '1470621033');
INSERT INTO `operation_08` VALUES ('499', 'admin', '1', '修改了id为125的课程章节', '106.2.164.226', '1470621361');
INSERT INTO `operation_08` VALUES ('500', 'admin', '1', '修改了id为71的订单状态', '106.2.164.226', '1470621429');
INSERT INTO `operation_08` VALUES ('501', 'admin', '1', '修改了id为67的订单状态', '127.0.0.1', '1470621797');
INSERT INTO `operation_08` VALUES ('502', 'admin', '1', '修改了id为67的订单应退金额', '127.0.0.1', '1470621824');
INSERT INTO `operation_08` VALUES ('503', 'admin', '1', '修改了id为67的订单已退金额', '127.0.0.1', '1470621833');
INSERT INTO `operation_08` VALUES ('504', 'admin', '1', '添加了id为126的课程章节', '106.2.164.226', '1470622056');
INSERT INTO `operation_08` VALUES ('505', 'admin', '1', '新增了热门视频ID为10的信息', '127.0.0.1', '1470623657');
INSERT INTO `operation_08` VALUES ('506', 'admin', '1', '删除了热门视频ID为10的信息', '127.0.0.1', '1470623686');
INSERT INTO `operation_08` VALUES ('507', 'admin', '1', '新增了热门视频ID为11的信息', '106.2.164.226', '1470623732');
INSERT INTO `operation_08` VALUES ('508', 'admin', '1', '删除了热门视频ID为11的信息', '106.2.164.226', '1470623750');
INSERT INTO `operation_08` VALUES ('509', 'admin', '1', '新增了热门视频ID为12的信息', '106.2.164.226', '1470623896');
INSERT INTO `operation_08` VALUES ('510', 'admin', '1', '修改了id为14的专题课程', '106.2.164.226', '1470624100');
INSERT INTO `operation_08` VALUES ('511', 'admin', '1', '删除了热门视频ID为12的信息', '106.2.164.226', '1470624411');
INSERT INTO `operation_08` VALUES ('512', 'admin', '1', '添加了id为15的专题课程', '106.2.164.226', '1470624414');
INSERT INTO `operation_08` VALUES ('513', 'admin', '1', '添加了id为127的课程章节', '106.2.164.226', '1470624430');
INSERT INTO `operation_08` VALUES ('514', 'admin', '1', '新增了热门视频ID为13的信息', '106.2.164.226', '1470624447');
INSERT INTO `operation_08` VALUES ('515', 'admin', '1', '修改了id为19演奏视频的审核状态', '106.2.164.226', '1470624465');
INSERT INTO `operation_08` VALUES ('516', 'admin', '1', '修改了id为19演奏视频的信息', '106.2.164.226', '1470624477');
INSERT INTO `operation_08` VALUES ('517', 'admin', '1', '新增了热门视频ID为14的信息', '106.2.164.226', '1470624485');
INSERT INTO `operation_08` VALUES ('518', 'admin', '1', '添加了id为128的课程章节', '106.2.164.226', '1470624486');
INSERT INTO `operation_08` VALUES ('519', 'admin', '1', '删除了热门视频ID为14的信息', '106.2.164.226', '1470624507');
INSERT INTO `operation_08` VALUES ('520', 'admin', '1', '删除了热门视频ID为13的信息', '106.2.164.226', '1470624511');
INSERT INTO `operation_08` VALUES ('521', 'admin', '1', '添加了id为129的课程章节', '106.2.164.226', '1470624549');
INSERT INTO `operation_08` VALUES ('522', 'admin', '1', '添加了id为16的专题课程', '106.2.164.226', '1470624709');
INSERT INTO `operation_08` VALUES ('523', 'admin', '1', '添加了id为130的课程章节', '106.2.164.226', '1470624728');
INSERT INTO `operation_08` VALUES ('524', 'admin', '1', '添加了id为131的课程章节', '106.2.164.226', '1470624827');
INSERT INTO `operation_08` VALUES ('525', 'admin', '1', '修改了id为20演奏视频的审核状态', '106.2.164.226', '1470625381');
INSERT INTO `operation_08` VALUES ('526', 'admin', '1', '添加了id为132的课程章节', '106.2.164.226', '1470625420');
INSERT INTO `operation_08` VALUES ('527', 'admin', '1', '删除了id为132的课程章节', '106.2.164.226', '1470625437');
INSERT INTO `operation_08` VALUES ('528', 'admin', '1', '修改了新闻资讯ID为12的信息', '106.2.164.226', '1470625512');
INSERT INTO `operation_08` VALUES ('529', 'admin', '1', '添加了id为133的课程章节', '106.2.164.226', '1470625729');
INSERT INTO `operation_08` VALUES ('530', 'admin', '1', '删除了id为133的课程章节', '106.2.164.226', '1470625740');
INSERT INTO `operation_08` VALUES ('531', 'admin', '1', '修改了id为67的订单应退金额', '106.2.164.226', '1470625944');
INSERT INTO `operation_08` VALUES ('532', 'admin', '1', '修改了id为81点评视频的审核状态', '106.2.164.226', '1470625950');
INSERT INTO `operation_08` VALUES ('533', 'admin', '1', '修改了id为67的订单已退金额', '106.2.164.226', '1470625959');
INSERT INTO `operation_08` VALUES ('534', 'admin', '1', '修改了id为67的订单状态', '106.2.164.226', '1470626474');
INSERT INTO `operation_08` VALUES ('535', 'admin', '0', '登陆了后台', '106.2.164.226', '1470626709');
INSERT INTO `operation_08` VALUES ('536', 'admin', '1', '修改了id为21演奏视频的审核状态', '106.2.164.226', '1470626800');
INSERT INTO `operation_08` VALUES ('537', 'admin', '1', '修改了id为82点评视频的审核状态', '106.2.164.226', '1470626960');
INSERT INTO `operation_08` VALUES ('538', 'admin', '1', '修改了id为82的点评视频信息', '106.2.164.226', '1470626981');
INSERT INTO `operation_08` VALUES ('539', 'admin', '1', '修改了id为70的订单状态', '127.0.0.1', '1470627137');
INSERT INTO `operation_08` VALUES ('540', 'admin', '1', '修改了id为70的订单应退金额', '127.0.0.1', '1470627151');
INSERT INTO `operation_08` VALUES ('541', 'admin', '1', '修改了id为70的订单已退金额', '127.0.0.1', '1470627159');
INSERT INTO `operation_08` VALUES ('542', 'admin', '0', '登陆了后台', '106.2.164.226', '1470627519');
INSERT INTO `operation_08` VALUES ('543', 'admin', '1', '删除了id为7的专题课程推荐', '106.2.164.226', '1470627530');
INSERT INTO `operation_08` VALUES ('544', 'admin', '1', '添加了id为9的专题课程推荐', '106.2.164.226', '1470627545');
INSERT INTO `operation_08` VALUES ('545', 'admin', '0', '登陆了后台', '106.2.164.226', '1470627575');
INSERT INTO `operation_08` VALUES ('546', 'admin', '0', '登陆了后台', '106.2.164.226', '1470627681');
INSERT INTO `operation_08` VALUES ('547', 'admin', '1', '修改了id为70的订单状态', '127.0.0.1', '1470627753');
INSERT INTO `operation_08` VALUES ('548', 'admin', '1', '修改了id为74的订单状态', '127.0.0.1', '1470627760');
INSERT INTO `operation_08` VALUES ('549', 'admin', '1', '修改了id为74的订单应退金额', '127.0.0.1', '1470627800');
INSERT INTO `operation_08` VALUES ('550', 'admin', '1', '修改了id为74的订单已退金额', '127.0.0.1', '1470627808');
INSERT INTO `operation_08` VALUES ('551', 'admin', '1', '修改了id为74的订单状态', '127.0.0.1', '1470628045');
INSERT INTO `operation_08` VALUES ('552', 'admin', '1', '修改了id为22演奏视频的审核状态', '106.2.164.226', '1470628091');
INSERT INTO `operation_08` VALUES ('553', 'admin', '0', '登陆了后台', '127.0.0.1', '1470630352');
INSERT INTO `operation_08` VALUES ('554', 'admin', '1', '修改了id为80的订单状态', '127.0.0.1', '1470630933');
INSERT INTO `operation_08` VALUES ('555', 'admin', '0', '登陆了后台', '106.2.164.226', '1470633911');
INSERT INTO `operation_08` VALUES ('556', 'admin', '1', '修改了id为80的订单应退金额', '106.2.164.226', '1470633934');
INSERT INTO `operation_08` VALUES ('557', 'admin', '1', '修改了id为80的订单已退金额', '106.2.164.226', '1470633941');
INSERT INTO `operation_08` VALUES ('558', 'admin', '1', '修改了id为80的订单状态', '106.2.164.226', '1470634273');
INSERT INTO `operation_08` VALUES ('559', 'admin', '1', '修改了id为22演奏视频的审核状态', '106.2.164.226', '1470634933');
INSERT INTO `operation_08` VALUES ('560', 'admin', '0', '登陆了后台', '127.0.0.1', '1470634950');
INSERT INTO `operation_08` VALUES ('561', 'admin', '1', '修改了id为83点评视频的审核状态', '106.2.164.226', '1470635282');
INSERT INTO `operation_08` VALUES ('562', 'admin', '1', '修改了id为83的点评视频信息', '106.2.164.226', '1470635289');
INSERT INTO `operation_08` VALUES ('563', 'admin', '0', '登陆了后台', '106.2.164.226', '1470635363');
INSERT INTO `operation_08` VALUES ('564', 'admin', '1', '修改了id为24演奏视频的审核状态', '106.2.164.226', '1470635398');
INSERT INTO `operation_08` VALUES ('565', 'admin', '1', '修改了id为23演奏视频的审核状态', '106.2.164.226', '1470635686');
INSERT INTO `operation_08` VALUES ('566', 'admin', '1', '修改了id为23演奏视频的审核状态', '106.2.164.226', '1470635800');
INSERT INTO `operation_08` VALUES ('567', 'admin', '1', '修改了id为84点评视频的审核状态', '106.2.164.226', '1470635846');
INSERT INTO `operation_08` VALUES ('568', 'admin', '1', '修改了id为81的订单状态', '106.2.164.226', '1470635918');
INSERT INTO `operation_08` VALUES ('569', 'admin', '1', '修改了id为81的订单应退金额', '106.2.164.226', '1470635928');
INSERT INTO `operation_08` VALUES ('570', 'admin', '1', '修改了id为81的订单已退金额', '106.2.164.226', '1470635936');
INSERT INTO `operation_08` VALUES ('571', 'admin', '1', '修改了id为84的点评视频信息', '106.2.164.226', '1470636012');
INSERT INTO `operation_08` VALUES ('572', 'admin', '1', '新增了热门视频ID为15的信息', '106.2.164.226', '1470636352');
INSERT INTO `operation_08` VALUES ('573', 'admin', '1', '删除了热门视频ID为15的信息', '106.2.164.226', '1470636375');
INSERT INTO `operation_08` VALUES ('574', 'admin', '1', '新增了热门视频ID为16的信息', '106.2.164.226', '1470636406');
INSERT INTO `operation_08` VALUES ('575', 'admin', '1', '新增了热门视频ID为17的信息', '106.2.164.226', '1470636525');
INSERT INTO `operation_08` VALUES ('576', 'admin', '1', '删除了热门视频ID为16的信息', '106.2.164.226', '1470636545');
INSERT INTO `operation_08` VALUES ('577', 'admin', '1', '删除了热门视频ID为17的信息', '106.2.164.226', '1470636550');
INSERT INTO `operation_08` VALUES ('578', 'admin', '1', '修改了id为89的订单状态', '127.0.0.1', '1470637155');
INSERT INTO `operation_08` VALUES ('579', 'admin', '1', '修改了id为88的订单应退金额', '106.2.164.226', '1470637274');
INSERT INTO `operation_08` VALUES ('580', 'admin', '1', '修改了id为88的订单已退金额', '106.2.164.226', '1470637293');
INSERT INTO `operation_08` VALUES ('581', 'admin', '1', '修改了id为84的订单状态', '127.0.0.1', '1470637360');
INSERT INTO `operation_08` VALUES ('582', 'admin', '1', '修改了id为89的订单应退金额', '127.0.0.1', '1470637375');
INSERT INTO `operation_08` VALUES ('583', 'admin', '1', '修改了id为89的订单已退金额', '127.0.0.1', '1470637385');
INSERT INTO `operation_08` VALUES ('584', 'admin', '1', '修改了id为11的专题课程', '106.2.164.226', '1470637422');
INSERT INTO `operation_08` VALUES ('585', 'admin', '1', '添加了id为134的课程章节', '106.2.164.226', '1470637829');
INSERT INTO `operation_08` VALUES ('586', 'admin', '1', '添加了id为135的课程章节', '106.2.164.226', '1470638061');
INSERT INTO `operation_08` VALUES ('587', 'admin', '1', '修改了id为15的专题课程', '106.2.164.226', '1470638138');
INSERT INTO `operation_08` VALUES ('588', 'admin', '1', '修改了id为131的课程章节', '106.2.164.226', '1470638839');
INSERT INTO `operation_08` VALUES ('589', 'admin', '1', '添加了id为17的专题课程', '106.2.164.226', '1470639095');
INSERT INTO `operation_08` VALUES ('590', 'admin', '1', '添加了id为136的课程章节', '106.2.164.226', '1470639108');
INSERT INTO `operation_08` VALUES ('591', 'admin', '1', '添加了id为137的课程章节', '106.2.164.226', '1470639177');
INSERT INTO `operation_08` VALUES ('592', 'admin', '1', '添加了id为138的课程章节', '106.2.164.226', '1470639250');
INSERT INTO `operation_08` VALUES ('593', 'admin', '0', '登陆了后台', '106.2.164.226', '1470640897');
INSERT INTO `operation_08` VALUES ('594', 'admin', '1', '修改了id为92的订单状态', '106.2.164.226', '1470641403');
INSERT INTO `operation_08` VALUES ('595', 'admin', '1', '修改了id为92的订单应退金额', '106.2.164.226', '1470641416');
INSERT INTO `operation_08` VALUES ('596', 'admin', '1', '修改了id为92的订单已退金额', '106.2.164.226', '1470641424');
INSERT INTO `operation_08` VALUES ('597', 'admin', '1', '修改了id为25演奏视频的审核状态', '106.2.164.226', '1470641475');
INSERT INTO `operation_08` VALUES ('598', 'admin', '1', '修改了id为25演奏视频的审核状态', '106.2.164.226', '1470641802');
INSERT INTO `operation_08` VALUES ('599', 'admin', '1', '修改了id为25演奏视频的审核状态', '106.2.164.226', '1470641851');
INSERT INTO `operation_08` VALUES ('600', 'admin', '1', '修改了id为85点评视频的审核状态', '106.2.164.226', '1470641967');
INSERT INTO `operation_08` VALUES ('601', 'admin', '1', '修改了id为93的订单状态', '106.2.164.226', '1470642580');
INSERT INTO `operation_08` VALUES ('602', 'admin', '1', '修改了id为93的订单应退金额', '106.2.164.226', '1470642593');
INSERT INTO `operation_08` VALUES ('603', 'admin', '1', '修改了id为26演奏视频的审核状态', '106.2.164.226', '1470642595');
INSERT INTO `operation_08` VALUES ('604', 'admin', '1', '修改了id为93的订单已退金额', '106.2.164.226', '1470642600');
INSERT INTO `operation_08` VALUES ('605', 'admin', '1', '修改了id为27演奏视频的审核状态', '106.2.164.226', '1470642827');
INSERT INTO `operation_08` VALUES ('606', 'admin', '1', '修改了id为86点评视频的审核状态', '106.2.164.226', '1470642924');
INSERT INTO `operation_08` VALUES ('607', 'admin', '1', '修改了id为86点评视频的审核状态', '106.2.164.226', '1470643284');
INSERT INTO `operation_08` VALUES ('608', 'admin', '1', '新增加了用户ID为17的名师', '106.2.164.226', '1470644155');
INSERT INTO `operation_08` VALUES ('609', 'admin', '1', '修改了id为93的订单状态', '127.0.0.1', '1470644249');
INSERT INTO `operation_08` VALUES ('610', 'admin', '1', '修改了id为95的订单状态', '127.0.0.1', '1470644259');
INSERT INTO `operation_08` VALUES ('611', 'admin', '1', '修改了id为95的订单应退金额', '127.0.0.1', '1470644268');
INSERT INTO `operation_08` VALUES ('612', 'admin', '1', '修改了id为95的订单已退金额', '127.0.0.1', '1470644276');
INSERT INTO `operation_08` VALUES ('613', 'admin', '1', '添加了id为17的名师推荐', '106.2.164.226', '1470644350');
INSERT INTO `operation_08` VALUES ('614', 'admin', '1', '修改了id为30演奏视频的审核状态', '106.2.164.226', '1470644806');
INSERT INTO `operation_08` VALUES ('615', 'admin', '0', '登陆了后台', '106.2.164.226', '1470644991');
INSERT INTO `operation_08` VALUES ('616', 'admin', '1', '修改了id为95的订单状态', '127.0.0.1', '1470645158');
INSERT INTO `operation_08` VALUES ('617', 'admin', '1', '修改了id为92的订单状态', '106.2.164.226', '1470645185');
INSERT INTO `operation_08` VALUES ('618', 'admin', '1', '添加了通知ID为115的信息', '106.2.164.226', '1470645191');
INSERT INTO `operation_08` VALUES ('619', 'admin', '1', '添加了通知ID为116的信息', '127.0.0.1', '1470645301');
INSERT INTO `operation_08` VALUES ('620', 'admin', '1', '修改了id为31演奏视频的审核状态', '106.2.164.226', '1470645482');
INSERT INTO `operation_08` VALUES ('621', 'admin', '1', '修改了id为32演奏视频的审核状态', '106.2.164.226', '1470646061');
INSERT INTO `operation_08` VALUES ('622', 'admin', '1', '修改了id为91点评视频的审核状态', '106.2.164.226', '1470646233');
INSERT INTO `operation_08` VALUES ('623', 'admin', '1', '修改了id为91点评视频的审核状态', '106.2.164.226', '1470646266');
INSERT INTO `operation_08` VALUES ('624', 'admin', '1', '修改了id为92的订单状态', '106.2.164.226', '1470646500');
INSERT INTO `operation_08` VALUES ('625', 'admin', '1', '修改了id为101的订单状态', '106.2.164.226', '1470646511');
INSERT INTO `operation_08` VALUES ('626', 'admin', '1', '修改了id为101的订单应退金额', '106.2.164.226', '1470646521');
INSERT INTO `operation_08` VALUES ('627', 'admin', '1', '修改了id为101的订单已退金额', '106.2.164.226', '1470646528');
INSERT INTO `operation_08` VALUES ('628', 'admin', '0', '登陆了后台', '106.2.164.226', '1470646924');
INSERT INTO `operation_08` VALUES ('629', 'admin', '1', '修改了id为17的专题课程', '106.2.164.226', '1470646937');
INSERT INTO `operation_08` VALUES ('630', 'admin', '1', '删除了id为95的订单', '106.2.164.226', '1470647762');
INSERT INTO `operation_08` VALUES ('631', 'admin', '1', '修改了id为103的订单状态', '106.2.164.226', '1470647796');
INSERT INTO `operation_08` VALUES ('632', 'admin', '1', '修改了id为100的订单状态', '106.2.164.226', '1470647820');
INSERT INTO `operation_08` VALUES ('633', 'admin', '1', '修改了id为99的订单状态', '106.2.164.226', '1470647827');
INSERT INTO `operation_08` VALUES ('634', 'admin', '1', '修改了id为98的订单状态', '106.2.164.226', '1470647834');
INSERT INTO `operation_08` VALUES ('635', 'admin', '1', '修改了id为97的订单状态', '106.2.164.226', '1470647836');
INSERT INTO `operation_08` VALUES ('636', 'admin', '1', '删除了id为91的点评视频', '106.2.164.226', '1470647847');
INSERT INTO `operation_08` VALUES ('637', 'admin', '1', '删除了id为5的专题课程', '106.2.164.226', '1470647972');
INSERT INTO `operation_08` VALUES ('638', 'admin', '0', '登陆了后台', '106.2.164.226', '1470648444');
INSERT INTO `operation_08` VALUES ('639', 'admin', '1', '修改了id为101的订单状态', '106.2.164.226', '1470648456');
INSERT INTO `operation_08` VALUES ('640', 'admin', '1', '修改了id为102的订单状态', '106.2.164.226', '1470648462');
INSERT INTO `operation_08` VALUES ('641', 'admin', '1', '修改了id为102的订单应退金额', '106.2.164.226', '1470648473');
INSERT INTO `operation_08` VALUES ('642', 'admin', '1', '修改了id为102的订单已退金额', '106.2.164.226', '1470648480');
INSERT INTO `operation_08` VALUES ('643', 'admin', '1', '删除了id为6的名师推荐', '106.2.164.226', '1470649039');
INSERT INTO `operation_08` VALUES ('644', 'admin', '1', '添加了id为17的名师推荐', '106.2.164.226', '1470649093');
INSERT INTO `operation_08` VALUES ('645', 'admin', '1', '修改了id为1的名师推荐', '106.2.164.226', '1470649115');
INSERT INTO `operation_08` VALUES ('646', 'admin', '1', '删除了用户ID为17的名师', '106.2.164.226', '1470649124');
INSERT INTO `operation_08` VALUES ('647', 'admin', '1', '添加了id为8的名师推荐', '106.2.164.226', '1470649160');
INSERT INTO `operation_08` VALUES ('648', 'admin', '1', '删除了id为7的名师推荐', '106.2.164.226', '1470649177');
INSERT INTO `operation_08` VALUES ('649', 'admin', '1', '新增加了用户ID为18的名师', '106.2.164.226', '1470649244');
INSERT INTO `operation_08` VALUES ('650', 'admin', '1', '添加了id为18的名师推荐', '106.2.164.226', '1470649280');
INSERT INTO `operation_08` VALUES ('651', 'admin', '1', '新增了社区名师推荐ID为5的信息', '106.2.164.226', '1470649315');
INSERT INTO `operation_08` VALUES ('652', 'admin', '1', '修改了社区名师推荐ID为4的信息', '106.2.164.226', '1470649321');
INSERT INTO `operation_08` VALUES ('653', 'admin', '1', '删除了用户ID为18的名师', '106.2.164.226', '1470649338');
INSERT INTO `operation_08` VALUES ('654', 'admin', '1', '回收站还原了id为5的专题课程', '106.2.164.226', '1470649457');
INSERT INTO `operation_08` VALUES ('655', 'admin', '1', '回收站还原了id为91的点评视频', '106.2.164.226', '1470649465');
INSERT INTO `operation_08` VALUES ('656', 'admin', '1', '添加了id为9的点评视频推荐', '106.2.164.226', '1470649520');
INSERT INTO `operation_08` VALUES ('657', 'admin', '1', '删除了id为5的专题课程', '106.2.164.226', '1470649548');
INSERT INTO `operation_08` VALUES ('658', 'admin', '1', '删除了id为91的点评视频', '106.2.164.226', '1470649557');
INSERT INTO `operation_08` VALUES ('659', 'admin', '0', '登陆了后台', '106.2.164.226', '1470649853');
INSERT INTO `operation_08` VALUES ('660', 'admin', '1', '修改了用户ID为17的信息', '106.2.164.226', '1470649884');
INSERT INTO `operation_08` VALUES ('661', 'admin', '1', '添加了id为18的专题课程', '106.2.164.226', '1470650471');
INSERT INTO `operation_08` VALUES ('662', 'admin', '1', '修改了id为86的订单状态', '127.0.0.1', '1470650476');
INSERT INTO `operation_08` VALUES ('663', 'admin', '1', '添加了id为139的课程章节', '106.2.164.226', '1470650481');
INSERT INTO `operation_08` VALUES ('664', 'admin', '1', '添加了id为140的课程章节', '106.2.164.226', '1470650647');
INSERT INTO `operation_08` VALUES ('665', 'admin', '1', '添加了id为141的课程章节', '106.2.164.226', '1470650843');
INSERT INTO `operation_08` VALUES ('666', 'admin', '0', '登陆了后台', '106.2.164.226', '1470651605');
INSERT INTO `operation_08` VALUES ('667', 'admin', '0', '登陆了后台', '106.2.164.226', '1470652526');
INSERT INTO `operation_08` VALUES ('668', 'admin', '1', '修改了id为106的订单状态', '106.2.164.226', '1470652538');
INSERT INTO `operation_08` VALUES ('669', 'admin', '1', '修改了id为106的订单应退金额', '106.2.164.226', '1470652546');
INSERT INTO `operation_08` VALUES ('670', 'admin', '1', '修改了id为106的订单已退金额', '106.2.164.226', '1470652552');
INSERT INTO `operation_08` VALUES ('671', 'admin', '1', '修改了id为77的订单状态', '106.2.164.226', '1470652903');
INSERT INTO `operation_08` VALUES ('672', 'admin', '1', '修改了id为77的订单应退金额', '106.2.164.226', '1470652920');
INSERT INTO `operation_08` VALUES ('673', 'admin', '1', '修改了id为77的订单已退金额', '106.2.164.226', '1470652927');
INSERT INTO `operation_08` VALUES ('674', 'admin', '1', '修改了id为109的订单状态', '106.2.164.226', '1470653514');
INSERT INTO `operation_08` VALUES ('675', 'admin', '1', '修改了id为109的订单应退金额', '106.2.164.226', '1470653524');
INSERT INTO `operation_08` VALUES ('676', 'admin', '1', '修改了id为109的订单已退金额', '106.2.164.226', '1470653530');
INSERT INTO `operation_08` VALUES ('677', '', '1', '修改了id为109的订单状态', '106.2.164.226', '1470653914');
INSERT INTO `operation_08` VALUES ('678', '', '1', '修改了id为110的订单状态', '106.2.164.226', '1470653997');
INSERT INTO `operation_08` VALUES ('679', '', '1', '修改了id为110的订单应退金额', '106.2.164.226', '1470654004');
INSERT INTO `operation_08` VALUES ('680', '', '1', '修改了id为110的订单已退金额', '106.2.164.226', '1470654011');
INSERT INTO `operation_08` VALUES ('681', '', '1', '异步日志为{\"sign\":\"b364a56a620c4e6f37', '110.75.152.1', '1470654072');
INSERT INTO `operation_08` VALUES ('682', '', '1', '异步日志为{\"sign\":\"30da05ad7f92ae0dfe', '110.75.242.87', '1470654092');
INSERT INTO `operation_08` VALUES ('683', '', '1', '异步日志为{\"sign\":\"0a7fdc9ee38c965cf9', '110.75.242.73', '1470654324');
INSERT INTO `operation_08` VALUES ('684', '', '1', '异步日志为{\"sign\":\"72386b7eddf7c9219e', '110.75.248.198', '1470654363');
INSERT INTO `operation_08` VALUES ('685', '', '1', '异步日志为{\"sign\":\"00f0c6287a77891c87', '110.75.248.192', '1470654509');
INSERT INTO `operation_08` VALUES ('686', '', '1', '异步日志为{\"sign\":\"cec60aa774e3cdecf0', '110.75.248.192', '1470654522');
INSERT INTO `operation_08` VALUES ('687', '', '1', '异步日志为{\"sign\":\"29a45b620123c87cc5', '110.75.152.1', '1470654971');
INSERT INTO `operation_08` VALUES ('688', '', '1', '异步日志为{\"sign\":\"b518bd25a1993e70f9', '110.75.242.34', '1470654975');
INSERT INTO `operation_08` VALUES ('689', '', '1', '异步日志为{\"sign\":\"0d385b54fca375f47c', '110.75.248.174', '1470654983');
INSERT INTO `operation_08` VALUES ('690', '', '1', '异步日志为{\"sign\":\"91bd15f855133731e3', '110.75.152.1', '1470655228');
INSERT INTO `operation_08` VALUES ('691', '', '1', '异步日志为{\"sign\":\"5a5344bb05c23eae5e', '110.75.242.2', '1470655510');
INSERT INTO `operation_08` VALUES ('692', '', '1', '异步日志为[]', '106.2.164.226', '1470655566');
INSERT INTO `operation_08` VALUES ('693', '', '1', '修改了id为105的订单状态', '127.0.0.1', '1470655744');
INSERT INTO `operation_08` VALUES ('694', '', '1', '异步日志为{\"sign\":\"cbaf3999573206fa96', '110.75.242.237', '1470655787');
INSERT INTO `operation_08` VALUES ('695', '', '1', '异步日志为{\"sign\":\"81a4da571065f50c0b', '110.75.152.1', '1470655885');
INSERT INTO `operation_08` VALUES ('696', '', '1', '异步日志为{\"sign\":\"5478feb9247a485f21', '110.75.242.223', '1470656024');
INSERT INTO `operation_08` VALUES ('697', '', '1', '异步日志为{\"sign\":\"68f723a5a011127442', '110.75.242.210', '1470656243');
INSERT INTO `operation_08` VALUES ('698', '', '1', '异步日志为{\"sign\":\"470f71c3ddb658642a', '110.75.152.1', '1470656408');
INSERT INTO `operation_08` VALUES ('699', '', '1', '异步日志为{\"sign\":\"1af1c9848ab99e198d', '110.75.242.189', '1470656603');
INSERT INTO `operation_08` VALUES ('700', '', '1', '异步日志为{\"sign\":\"43127d4d194833c1bd', '110.75.242.188', '1470656614');
INSERT INTO `operation_08` VALUES ('701', '', '1', '异步日志为{\"sign\":\"6528ab0fddefb913e8', '110.75.242.152', '1470657209');
INSERT INTO `operation_08` VALUES ('702', '', '1', '异步日志为{\"sign\":\"91b8f428e0d330d2b5', '110.75.152.1', '1470657643');
INSERT INTO `operation_08` VALUES ('703', '', '1', '异步日志为{\"sign\":\"2ee4cae6320dc6729e', '110.75.152.1', '1470657686');
INSERT INTO `operation_08` VALUES ('704', '', '1', '异步日志为{\"sign\":\"0d74b81628711bc938', '110.75.248.49', '1470658282');
INSERT INTO `operation_08` VALUES ('705', '', '1', '异步日志为{\"sign\":\"077fa4be57414b3517', '110.75.248.37', '1470658574');
INSERT INTO `operation_08` VALUES ('706', '', '1', '异步日志为{\"sign\":\"7b8934b7e60ad8b736', '110.75.152.3', '1470658845');
INSERT INTO `operation_08` VALUES ('707', '', '1', '异步日志为{\"sign\":\"b4f919388e66dd2244', '110.75.242.36', '1470659118');
INSERT INTO `operation_08` VALUES ('708', '', '1', '异步日志为{\"sign\":\"7d4baf869ed630d428', '110.75.152.1', '1470660022');
INSERT INTO `operation_08` VALUES ('709', '', '1', '异步日志为{\"sign\":\"84d72af0eae965a985', '110.75.152.1', '1470660463');
INSERT INTO `operation_08` VALUES ('710', '', '1', '异步日志为{\"sign\":\"3c81281318ece6c9f1', '110.75.152.1', '1470660755');
INSERT INTO `operation_08` VALUES ('711', '', '1', '异步日志为{\"sign\":\"7cfdcbc7d3269ca5ed', '110.75.242.187', '1470660810');
INSERT INTO `operation_08` VALUES ('712', '', '1', '异步日志为{\"sign\":\"d6ac094e90fb62f44c', '110.75.152.3', '1470664909');
INSERT INTO `operation_08` VALUES ('713', '', '1', '异步日志为{\"sign\":\"7622dcfad48225484f', '110.75.248.20', '1470665228');
INSERT INTO `operation_08` VALUES ('714', '', '1', '异步日志为{\"sign\":\"6c316a4a2b97b8583f', '110.75.248.249', '1470665829');
INSERT INTO `operation_08` VALUES ('715', '', '1', '异步日志为{\"sign\":\"eef154ecd8a903a704', '110.75.242.105', '1470666342');
INSERT INTO `operation_08` VALUES ('716', '', '1', '异步日志为{\"sign\":\"db9558846c85fe39a8', '110.75.152.3', '1470667227');
INSERT INTO `operation_08` VALUES ('717', '', '1', '异步日志为{\"sign\":\"21533a38bd68f3699d', '110.75.242.10', '1470668016');
INSERT INTO `operation_08` VALUES ('718', '', '1', '异步日志为{\"sign\":\"308f2114738ec56a17', '110.75.225.149', '1470669815');
INSERT INTO `operation_08` VALUES ('719', '', '1', '异步日志为{\"sign\":\"6fc487318222e8e6f2', '110.75.225.178', '1470674772');
INSERT INTO `operation_08` VALUES ('720', '', '1', '异步日志为{\"sign\":\"f73839981aab910a32', '110.75.242.171', '1470675014');
INSERT INTO `operation_08` VALUES ('721', '', '1', '异步日志为{\"sign\":\"31e6f00bcb6dc81d44', '110.75.242.159', '1470675302');
INSERT INTO `operation_08` VALUES ('722', '', '1', '异步日志为{\"sign\":\"2eed36fbb17d4b00ea', '110.75.248.141', '1470676275');
INSERT INTO `operation_08` VALUES ('723', '', '1', '异步日志为{\"sign\":\"b9c26ce361fc999904', '110.75.242.55', '1470677956');
INSERT INTO `operation_08` VALUES ('724', '', '1', '异步日志为{\"sign\":\"899f37f5a57a5dc75c', '110.75.242.40', '1470678366');
INSERT INTO `operation_08` VALUES ('725', '', '1', '异步日志为{\"sign\":\"641b52fbf5933bcaaf', '110.75.152.3', '1470679157');
INSERT INTO `operation_08` VALUES ('726', '', '1', '异步日志为{\"sign\":\"3c92065e30be577c38', '110.75.152.3', '1470680690');
INSERT INTO `operation_08` VALUES ('727', '', '1', '异步日志为{\"sign\":\"9149a42838b68053a2', '110.75.152.1', '1470682096');
INSERT INTO `operation_08` VALUES ('728', '', '1', '异步日志为{\"sign\":\"4ed689a31bc4a1c395', '110.75.152.1', '1470682359');
INSERT INTO `operation_08` VALUES ('729', '', '1', '异步日志为{\"sign\":\"7cd8fe5f79a7b45611', '110.75.152.1', '1470686494');
INSERT INTO `operation_08` VALUES ('730', '', '1', '异步日志为{\"sign\":\"f4787494c257f54b4f', '110.75.248.133', '1470687028');
INSERT INTO `operation_08` VALUES ('731', '', '1', '异步日志为{\"sign\":\"851c98e1e9a16fd923', '110.75.248.124', '1470687401');
INSERT INTO `operation_08` VALUES ('732', '', '1', '异步日志为{\"sign\":\"a1154ab5394dff67af', '110.75.242.225', '1470687936');
INSERT INTO `operation_08` VALUES ('733', '', '1', '异步日志为{\"sign\":\"0d69ca3cc7e7c298a4', '110.75.152.1', '1470688951');
INSERT INTO `operation_08` VALUES ('734', '', '1', '异步日志为{\"sign\":\"878d9a3228c9dbe1a1', '110.75.242.173', '1470689593');
INSERT INTO `operation_08` VALUES ('735', '', '0', '登陆了后台', '106.2.164.226', '1470705921');
INSERT INTO `operation_08` VALUES ('736', 'admin', '0', '登陆了后台', '127.0.0.1', '1470705925');
INSERT INTO `operation_08` VALUES ('737', '', '0', '登陆了后台', '127.0.0.1', '1470706029');
INSERT INTO `operation_08` VALUES ('738', '', '0', '登陆了后台', '106.2.164.226', '1470706274');
INSERT INTO `operation_08` VALUES ('739', '', '0', '登陆了后台', '106.2.164.226', '1470707162');
INSERT INTO `operation_08` VALUES ('740', '', '0', '登陆了后台', '106.2.164.226', '1470708241');
INSERT INTO `operation_08` VALUES ('741', '', '1', '修改了id为112的订单已退金额', '106.2.164.226', '1470708292');
INSERT INTO `operation_08` VALUES ('742', '', '1', '修改了id为111的订单状态', '106.2.164.226', '1470708418');
INSERT INTO `operation_08` VALUES ('743', '', '1', '修改了id为111的订单应退金额', '106.2.164.226', '1470708431');
INSERT INTO `operation_08` VALUES ('744', '', '1', '修改了id为111的订单已退金额', '106.2.164.226', '1470708437');
INSERT INTO `operation_08` VALUES ('745', '', '1', '异步日志为{\"sign\":\"8fbadfa4567379e0cd969676186caa79\",\"result_details\":\"2016080921001004140287947378^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 10:10:41\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"916768293779e824f91e2f9c2f95469ggq\",\"batch_no\":\"201608091470708484\",\"success_num\":\"1\"}', '110.75.225.84', '1470708641');
INSERT INTO `operation_08` VALUES ('746', '', '1', '异步日志为{\"sign\":\"20abb514aac03cd6d96f634a4c72c627\",\"result_details\":\"2016080921001004140287947378^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 10:14:12\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"916768293779e824f91e2f9c2f95469ggq\",\"batch_no\":\"201608091470708484\",\"success_num\":\"1\"}', '110.75.225.73', '1470708852');
INSERT INTO `operation_08` VALUES ('747', '', '1', '异步日志为[]', '106.2.164.226', '1470709052');
INSERT INTO `operation_08` VALUES ('748', '', '1', '异步日志为[]', '106.2.164.226', '1470709082');
INSERT INTO `operation_08` VALUES ('749', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709197');
INSERT INTO `operation_08` VALUES ('750', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709202');
INSERT INTO `operation_08` VALUES ('751', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709202');
INSERT INTO `operation_08` VALUES ('752', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709202');
INSERT INTO `operation_08` VALUES ('753', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709203');
INSERT INTO `operation_08` VALUES ('754', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709204');
INSERT INTO `operation_08` VALUES ('755', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709204');
INSERT INTO `operation_08` VALUES ('756', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709204');
INSERT INTO `operation_08` VALUES ('757', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709204');
INSERT INTO `operation_08` VALUES ('758', '', '1', '异步日志为{\"a\":\"friend_recommend\",\"c\":\"user\"}', '106.2.164.226', '1470709204');
INSERT INTO `operation_08` VALUES ('759', '', '1', '新增了bannerID为9的信息', '106.2.164.226', '1470709342');
INSERT INTO `operation_08` VALUES ('760', '', '1', '删除了bannerID为9的信息', '106.2.164.226', '1470709384');
INSERT INTO `operation_08` VALUES ('761', '', '1', '新增了bannerID为10的信息', '106.2.164.226', '1470709449');
INSERT INTO `operation_08` VALUES ('762', '', '1', '异步日志为{\"sign\":\"ddf4e1e5ae6f6a68d387cdb9f9d3931f\",\"result_details\":\"2016080921001004140287947378^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 10:25:08\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"916768293779e824f91e2f9c2f95469ggq\",\"batch_no\":\"201608091470708484\",\"success_num\":\"1\"}', '110.75.225.40', '1470709508');
INSERT INTO `operation_08` VALUES ('763', '', '1', '添加了通知ID为127的信息', '106.2.164.226', '1470709592');
INSERT INTO `operation_08` VALUES ('764', '', '1', '添加了通知ID为128的信息', '106.2.164.226', '1470709643');
INSERT INTO `operation_08` VALUES ('765', '', '1', '修改了通知ID为127的信息', '106.2.164.226', '1470709673');
INSERT INTO `operation_08` VALUES ('766', '', '1', '删除了id为123的课程章节', '106.2.164.226', '1470709824');
INSERT INTO `operation_08` VALUES ('767', '', '1', '修改了id为111的订单状态', '106.2.164.226', '1470709902');
INSERT INTO `operation_08` VALUES ('768', '', '1', '异步日志为{\"sign\":\"3d801eab4fbf00181c1637dd65d640ee\",\"result_details\":\"2016080921001004220277926865^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 10:32:50\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"5a831f5ab3dc0b9dc6f98d0e060a515huq\",\"batch_no\":\"201608091470709945\",\"success_num\":\"1\"}', '110.75.242.225', '1470709970');
INSERT INTO `operation_08` VALUES ('769', '', '1', '异步日志为{\"sign\":\"bf9620edb46a77ad5a3a146747891a2e\",\"result_details\":\"2016080921001004140287947378^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 10:34:40\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"916768293779e824f91e2f9c2f95469ggq\",\"batch_no\":\"201608091470708484\",\"success_num\":\"1\"}', '110.75.225.253', '1470710080');
INSERT INTO `operation_08` VALUES ('770', '', '1', '异步日志为{\"sign\":\"ace4151be1c101aa06208fe4c9017514\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 10:38:01\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a855343399ca674a33e9f9dcf1b616dnka\",\"batch_no\":\"201608091470710257\",\"success_num\":\"0\"}', '110.75.152.1', '1470710281');
INSERT INTO `operation_08` VALUES ('771', '', '1', '添加了id为19的专题课程', '106.2.164.226', '1470710438');
INSERT INTO `operation_08` VALUES ('772', '', '1', '添加了id为142的课程章节', '106.2.164.226', '1470710453');
INSERT INTO `operation_08` VALUES ('773', '', '1', '添加了id为143的课程章节', '106.2.164.226', '1470710495');
INSERT INTO `operation_08` VALUES ('774', '', '1', '添加了id为144的课程章节', '106.2.164.226', '1470710527');
INSERT INTO `operation_08` VALUES ('775', '', '1', '异步日志为{\"sign\":\"798f06b7116de376d45ac654f9b5434c\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 10:42:07\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a855343399ca674a33e9f9dcf1b616dnka\",\"batch_no\":\"201608091470710257\",\"success_num\":\"0\"}', '110.75.152.3', '1470710527');
INSERT INTO `operation_08` VALUES ('776', '', '1', '添加了id为145的课程章节', '106.2.164.226', '1470710568');
INSERT INTO `operation_08` VALUES ('777', '', '1', '添加了id为146的课程章节', '106.2.164.226', '1470710581');
INSERT INTO `operation_08` VALUES ('778', '', '1', '添加了id为147的课程章节', '106.2.164.226', '1470710605');
INSERT INTO `operation_08` VALUES ('779', '', '1', '添加了id为148的课程章节', '106.2.164.226', '1470710630');
INSERT INTO `operation_08` VALUES ('780', '', '1', '添加了id为149的课程章节', '106.2.164.226', '1470710656');
INSERT INTO `operation_08` VALUES ('781', '', '1', '同步日志为[]', '127.0.0.1', '1470710901');
INSERT INTO `operation_08` VALUES ('782', '', '1', '删除了id为148的课程章节', '106.2.164.226', '1470710951');
INSERT INTO `operation_08` VALUES ('783', '', '1', '同步日志为[]', '106.2.164.226', '1470710959');
INSERT INTO `operation_08` VALUES ('784', '', '1', '修改了id为115的订单状态', '106.2.164.226', '1470711183');
INSERT INTO `operation_08` VALUES ('785', '', '1', '修改了id为115的订单应退金额', '106.2.164.226', '1470711191');
INSERT INTO `operation_08` VALUES ('786', '', '1', '修改了id为115的订单已退金额', '106.2.164.226', '1470711197');
INSERT INTO `operation_08` VALUES ('787', '', '1', '异步日志为{\"sign\":\"f295dabf1d639f45031419c6082d4442\",\"result_details\":\"2016080921001004140290026722^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 10:54:03\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a863078973f0e7805c7275bb7af72acmem\",\"batch_no\":\"201608091470711203\",\"success_num\":\"1\"}', '110.75.152.3', '1470711243');
INSERT INTO `operation_08` VALUES ('788', '', '1', '异步日志为{\"sign\":\"34a6a23d7a7af51e6da1332385f645ad\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 10:54:09\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a855343399ca674a33e9f9dcf1b616dnka\",\"batch_no\":\"201608091470710257\",\"success_num\":\"0\"}', '110.75.152.3', '1470711249');
INSERT INTO `operation_08` VALUES ('789', '', '1', '修改了id为19的专题课程', '106.2.164.226', '1470711441');
INSERT INTO `operation_08` VALUES ('790', '', '1', '异步日志为{\"sign\":\"935e8542f21f9540c757c70a1208038c\",\"result_details\":\"2016080821001004140280484275^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 11:01:04\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"50bdfd64dd7cb9e26911fd4f9e3e89ckbm\",\"batch_no\":\"201608091470710684\",\"success_num\":\"0\"}', '110.75.242.120', '1470711664');
INSERT INTO `operation_08` VALUES ('791', '', '1', '异步日志为{\"sign\":\"74578ad28cac2f59b9aba949085fd2cd\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 11:02:41\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a855343399ca674a33e9f9dcf1b616dnka\",\"batch_no\":\"201608091470710257\",\"success_num\":\"0\"}', '110.75.152.1', '1470711761');
INSERT INTO `operation_08` VALUES ('792', '', '0', '登陆了后台', '106.2.164.226', '1470711766');
INSERT INTO `operation_08` VALUES ('793', '', '1', '添加了id为150的课程章节', '106.2.164.226', '1470711858');
INSERT INTO `operation_08` VALUES ('794', '', '1', '异步日志为{\"sign\":\"b6ecbbf32fcd4cc8330855a40f28d464\",\"result_details\":\"2016080821001004140280484275^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 11:09:16\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"50bdfd64dd7cb9e26911fd4f9e3e89ckbm\",\"batch_no\":\"201608091470710684\",\"success_num\":\"0\"}', '110.75.242.89', '1470712156');
INSERT INTO `operation_08` VALUES ('795', '', '0', '登陆了后台', '106.2.164.226', '1470712892');
INSERT INTO `operation_08` VALUES ('796', '', '0', '登陆了后台', '106.2.164.226', '1470713199');
INSERT INTO `operation_08` VALUES ('797', 'admin', '1', '修改了id为105的订单应退金额', '106.2.164.226', '1470713320');
INSERT INTO `operation_08` VALUES ('798', 'admin', '1', '修改了id为105的订单已退金额', '106.2.164.226', '1470713449');
INSERT INTO `operation_08` VALUES ('799', 'admin', '1', '新增加了用户ID为20的名师', '106.2.164.226', '1470713745');
INSERT INTO `operation_08` VALUES ('800', 'admin', '1', '添加了id为20的名师推荐', '106.2.164.226', '1470713759');
INSERT INTO `operation_08` VALUES ('801', 'admin', '1', '修改了id为122的订单已退金额', '106.2.164.226', '1470713783');
INSERT INTO `operation_08` VALUES ('802', 'admin', '1', '删除了社区名师推荐D为2的信息', '106.2.164.226', '1470713885');
INSERT INTO `operation_08` VALUES ('803', 'admin', '1', '新增了社区名师推荐ID为6的信息', '106.2.164.226', '1470713893');
INSERT INTO `operation_08` VALUES ('804', 'admin', '1', '修改了id为121的订单状态', '127.0.0.1', '1470714139');
INSERT INTO `operation_08` VALUES ('805', 'admin', '1', '修改了id为121的订单应退金额', '127.0.0.1', '1470714208');
INSERT INTO `operation_08` VALUES ('806', 'admin', '1', '修改了id为121的订单已退金额', '127.0.0.1', '1470714216');
INSERT INTO `operation_08` VALUES ('807', 'admin', '1', '删除了id为9的专题课程', '106.2.164.226', '1470714243');
INSERT INTO `operation_08` VALUES ('808', 'admin', '1', '回收站还原了id为9的专题课程', '106.2.164.226', '1470714257');
INSERT INTO `operation_08` VALUES ('809', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470714293');
INSERT INTO `operation_08` VALUES ('810', 'admin', '1', '修改了id为122的订单状态', '106.2.164.226', '1470714321');
INSERT INTO `operation_08` VALUES ('811', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470714322');
INSERT INTO `operation_08` VALUES ('812', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470714343');
INSERT INTO `operation_08` VALUES ('813', 'admin', '1', '修改了id为122的订单状态', '106.2.164.226', '1470714344');
INSERT INTO `operation_08` VALUES ('814', 'admin', '1', '修改了id为122的订单已退金额', '106.2.164.226', '1470714350');
INSERT INTO `operation_08` VALUES ('815', 'admin', '1', '修改了id为121的订单状态', '127.0.0.1', '1470714357');
INSERT INTO `operation_08` VALUES ('816', 'admin', '1', '修改了id为122的订单状态', '106.2.164.226', '1470714373');
INSERT INTO `operation_08` VALUES ('817', 'admin', '1', '修改了公司介绍ID为3的信息', '106.2.164.226', '1470714375');
INSERT INTO `operation_08` VALUES ('818', 'admin', '1', '修改了id为122的订单已退金额', '106.2.164.226', '1470714383');
INSERT INTO `operation_08` VALUES ('819', 'admin', '1', '修改了id为27的订单状态', '106.2.164.226', '1470714426');
INSERT INTO `operation_08` VALUES ('820', 'admin', '1', '修改了id为122的订单状态', '106.2.164.226', '1470714601');
INSERT INTO `operation_08` VALUES ('821', 'admin', '1', '修改了id为122的订单状态', '127.0.0.1', '1470714600');
INSERT INTO `operation_08` VALUES ('822', 'admin', '1', '修改了id为122的订单状态', '127.0.0.1', '1470714601');
INSERT INTO `operation_08` VALUES ('823', 'admin', '1', '修改了id为123的订单状态', '127.0.0.1', '1470714608');
INSERT INTO `operation_08` VALUES ('824', 'admin', '1', '修改了id为122的订单已退金额', '106.2.164.226', '1470714611');
INSERT INTO `operation_08` VALUES ('825', 'admin', '1', '修改了id为123的订单状态', '127.0.0.1', '1470714616');
INSERT INTO `operation_08` VALUES ('826', 'whrcfzzj', '1', '~~~~~~~~~~~~~~~~~~~\"\\/lessonSubject\\/buySuccess\\/129\"', '106.2.164.226', '1470714645');
INSERT INTO `operation_08` VALUES ('827', 'admin', '1', '修改了id为110的订单已退金额', '127.0.0.1', '1470714662');
INSERT INTO `operation_08` VALUES ('828', 'admin', '1', '修改了id为96的订单已退金额', '106.2.164.226', '1470714664');
INSERT INTO `operation_08` VALUES ('829', 'admin', '1', '修改了bannerID为10的状态', '106.2.164.226', '1470714677');
INSERT INTO `operation_08` VALUES ('830', 'admin', '1', '修改了id为129的订单状态', '127.0.0.1', '1470714693');
INSERT INTO `operation_08` VALUES ('831', 'admin', '1', '修改了id为129的订单已退金额', '127.0.0.1', '1470714702');
INSERT INTO `operation_08` VALUES ('832', 'admin', '1', '修改了id为129的订单应退金额', '127.0.0.1', '1470714712');
INSERT INTO `operation_08` VALUES ('833', 'admin', '1', '修改了id为129的订单已退金额', '127.0.0.1', '1470714723');
INSERT INTO `operation_08` VALUES ('834', 'admin', '1', '修改了id为110的订单已退金额', '106.2.164.226', '1470714786');
INSERT INTO `operation_08` VALUES ('835', 'admin', '1', '修改了id为9的名师推荐', '106.2.164.226', '1470714804');
INSERT INTO `operation_08` VALUES ('836', 'admin', '1', '修改了id为110的订单已退金额', '106.2.164.226', '1470714858');
INSERT INTO `operation_08` VALUES ('837', 'admin', '1', '修改了id为110的订单已退金额', '106.2.164.226', '1470714875');
INSERT INTO `operation_08` VALUES ('838', 'admin', '1', '新增了用户ID为21的学员', '106.2.164.226', '1470720189');
INSERT INTO `operation_08` VALUES ('839', 'admin', '1', '新增加了用户ID为22的名师', '106.2.164.226', '1470720362');
INSERT INTO `operation_08` VALUES ('840', 'admin', '1', '新增加了用户ID为23的名师', '106.2.164.226', '1470720445');
INSERT INTO `operation_08` VALUES ('841', 'admin', '1', '添加了id为23的名师推荐', '106.2.164.226', '1470720456');
INSERT INTO `operation_08` VALUES ('842', 'admin', '1', '删除了社区名师推荐D为4的信息', '106.2.164.226', '1470720565');
INSERT INTO `operation_08` VALUES ('843', 'admin', '1', '删除了社区名师推荐D为5的信息', '106.2.164.226', '1470720570');
INSERT INTO `operation_08` VALUES ('844', 'admin', '1', '新增了社区名师推荐ID为7的信息', '106.2.164.226', '1470720576');
INSERT INTO `operation_08` VALUES ('845', 'admin', '1', '新增了社区名师推荐ID为8的信息', '106.2.164.226', '1470720587');
INSERT INTO `operation_08` VALUES ('846', 'admin', '1', '添加了id为10的专题课程推荐', '106.2.164.226', '1470720638');
INSERT INTO `operation_08` VALUES ('847', 'admin', '1', '删除了id为8的专题课程推荐', '106.2.164.226', '1470720664');
INSERT INTO `operation_08` VALUES ('848', 'admin', '1', '删除了id为9的专题课程推荐', '106.2.164.226', '1470720678');
INSERT INTO `operation_08` VALUES ('849', 'admin', '1', '修改了id为33演奏视频的审核状态', '106.2.164.226', '1470720911');
INSERT INTO `operation_08` VALUES ('850', 'admin', '1', '修改了id为34演奏视频的审核状态', '106.2.164.226', '1470721663');
INSERT INTO `operation_08` VALUES ('851', 'admin', '0', '登陆了后台', '127.0.0.1', '1470721707');
INSERT INTO `operation_08` VALUES ('852', 'admin', '1', '修改了id为94点评视频的审核状态', '106.2.164.226', '1470721819');
INSERT INTO `operation_08` VALUES ('853', 'admin', '1', '修改了id为134的订单状态', '127.0.0.1', '1470722363');
INSERT INTO `operation_08` VALUES ('854', 'admin', '1', '修改了id为134的订单应退金额', '127.0.0.1', '1470722374');
INSERT INTO `operation_08` VALUES ('855', 'admin', '1', '修改了id为134的订单已退金额', '127.0.0.1', '1470722383');
INSERT INTO `operation_08` VALUES ('856', 'admin', '0', '登陆了后台', '106.2.164.226', '1470722445');
INSERT INTO `operation_08` VALUES ('857', 'admin', '1', '修改了id为93点评视频的审核状态', '106.2.164.226', '1470722489');
INSERT INTO `operation_08` VALUES ('858', 'admin', '1', '修改了id为36演奏视频的审核状态', '106.2.164.226', '1470722710');
INSERT INTO `operation_08` VALUES ('859', 'admin', '1', '修改了id为93的点评视频信息', '106.2.164.226', '1470722777');
INSERT INTO `operation_08` VALUES ('860', 'admin', '1', '修改了id为95点评视频的审核状态', '106.2.164.226', '1470722786');
INSERT INTO `operation_08` VALUES ('861', 'admin', '1', '修改了id为94的点评视频信息', '106.2.164.226', '1470722840');
INSERT INTO `operation_08` VALUES ('862', 'admin', '1', '新增了用户ID为26的学员', '106.2.164.226', '1470722868');
INSERT INTO `operation_08` VALUES ('863', 'admin', '1', '修改了id为95的点评视频信息', '106.2.164.226', '1470722874');
INSERT INTO `operation_08` VALUES ('864', '', '1', '订单异步日志{\"sign\":\"fd41e0785dc4dc5e8187fbe7d2a2a346\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 14:10:31\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.49', '1470723031');
INSERT INTO `operation_08` VALUES ('865', '', '1', '订单异步日志{\"sign\":\"aea7546d6c23547071fc7f317469eaf8\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 14:11:51\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.169', '1470723111');
INSERT INTO `operation_08` VALUES ('866', 'admin', '1', '修改了id为37演奏视频的审核状态', '106.2.164.226', '1470723135');
INSERT INTO `operation_08` VALUES ('867', 'admin', '1', '修改了id为134的订单状态', '106.2.164.226', '1470723483');
INSERT INTO `operation_08` VALUES ('868', 'admin', '1', '修改了id为108的订单状态', '106.2.164.226', '1470723504');
INSERT INTO `operation_08` VALUES ('869', 'admin', '1', '修改了id为108的订单应退金额', '106.2.164.226', '1470723515');
INSERT INTO `operation_08` VALUES ('870', 'admin', '1', '修改了id为108的订单已退金额', '106.2.164.226', '1470723524');
INSERT INTO `operation_08` VALUES ('871', '', '1', '订单异步日志{\"sign\":\"8a785c0eaa2b99ebdf21e631e28cbe47\",\"result_details\":\"2016080821001004140282344503^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 14:19:16\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"7f582db262b49a38aebfb8cfb4a8d12l66\",\"batch_no\":\"201608091470723532\",\"success_num\":\"1\"}', '110.75.248.134', '1470723556');
INSERT INTO `operation_08` VALUES ('872', 'admin', '1', '修改了id为96点评视频的审核状态', '106.2.164.226', '1470723596');
INSERT INTO `operation_08` VALUES ('873', '', '1', '订单异步日志{\"sign\":\"5af70ee40a6d7d88d8a0bb4b00e969d8\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 14:22:23\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.131', '1470723744');
INSERT INTO `operation_08` VALUES ('874', '', '1', '订单异步日志{\"sign\":\"e30311c69b2dca9f337fc1cda30096db\",\"result_details\":\"2016080821001004220267901826^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 14:23:24\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"305c6ac54f20a05a4368fcdc7dd836bgum\",\"batch_no\":\"201608081470635939\",\"success_num\":\"1\"}', '110.75.225.7', '1470723804');
INSERT INTO `operation_08` VALUES ('875', '', '1', '订单交易号为2016080821001004220267901826的订单已退款', '110.75.225.7', '1470723804');
INSERT INTO `operation_08` VALUES ('876', '', '1', '订单异步日志{\"sign\":\"25c5d8995404b8b16790756a7f9db2bf\",\"result_details\":\"2016080821001004140282344503^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 14:23:51\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"7f582db262b49a38aebfb8cfb4a8d12l66\",\"batch_no\":\"201608091470723532\",\"success_num\":\"1\"}', '110.75.248.123', '1470723831');
INSERT INTO `operation_08` VALUES ('877', '', '1', '订单交易号为2016080821001004140282344503的订单已退款', '110.75.248.123', '1470723837');
INSERT INTO `operation_08` VALUES ('878', 'admin', '1', '修改了id为136的订单状态', '106.2.164.226', '1470723899');
INSERT INTO `operation_08` VALUES ('879', 'admin', '1', '修改了id为136的订单应退金额', '106.2.164.226', '1470723908');
INSERT INTO `operation_08` VALUES ('880', 'admin', '1', '修改了id为136的订单已退金额', '106.2.164.226', '1470723917');
INSERT INTO `operation_08` VALUES ('881', '', '1', '订单异步日志{\"sign\":\"9f19d2f3fa4ecafc851fcbd854c6e595\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 14:25:38\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.251', '1470723938');
INSERT INTO `operation_08` VALUES ('882', '', '1', '订单异步日志{\"sign\":\"a512c4744a4ec2a79503e811f441cf6e\",\"result_details\":\"2016080921001004140289965204^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 14:26:17\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"5e89094f85aa28e3db055f58d1a6c1ahjm\",\"batch_no\":\"201608091470723923\",\"success_num\":\"1\"}', '110.75.242.117', '1470723978');
INSERT INTO `operation_08` VALUES ('883', '', '1', '订单交易号为2016080921001004140289965204的订单已退款', '110.75.242.117', '1470723978');
INSERT INTO `operation_08` VALUES ('884', '', '1', '订单异步日志{\"sign\":\"eff7dcf1e6cd6c8bd06f8613c2d51712\",\"result_details\":\"2016080921001004140290266640^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 14:26:51\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"8234852e4f00a68b87a1f79d2a6e9adk0i\",\"batch_no\":\"201608091470722467\",\"success_num\":\"1\"}', '110.75.242.115', '1470724011');
INSERT INTO `operation_08` VALUES ('885', '', '1', '订单交易号为2016080921001004140290266640的订单已退款', '110.75.242.115', '1470724011');
INSERT INTO `operation_08` VALUES ('886', 'admin', '1', '删除了id为6的点评视频推荐', '106.2.164.226', '1470724049');
INSERT INTO `operation_08` VALUES ('887', 'admin', '1', '删除了id为3的点评视频推荐', '106.2.164.226', '1470724054');
INSERT INTO `operation_08` VALUES ('888', 'admin', '1', '删除了id为5的点评视频推荐', '106.2.164.226', '1470724060');
INSERT INTO `operation_08` VALUES ('889', 'admin', '1', '删除了id为9的点评视频推荐', '106.2.164.226', '1470724066');
INSERT INTO `operation_08` VALUES ('890', 'admin', '1', '添加了id为10的点评视频推荐', '106.2.164.226', '1470724118');
INSERT INTO `operation_08` VALUES ('891', 'admin', '1', '添加了id为11的点评视频推荐', '106.2.164.226', '1470724125');
INSERT INTO `operation_08` VALUES ('892', 'admin', '1', '添加了id为12的点评视频推荐', '106.2.164.226', '1470724133');
INSERT INTO `operation_08` VALUES ('893', 'admin', '1', '添加了id为13的点评视频推荐', '106.2.164.226', '1470724142');
INSERT INTO `operation_08` VALUES ('894', 'admin', '1', '添加了id为14的点评视频推荐', '106.2.164.226', '1470724165');
INSERT INTO `operation_08` VALUES ('895', 'admin', '1', '添加了id为15的点评视频推荐', '106.2.164.226', '1470724179');
INSERT INTO `operation_08` VALUES ('896', 'admin', '0', '登陆了后台', '127.0.0.1', '1470724180');
INSERT INTO `operation_08` VALUES ('897', 'admin', '1', '修改了id为96的点评视频信息', '106.2.164.226', '1470724265');
INSERT INTO `operation_08` VALUES ('898', '', '1', '订单异步日志{\"sign\":\"4241af768a544bc48ed01c4246a84d13\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 14:31:26\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.99', '1470724286');
INSERT INTO `operation_08` VALUES ('899', 'admin', '1', '修改了id为86的点评视频信息', '106.2.164.226', '1470724298');
INSERT INTO `operation_08` VALUES ('900', 'admin', '1', '修改了id为83的点评视频信息', '106.2.164.226', '1470724324');
INSERT INTO `operation_08` VALUES ('901', '', '1', '订单异步日志{\"sign\":\"b1df811453107262bb83443e687fc001\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 14:34:23\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.223', '1470724464');
INSERT INTO `operation_08` VALUES ('902', 'admin', '0', '登陆了后台', '106.2.164.226', '1470725426');
INSERT INTO `operation_08` VALUES ('903', 'admin', '0', '登陆了后台', '106.2.164.226', '1470725661');
INSERT INTO `operation_08` VALUES ('904', 'admin', '0', '登陆了后台', '106.2.164.226', '1470725718');
INSERT INTO `operation_08` VALUES ('905', 'admin', '1', '添加了通知ID为145的信息', '106.2.164.226', '1470725746');
INSERT INTO `operation_08` VALUES ('906', 'admin', '0', '登陆了后台', '106.2.164.226', '1470725793');
INSERT INTO `operation_08` VALUES ('907', 'admin', '1', '添加了通知ID为146的信息', '106.2.164.226', '1470725809');
INSERT INTO `operation_08` VALUES ('908', 'admin', '1', '修改了id为143的订单状态', '106.2.164.226', '1470726687');
INSERT INTO `operation_08` VALUES ('909', 'admin', '1', '修改了id为143的订单状态', '106.2.164.226', '1470726917');
INSERT INTO `operation_08` VALUES ('910', 'admin', '1', '修改了id为143的订单应退金额', '106.2.164.226', '1470726924');
INSERT INTO `operation_08` VALUES ('911', 'admin', '1', '修改了id为143的订单已退金额', '106.2.164.226', '1470726940');
INSERT INTO `operation_08` VALUES ('912', 'admin', '1', '修改了id为141的订单应退金额', '106.2.164.226', '1470727125');
INSERT INTO `operation_08` VALUES ('913', 'admin', '1', '修改了id为141的订单已退金额', '106.2.164.226', '1470727140');
INSERT INTO `operation_08` VALUES ('914', '', '1', '订单异步日志{\"sign\":\"61cc46f95c42b60d0835a5a3c9595228\",\"result_details\":\"2016080921001004220276741210^10.00^SUCCESS\",\"notify_time\":\"2016-08-09 15:21:30\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b4d7c1b98ebf6f85eaeafd26cd1d2a4lha\",\"batch_no\":\"201608091470727268\",\"success_num\":\"1\"}', '110.75.248.244', '1470727291');
INSERT INTO `operation_08` VALUES ('915', '', '1', '订单交易号为2016080921001004220276741210的订单已退款', '110.75.248.244', '1470727291');
INSERT INTO `operation_08` VALUES ('916', '', '1', '订单异步日志{\"sign\":\"41ff51e291acdef82be8644fb0971817\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 15:31:04\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.138', '1470727864');
INSERT INTO `operation_08` VALUES ('917', '', '1', '订单异步日志{\"sign\":\"a734d81cd62bd05a5edc2ac6d480993c\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 15:34:29\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.29', '1470728069');
INSERT INTO `operation_08` VALUES ('918', '', '1', '订单异步日志{\"sign\":\"f39fd6144dd638fef4e8d345357ac190\",\"result_details\":\"2016080821001004140283700014^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 15:47:42\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"5150cea312b7f3c65d6622f93d8ad43gji\",\"batch_no\":\"201608081470640912\",\"success_num\":\"1\"}', '110.75.225.227', '1470728862');
INSERT INTO `operation_08` VALUES ('919', '', '1', '订单交易号为2016080821001004140283700014的订单已退款', '110.75.225.227', '1470728862');
INSERT INTO `operation_08` VALUES ('920', '', '1', '订单异步日志{\"sign\":\"c3753799cea29c718cf7eac9aa27cc77\",\"result_details\":\"2016080821001004140283700014^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 15:50:29\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"792f3c8aa063b2915693f59ef30c81fj8q\",\"batch_no\":\"201608081470641186\",\"success_num\":\"0\"}', '110.75.242.53', '1470729029');
INSERT INTO `operation_08` VALUES ('921', 'admin', '0', '登陆了后台', '106.2.164.226', '1470729127');
INSERT INTO `operation_08` VALUES ('922', '', '1', '订单异步日志{\"sign\":\"b2b58f6bc69688c81a3712b6b460dda5\",\"result_details\":\"2016080821001004140280545915^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 15:55:03\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"7fea1799c15a6f1ead7e440f4692cf0k3a\",\"batch_no\":\"201608081470641431\",\"success_num\":\"1\"}', '110.75.242.37', '1470729304');
INSERT INTO `operation_08` VALUES ('923', '', '1', '订单交易号为2016080821001004140280545915的订单已退款', '110.75.242.37', '1470729304');
INSERT INTO `operation_08` VALUES ('924', '', '1', '订单异步日志{\"sign\":\"3d5505351f896b7653f25e4d19a7d583\",\"result_details\":\"2016080821001004140283700014^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 16:09:26\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"028ec0117bc33e80ecb72dcad75ca74kxu\",\"batch_no\":\"201608081470642207\",\"success_num\":\"0\"}', '110.75.248.124', '1470730166');
INSERT INTO `operation_08` VALUES ('925', 'admin', '0', '登陆了后台', '106.2.164.226', '1470730212');
INSERT INTO `operation_08` VALUES ('926', 'admin', '0', '登陆了后台', '106.2.164.226', '1470730331');
INSERT INTO `operation_08` VALUES ('927', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('928', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('929', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('930', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('931', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('932', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('933', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('934', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('935', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('936', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('937', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('938', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('939', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('940', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('941', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('942', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('943', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('944', 'admin', '1', '清除了垃圾订单', '106.2.164.226', '1470730367');
INSERT INTO `operation_08` VALUES ('945', 'admin', '0', '登陆了后台', '106.2.164.226', '1470730613');
INSERT INTO `operation_08` VALUES ('946', 'admin', '0', '登陆了后台', '106.2.164.226', '1470730745');
INSERT INTO `operation_08` VALUES ('947', '', '1', '订单异步日志{\"sign\":\"e42983393d325350b65032e441248189\",\"result_details\":\"2016080821001004690220565307^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 16:38:46\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"d61122725b7626ddd748863f95a9fcekjy\",\"batch_no\":\"201608081470643831\",\"success_num\":\"1\"}', '110.75.242.131', '1470731927');
INSERT INTO `operation_08` VALUES ('948', '', '1', '订单交易号为2016080821001004690220565307的订单已退款', '110.75.242.131', '1470731927');
INSERT INTO `operation_08` VALUES ('949', '', '1', '订单异步日志{\"sign\":\"84e2baa550fa381ecee3334dc746ba56\",\"result_details\":\"2016080821001004690224132830^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 16:43:10\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"f1a374751857374a800e5aadb3ba6edj5y\",\"batch_no\":\"201608081470644281\",\"success_num\":\"1\"}', '110.75.242.115', '1470732190');
INSERT INTO `operation_08` VALUES ('950', '', '1', '订单交易号为2016080821001004690224132830的订单已退款', '110.75.242.115', '1470732190');
INSERT INTO `operation_08` VALUES ('951', 'admin', '0', '登陆了后台', '106.2.164.226', '1470732370');
INSERT INTO `operation_08` VALUES ('952', 'admin', '1', '修改了id为117的订单已退金额', '127.0.0.1', '1470732480');
INSERT INTO `operation_08` VALUES ('953', 'admin', '1', '新增了用户ID为27的学员', '106.2.164.226', '1470732813');
INSERT INTO `operation_08` VALUES ('954', 'admin', '1', '修改了id为96的订单已退金额', '106.2.164.226', '1470732877');
INSERT INTO `operation_08` VALUES ('955', '', '1', '订单异步日志{\"sign\":\"502e91967ddd9dac54fa5688cfb2a970\",\"result_details\":\"2016080821001004140280545915^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 16:59:46\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"7051b816f709dd13f81c1b170505458n3m\",\"batch_no\":\"201608081470645243\",\"success_num\":\"0\"}', '110.75.152.1', '1470733186');
INSERT INTO `operation_08` VALUES ('956', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470733761');
INSERT INTO `operation_08` VALUES ('957', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470733795');
INSERT INTO `operation_08` VALUES ('958', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470733855');
INSERT INTO `operation_08` VALUES ('959', 'admin', '1', '修改了公司介绍ID为1的信息', '106.2.164.226', '1470733941');
INSERT INTO `operation_08` VALUES ('960', 'admin', '0', '登陆了后台', '106.2.164.226', '1470734300');
INSERT INTO `operation_08` VALUES ('961', '', '1', '订单异步日志{\"sign\":\"5c95943387a3152920bd6674c73bcd62\",\"result_details\":\"2016080821001004690218143544^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 17:20:23\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"288cedceb1f4c07f5f36198ca8db03emsi\",\"batch_no\":\"201608081470646531\",\"success_num\":\"1\"}', '110.75.152.3', '1470734423');
INSERT INTO `operation_08` VALUES ('962', '', '1', '订单交易号为2016080821001004690218143544的订单已退款', '110.75.152.3', '1470734423');
INSERT INTO `operation_08` VALUES ('963', 'admin', '1', '修改了id为39演奏视频的审核状态', '106.2.164.226', '1470734716');
INSERT INTO `operation_08` VALUES ('964', 'admin', '0', '登陆了后台', '106.2.164.226', '1470734894');
INSERT INTO `operation_08` VALUES ('965', '', '1', '订单异步日志{\"sign\":\"d550673e12555f942dc5f618380fcee2\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 17:31:19\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.189', '1470735080');
INSERT INTO `operation_08` VALUES ('966', '', '1', '订单异步日志{\"sign\":\"4f876a905fc6d9b88e2850e44d0cef22\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 17:35:25\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.128', '1470735325');
INSERT INTO `operation_08` VALUES ('967', '', '1', '订单异步日志{\"sign\":\"fb00c848c8634e8c5fa65c116441b549\",\"result_details\":\"2016080821001004690218143544^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 17:48:22\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"17d79d2229eb960d369c652317a3c87neq\",\"batch_no\":\"201608081470648150\",\"success_num\":\"0\"}', '110.75.152.1', '1470736102');
INSERT INTO `operation_08` VALUES ('968', 'admin', '0', '登陆了后台', '106.2.164.226', '1470736301');
INSERT INTO `operation_08` VALUES ('969', '', '1', '订单异步日志{\"sign\":\"6323edc68948e803ba7c8fcd2a554b7d\",\"result_details\":\"2016080821001004690223809428^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 17:54:21\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"1783a8ab5bce0ed01a6a8bd6aa71377mhe\",\"batch_no\":\"201608081470648484\",\"success_num\":\"1\"}', '110.75.152.2', '1470736461');
INSERT INTO `operation_08` VALUES ('970', '', '1', '订单交易号为2016080821001004690223809428的订单已退款', '110.75.152.2', '1470736461');
INSERT INTO `operation_08` VALUES ('971', 'admin', '1', '修改了id为119点评视频的审核状态', '106.2.164.226', '1470736733');
INSERT INTO `operation_08` VALUES ('972', 'admin', '0', '登陆了后台', '106.2.164.226', '1470736748');
INSERT INTO `operation_08` VALUES ('973', 'admin', '0', '登陆了后台', '106.2.164.226', '1470737067');
INSERT INTO `operation_08` VALUES ('974', 'admin', '1', '修改了id为119的点评视频信息', '106.2.164.226', '1470737113');
INSERT INTO `operation_08` VALUES ('975', 'admin', '1', '修改了id为39演奏视频的信息', '106.2.164.226', '1470737184');
INSERT INTO `operation_08` VALUES ('976', 'admin', '0', '登陆了后台', '106.2.164.226', '1470737266');
INSERT INTO `operation_08` VALUES ('977', '', '1', '订单异步日志{\"sign\":\"0203951fdd7663c464318b3d3391a358\",\"result_details\":\"2016080821001004140280484275^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 19:01:50\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"fdede139775a8b716f42ba59797448am6a\",\"batch_no\":\"201608081470652555\",\"success_num\":\"1\"}', '110.75.152.1', '1470740510');
INSERT INTO `operation_08` VALUES ('978', '', '1', '订单交易号为2016080821001004140280484275的订单已退款', '110.75.152.1', '1470740511');
INSERT INTO `operation_08` VALUES ('979', '', '1', '订单异步日志{\"sign\":\"d5eb551e9ccafcf9066e302b9908bc1f\",\"result_details\":\"2016080821001004220278202263^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 19:08:23\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"66c55d2ffd7f9599b0f9cd1d9ababe7ksa\",\"batch_no\":\"201608081470652975\",\"success_num\":\"1\"}', '110.75.248.211', '1470740903');
INSERT INTO `operation_08` VALUES ('980', '', '1', '订单交易号为2016080821001004220278202263的订单已退款', '110.75.248.211', '1470740909');
INSERT INTO `operation_08` VALUES ('981', '', '1', '订单异步日志{\"sign\":\"a782768d19ad225a4e8e39767cb99e74\",\"result_details\":\"2016080821001004140283809953^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 19:17:25\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"dd3f1c666a9762b1cd5eeab7bffb02em0q\",\"batch_no\":\"201608081470653533\",\"success_num\":\"1\"}', '110.75.248.190', '1470741445');
INSERT INTO `operation_08` VALUES ('982', '', '1', '订单交易号为2016080821001004140283809953的订单已退款', '110.75.248.190', '1470741446');
INSERT INTO `operation_08` VALUES ('983', '', '1', '订单异步日志{\"sign\":\"bfc82ad5f6ab0c5379de7ca7a8d97e23\",\"result_details\":\"2016080821001004140283015146^0.01^SUCCESS\",\"notify_time\":\"2016-08-09 19:28:17\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"f37c785757656f9affc41fe71d1b31chuq\",\"batch_no\":\"201608081470654014\",\"success_num\":\"1\"}', '110.75.242.1', '1470742098');
INSERT INTO `operation_08` VALUES ('984', '', '1', '订单交易号为2016080821001004140283015146的订单已退款', '110.75.242.1', '1470742098');
INSERT INTO `operation_08` VALUES ('985', '', '1', '订单异步日志{\"sign\":\"6e5d55fd0042228899f0fdec25ab26c7\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 19:40:31\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"bcf7ca8dccd8a7f12780ee5e315ae77nby\",\"batch_no\":\"201608081470654841\",\"success_num\":\"0\"}', '110.75.152.2', '1470742831');
INSERT INTO `operation_08` VALUES ('986', '', '1', '订单异步日志{\"sign\":\"27e6564126b70bca7b1bce396d000658\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 19:53:30\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"8469554c8026f2f553ac495f8ea9600js6\",\"batch_no\":\"201608081470655758\",\"success_num\":\"0\"}', '110.75.242.161', '1470743610');
INSERT INTO `operation_08` VALUES ('987', '', '1', '订单异步日志{\"sign\":\"9a55150229e71a1735e501c6f3540222\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 20:02:11\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a855343399ca674a33e9f9dcf1b616dnka\",\"batch_no\":\"201608091470710257\",\"success_num\":\"0\"}', '110.75.152.3', '1470744131');
INSERT INTO `operation_08` VALUES ('988', '', '1', '订单异步日志{\"sign\":\"22389bcd9ce43fd34ad5da8cdd1a7ce6\",\"result_details\":\"2016080821001004140280484275^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 20:09:15\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"50bdfd64dd7cb9e26911fd4f9e3e89ckbm\",\"batch_no\":\"201608091470710684\",\"success_num\":\"0\"}', '110.75.242.103', '1470744555');
INSERT INTO `operation_08` VALUES ('989', '', '1', '订单异步日志{\"sign\":\"f51858fce346beee42322d5e55169c34\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 23:31:14\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.116', '1470756675');
INSERT INTO `operation_08` VALUES ('990', '', '1', '订单异步日志{\"sign\":\"96250a47076bcc24709ff1d3ac31a6af\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-09 23:34:31\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.225', '1470756871');
INSERT INTO `operation_08` VALUES ('991', 'admin', '0', '登陆了后台', '106.2.164.226', '1470792478');
INSERT INTO `operation_08` VALUES ('992', 'admin', '0', '登陆了后台', '106.2.164.226', '1470793423');
INSERT INTO `operation_08` VALUES ('993', 'admin', '0', '登陆了后台', '106.2.164.226', '1470793450');
INSERT INTO `operation_08` VALUES ('994', 'admin', '0', '登陆了后台', '127.0.0.1', '1470793936');
INSERT INTO `operation_08` VALUES ('995', 'admin', '0', '登陆了后台', '106.2.164.226', '1470794370');
INSERT INTO `operation_08` VALUES ('996', 'admin', '0', '登陆了后台', '127.0.0.1', '1470794372');
INSERT INTO `operation_08` VALUES ('997', 'admin', '0', '登陆了后台', '106.2.164.226', '1470794466');
INSERT INTO `operation_08` VALUES ('998', 'admin', '1', '修改了id为161的订单状态', '106.2.164.226', '1470794478');
INSERT INTO `operation_08` VALUES ('999', 'admin', '1', '修改了id为161的订单状态', '106.2.164.226', '1470794501');
INSERT INTO `operation_08` VALUES ('1000', 'admin', '1', '添加了id为1的订单备注', '106.2.164.226', '1470794555');
INSERT INTO `operation_08` VALUES ('1001', 'admin', '1', '删除了id为17的专题课程', '127.0.0.1', '1470794818');
INSERT INTO `operation_08` VALUES ('1002', 'admin', '0', '登陆了后台', '106.2.164.226', '1470794999');
INSERT INTO `operation_08` VALUES ('1003', 'admin', '0', '登陆了后台', '106.2.164.226', '1470795830');
INSERT INTO `operation_08` VALUES ('1004', 'admin', '1', '新增加了用户ID为28的名师', '106.2.164.226', '1470795839');
INSERT INTO `operation_08` VALUES ('1005', 'admin', '1', '添加了id为28的名师推荐', '106.2.164.226', '1470795851');
INSERT INTO `operation_08` VALUES ('1006', 'admin', '1', '修改了id为40演奏视频的审核状态', '106.2.164.226', '1470795857');
INSERT INTO `operation_08` VALUES ('1007', 'admin', '1', '删除了用户ID为28的名师', '106.2.164.226', '1470795874');
INSERT INTO `operation_08` VALUES ('1008', 'admin', '1', '新增加了用户ID为29的名师', '127.0.0.1', '1470796150');
INSERT INTO `operation_08` VALUES ('1009', 'admin', '1', '添加了id为29的名师推荐', '127.0.0.1', '1470796162');
INSERT INTO `operation_08` VALUES ('1010', 'admin', '1', '删除了用户ID为29的名师', '127.0.0.1', '1470796173');
INSERT INTO `operation_08` VALUES ('1011', 'admin', '1', '修改了id为120的点评视频信息', '106.2.164.226', '1470796257');
INSERT INTO `operation_08` VALUES ('1012', 'admin', '1', '删除了id为5的专题课程推荐', '106.2.164.226', '1470796694');
INSERT INTO `operation_08` VALUES ('1013', 'admin', '1', '删除了id为1的专题课程推荐', '106.2.164.226', '1470796718');
INSERT INTO `operation_08` VALUES ('1014', 'admin', '1', '删除了id为8的点评视频推荐', '106.2.164.226', '1470796838');
INSERT INTO `operation_08` VALUES ('1015', 'admin', '1', '删除了id为15的点评视频推荐', '106.2.164.226', '1470796841');
INSERT INTO `operation_08` VALUES ('1016', 'admin', '1', '删除了id为14的点评视频推荐', '106.2.164.226', '1470796844');
INSERT INTO `operation_08` VALUES ('1017', 'admin', '1', '删除了id为13的点评视频推荐', '106.2.164.226', '1470796848');
INSERT INTO `operation_08` VALUES ('1018', 'admin', '1', '修改了id为11的名师推荐', '106.2.164.226', '1470797289');
INSERT INTO `operation_08` VALUES ('1019', 'admin', '1', '删除了id为11的名师推荐', '106.2.164.226', '1470797743');
INSERT INTO `operation_08` VALUES ('1020', 'admin', '1', '删除了id为12的名师推荐', '106.2.164.226', '1470797841');
INSERT INTO `operation_08` VALUES ('1021', 'admin', '1', '删除了id为9的名师推荐', '106.2.164.226', '1470797852');
INSERT INTO `operation_08` VALUES ('1022', 'admin', '1', '新增加了用户ID为30的名师', '106.2.164.226', '1470797923');
INSERT INTO `operation_08` VALUES ('1023', 'admin', '1', '修改了id为10的名师推荐', '106.2.164.226', '1470797931');
INSERT INTO `operation_08` VALUES ('1024', 'admin', '1', '添加了id为30的名师推荐', '106.2.164.226', '1470797939');
INSERT INTO `operation_08` VALUES ('1025', 'admin', '1', '删除了用户ID为30的名师', '106.2.164.226', '1470797974');
INSERT INTO `operation_08` VALUES ('1026', 'admin', '1', '添加了id为11的专题课程推荐', '106.2.164.226', '1470798006');
INSERT INTO `operation_08` VALUES ('1027', 'admin', '1', '删除了id为13的专题课程', '106.2.164.226', '1470798056');
INSERT INTO `operation_08` VALUES ('1028', 'admin', '1', '回收站还原了id为13的专题课程', '106.2.164.226', '1470798072');
INSERT INTO `operation_08` VALUES ('1029', 'admin', '1', '添加了id为16的点评视频推荐', '106.2.164.226', '1470798127');
INSERT INTO `operation_08` VALUES ('1030', '', '1', '订单异步日志{\"sign\":\"6b319c9afd587de7f59b14a70258f933\",\"result_details\":\"2016080821001004140283015146^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-10 11:02:35\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"a855343399ca674a33e9f9dcf1b616dnka\",\"batch_no\":\"201608091470710257\",\"success_num\":\"0\"}', '110.75.152.1', '1470798155');
INSERT INTO `operation_08` VALUES ('1031', 'admin', '1', '修改了id为94的订单状态', '106.2.164.226', '1470798195');
INSERT INTO `operation_08` VALUES ('1032', 'admin', '1', '删除了id为86的点评视频', '106.2.164.226', '1470798209');
INSERT INTO `operation_08` VALUES ('1033', 'admin', '1', '回收站还原了id为86的点评视频', '106.2.164.226', '1470798237');
INSERT INTO `operation_08` VALUES ('1034', 'admin', '1', '修改了id为7的点评视频推荐', '106.2.164.226', '1470798261');
INSERT INTO `operation_08` VALUES ('1035', '', '1', '订单异步日志{\"sign\":\"470501ef7654f891443bb8422df01b70\",\"result_details\":\"2016080821001004140280484275^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-10 11:09:31\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"50bdfd64dd7cb9e26911fd4f9e3e89ckbm\",\"batch_no\":\"201608091470710684\",\"success_num\":\"0\"}', '110.75.242.66', '1470798571');
INSERT INTO `operation_08` VALUES ('1036', 'admin', '0', '登陆了后台', '106.2.164.226', '1470798757');
INSERT INTO `operation_08` VALUES ('1037', 'admin', '1', '修改了id为126的课程章节', '106.2.164.226', '1470798835');
INSERT INTO `operation_08` VALUES ('1038', 'admin', '0', '登陆了后台', '106.2.164.226', '1470799848');
INSERT INTO `operation_08` VALUES ('1039', 'admin', '1', '修改了id为126的课程章节', '106.2.164.226', '1470799950');
INSERT INTO `operation_08` VALUES ('1040', 'admin', '1', '修改了id为126的课程章节', '106.2.164.226', '1470799967');
INSERT INTO `operation_08` VALUES ('1041', 'admin', '1', '删除了id为122的课程章节', '106.2.164.226', '1470800168');
INSERT INTO `operation_08` VALUES ('1042', 'admin', '1', '删除了id为105的课程章节', '106.2.164.226', '1470800174');
INSERT INTO `operation_08` VALUES ('1043', 'admin', '1', '删除了id为118的课程章节', '106.2.164.226', '1470800181');
INSERT INTO `operation_08` VALUES ('1044', 'admin', '1', '删除了id为121的课程章节', '106.2.164.226', '1470800186');
INSERT INTO `operation_08` VALUES ('1045', 'admin', '1', '删除了id为120的课程章节', '106.2.164.226', '1470800190');
INSERT INTO `operation_08` VALUES ('1046', 'admin', '1', '添加了id为151的课程章节', '106.2.164.226', '1470800268');
INSERT INTO `operation_08` VALUES ('1047', 'admin', '1', '删除了id为126的课程章节', '106.2.164.226', '1470800281');
INSERT INTO `operation_08` VALUES ('1048', 'admin', '1', '删除了id为125的课程章节', '106.2.164.226', '1470800286');
INSERT INTO `operation_08` VALUES ('1049', 'admin', '1', '删除了id为124的课程章节', '106.2.164.226', '1470800290');
INSERT INTO `operation_08` VALUES ('1050', 'admin', '1', '删除了id为107的课程章节', '106.2.164.226', '1470800293');
INSERT INTO `operation_08` VALUES ('1051', 'admin', '1', '添加了id为20的专题课程', '106.2.164.226', '1470800583');
INSERT INTO `operation_08` VALUES ('1052', 'admin', '1', '修改了id为20的专题课程', '106.2.164.226', '1470800601');
INSERT INTO `operation_08` VALUES ('1053', 'admin', '1', '添加了id为152的课程章节', '106.2.164.226', '1470800611');
INSERT INTO `operation_08` VALUES ('1054', 'admin', '1', '新增了热门视频ID为18的信息', '106.2.164.226', '1470807604');
INSERT INTO `operation_08` VALUES ('1055', 'admin', '1', '删除了热门视频ID为18的信息', '106.2.164.226', '1470807656');
INSERT INTO `operation_08` VALUES ('1056', 'admin', '0', '登陆了后台', '106.2.164.226', '1470807745');
INSERT INTO `operation_08` VALUES ('1057', 'admin', '1', '新增了热门视频ID为19的信息', '106.2.164.226', '1470807877');
INSERT INTO `operation_08` VALUES ('1058', 'admin', '1', '新增了热门视频ID为20的信息', '106.2.164.226', '1470808352');
INSERT INTO `operation_08` VALUES ('1059', 'admin', '0', '登陆了后台', '127.0.0.1', '1470808405');
INSERT INTO `operation_08` VALUES ('1060', 'admin', '1', '新增了热门视频ID为21的信息', '106.2.164.226', '1470809204');
INSERT INTO `operation_08` VALUES ('1061', 'admin', '0', '登陆了后台', '106.2.164.226', '1470810110');
INSERT INTO `operation_08` VALUES ('1062', 'admin', '0', '登陆了后台', '106.2.164.226', '1470810390');
INSERT INTO `operation_08` VALUES ('1063', 'admin', '0', '登陆了后台', '106.2.164.226', '1470810463');
INSERT INTO `operation_08` VALUES ('1064', 'admin', '1', '修改了id为13的专题课程', '106.2.164.226', '1470810494');
INSERT INTO `operation_08` VALUES ('1065', '', '1', '订单异步日志{\"sign\":\"8d5221f48b5bdc258bc0381b94c0026e\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-10 14:31:46\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"b3e11f1dab7cd7ea0df1d460f229da9k0i\",\"batch_no\":\"201608091470722780\",\"success_num\":\"0\"}', '110.75.242.50', '1470810706');
INSERT INTO `operation_08` VALUES ('1066', '', '1', '订单异步日志{\"sign\":\"1645cfa79c024de333815b7991f4160e\",\"result_details\":\"2016080921001004140290266640^0.01^TRADE_HAS_CLOSED\",\"notify_time\":\"2016-08-10 14:34:26\",\"sign_type\":\"MD5\",\"notify_type\":\"batch_refund_notify\",\"notify_id\":\"03e09fa033c0d8492015796a5dbc66dgma\",\"batch_no\":\"201608091470723010\",\"success_num\":\"0\"}', '110.75.225.79', '1470810866');
INSERT INTO `operation_08` VALUES ('1067', 'admin', '1', '修改了id为148的订单已退金额', '106.2.164.226', '1470811210');
INSERT INTO `operation_08` VALUES ('1068', 'admin', '1', '新增了热门视频ID为22的信息', '106.2.164.226', '1470813053');
INSERT INTO `operation_08` VALUES ('1069', 'admin', '1', '修改了id为148的订单状态', '106.2.164.226', '1470813109');
INSERT INTO `operation_08` VALUES ('1070', 'admin', '0', '登陆了后台', '106.2.164.226', '1470813172');
INSERT INTO `operation_08` VALUES ('1071', 'admin', '1', '修改了id为182的订单状态', '106.2.164.226', '1470813186');
INSERT INTO `operation_08` VALUES ('1072', 'admin', '1', '修改了id为182的订单应退金额', '106.2.164.226', '1470813202');
INSERT INTO `operation_08` VALUES ('1073', 'admin', '0', '登陆了后台', '106.2.164.226', '1470813206');
INSERT INTO `operation_08` VALUES ('1074', 'admin', '1', '修改了id为182的订单已退金额', '106.2.164.226', '1470813208');
INSERT INTO `operation_08` VALUES ('1075', 'admin', '1', 'id为182的订单确认了退款', '106.2.164.226', '1470813234');
INSERT INTO `operation_08` VALUES ('1076', 'admin', '1', '修改了id为147的订单已退金额', '106.2.164.226', '1470813351');
INSERT INTO `operation_08` VALUES ('1077', 'admin', '1', 'id为147的订单确认了退款', '106.2.164.226', '1470813359');
INSERT INTO `operation_08` VALUES ('1078', 'admin', '1', 'id为147的订单确认了退款', '106.2.164.226', '1470813360');
INSERT INTO `operation_08` VALUES ('1079', 'admin', '1', '添加了id为153的课程章节', '106.2.164.226', '1470813528');
INSERT INTO `operation_08` VALUES ('1080', 'admin', '1', '修改了id为46演奏视频的审核状态', '106.2.164.226', '1470813867');
INSERT INTO `operation_08` VALUES ('1081', 'admin', '1', '修改了id为121点评视频的审核状态', '106.2.164.226', '1470814124');
INSERT INTO `operation_08` VALUES ('1082', 'admin', '1', '新增了热门视频ID为23的信息', '106.2.164.226', '1470814613');
INSERT INTO `operation_08` VALUES ('1083', 'admin', '1', '修改了id为47演奏视频的审核状态', '106.2.164.226', '1470814866');
INSERT INTO `operation_08` VALUES ('1084', 'admin', '1', '修改了id为6的专题课程', '106.2.164.226', '1470816763');
INSERT INTO `operation_08` VALUES ('1085', 'admin', '1', '新增了热门视频ID为24的信息', '106.2.164.226', '1470816781');
INSERT INTO `operation_08` VALUES ('1086', 'admin', '1', '删除了热门视频ID为23的信息', '106.2.164.226', '1470816788');
INSERT INTO `operation_08` VALUES ('1087', 'admin', '1', '修改了热门视频ID为24的信息', '106.2.164.226', '1470816843');
INSERT INTO `operation_08` VALUES ('1088', 'admin', '1', '删除了热门视频ID为24的信息', '106.2.164.226', '1470816856');
INSERT INTO `operation_08` VALUES ('1089', 'admin', '1', '修改了id为6的专题课程', '106.2.164.226', '1470816944');
INSERT INTO `operation_08` VALUES ('1090', 'admin', '1', '修改了id为184的订单应退金额', '106.2.164.226', '1470817255');
INSERT INTO `operation_08` VALUES ('1091', 'admin', '1', '修改了id为184的订单已退金额', '106.2.164.226', '1470817364');
INSERT INTO `operation_08` VALUES ('1092', 'admin', '1', '修改了id为12的专题课程', '106.2.164.226', '1470817575');
INSERT INTO `operation_08` VALUES ('1093', 'admin', '1', '修改了id为186的订单状态', '106.2.164.226', '1470817675');
INSERT INTO `operation_08` VALUES ('1094', 'admin', '1', '修改了id为186的订单状态', '106.2.164.226', '1470817693');
INSERT INTO `operation_08` VALUES ('1095', 'admin', '1', '修改了id为186的订单状态', '106.2.164.226', '1470817817');
INSERT INTO `operation_08` VALUES ('1096', 'admin', '1', '新增了热门视频ID为25的信息', '106.2.164.226', '1470817829');
INSERT INTO `operation_08` VALUES ('1097', 'admin', '1', '修改了热门视频ID为25的信息', '106.2.164.226', '1470817853');
INSERT INTO `operation_08` VALUES ('1098', 'admin', '1', '修改了id为186的订单状态', '106.2.164.226', '1470817934');
INSERT INTO `operation_08` VALUES ('1099', 'admin', '1', '修改了id为141的订单状态', '106.2.164.226', '1470818193');
INSERT INTO `operation_08` VALUES ('1100', 'admin', '1', '修改了id为45演奏视频的审核状态', '106.2.164.226', '1470818491');
INSERT INTO `operation_08` VALUES ('1101', 'admin', '1', '修改了id为141的订单状态', '127.0.0.1', '1470818581');
INSERT INTO `operation_08` VALUES ('1102', 'admin', '1', '修改了id为49演奏视频的审核状态', '106.2.164.226', '1470818888');
INSERT INTO `operation_08` VALUES ('1103', 'admin', '1', '修改了id为45演奏视频的审核状态', '106.2.164.226', '1470818916');
INSERT INTO `operation_08` VALUES ('1104', 'admin', '1', '新增了热门视频ID为26的信息', '106.2.164.226', '1470818944');
INSERT INTO `operation_08` VALUES ('1105', 'admin', '1', '修改了id为45演奏视频的审核状态', '106.2.164.226', '1470818971');
INSERT INTO `operation_08` VALUES ('1106', 'admin', '1', '修改了id为122点评视频的审核状态', '106.2.164.226', '1470818992');
INSERT INTO `operation_08` VALUES ('1107', 'admin', '0', '登陆了后台', '106.2.164.226', '1470819020');
INSERT INTO `operation_08` VALUES ('1108', 'admin', '1', '新增了热门视频ID为27的信息', '106.2.164.226', '1470819175');
INSERT INTO `operation_08` VALUES ('1109', 'admin', '1', '修改了id为45演奏视频的审核状态', '106.2.164.226', '1470819316');
INSERT INTO `operation_08` VALUES ('1110', 'admin', '1', '新增了热门视频ID为28的信息', '106.2.164.226', '1470819506');
INSERT INTO `operation_08` VALUES ('1111', 'admin', '1', '修改了id为44演奏视频的审核状态', '106.2.164.226', '1470819807');
INSERT INTO `operation_08` VALUES ('1112', 'admin', '1', '修改了id为153的课程章节', '106.2.164.226', '1470819819');
INSERT INTO `operation_08` VALUES ('1113', 'admin', '1', '修改了id为43演奏视频的审核状态', '106.2.164.226', '1470819918');
INSERT INTO `operation_08` VALUES ('1114', 'admin', '1', '修改了id为6的专题课程推荐', '106.2.164.226', '1470819969');
INSERT INTO `operation_08` VALUES ('1115', 'admin', '1', '修改了id为6的专题课程推荐', '106.2.164.226', '1470819993');
INSERT INTO `operation_08` VALUES ('1116', 'admin', '1', '修改了id为49演奏视频的审核状态', '106.2.164.226', '1470820696');
INSERT INTO `operation_08` VALUES ('1117', 'admin', '1', '修改了id为50演奏视频的审核状态', '106.2.164.226', '1470820746');
INSERT INTO `operation_08` VALUES ('1118', 'admin', '1', '修改了id为134点评视频的审核状态', '106.2.164.226', '1470820789');
INSERT INTO `operation_08` VALUES ('1119', 'admin', '1', '新增了热门视频ID为29的信息', '106.2.164.226', '1470820962');
INSERT INTO `operation_08` VALUES ('1120', 'admin', '1', '修改了id为50演奏视频的信息', '106.2.164.226', '1470821074');
INSERT INTO `operation_08` VALUES ('1121', 'admin', '1', '新增了热门视频ID为30的信息', '106.2.164.226', '1470821144');
INSERT INTO `operation_08` VALUES ('1122', 'admin', '1', '修改了id为135点评视频的审核状态', '106.2.164.226', '1470821176');
INSERT INTO `operation_08` VALUES ('1123', 'admin', '1', '修改了id为42演奏视频的审核状态', '106.2.164.226', '1470821300');
INSERT INTO `operation_08` VALUES ('1124', 'admin', '1', '修改了id为41演奏视频的审核状态', '106.2.164.226', '1470821414');
INSERT INTO `operation_08` VALUES ('1125', 'admin', '1', '修改了id为41演奏视频的审核状态', '106.2.164.226', '1470821740');
INSERT INTO `operation_08` VALUES ('1126', 'admin', '1', '修改了id为42演奏视频的审核状态', '106.2.164.226', '1470821771');
INSERT INTO `operation_08` VALUES ('1127', 'admin', '1', '修改了id为42演奏视频的审核状态', '106.2.164.226', '1470821790');
INSERT INTO `operation_08` VALUES ('1128', 'admin', '1', '修改了id为51演奏视频的审核状态', '106.2.164.226', '1470822920');
INSERT INTO `operation_08` VALUES ('1129', 'admin', '0', '登陆了后台', '106.2.164.226', '1470878785');
INSERT INTO `operation_08` VALUES ('1130', 'admin', '0', '登陆了后台', '106.2.164.226', '1470879104');
INSERT INTO `operation_08` VALUES ('1131', 'admin', '0', '登陆了后台', '106.2.164.226', '1470879151');
INSERT INTO `operation_08` VALUES ('1132', 'admin', '0', '登陆了后台', '106.2.164.226', '1470879188');
INSERT INTO `operation_08` VALUES ('1133', 'admin', '1', '修改了id为52演奏视频的审核状态', '106.2.164.226', '1470879249');
INSERT INTO `operation_08` VALUES ('1134', 'admin', '0', '登陆了后台', '127.0.0.1', '1470879274');
INSERT INTO `operation_08` VALUES ('1135', 'admin', '0', '登陆了后台', '106.2.164.226', '1470879342');
INSERT INTO `operation_08` VALUES ('1136', 'admin', '1', '修改了id为136点评视频的审核状态', '106.2.164.226', '1470879674');
INSERT INTO `operation_08` VALUES ('1137', 'admin', '1', '修改了id为136点评视频的审核状态', '106.2.164.226', '1470879805');

-- ----------------------------
-- Table structure for `operation_09`
-- ----------------------------
DROP TABLE IF EXISTS `operation_09`;
CREATE TABLE `operation_09` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_09
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_10`
-- ----------------------------
DROP TABLE IF EXISTS `operation_10`;
CREATE TABLE `operation_10` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_10
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_11`
-- ----------------------------
DROP TABLE IF EXISTS `operation_11`;
CREATE TABLE `operation_11` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_11
-- ----------------------------

-- ----------------------------
-- Table structure for `operation_12`
-- ----------------------------
DROP TABLE IF EXISTS `operation_12`;
CREATE TABLE `operation_12` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `type` tinyint(1) DEFAULT NULL COMMENT '操作类型 登录为0  1位其他所有',
  `action` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作动作',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `create_at` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='操作日志 按月划分';

-- ----------------------------
-- Records of operation_12
-- ----------------------------

-- ----------------------------
-- Table structure for `orders`
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '订单ID主键',
  `orderSn` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单号',
  `tradeSn` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '第三方平台交易订单号',
  `orderTitle` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单标题',
  `orderPrice` int(11) DEFAULT NULL COMMENT '订单价格  价格乘以100 存储',
  `payPrice` int(11) DEFAULT NULL COMMENT '实付金额 价格乘以100 存储',
  `payType` tinyint(1) DEFAULT NULL COMMENT '支付方式 0位支付宝 1为微信支付',
  `userId` int(10) DEFAULT NULL COMMENT '订单用户ID',
  `userName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单用户名',
  `teacherId` int(10) DEFAULT NULL COMMENT '邀请ID',
  `teacherName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邀请人用户名',
  `orderType` tinyint(1) DEFAULT NULL COMMENT '0为购买专题订单 1位点评申请订单 2位购买点评订单',
  `courseId` int(8) DEFAULT NULL COMMENT '专题课程ID',
  `status` tinyint(1) DEFAULT '5' COMMENT '订单状态 \r\n已付款-0  \r\n待点评-1\r\n已完成-2\r\n退款中-3\r\n已退款-4 \r\n未付款-5',
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '是否删除 0位正常 1位虚拟删除',
  `refundableAmount` int(8) DEFAULT NULL COMMENT '应退金额*100存储',
  `refundAmount` int(8) DEFAULT NULL COMMENT '已退金额*100存储',
  `payTime` datetime DEFAULT NULL COMMENT '付款时间',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderSn` (`orderSn`)
) ENGINE=MyISAM AUTO_INCREMENT=191 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单主表';

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '2016080457a307ff34aa9', '4000922001201608040559694858', '学员wangchenkai申请罗宁老师点评。', '1', '1', '1', '3', 'wangchenkai', '5', '罗宁', '1', null, '0', '0', null, null, '2016-08-04 17:17:11', '2016-08-04 17:16:47', '2016-08-04 17:16:47');
INSERT INTO `orders` VALUES ('2', '2016080457a308f702e78', '2016080421001004830267277428', '学员wangchenkai申请罗宁老师点评。', '1', '1', '0', '3', 'wangchenkai', '5', '罗宁', '1', '1', '2', '0', null, null, '2016-08-04 17:21:13', '2016-08-04 17:20:55', '2016-08-04 18:26:52');
INSERT INTO `orders` VALUES ('3', '2016080457a30b9bd9a6b', '4009422001201608040560283269', '学员xueyuan申请罗宁老师点评。', '1', '1', '1', '7', 'xueyuan', '5', '罗宁', '1', '6', '2', '0', '1', '1', '2016-08-04 17:32:48', '2016-08-04 17:32:11', '2016-08-04 19:36:49');
INSERT INTO `orders` VALUES ('168', '2016081057aac37e0ba21', '4003712001201608101018607062', '学员ceshi1申请李民老师点评。', '1', '1', '1', '2', 'ceshi1', '20', '李民', '1', '121', '2', '0', null, null, '2016-08-10 14:03:07', '2016-08-10 14:02:38', '2016-08-10 14:02:38');
INSERT INTO `orders` VALUES ('10', '2016080457a31d0b462ce', '2016080421001004220274474547', '学员xueyuan申请罗宁老师点评。', '1', '1', '0', '7', 'xueyuan', '5', '罗宁', '1', '7', '2', '0', null, null, '2016-08-04 18:47:08', '2016-08-04 18:46:35', '2016-08-04 18:46:35');
INSERT INTO `orders` VALUES ('167', '20160810140229_57aac3752c89a', null, '李云迪——雨滴', '1', null, '1', '2', 'ceshi1', null, null, '0', '13', '5', '0', null, null, null, '2016-08-10 14:02:29', '2016-08-10 14:02:29');
INSERT INTO `orders` VALUES ('166', '20160810135727_57aac247f2e28', null, '超高标转换', '3', null, '0', '2', 'ceshi1', null, null, '0', '15', '5', '0', null, null, null, '2016-08-10 13:57:27', '2016-08-10 13:57:27');
INSERT INTO `orders` VALUES ('9', '2016080457a31018dd85b', '2016080421001004830264879152', '学员wangchenkai申请罗宁老师点评。', '1', '1', '0', '3', 'wangchenkai', '5', '罗宁', '1', '2', '2', '0', null, null, '2016-08-04 17:51:51', '2016-08-04 17:51:20', '2016-08-04 17:51:20');
INSERT INTO `orders` VALUES ('11', '2016080457a320c8c8bab', '2016080421001004220275765581', '学员wangchenkai申请罗宁老师点评。', '1', '1', '0', '3', 'wangchenkai', '5', '罗宁', '1', '8', '2', '0', null, null, '2016-08-04 19:03:03', '2016-08-04 19:02:32', '2016-08-04 19:02:32');
INSERT INTO `orders` VALUES ('165', '2016081057aabbd41bc32', null, '学员whrcfzzj购买apologize_标清.flv点评课程。', '1', null, '0', '16', 'whrcfzzj', '8', 'langlang', '2', '84', '5', '0', null, null, null, '2016-08-10 13:29:56', '2016-08-10 13:29:56');
INSERT INTO `orders` VALUES ('13', '2016080457a326378d00d', '2016080421001004220276521300', '学员qinying申请罗宁老师点评。', '1', '1', '0', '9', 'qinying', '5', '罗宁', '1', '9', '2', '0', null, null, '2016-08-04 19:26:11', '2016-08-04 19:25:43', '2016-08-04 19:25:43');
INSERT INTO `orders` VALUES ('164', '20160810132929_57aabbb90e45a', null, '顺序播放', '3', null, '0', '16', 'whrcfzzj', null, null, '0', '19', '5', '0', null, null, null, '2016-08-10 13:29:29', '2016-08-10 13:29:29');
INSERT INTO `orders` VALUES ('17', '2016080457a328c333352', '4009422001201608040571460349', '学员ceshi2购买通知1点评课程。', '1', '1', '1', '6', 'ceshi2', '5', '罗宁', '2', '9', '2', '0', null, null, '2016-08-04 19:36:56', '2016-08-04 19:36:35', '2016-08-04 19:36:35');
INSERT INTO `orders` VALUES ('50', '20160805134021_57a426c50afbc', '4004292001201608050624258593', '周杰伦——世界末日', '1', '1', '1', '2', 'ceshi1', null, null, '0', '8', '2', '0', null, null, '2016-08-05 16:47:29', '2016-08-05 13:40:21', '2016-08-05 13:40:21');
INSERT INTO `orders` VALUES ('163', '2016081057aabb83ce7ab', null, '学员whrcfzzj购买动漫点评课程。', '1', null, '0', '16', 'whrcfzzj', '5', '罗宁', '2', '7', '5', '0', null, null, null, '2016-08-10 13:28:35', '2016-08-10 13:28:35');
INSERT INTO `orders` VALUES ('20', '2016080557a3f5e252b20', '4009422001201608050606137928', '学员qinying购买第二次测试~~点评课程。', '1', '1', '1', '9', 'qinying', '5', '罗宁', '2', '1', '2', '0', null, null, '2016-08-05 10:12:05', '2016-08-05 10:11:46', '2016-08-05 10:11:46');
INSERT INTO `orders` VALUES ('162', '2016081057aa8f877622e', '4000922001201608100999662487', '学员wangchenkai申请李民老师点评。', '1', '1', '1', '3', 'wangchenkai', '20', '李民', '1', '120', '1', '0', null, null, '2016-08-10 10:21:13', '2016-08-10 10:20:55', '2016-08-10 10:20:55');
INSERT INTO `orders` VALUES ('161', '2016081057aa87ec3010d', '4001202001201608100998579912', '学员ceshi1申请李民老师点评。', '1', '1', '1', '2', 'ceshi1', '20', '李民', '1', '122', '1', '0', null, null, '2016-08-10 09:51:18', '2016-08-10 09:48:28', '2016-08-10 10:01:41');
INSERT INTO `orders` VALUES ('27', '2016080557a4082f773f3', '2016080521001004690218888744', '学员ceshi1申请langlang老师点评。', '1', '1', '0', '2', 'ceshi1', '8', 'langlang', '1', '70', '4', '0', null, null, '2016-08-05 11:30:33', '2016-08-05 11:29:51', '2016-08-09 11:47:06');
INSERT INTO `orders` VALUES ('160', '2016080957a9a0c55bbb1', '4001202001201608090946088721', '学员whrcfzzj申请李民老师点评。', '1', '1', '1', '16', 'whrcfzzj', '20', '李民', '1', '119', '2', '0', null, null, '2016-08-09 17:23:17', '2016-08-09 17:22:13', '2016-08-09 17:22:13');
INSERT INTO `orders` VALUES ('57', '2016080557a4462c13ac8', '4009422001201608050633632400', '学员qinying申请周杰伦老师点评。', '1', '1', '1', '9', 'qinying', '13', '周杰伦', '1', '92', '1', '0', null, null, '2016-08-05 15:54:34', '2016-08-05 15:54:20', '2016-08-05 15:54:20');
INSERT INTO `orders` VALUES ('58', '20160805163803_57a4506b2a8e2', '4004292001201608050637187228', '贝多芬系列交响乐', '1', '1', '1', '3', 'wangchenkai', null, null, '0', '11', '2', '0', null, null, '2016-08-05 17:12:18', '2016-08-05 16:38:03', '2016-08-05 16:38:03');
INSERT INTO `orders` VALUES ('59', '20160805164202_57a4515aad28f', '4004292001201608050637339500', '贝多芬系列交响乐', '1', '1', '1', '3', 'wangchenkai', null, null, '0', '11', '2', '0', null, null, '2016-08-05 16:46:26', '2016-08-05 16:42:02', '2016-08-05 16:42:02');
INSERT INTO `orders` VALUES ('76', '2016080857a7f6326140d', '4006332001201608080841649345', '学员ceshi2申请周杰伦老师点评。', '1', '1', '1', '6', 'ceshi2', '13', '周杰伦', '1', '81', '2', '0', null, null, '2016-08-08 11:02:26', '2016-08-08 11:02:10', '2016-08-08 11:02:10');
INSERT INTO `orders` VALUES ('77', '20160808110335_57a7f687612d5', '2016080821001004220278202263', '周杰伦——mine钢琴演奏版', '1', '1', '0', '9', 'qinying', null, null, '0', '6', '4', '0', '1', '1', '2016-08-08 11:04:11', '2016-08-08 11:03:35', '2016-08-08 18:42:07');
INSERT INTO `orders` VALUES ('123', '20160809113924_57a9506c52dbc', null, '顺序播放', '3', null, '0', '2', 'ceshi1', null, null, '0', '19', '4', '0', null, null, null, '2016-08-09 11:39:24', '2016-08-09 11:50:16');
INSERT INTO `orders` VALUES ('124', '20160809114032_57a950b0c8da1', null, '顺序播放', '3', null, '1', '2', 'ceshi1', null, null, '0', '19', '5', '0', null, null, null, '2016-08-09 11:40:32', '2016-08-09 11:40:32');
INSERT INTO `orders` VALUES ('54', '2016080557a444515a609', '4006332001201608050633359705', '学员ceshi2购买《梨花又开放》点评课程。', '1', '1', '1', '6', 'ceshi2', '8', 'langlang', '2', '70', '2', '0', null, null, '2016-08-05 15:46:45', '2016-08-05 15:46:25', '2016-08-05 15:46:25');
INSERT INTO `orders` VALUES ('159', '2016080957a99db57c187', null, '学员ceshi4购买《有没有》点评课程。', '1', null, '1', '27', 'ceshi4', '10', 'yundi', '2', '82', '5', '0', null, null, null, '2016-08-09 17:09:09', '2016-08-09 17:09:09');
INSERT INTO `orders` VALUES ('55', '2016080557a44490d481c', '4006332001201608050633387285', '学员ceshi2申请yundi老师点评。', '1', '1', '1', '6', 'ceshi2', '10', 'yundi', '1', '71', '2', '0', null, null, '2016-08-05 15:47:41', '2016-08-05 15:47:28', '2016-08-05 15:47:28');
INSERT INTO `orders` VALUES ('75', '2016080857a7f2408d4d7', '4006332001201608080840193758', '学员ceshi2申请langlang老师点评。', '1', '1', '1', '6', 'ceshi2', '8', 'langlang', '1', '87', '1', '0', null, null, '2016-08-08 10:45:33', '2016-08-08 10:45:20', '2016-08-08 10:45:20');
INSERT INTO `orders` VALUES ('74', '2016080857a7e3afc5486', '2016080821001004690224345464', '学员ceshi1申请langlang老师点评。', '1', '1', '0', '2', 'ceshi1', '8', 'langlang', '1', '80', '4', '0', '1', '1', '2016-08-08 09:43:39', '2016-08-08 09:43:11', '2016-08-08 11:47:25');
INSERT INTO `orders` VALUES ('52', '20160805135045_57a42935b2caf', '4004292001201608050626601402', '周杰伦——世界末日', '1', '1', '1', '16', 'whrcfzzj', null, null, '0', '8', '2', '0', null, null, '2016-08-05 16:55:15', '2016-08-05 13:50:45', '2016-08-05 13:50:45');
INSERT INTO `orders` VALUES ('61', '20160805164358_57a451ce5f436', '4004292001201608050637422054', '贝多芬系列交响乐', '1', '1', '1', '3', 'wangchenkai', null, null, '0', '11', '3', '0', '1', null, '2016-08-05 16:44:08', '2016-08-05 16:43:58', '2016-08-05 16:43:58');
INSERT INTO `orders` VALUES ('158', '2016080957a99bd155b5e', null, '学员ceshi4申请周杰伦老师点评。', '1', null, '0', '27', 'ceshi4', '13', '周杰伦', '1', null, '5', '0', null, null, null, '2016-08-09 17:01:05', '2016-08-09 17:01:05');
INSERT INTO `orders` VALUES ('63', '20160805165023_57a4534f2f7fd', '4009422001201608050638927836', '周杰伦——皮影戏钢琴演奏版', '1', '1', '1', '9', 'qinying', null, null, '0', '7', '2', '0', null, null, '2016-08-05 16:50:39', '2016-08-05 16:50:23', '2016-08-05 16:50:23');
INSERT INTO `orders` VALUES ('64', '20160805172053_57a45a7504b34', '4006332001201608050640034328', '李云迪——在那遥远的地方', '1', '1', '1', '6', 'ceshi2', null, null, '0', '10', '2', '0', null, null, '2016-08-05 17:21:09', '2016-08-05 17:20:53', '2016-08-05 17:20:53');
INSERT INTO `orders` VALUES ('157', '2016080957a99bcd9c9d0', null, '学员ceshi4申请周杰伦老师点评。', '1', null, '0', '27', 'ceshi4', '13', '周杰伦', '1', null, '5', '0', null, null, null, '2016-08-09 17:01:01', '2016-08-09 17:01:01');
INSERT INTO `orders` VALUES ('156', '2016080957a99b084b0b2', null, '学员qinying购买你好吗~点评课程。', '1', null, '1', '9', 'qinying', '5', '罗宁', '2', '78', '5', '0', null, null, null, '2016-08-09 16:57:44', '2016-08-09 16:57:44');
INSERT INTO `orders` VALUES ('155', '20160809165605_57a99aa5e85af', null, '李云迪——雨滴', '1', null, '1', '9', 'qinying', null, null, '0', '13', '5', '0', null, null, null, '2016-08-09 16:56:05', '2016-08-09 16:56:05');
INSERT INTO `orders` VALUES ('67', '2016080557a45f570bf8c', '2016080521001004220275064685', '学员qinying购买《梨花又开放》点评课程。', '1', '1', '0', '9', 'qinying', '8', 'langlang', '2', '70', '4', '0', '1', '1', '2016-08-05 17:42:16', '2016-08-05 17:41:43', '2016-08-08 11:21:14');
INSERT INTO `orders` VALUES ('68', '2016080557a4621623bd5', '4006332001201608050642109591', '学员ceshi1申请yundi老师点评。', '1', '1', '1', '2', 'ceshi1', '10', 'yundi', '1', '75', '1', '0', null, null, '2016-08-05 17:53:54', '2016-08-05 17:53:26', '2016-08-05 17:53:26');
INSERT INTO `orders` VALUES ('69', '2016080557a463f67565e', '4000922001201608050644459392', '学员wangchenkai申请罗宁老师点评。', '1', '1', '1', '3', 'wangchenkai', '5', '罗宁', '1', '76', '2', '0', null, null, '2016-08-05 18:01:45', '2016-08-05 18:01:26', '2016-08-05 18:01:26');
INSERT INTO `orders` VALUES ('70', '2016080557a464a84d0b7', '2016080521001004830266126077', '学员wangchenkai申请罗宁老师点评。', '1', '1', '0', '3', 'wangchenkai', '5', '罗宁', '1', '77', '4', '0', '1', '1', '2016-08-05 18:04:46', '2016-08-05 18:04:24', '2016-08-08 11:42:33');
INSERT INTO `orders` VALUES ('71', '2016080557a466901ab3b', '4000922001201608050644034323', '学员wangchenkai申请罗宁老师点评。', '1', '1', '1', '3', 'wangchenkai', '5', '罗宁', '1', '78', '2', '0', null, null, '2016-08-05 18:12:47', '2016-08-05 18:12:32', '2016-08-08 09:57:09');
INSERT INTO `orders` VALUES ('72', '2016080557a467838f3d0', '4006332001201608050644196532', '学员ceshi1申请langlang老师点评。', '1', '1', '1', '2', 'ceshi1', '8', 'langlang', '1', '79', '1', '0', null, null, '2016-08-05 18:16:46', '2016-08-05 18:16:35', '2016-08-05 18:16:35');
INSERT INTO `orders` VALUES ('78', '20160808110611_57a7f723bfeae', '4009422001201608080841836428', '周杰伦——世界末日', '1', '1', '1', '9', 'qinying', null, null, '0', '8', '2', '0', null, null, '2016-08-08 11:06:31', '2016-08-08 11:06:11', '2016-08-08 11:06:11');
INSERT INTO `orders` VALUES ('79', '2016080857a7fb8a28085', '4006332001201608080843877684', '学员ceshi1申请yundi老师点评。', '1', '1', '1', '2', 'ceshi1', '10', 'yundi', '1', '82', '2', '0', null, null, '2016-08-08 11:25:11', '2016-08-08 11:24:58', '2016-08-08 11:24:58');
INSERT INTO `orders` VALUES ('80', '2016080857a80068cc599', '2016080821001004690219150966', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', '83', '2', '0', '1', '1', '2016-08-08 11:46:11', '2016-08-08 11:45:44', '2016-08-08 13:31:13');
INSERT INTO `orders` VALUES ('81', '2016080857a81a6e274e5', '2016080821001004220267901826', '学员qinying申请周杰伦老师点评。', '1', '1', '0', '9', 'qinying', '13', '周杰伦', '1', null, '4', '0', '1', '1', '2016-08-08 13:37:21', '2016-08-08 13:36:46', '2016-08-08 13:58:56');
INSERT INTO `orders` VALUES ('82', '2016080857a81b1737eda', '2016080821001004220272458352', '学员qinying申请langlang老师点评。', '1', '1', '0', '9', 'qinying', '8', 'langlang', '1', '84', '2', '0', null, null, '2016-08-08 13:40:05', '2016-08-08 13:39:35', '2016-08-08 13:39:35');
INSERT INTO `orders` VALUES ('84', '2016080857a81d8744510', '2016080821001004690222528227', '学员ceshi1申请langlang老师点评。', '1', '1', '0', '2', 'ceshi1', '8', 'langlang', '1', null, '3', '0', null, null, '2016-08-08 13:50:23', '2016-08-08 13:49:59', '2016-08-08 14:22:40');
INSERT INTO `orders` VALUES ('153', '20160809161746_57a991aa284ab', null, '顺序播放', '3', null, '0', '2', 'ceshi1', null, null, '0', '19', '5', '0', null, null, null, '2016-08-09 16:17:46', '2016-08-09 16:17:46');
INSERT INTO `orders` VALUES ('86', '2016080857a81dabc25df', null, '学员ceshi1申请罗宁老师点评。', '1', null, '0', '2', 'ceshi1', '5', '罗宁', '1', null, '3', '0', null, null, null, '2016-08-08 13:50:35', '2016-08-08 18:01:16');
INSERT INTO `orders` VALUES ('87', '20160808135521_57a81ec963f1d', '4006332001201608080856279125', '周杰伦——皮影戏钢琴演奏版', '1', '1', '1', '2', 'ceshi1', null, null, '0', '7', '2', '0', null, null, '2016-08-08 13:55:32', '2016-08-08 13:55:21', '2016-08-08 13:55:21');
INSERT INTO `orders` VALUES ('88', '20160808141235_57a822d302d4e', '4009422001201608080857664495', '李云迪——雨滴', '1', '1', '1', '9', 'qinying', null, null, '0', '13', '3', '0', '0', '0', '2016-08-08 14:12:59', '2016-08-08 14:12:35', '2016-08-08 14:21:33');
INSERT INTO `orders` VALUES ('89', '2016080857a823f41c4ad', '2016080821001004140283700014', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-08 14:18:21', '2016-08-08 14:17:24', '2016-08-08 14:23:05');
INSERT INTO `orders` VALUES ('90', '20160808142356_57a8257cd6b9d', '4009422001201608080858091011', '贝多芬系列交响乐', '3', '3', '1', '9', 'qinying', null, null, '0', '11', '2', '0', null, null, '2016-08-08 14:24:20', '2016-08-08 14:23:56', '2016-08-08 14:23:56');
INSERT INTO `orders` VALUES ('91', '20160808143756_57a828c4658a8', '4009422001201608080859835416', '超高标转换', '3', '3', '1', '9', 'qinying', null, null, '0', '15', '2', '0', null, null, '2016-08-08 14:38:17', '2016-08-08 14:37:56', '2016-08-08 14:37:56');
INSERT INTO `orders` VALUES ('92', '2016080857a834d441713', '2016080821001004140280545915', '学员ceshi1申请周杰伦老师点评。', '1', '1', '0', '2', 'ceshi1', '13', '周杰伦', '1', '85', '4', '0', '1', '1', '2016-08-08 15:29:54', '2016-08-08 15:29:24', '2016-08-08 16:55:00');
INSERT INTO `orders` VALUES ('93', '2016080857a837b0c79d5', '2016080821001004690220565307', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-08 15:42:30', '2016-08-08 15:41:36', '2016-08-08 16:17:29');
INSERT INTO `orders` VALUES ('94', '2016080857a83a2231e0b', '2016080821001004690222974349', '学员ceshi2申请yundi老师点评。', '1', '1', '0', '6', 'ceshi2', '10', 'yundi', '1', '86', '4', '0', null, null, '2016-08-08 15:52:28', '2016-08-08 15:52:02', '2016-08-10 11:03:15');
INSERT INTO `orders` VALUES ('95', '2016080857a83e358adfe', '2016080821001004690224132830', '学员ceshi2申请langlang老师点评。', '1', '1', '0', '6', 'ceshi2', '8', 'langlang', '1', null, '4', '1', '1', '1', '2016-08-08 16:09:53', '2016-08-08 16:09:25', '2016-08-08 16:32:38');
INSERT INTO `orders` VALUES ('96', '20160808161511_57a83f8faba50', '2016080821001004690224132831', '超高标转换', '3', '3', '1', '2', 'ceshi1', null, null, '0', '15', '3', '0', '3', '3', '2016-08-08 16:16:53', '2016-08-08 16:15:11', '2016-08-09 16:54:37');
INSERT INTO `orders` VALUES ('97', '2016080857a8408f8a65f', '2016080821001004690224894874', '学员ceshi2申请贝多芬老师点评。', '1', '1', '0', '6', 'ceshi2', '17', '贝多芬', '1', null, '4', '0', null, null, '2016-08-08 16:19:48', '2016-08-08 16:19:27', '2016-08-08 17:17:16');
INSERT INTO `orders` VALUES ('98', '2016080857a840e751f69', null, '学员ceshi2申请贝多芬老师点评。', '1', '1', '0', '6', 'ceshi2', '17', '贝多芬', '1', null, '4', '0', null, null, '2016-08-10 09:54:53', '2016-08-08 16:20:55', '2016-08-08 17:17:14');
INSERT INTO `orders` VALUES ('99', '2016080857a840ed33a96', null, '学员ceshi2申请贝多芬老师点评。', '1', '1', '0', '6', 'ceshi2', '17', '贝多芬', '1', null, '4', '0', null, null, '2016-08-10 09:54:57', '2016-08-08 16:21:01', '2016-08-08 17:17:07');
INSERT INTO `orders` VALUES ('100', '2016080857a840ff03985', '2016080821001004690219721253', '学员ceshi2申请贝多芬老师点评。', '1', '1', '0', '6', 'ceshi2', '17', '贝多芬', '1', null, '4', '0', null, null, '2016-08-08 16:21:39', '2016-08-08 16:21:19', '2016-08-08 17:17:00');
INSERT INTO `orders` VALUES ('101', '2016080857a841d558826', '2016080821001004690218143544', '学员ceshi1申请贝多芬老师点评。', '1', '1', '0', '2', 'ceshi1', '17', '贝多芬', '1', '89', '4', '0', '1', '1', '2016-08-08 16:25:14', '2016-08-08 16:24:53', '2016-08-08 17:27:36');
INSERT INTO `orders` VALUES ('102', '2016080857a844b249274', '2016080821001004690223809428', '学员ceshi1申请贝多芬老师点评。', '1', '1', '0', '2', 'ceshi1', '17', '贝多芬', '1', '90', '4', '0', '1', '1', '2016-08-08 16:37:27', '2016-08-08 16:37:06', '2016-08-08 17:28:00');
INSERT INTO `orders` VALUES ('103', '2016080857a8469292d49', '2016080821001004690224895238', '学员ceshi2申请贝多芬老师点评。', '1', '1', '0', '6', 'ceshi2', '17', '贝多芬', '1', '91', '4', '1', null, null, '2016-08-08 16:45:28', '2016-08-08 16:45:06', '2016-08-08 17:16:36');
INSERT INTO `orders` VALUES ('104', '20160808173909_57a8533d122dc', '2016080821001004690224895238', '李云迪——在那遥远的地方', '1', '1', '0', '2', 'ceshi1', null, null, '0', '10', '2', '0', null, null, '2016-08-08 17:40:25', '2016-08-08 17:39:09', '2016-08-08 17:39:09');
INSERT INTO `orders` VALUES ('105', '2016080857a85674df8c0', '2016080821001004830270936191', '学员lilith购买你好吗~点评课程。', '1', '1', '0', '17', 'lilith', '5', '罗宁', '2', '78', '4', '0', '1', '1', '2016-08-08 17:53:17', '2016-08-08 17:52:52', '2016-08-09 11:30:49');
INSERT INTO `orders` VALUES ('106', '2016080857a85fb6d5588', '2016080821001004140280484275', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-08 18:34:56', '2016-08-08 18:32:22', '2016-08-08 18:35:52');
INSERT INTO `orders` VALUES ('107', '20160808183919_57a861573a1d4', null, '李云迪——花儿为什么那样红', '1000', null, '0', '2', 'ceshi1', null, null, '0', '12', '5', '0', null, null, null, '2016-08-08 18:39:19', '2016-08-08 18:39:19');
INSERT INTO `orders` VALUES ('108', '2016080857a8618790eb6', '2016080821001004140282344503', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-08 18:50:22', '2016-08-08 18:40:07', '2016-08-09 14:18:44');
INSERT INTO `orders` VALUES ('109', '2016080857a8640743eb0', '2016080821001004140283809953', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-08 18:51:45', '2016-08-08 18:50:47', '2016-08-08 18:58:34');
INSERT INTO `orders` VALUES ('110', '2016080857a8660252204', '2016080821001004140283015146', '学员ceshi1申请罗宁老师点评。', '1', '1', '0', '2', 'ceshi1', '5', '罗宁', '1', null, '4', '0', '1', '1', '2016-08-08 18:59:41', '2016-08-08 18:59:14', '2016-08-09 11:54:35');
INSERT INTO `orders` VALUES ('111', '2016080957a9372cd082b', '2016080921001004140287947378', '学员ceshi1申请yundi老师点评。', '1', '1', '0', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-09 09:52:35', '2016-08-09 09:51:40', '2016-08-09 10:31:42');
INSERT INTO `orders` VALUES ('112', '2016080957a939a0553c2', '2016080921001004220277926865', '学员qinying购买《太阳的后裔》主题曲点评课程。', '1', '1', '0', '9', 'qinying', '10', 'yundi', '2', '83', '4', '0', '1', '1', '2016-08-09 10:02:42', '2016-08-09 10:02:08', '2016-08-09 10:04:52');
INSERT INTO `orders` VALUES ('113', '2016080957a93c15a4e29', '4009422001201608090917849304', '学员qinying购买动漫点评课程。', '1', '1', '1', '9', 'qinying', '5', '罗宁', '2', '7', '2', '0', null, null, '2016-08-09 10:13:02', '2016-08-09 10:12:37', '2016-08-09 10:12:37');
INSERT INTO `orders` VALUES ('114', '2016080957a94559e667f', null, '学员ceshi1申请罗宁老师点评。', '1', null, '0', '2', 'ceshi1', '5', '罗宁', '1', null, '5', '0', null, null, null, '2016-08-09 10:52:09', '2016-08-09 10:52:09');
INSERT INTO `orders` VALUES ('115', '2016080957a9455e8626d', '2016080921001004140290026722', '学员ceshi1申请罗宁老师点评。', '1', '1', '0', '2', 'ceshi1', '5', '罗宁', '1', null, '4', '0', '1', '1', '2016-08-09 10:52:48', '2016-08-09 10:52:14', '2016-08-09 10:53:17');
INSERT INTO `orders` VALUES ('116', '20160809105753_57a946b17eca4', '4009422001201608090921651221', '顺序播放', '3', '3', '1', '9', 'qinying', null, null, '0', '19', '2', '0', null, null, '2016-08-09 10:58:20', '2016-08-09 10:57:53', '2016-08-09 10:57:53');
INSERT INTO `orders` VALUES ('117', '20160809110607_57a9489f3ca93', '4006332001201608090923247268', '郎朗-柴可夫斯基第一钢琴协奏曲第一讲', '1', '1', '1', '6', 'ceshi2', null, null, '0', '2', '3', '0', '1', '1', '2016-08-09 11:06:18', '2016-08-09 11:06:07', '2016-08-09 16:48:00');
INSERT INTO `orders` VALUES ('118', '20160809111025_57a949a11acae', '2016080921001004830269696380', '李云迪——雨滴', '1', '1', '0', '16', 'whrcfzzj', null, null, '0', '13', '2', '0', null, null, '2016-08-09 11:11:23', '2016-08-09 11:10:25', '2016-08-09 11:10:25');
INSERT INTO `orders` VALUES ('119', '20160809111509_57a94abd6cd83', '2016080921001004830268147526', '周杰伦——皮影戏钢琴演奏版', '1', '1', '0', '16', 'whrcfzzj', null, null, '0', '7', '2', '0', null, null, '2016-08-09 11:15:33', '2016-08-09 11:15:09', '2016-08-09 11:15:09');
INSERT INTO `orders` VALUES ('120', '2016080957a94d298243b', null, '学员ceshi1申请周杰伦老师点评。', '1', null, '1', '2', 'ceshi1', '13', '周杰伦', '1', null, '5', '0', null, null, null, '2016-08-09 11:25:29', '2016-08-09 11:25:29');
INSERT INTO `orders` VALUES ('121', '20160809112633_57a94d69d85a9', '2016080921001004830271091515', '周杰伦——mine钢琴演奏版', '1', '1', '0', '16', 'whrcfzzj', null, null, '0', '6', '1', '0', '1', '1', '2016-08-09 11:34:03', '2016-08-09 11:26:33', '2016-08-09 11:45:57');
INSERT INTO `orders` VALUES ('122', '2016080957a94f347ebab', '2016080921001004220277991289', '学员xueyuan购买通知1点评课程。', '1', '1', '0', '7', 'xueyuan', '5', '罗宁', '2', '9', '44', '0', '1', '1', '2016-08-09 11:34:52', '2016-08-09 11:34:12', '2016-08-09 11:50:11');
INSERT INTO `orders` VALUES ('125', '20160809114206_57a9510e0a77f', null, '顺序播放', '3', null, '0', '2', 'ceshi1', null, null, '0', '19', '5', '0', null, null, null, '2016-08-09 11:42:06', '2016-08-09 11:42:06');
INSERT INTO `orders` VALUES ('126', '20160809114207_57a9510f113e7', null, '顺序播放', '3', null, '0', '2', 'ceshi1', null, null, '0', '19', '5', '0', null, null, null, '2016-08-09 11:42:07', '2016-08-09 11:42:07');
INSERT INTO `orders` VALUES ('129', '20160809115018_57a952fa0b810', '2016080921001004830269696814', '周杰伦——mine钢琴演奏版', '1', '1', '0', '16', 'whrcfzzj', null, null, '0', '6', '3', '0', '1', '1', '2016-08-09 11:50:45', '2016-08-09 11:50:18', '2016-08-09 11:52:03');
INSERT INTO `orders` VALUES ('130', '2016080957a96a306b33b', '2016080921001004220276213155', '学员liliang申请李民老师点评。', '1', '1', '0', '21', 'liliang', '20', '李民', '1', '93', '2', '0', null, null, '2016-08-09 13:29:50', '2016-08-09 13:29:20', '2016-08-09 13:29:20');
INSERT INTO `orders` VALUES ('131', '20160809133026_57a96a7251cd3', '2016080921001004830267093749', '周杰伦——mine钢琴演奏版', '1', '1', '0', '16', 'whrcfzzj', null, null, '0', '6', '2', '0', null, null, '2016-08-09 13:32:49', '2016-08-09 13:30:26', '2016-08-09 13:30:26');
INSERT INTO `orders` VALUES ('132', '2016080957a96cb6d4916', '4006332001201608090936725412', '学员徐孟申请李民老师点评。', '1', '1', '1', '24', '徐孟', '20', '李民', '1', '94', '2', '0', null, null, '2016-08-09 13:40:18', '2016-08-09 13:40:06', '2016-08-09 13:40:06');
INSERT INTO `orders` VALUES ('133', '2016080957a96f74ca4d1', '4006332001201608090938376502', '学员宗硕琪申请李民老师点评。', '1', '1', '1', '25', '宗硕琪', '20', '李民', '1', '95', '2', '0', null, null, '2016-08-09 13:52:12', '2016-08-09 13:51:48', '2016-08-09 13:51:48');
INSERT INTO `orders` VALUES ('134', '2016080957a970bd87639', '2016080921001004140290266640', '学员ceshi3申请李民老师点评。', '1', '1', '0', '14', 'ceshi3', '20', '李民', '1', null, '4', '0', '1', '1', '2016-08-09 13:57:44', '2016-08-09 13:57:17', '2016-08-09 14:18:03');
INSERT INTO `orders` VALUES ('135', '2016080957a9736fd876b', '2016080921001004220276985546', '学员王秋实申请李民老师点评。', '1', '1', '0', '26', '王秋实', '20', '李民', '1', '96', '2', '0', null, null, '2016-08-09 14:09:15', '2016-08-09 14:08:47', '2016-08-09 14:08:47');
INSERT INTO `orders` VALUES ('136', '2016080957a976eeab30b', '2016080921001004140289965204', '学员ceshi3申请罗宁老师点评。', '1', '1', '0', '14', 'ceshi3', '5', '罗宁', '1', null, '4', '0', '1', '1', '2016-08-09 14:24:12', '2016-08-09 14:23:42', '2016-08-09 14:25:17');
INSERT INTO `orders` VALUES ('137', '20160809144057_57a97af9cef96', '2016080921001004690221735852', '已学验证1', '2', '2', '0', '2', 'ceshi1', null, null, '0', '17', '2', '0', null, null, '2016-08-09 14:41:57', '2016-08-09 14:40:57', '2016-08-09 14:40:57');
INSERT INTO `orders` VALUES ('138', '2016080957a97d7458bc7', null, '学员admin申请李民老师点评。', '1', null, '1', '1', 'admin', '20', '李民', '1', null, '5', '0', null, null, null, '2016-08-09 14:51:32', '2016-08-09 14:51:32');
INSERT INTO `orders` VALUES ('139', '2016080957a97dc6a25ff', null, '学员admin申请李民老师点评。', '1', null, '1', '1', 'admin', '20', '李民', '1', null, '5', '0', null, null, null, '2016-08-09 14:52:54', '2016-08-09 14:52:54');
INSERT INTO `orders` VALUES ('140', '20160809150841_57a98179b7767', null, '李云迪——花儿为什么那样红', '1000', null, '1', '21', 'liliang', null, null, '0', '12', '5', '0', null, null, null, '2016-08-09 15:08:41', '2016-08-09 15:08:41');
INSERT INTO `orders` VALUES ('141', '20160809150856_57a9818826aa6', '2016080921001004220276741210', '李云迪——花儿为什么那样红', '1000', '1000', '0', '21', 'liliang', null, null, '0', '12', '4', '0', '1000', '1000', '2016-08-09 15:09:32', '2016-08-09 15:08:56', '2016-08-10 16:43:01');
INSERT INTO `orders` VALUES ('142', '20160809151005_57a981cd89f97', null, '李云迪——雨滴', '1', null, '0', '2', 'ceshi1', null, null, '0', '13', '5', '0', null, null, null, '2016-08-09 15:10:05', '2016-08-09 15:10:05');
INSERT INTO `orders` VALUES ('143', '20160809151009_57a981d19bfc4', '2016080921001004690221472800', '李云迪——雨滴', '1', '1', '0', '2', 'ceshi1', null, null, '0', '13', '3', '0', '1', '1', '2016-08-09 15:10:30', '2016-08-09 15:10:09', '2016-08-09 15:15:40');
INSERT INTO `orders` VALUES ('144', '20160809152246_57a984c6d742f', '2016080921001004690223180779', '周杰伦——世界末日', '1', '1', '0', '6', 'ceshi2', null, null, '0', '8', '2', '0', null, null, '2016-08-09 15:23:11', '2016-08-09 15:22:46', '2016-08-09 15:22:46');
INSERT INTO `orders` VALUES ('145', '2016080957a984e1a71d4', '2016080921001004220276481612', '学员liliang购买《月光奏鸣曲》点评课程。', '1', '1', '0', '21', 'liliang', '20', '李民', '2', '95', '3', '0', '1', null, '2016-08-09 15:24:02', '2016-08-09 15:23:13', '2016-08-09 15:23:13');
INSERT INTO `orders` VALUES ('146', '20160809152451_57a9854389f6e', null, '基础视频演奏', '1', null, '1', '16', 'whrcfzzj', null, null, '0', '1', '5', '0', null, null, null, '2016-08-09 15:24:51', '2016-08-09 15:24:51');
INSERT INTO `orders` VALUES ('147', '2016080957a98548f2a0b', '4009422001201608090943610360', '学员liliang购买通知1点评课程。', '1', '1', '1', '21', 'liliang', '5', '罗宁', '2', '9', '4', '0', '1', '1', '2016-08-09 15:25:21', '2016-08-09 15:24:56', '2016-08-10 15:15:51');
INSERT INTO `orders` VALUES ('148', '2016080957a985b788505', '4009422001201608090943688963', '学员liliang购买动漫点评课程。', '1', '1', '1', '21', 'liliang', '5', '罗宁', '2', '7', '4', '0', '1', '1', '2016-08-09 15:27:11', '2016-08-09 15:26:47', '2016-08-10 15:11:49');
INSERT INTO `orders` VALUES ('149', '2016080957a989bb8be90', null, '学员whrcfzzj申请周杰伦老师点评。', '1', null, '0', '16', 'whrcfzzj', '13', '周杰伦', '1', null, '5', '0', null, null, null, '2016-08-09 15:43:55', '2016-08-09 15:43:55');
INSERT INTO `orders` VALUES ('150', '2016080957a98c190dffc', '2016080921001004220278765775', '学员liliang购买你好吗~点评课程。', '1', '1', '0', '21', 'liliang', '5', '罗宁', '2', '78', '2', '0', null, null, '2016-08-09 15:54:30', '2016-08-09 15:54:01', '2016-08-09 15:54:01');
INSERT INTO `orders` VALUES ('151', '2016080957a98e56a483d', '4006332001201608090946963105', '学员ceshi2申请yundi老师点评。', '1', '1', '1', '6', 'ceshi2', '10', 'yundi', '1', null, '0', '0', null, null, '2016-08-09 16:03:47', '2016-08-09 16:03:34', '2016-08-09 16:03:34');
INSERT INTO `orders` VALUES ('152', '2016080957a9906c76422', '4001202001201608090946088725', '学员ceshi1申请李民老师点评。', '1', '1', '1', '2', 'ceshi1', '20', '李民', '1', '134', '2', '0', null, null, '2016-08-09 16:13:16', '2016-08-09 16:12:28', '2016-08-09 16:12:28');
INSERT INTO `orders` VALUES ('169', '2016081057aac7b4ab0f6', null, '学员wangchenkai申请李民老师点评。', '1', null, '1', '3', 'wangchenkai', '20', '李民', '1', null, '5', '0', null, null, null, '2016-08-10 14:20:36', '2016-08-10 14:20:36');
INSERT INTO `orders` VALUES ('170', '20160810142847_57aac99f57012', null, '李云迪——雨滴', '2', null, '0', '21', 'liliang', null, null, '0', '13', '5', '0', null, null, null, '2016-08-10 14:28:47', '2016-08-10 14:28:47');
INSERT INTO `orders` VALUES ('173', '2016081057aacad49af59', '2016081021001004220276992903', '学员liliang申请李民老师点评。', '1', '1', '0', '21', 'liliang', '20', '李民', '1', null, '1', '0', null, null, '2016-08-10 14:34:29', '2016-08-10 14:33:56', '2016-08-10 14:33:56');
INSERT INTO `orders` VALUES ('172', '20160810143030_57aaca0679562', null, '李云迪——雨滴', '2', null, '1', '21', 'liliang', null, null, '0', '13', '5', '0', null, null, null, '2016-08-10 14:30:30', '2016-08-10 14:30:30');
INSERT INTO `orders` VALUES ('174', '2016081057aace1f611d3', null, '学员liliang购买《悲怆》第三乐章点评课程。', '1', null, '0', '21', 'liliang', '20', '李民', '2', '94', '5', '0', null, null, null, '2016-08-10 14:47:59', '2016-08-10 14:47:59');
INSERT INTO `orders` VALUES ('175', '2016081057aacf05078fe', null, '学员liliang购买~~~~~~~~~~~~点评课程。', '1', null, '0', '21', 'liliang', '5', '罗宁', '2', '2', '5', '0', null, null, null, '2016-08-10 14:51:49', '2016-08-10 14:51:49');
INSERT INTO `orders` VALUES ('176', '2016081057aacfb625df2', '4009422001201608101020658978', '学员liliang申请langlang老师点评。', '1', '1', '1', '21', 'liliang', '8', 'langlang', '1', null, '1', '0', null, null, '2016-08-10 14:56:29', '2016-08-10 14:54:46', '2016-08-10 14:54:46');
INSERT INTO `orders` VALUES ('177', '2016081057aad05c77cbf', null, '学员wangchenkai申请李民老师点评。', '1', null, '0', '3', 'wangchenkai', '20', '李民', '1', null, '5', '0', null, null, null, '2016-08-10 14:57:32', '2016-08-10 14:57:32');
INSERT INTO `orders` VALUES ('178', '2016081057aad0831f54f', '4000922001201608101022492104', '学员wangchenkai申请李民老师点评。', '1', '1', '1', '3', 'wangchenkai', '20', '李民', '1', '135', '2', '0', null, null, '2016-08-10 14:58:29', '2016-08-10 14:58:11', '2016-08-10 14:58:11');
INSERT INTO `orders` VALUES ('179', '2016081057aad2b020987', '4009422001201608101022828034', '学员liliang申请yundi老师点评。', '1', '1', '1', '21', 'liliang', '10', 'yundi', '1', '133', '1', '0', null, null, '2016-08-10 15:07:51', '2016-08-10 15:07:28', '2016-08-10 15:07:28');
INSERT INTO `orders` VALUES ('180', '2016081057aad34242565', '2016081021001004220279076490', '学员liliang申请周杰伦老师点评。', '1', '1', '0', '21', 'liliang', '13', '周杰伦', '1', null, '1', '0', null, null, '2016-08-10 15:10:21', '2016-08-10 15:09:54', '2016-08-10 15:09:54');
INSERT INTO `orders` VALUES ('181', '2016081057aad343a19a0', null, '学员liliang申请周杰伦老师点评。', '1', null, '0', '21', 'liliang', '13', '周杰伦', '1', null, '5', '0', null, null, null, '2016-08-10 15:09:55', '2016-08-10 15:09:55');
INSERT INTO `orders` VALUES ('182', '2016081057aad3dcd8d2e', '4003712001201608101022980877', '学员ceshi1申请yundi老师点评。', '1', '1', '1', '2', 'ceshi1', '10', 'yundi', '1', null, '4', '0', '1', '1', '2016-08-10 15:12:44', '2016-08-10 15:12:28', '2016-08-10 15:13:28');
INSERT INTO `orders` VALUES ('183', '2016081057aad407cc8dd', '4009422001201608101022989758', '学员liliang申请周杰伦老师点评。', '1', '1', '1', '21', 'liliang', '13', '周杰伦', '1', '132', '1', '0', null, null, '2016-08-10 15:13:31', '2016-08-10 15:13:11', '2016-08-10 15:13:11');
INSERT INTO `orders` VALUES ('184', '20160810161640_57aae2e887c5d', '2016081021001004220286038817', '李云迪——雨滴', '2', '2', '0', '21', 'liliang', null, null, '0', '13', '3', '0', '2', '2', '2016-08-10 16:17:15', '2016-08-10 16:16:40', '2016-08-10 16:22:44');
INSERT INTO `orders` VALUES ('185', '20160810162529_57aae4f92d670', null, '巩固基础', '1', null, '0', '21', 'liliang', null, null, '0', '20', '5', '0', null, null, null, '2016-08-10 16:25:29', '2016-08-10 16:25:29');
INSERT INTO `orders` VALUES ('186', '20160810162553_57aae51130a90', '4009422001201608101027341420', '巩固基础', '1', '1', '1', '21', 'liliang', null, null, '0', '20', '0', '0', null, null, '2016-08-10 16:26:18', '2016-08-10 16:25:53', '2016-08-10 16:32:14');
INSERT INTO `orders` VALUES ('187', '20160810171952_57aaf1b878ed1', null, '巩固基础', '1', null, '1', '2', 'ceshi1', null, null, '0', '20', '5', '0', null, null, null, '2016-08-10 17:19:52', '2016-08-10 17:19:52');
INSERT INTO `orders` VALUES ('188', '20160810172024_57aaf1d88148a', null, '顺序播放', '3', null, '1', '2', 'ceshi1', null, null, '0', '19', '5', '0', null, null, null, '2016-08-10 17:20:24', '2016-08-10 17:20:24');
INSERT INTO `orders` VALUES ('189', '2016081057aaf81d6c511', '2016081021001004220275338933', '学员liliang申请周杰伦老师点评。', '1', '1', '0', '21', 'liliang', '13', '周杰伦', '1', null, '1', '0', null, null, '2016-08-10 17:47:32', '2016-08-10 17:47:09', '2016-08-10 17:47:09');
INSERT INTO `orders` VALUES ('190', '2016081157abd49b3bc91', '4009422001201608111072179142', '学员王秋实申请yundi老师点评。', '1', '1', '1', '26', '王秋实', '10', 'yundi', '1', '136', '1', '0', null, null, '2016-08-11 09:28:13', '2016-08-11 09:27:55', '2016-08-11 09:27:55');

-- ----------------------------
-- Table structure for `partner`
-- ----------------------------
DROP TABLE IF EXISTS `partner`;
CREATE TABLE `partner` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图片地址',
  `url` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '链接地址',
  `postion` int(2) DEFAULT NULL COMMENT '排序位置',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0为激活 1位禁用',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='合作伙伴';

-- ----------------------------
-- Records of partner
-- ----------------------------
INSERT INTO `partner` VALUES ('1', '1', '/admin/image/contentManager/partner/716353bb590acdbebf3d2f17b248cf7d.png', 'www.baidu.com', '1', '0', '2016-08-05 11:14:34');
INSERT INTO `partner` VALUES ('2', '2', '/admin/image/contentManager/partner/d53307ddbf40fda0b31de3b9f2ea06fb.png', 'www.baidu.com', '2', '0', '2016-08-05 11:14:22');
INSERT INTO `partner` VALUES ('3', '3', '/admin/image/contentManager/partner/716353bb590acdbebf3d2f17b248cf7d.png', 'www.baidu.com', '3', '0', '2016-08-05 11:14:11');
INSERT INTO `partner` VALUES ('4', '4', '/admin/image/contentManager/partner/d53307ddbf40fda0b31de3b9f2ea06fb.png', 'www.baidu.com', '4', '0', '2016-08-05 11:14:01');

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1', '1', '2016-07-17 16:50:15', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('2', '2', '1', '2016-07-17 16:50:15', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('3', '3', '1', '2016-07-17 16:50:15', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('4', '4', '1', '2016-07-17 16:50:15', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('5', '28', '1', '2016-07-20 17:17:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('6', '23', '1', '2016-07-20 17:16:19', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('7', '27', '1', '2016-07-20 17:17:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('8', '24', '1', '2016-07-20 17:17:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('9', '26', '1', '2016-07-28 15:47:53', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('10', '25', '1', '2016-07-20 17:17:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('11', '63', '1', '2016-07-25 11:15:52', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('12', '65', '1', '2016-07-25 11:15:52', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('13', '64', '1', '2016-07-25 11:15:52', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('14', '66', '1', '2016-07-26 16:54:28', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('15', '62', '1', '2016-07-25 11:16:39', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('16', '59', '1', '2016-07-25 11:16:39', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('17', '60', '1', '2016-07-25 11:16:39', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('18', '61', '1', '2016-07-25 11:16:39', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('19', '29', '1', '2016-07-25 11:16:51', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('20', '30', '1', '2016-07-25 11:16:51', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('21', '31', '1', '2016-07-25 11:16:51', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('22', '32', '1', '2016-07-25 11:16:51', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('23', '18', '1', '2016-07-25 11:17:06', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('24', '19', '1', '2016-07-25 11:17:06', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('25', '20', '1', '2016-07-25 11:17:06', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('26', '21', '1', '2016-07-25 11:17:06', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('27', '33', '1', '2016-07-25 11:17:24', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('28', '34', '1', '2016-07-25 11:17:24', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('29', '67', '1', '2016-07-25 11:27:18', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('30', '68', '1', '2016-07-25 11:27:18', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('31', '69', '1', '2016-07-25 11:27:18', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('32', '70', '1', '2016-07-25 11:37:14', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('33', '73', '1', '2016-07-25 11:37:14', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('34', '71', '1', '2016-07-25 11:37:14', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('35', '72', '1', '2016-07-25 11:37:14', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('36', '74', '1', '2016-07-25 11:53:40', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('37', '75', '1', '2016-07-25 11:53:40', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('38', '76', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('39', '81', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('40', '82', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('41', '77', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('42', '78', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('43', '83', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('44', '79', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('45', '80', '1', '2016-07-26 16:55:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('46', '86', '1', '2016-08-01 14:41:04', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('47', '87', '1', '2016-08-02 17:05:53', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('48', '95', '27', '2016-08-04 16:56:38', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('49', '96', '27', '2016-08-04 16:56:38', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('50', '97', '27', '2016-08-04 16:56:38', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('51', '103', '27', '2016-08-04 16:56:38', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('52', '107', '15', '2016-08-04 17:03:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('53', '106', '15', '2016-08-04 17:03:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('54', '108', '15', '2016-08-04 17:03:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('55', '109', '15', '2016-08-04 17:03:57', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('56', '88', '25', '2016-08-04 17:04:34', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('57', '90', '25', '2016-08-04 17:04:34', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('58', '91', '25', '2016-08-04 17:04:34', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('59', '89', '25', '2016-08-04 17:04:41', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('60', '92', '26', '2016-08-04 17:05:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('61', '102', '26', '2016-08-04 17:05:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('62', '93', '26', '2016-08-04 17:05:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('63', '94', '26', '2016-08-04 17:05:08', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('64', '98', '28', '2016-08-04 17:05:49', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('65', '99', '29', '2016-08-04 17:06:20', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('66', '100', '29', '2016-08-04 17:06:20', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('67', '101', '29', '2016-08-04 17:06:20', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('68', '104', '30', '2016-08-04 18:27:37', '0000-00-00 00:00:00');
INSERT INTO `permission_role` VALUES ('69', '105', '31', '2016-08-04 18:28:02', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `permission_user`
-- ----------------------------
DROP TABLE IF EXISTS `permission_user`;
CREATE TABLE `permission_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permission_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `permission_user_permission_id_index` (`permission_id`),
  KEY `permission_user_user_id_index` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permission_user
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('2', 'add.role', 'add.role', '添加角色', '权限管理', '2016-07-16 17:40:01', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('1', 'check.role', 'check.role', '角色查看', '权限管理', '2016-07-16 17:37:57', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('3', 'edit.role', 'edit.role', '修改角色', '权限管理', '2016-07-16 17:45:16', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('4', 'delete.role', 'delete.role', '删除角色', '权限管理', '2016-07-16 17:45:32', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('89', 'edit.course', 'edit.course', '修改课程', '课程管理模块', '2016-08-01 15:58:06', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('88', 'check.course', 'check.course', '查看课程', '课程管理模块', '2016-08-01 15:57:34', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('83', 'del.noticeTem', 'del.noticeTem', '删除通知模板', '通知管理', '2016-07-26 11:21:05', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('86', 'logs.list', 'logs.list', '日志列表', '日志管理', '2016-07-28 15:55:13', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('87', 'delete.log', 'delete.log', '日志删除', '日志管理', '2016-07-28 15:55:31', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('82', 'list.noticeTem', 'list.noticeTem', '通知模板列表', '通知管理', '2016-07-26 11:20:44', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('18', 'activity.list', 'activity.list', '赛事活动列表', '赛事管理', '2016-07-19 14:13:52', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('19', 'add.activity', 'add.activity', '添加活动', '赛事管理', '2016-07-19 14:15:09', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('20', 'edit.activity', 'edit.activity', '修改活动', '赛事管理', '2016-07-19 14:15:25', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('21', 'delete.activity', 'delete.activity', '删除活动', '赛事管理', '2016-07-19 14:15:40', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('23', 'user.list', 'user.list', '用户列表', '用户模块', '2016-07-20 14:38:03', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('24', 'add.user', 'add.user', '添加用户', '用户模块', '2016-07-20 16:21:32', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('25', 'edit.user', 'edit.user', '编辑用户', '用户模块', '2016-07-20 16:21:57', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('26', 'delete.user', 'delete.user', '用户删除', '用户模块', '2016-07-20 16:23:19', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('27', 'resetPass.user', 'resetPass.user', '重置密码', '用户模块', '2016-07-20 16:26:59', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('28', 'changeStatus.user', 'changeStatus.user', '审核用户', '用户模块', '2016-07-20 16:27:31', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('29', 'companyUser.list', 'companyUser.list', '后台用户列表', '后台用户管理', '2016-07-20 16:37:07', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('30', 'add.companyUser', 'add.companyUser', '添加用户', '后台用户管理', '2016-07-20 16:39:21', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('31', 'edit.companyUser', 'edit.companyUser', '修改用户', '后台用户管理', '2016-07-20 16:39:53', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('32', 'delete.companyUser', 'delete.companyUser', '删除用户', '后台用户管理', '2016-07-20 16:40:19', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('74', 'collection.list', 'collection.list', '收藏列表', '收藏管理', '2016-07-25 11:53:12', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('75', 'delete.collection', 'delete.collection', '删除收藏', '收藏管理', '2016-07-25 11:53:30', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('76', 'add.notice', 'add.notice', '添加通知', '通知管理', '2016-07-26 11:16:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('77', 'list.notice', 'list.notice', '通知列表', '通知管理', '2016-07-26 11:16:42', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('78', 'edit.notice', 'edit.notice', '修改通知', '通知管理', '2016-07-26 11:17:17', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('79', 'del.notice', 'del.notice', '删除通知', '通知管理', '2016-07-26 11:19:32', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('80', 'add.noticeTem', 'add.noticeTem', '添加通知模板', '通知管理', '2016-07-26 11:19:57', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('81', 'edit.noticeTem', 'edit.noticeTem', '修改通知模板', '通知管理', '2016-07-26 11:20:21', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('63', 'departmentpost.list', 'departmentpost.list', '部门岗位列表', '部门岗位管理', '2016-07-25 11:01:33', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('64', 'add.departmentpost', 'add.departmentpost', '部门岗位添加', '部门岗位管理', '2016-07-25 11:02:15', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('65', 'edit.departmentpost', 'edit.departmentpost', '部门岗位修改', '部门岗位管理', '2016-07-25 11:02:38', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('66', 'delete.departmentpost', 'delete.departmentpost', '部门岗位删除', '部门岗位管理', '2016-07-25 11:02:55', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('67', 'commentReply.list', 'commentReply.list', '评论回复列表', '评论回复管理', '2016-07-25 11:25:51', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('68', 'edit.commentReply', 'edit.commentReply', '评论回复修改', '评论回复管理', '2016-07-25 11:26:34', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('69', 'delete.commentReply', 'delete.commentReply', '评论回复删除', '评论回复管理', '2016-07-25 11:26:55', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('70', 'contentManager.list', 'contentManager.list', '内容管理列表', '内容管理', '2016-07-25 11:35:17', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('71', 'add.contentManager', 'add.contentManager', '内容管理添加', '内容管理', '2016-07-25 11:35:55', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('72', 'edit.contentManager', 'edit.contentManager', '内容管理修改', '内容管理', '2016-07-25 11:36:08', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('73', 'delete.contentManager', 'delete.contentManager', '内容管理删除', '内容管理', '2016-07-25 11:36:21', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('62', 'aboutus.list', 'aboutus.list', '关于我们查看', '关于我们', '2016-07-25 10:15:32', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('90', 'del.course', 'del.course', '删除课程', '课程管理模块', '2016-08-01 15:58:29', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('91', 'add.course', 'add.course', '添加课程', '课程管理模块', '2016-08-01 16:05:28', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('59', 'add.aboutus', 'add.aboutus', '关于我们添加\r\n', '关于我们', '2016-07-25 09:46:02', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('60', 'edit.aboutus', 'edit.aboutus', '关于我们修改', '关于我们', '2016-07-25 10:12:21', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('61', 'delete.aboutus', 'delete.aboutus', '关于我们删除', '关于我们', '2016-07-25 10:12:52', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('92', 'check.commentcourse', 'check.commentcourse', '查看点评课程', '点评管理', '2016-08-01 16:52:24', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('93', 'edit.commentcourse', 'edit.commentcourse', '修改点评课程', '点评管理', '2016-08-01 16:52:52', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('94', 'del.commentcourse', 'del.commentcourse', '删除点评课程', '点评管理', '2016-08-01 16:53:11', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('95', 'check.order', 'check.order', '查看订单', '订单管理', '2016-08-01 16:55:05', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('96', 'edit.order', 'edit.order', '修改订单', '订单管理', '2016-08-01 16:55:24', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('97', 'del.order', 'del.order', '删除订单', '订单管理', '2016-08-01 16:55:51', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('98', 'check.count', 'check.count', '查看数据统计', '数据统计管理', '2016-08-01 16:58:17', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('99', 'check.recycle', 'check.recycle', '查看回收站', '回收站管理', '2016-08-01 17:00:16', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('100', 'edit.recycle', 'edit.recycle', '还原', '回收站管理', '2016-08-01 17:00:44', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('101', 'del.recycle', 'del.recycle', '删除', '回收站管理', '2016-08-01 17:01:00', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('102', 'add.commentcourse', 'add.commentcourse', '添加', '点评管理', '2016-08-01 17:14:55', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('103', 'add.order', 'add.order', '添加备注', '订单管理', '2016-08-01 17:18:18', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('104', 'edit.Refundmoney', 'edit.Refundmoney', '编辑应退金额', '订单管理', '2016-08-01 17:24:56', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('105', 'edit.Retiredmoney', 'edit.Retiredmoney', '编辑已退金额', '订单管理', '2016-08-01 17:25:23', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('106', 'check.famous', 'check.famous', '查看名师', '名师管理', '2016-08-01 18:13:03', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('107', 'add.famous', 'add.famous', '添加名师', '名师管理', '2016-08-01 18:15:10', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('108', 'edit.famous', 'edit.famous', '修改名师', '名师管理', '2016-08-01 18:15:56', '0000-00-00 00:00:00');
INSERT INTO `permissions` VALUES ('109', 'del.famous', 'del.famous', '删除名师', '名师管理', '2016-08-01 18:16:13', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `post`
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '年度信息报告主键ID',
  `postName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '岗位名称',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0为锁定 1为激活',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `parentId` int(8) DEFAULT NULL COMMENT '对应部门ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of post
-- ----------------------------

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `name` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份表';

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '110000', '北京市', null, null);
INSERT INTO `province` VALUES ('2', '120000', '天津市', null, null);
INSERT INTO `province` VALUES ('3', '130000', '河北省', null, null);
INSERT INTO `province` VALUES ('4', '140000', '山西省', null, null);
INSERT INTO `province` VALUES ('5', '150000', '内蒙古', null, null);
INSERT INTO `province` VALUES ('6', '210000', '辽宁省', null, null);
INSERT INTO `province` VALUES ('7', '220000', '吉林省', null, null);
INSERT INTO `province` VALUES ('8', '230000', '黑龙江', null, null);
INSERT INTO `province` VALUES ('9', '310000', '上海市', null, null);
INSERT INTO `province` VALUES ('10', '320000', '江苏省', null, null);
INSERT INTO `province` VALUES ('11', '330000', '浙江省', null, null);
INSERT INTO `province` VALUES ('12', '340000', '安徽省', null, null);
INSERT INTO `province` VALUES ('13', '350000', '福建省', null, null);
INSERT INTO `province` VALUES ('14', '360000', '江西省', null, null);
INSERT INTO `province` VALUES ('15', '370000', '山东省', null, null);
INSERT INTO `province` VALUES ('16', '410000', '河南省', null, null);
INSERT INTO `province` VALUES ('17', '420000', '湖北省', null, null);
INSERT INTO `province` VALUES ('18', '430000', '湖南省', null, null);
INSERT INTO `province` VALUES ('19', '440000', '广东省', null, null);
INSERT INTO `province` VALUES ('20', '450000', '广  西', null, null);
INSERT INTO `province` VALUES ('21', '460000', '海南省', null, null);
INSERT INTO `province` VALUES ('22', '500000', '重庆市', null, null);
INSERT INTO `province` VALUES ('23', '510000', '四川省', null, null);
INSERT INTO `province` VALUES ('24', '520000', '贵州省', null, null);
INSERT INTO `province` VALUES ('25', '530000', '云南省', null, null);
INSERT INTO `province` VALUES ('26', '540000', '西  藏', null, null);
INSERT INTO `province` VALUES ('27', '610000', '陕西省', null, null);
INSERT INTO `province` VALUES ('28', '620000', '甘肃省', null, null);
INSERT INTO `province` VALUES ('29', '630000', '青海省', null, null);
INSERT INTO `province` VALUES ('30', '640000', '宁  夏', null, null);
INSERT INTO `province` VALUES ('31', '650000', '新  疆', null, null);
INSERT INTO `province` VALUES ('32', '710000', '台湾省', null, null);
INSERT INTO `province` VALUES ('33', '810000', '香  港', null, null);
INSERT INTO `province` VALUES ('34', '820000', '澳  门', null, null);

-- ----------------------------
-- Table structure for `recteacher`
-- ----------------------------
DROP TABLE IF EXISTS `recteacher`;
CREATE TABLE `recteacher` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `userId` int(8) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort` int(8) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='社区名师推荐';

-- ----------------------------
-- Records of recteacher
-- ----------------------------
INSERT INTO `recteacher` VALUES ('1', '8', '朗朗', '3', '2016-08-05 10:27:09', '2016-08-05 10:27:46');
INSERT INTO `recteacher` VALUES ('6', '20', '李民', '1', '2016-08-09 11:38:13', null);
INSERT INTO `recteacher` VALUES ('3', '10', '李云迪', '2', '2016-08-05 10:27:20', null);
INSERT INTO `recteacher` VALUES ('8', '22', '王洵', '5', '2016-08-09 13:29:47', null);
INSERT INTO `recteacher` VALUES ('7', '23', '张丰', '4', '2016-08-09 13:29:36', null);

-- ----------------------------
-- Table structure for `refund`
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `refundType` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '退款原因\r\n            0 课程购买错误\r\n            1 课程内容与描述不符\r\n            2 其他',
  `refundAmount` int(8) DEFAULT NULL COMMENT '可退款金额',
  `orderTitle` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单名称',
  `orderSn` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单SN',
  `username` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '申请退款用户',
  `refundContent` text COLLATE utf8_unicode_ci COMMENT '退款描述',
  `status` tinyint(1) DEFAULT NULL COMMENT '退款状态 0为申请中  1为已经确认 退款中 2 完成',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='退款表';

-- ----------------------------
-- Records of refund
-- ----------------------------
INSERT INTO `refund` VALUES ('1', '0', '0', '李云迪——雨滴', '20160808141235_57a822d302d4e', 'qinying', '', '0', '2016-08-08 14:20:22', '2016-08-08 14:20:22');
INSERT INTO `refund` VALUES ('2', '2', '3', '超高标转换', '20160808161511_57a83f8faba50', 'ceshi1', '', '0', '2016-08-08 17:21:50', '2016-08-08 17:21:50');
INSERT INTO `refund` VALUES ('3', '2', '1', '学员qinying购买《太阳的后裔》主题', '2016080957a939a0553c2', 'qinying', '不太适合我现阶段的学习，不好意思哦', '0', '2016-08-09 10:03:36', '2016-08-09 10:03:36');
INSERT INTO `refund` VALUES ('4', '0', '1', '学员xueyuan购买通知1点评课程。', '2016080957a94f347ebab', 'xueyuan', '', '0', '2016-08-09 11:35:33', '2016-08-09 11:35:33');
INSERT INTO `refund` VALUES ('7', '1', '1', '李云迪——雨滴', '20160809151009_57a981d19bfc4', 'ceshi1', '', '0', '2016-08-09 15:11:18', '2016-08-09 15:11:18');
INSERT INTO `refund` VALUES ('8', '2', '1', '郎朗-柴可夫斯基第一钢琴协奏曲第一讲', '20160809110607_57a9489f3ca93', 'ceshi2', '', '0', '2016-08-09 15:14:20', '2016-08-09 15:14:20');
INSERT INTO `refund` VALUES ('9', '1', '333', '李云迪——花儿为什么那样红', '20160809150856_57a9818826aa6', 'liliang', '', '0', '2016-08-09 15:17:48', '2016-08-09 15:17:48');
INSERT INTO `refund` VALUES ('10', '1', '1', '学员liliang购买《月光奏鸣曲》点评', '2016080957a984e1a71d4', 'liliang', '', '0', '2016-08-09 15:24:21', '2016-08-09 15:24:21');
INSERT INTO `refund` VALUES ('11', '2', '1', '学员liliang购买动漫点评课程。', '2016080957a985b788505', 'liliang', '阿萨所谓的成所谓的成分为三', '0', '2016-08-09 15:55:28', '2016-08-09 15:55:28');
INSERT INTO `refund` VALUES ('12', '2', '1', '学员liliang购买通知1点评课程。', '2016080957a98548f2a0b', 'liliang', '呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜呜', '0', '2016-08-09 15:55:49', '2016-08-09 15:55:49');
INSERT INTO `refund` VALUES ('13', '1', '1', '贝多芬系列交响乐', '20160805164358_57a451ce5f436', 'wangchenkai', '', '0', '2016-08-10 15:36:51', '2016-08-10 15:36:51');
INSERT INTO `refund` VALUES ('14', '0', '1', '李云迪——雨滴', '20160810161640_57aae2e887c5d', 'liliang', '', '0', '2016-08-10 16:20:01', '2016-08-10 16:20:01');

-- ----------------------------
-- Table structure for `remarks`
-- ----------------------------
DROP TABLE IF EXISTS `remarks`;
CREATE TABLE `remarks` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '备注id',
  `orderid` int(8) DEFAULT NULL COMMENT '订单id',
  `content` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注信息',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='订单备注表';

-- ----------------------------
-- Records of remarks
-- ----------------------------
INSERT INTO `remarks` VALUES ('1', '161', '微信支付0.01元', '2016-08-10 10:02:35');

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('1', '1', '1', '2016-07-17 16:50:23', '2016-08-04 16:49:27');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` int(11) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'root', 'root', null, '1', '2016-07-16 17:12:58', '2016-08-04 16:56:38');
INSERT INTO `roles` VALUES ('4', 'test', 'test', null, '0', '2016-07-17 16:59:18', '2016-07-18 14:05:18');
INSERT INTO `roles` VALUES ('23', '部门岗位管理员', '部门岗位管理员', null, '0', '2016-07-25 11:07:51', null);
INSERT INTO `roles` VALUES ('22', '关于我们管理员', '关于我们管理员', null, '0', '2016-07-25 10:25:42', null);
INSERT INTO `roles` VALUES ('12', '赛事管理', '赛事管理', null, '0', '2016-07-19 14:14:13', null);
INSERT INTO `roles` VALUES ('15', '后台管理员', '后台管理员', null, '0', '2016-07-21 10:43:18', null);
INSERT INTO `roles` VALUES ('17', '权限管理员', '权限管理员', null, '0', '2016-07-23 16:35:42', '2016-07-23 16:41:12');
INSERT INTO `roles` VALUES ('26', '点评管理', '点评管理', null, '0', '2016-08-01 17:01:43', null);
INSERT INTO `roles` VALUES ('25', '课程管理员', '课程管理员', null, '0', '2016-08-01 15:59:24', '2016-08-01 16:04:31');
INSERT INTO `roles` VALUES ('27', '订单管理', '订单管理', null, '0', '2016-08-01 17:02:32', null);
INSERT INTO `roles` VALUES ('28', '数据统计管理', '数据统计管理', null, '0', '2016-08-01 17:03:26', null);
INSERT INTO `roles` VALUES ('29', '回收站管理', '回收站管理', null, '0', '2016-08-01 17:04:03', null);
INSERT INTO `roles` VALUES ('30', '应退金额', '应退金额', null, '0', '2016-08-01 17:26:30', null);
INSERT INTO `roles` VALUES ('31', '已退金额', '已退金额', null, '0', '2016-08-01 17:27:19', null);
INSERT INTO `roles` VALUES ('32', '名师管理', '名师管理', null, '0', '2016-08-02 09:56:52', null);

-- ----------------------------
-- Table structure for `systemmessage`
-- ----------------------------
DROP TABLE IF EXISTS `systemmessage`;
CREATE TABLE `systemmessage` (
  `id` int(8) NOT NULL,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '接受消息的管理员',
  `type` tinyint(1) DEFAULT NULL COMMENT '通知类型 0为点评视频审核\r\n            1为演奏视频审核\r\n            2为退款申请\r\n            3意见反馈',
  `resourceId` int(13) DEFAULT NULL COMMENT '课程视频或者退款意见反馈的ID',
  `title` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '作品名称 订单名称 ',
  `uploadUsername` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '上传用户名 学员或者名师',
  `ordePrice` int(8) DEFAULT NULL COMMENT '订单价格',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '退款原因 或者 反馈内容',
  `isRead` tinyint(1) DEFAULT NULL COMMENT '是否阅读',
  `addTime` datetime DEFAULT NULL COMMENT '上传日期或者申请时间或者反馈时间',
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='后台管理员接受通知表';

-- ----------------------------
-- Records of systemmessage
-- ----------------------------

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '年度信息报告主键ID',
  `parentId` int(8) DEFAULT NULL COMMENT '用户表id',
  `price` int(10) DEFAULT NULL COMMENT '价格',
  `stock` int(8) unsigned DEFAULT NULL COMMENT '点评名额（库存）',
  `intro` text COLLATE utf8_unicode_ci COMMENT '专家介绍',
  `cover` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '名师封面',
  `firstletter` char(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '首字母(用于排序和条件筛选)',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='名师信息表';

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('3', '8', '1', '43', '第一位受聘于世界顶级的柏林爱乐乐团和美国五大交响乐团的中国钢琴家，获得古典音乐类多项权威奖项，包括德国古典回声大奖等。<b>22222222</b>', '/home/image/community/b728dba8bdb793405799ba87fbc2e89c.jpg', 'L');
INSERT INTO `teacher` VALUES ('2', '5', '1', '85', '比楼上更厉害的名师', '/home/image/community/c1770f60331ef612f79d1f53be31a10e.png', 'L');
INSERT INTO `teacher` VALUES ('4', '10', '1', '33', '2000年，李云迪获得肖邦国际钢琴比赛冠军，成为首位获此奖项的中国人 。2001年，首登春晚舞台为观众演奏；同年，作为第一位中国钢琴家与环球DG唱片公司签约，并开启音乐会世界巡演。', '/home/image/community/65caa757accf5356a508519df561d3a8.png', 'N');
INSERT INTO `teacher` VALUES ('7', '13', '1', '92', '周杰伦周杰伦', '/home/image/community/c4d41bb65972b66d6594f59ed3e7912f.png', 'Z');
INSERT INTO `teacher` VALUES ('10', '20', '1', '0', '1988年于中央音乐学院钢琴系毕业后留校任教，并攻读硕士研究生，后担任中央音乐学院钢琴系共同课教研室主任。2001年初调入中国音乐学院负责组建钢琴系并于同年10月出任中国音乐学院钢琴系主任。2005年担任中国音乐学院教务处处长职务。', '/home/image/community/eac43d9edb365c12924191bd00e0f018.png', 'L');
INSERT INTO `teacher` VALUES ('11', '22', '1', '15', '自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人自由职业人', '/home/image/community/90a6a08c310c859b453c6e0d55c11b47.jpg', 'W');
INSERT INTO `teacher` VALUES ('12', '23', '1', '100', '张丰老师有多年的钢琴教学经验', '/home/image/community/9cb736febe0830c51afc17bf07fff5b2.png', 'Z');

-- ----------------------------
-- Table structure for `usermessage`
-- ----------------------------
DROP TABLE IF EXISTS `usermessage`;
CREATE TABLE `usermessage` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `username` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '操作用户名',
  `actionId` int(8) DEFAULT NULL COMMENT '资源ID 用于拼接跳转的URL',
  `courseType` tinyint(1) DEFAULT NULL COMMENT '0->专题课程  1->点评课程(评论回复时用，其余不用）',
  `type` tinyint(1) DEFAULT NULL COMMENT '消息类型  \r\n0为后台主动发送消息\r\n1为注册加入消息\r\n2为本人被点评消息\r\n3为本人被关注消息\r\n4为关注用户被点评消息\r\n5为用户评论被回复消息\r\n6为作品被评论消息\r\n7.为名师被邀请点评\r\n            \r\n            ',
  `tempId` int(8) DEFAULT '0' COMMENT ' 0 -> 前台的消息  \r\n非0 -> usermessagetem表外键',
  `content` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '信息内容',
  `client_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户端IP地址',
  `fromUsername` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '消息来源用户',
  `toUsername` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '其他相关用户',
  `isRead` tinyint(1) DEFAULT '0' COMMENT '0 -> 未读  1 -> 已读',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户通知表';

-- ----------------------------
-- Records of usermessage
-- ----------------------------
INSERT INTO `usermessage` VALUES ('87', 'ceshi2', '81', null, '2', '0', '周杰伦老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '周杰伦', 'admin', '1', '2016-08-08 11:12:31');
INSERT INTO `usermessage` VALUES ('2', '罗宁', '3', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'wangchenkai', '罗宁', '1', '2016-08-04 17:16:13');
INSERT INTO `usermessage` VALUES ('4', 'xueyuan', null, null, '1', '0', '恭喜您成功加入点评网，您的邀请码是：jtAPXZ', '106.2.164.226', null, null, '1', '2016-08-04 17:26:30');
INSERT INTO `usermessage` VALUES ('9', '罗宁', '3', null, '7', '0', '学员xueyuan向您发起点评邀请', '106.2.164.226', 'xueyuan', 'admin', '1', '2016-08-04 17:48:03');
INSERT INTO `usermessage` VALUES ('20', 'xueyuan', '6', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi2', 'xueyuan', '1', '2016-08-04 19:09:30');
INSERT INTO `usermessage` VALUES ('11', '罗宁', '4', null, '7', '0', '学员xueyuan向您发起点评邀请', '106.2.164.226', 'xueyuan', 'admin', '1', '2016-08-04 17:52:38');
INSERT INTO `usermessage` VALUES ('29', '罗宁', '2', '1', '5', '0', 'dasdasdasd', null, 'wangchenkai', '罗宁', '0', '2016-08-05 09:51:25');
INSERT INTO `usermessage` VALUES ('30', 'yundi', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', 'yundi', '1', '2016-08-05 10:35:33');
INSERT INTO `usermessage` VALUES ('22', 'qinying', '6', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi2', 'qinying', '1', '2016-08-04 19:23:59');
INSERT INTO `usermessage` VALUES ('18', '罗宁', '7', null, '0', '0', '外地人特然5', '106.2.164.226', 'admin', 'xueyuan', '1', '2016-08-04 18:59:57');
INSERT INTO `usermessage` VALUES ('23', '罗宁', '9', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'qinying', '罗宁', '1', '2016-08-04 19:25:28');
INSERT INTO `usermessage` VALUES ('25', 'qinying', '9', null, '2', '0', '罗宁老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '罗宁', 'admin', '1', '2016-08-04 19:30:54');
INSERT INTO `usermessage` VALUES ('26', 'ceshi2', '9', null, '4', '0', '罗宁老师点评了qinying的作品 点击可进入该点评视频详情页面', '106.2.164.226', '罗宁', 'qinying', '1', '2016-08-04 19:30:54');
INSERT INTO `usermessage` VALUES ('27', 'qinying', '9', '1', '6', '0', '通知1', null, 'ceshi2', 'qinying', '1', '2016-08-04 19:37:48');
INSERT INTO `usermessage` VALUES ('28', 'qinying', '9', '1', '6', '0', '通知1', null, 'ceshi2', 'qinying', '1', '2016-08-04 19:38:25');
INSERT INTO `usermessage` VALUES ('35', 'ceshi1', null, null, '0', null, '测试系统通知', '106.2.164.226', 'admin', null, '1', '2016-08-05 11:10:50');
INSERT INTO `usermessage` VALUES ('33', '周杰伦', '9', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'qinying', '周杰伦', '1', '2016-08-05 10:51:32');
INSERT INTO `usermessage` VALUES ('65', 'langlang', '6', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi2', 'langlang', '1', '2016-08-08 09:42:44');
INSERT INTO `usermessage` VALUES ('36', 'ceshi1', null, null, '0', null, '这是舍妹你呀', '106.2.164.226', 'admin', null, '1', '2016-08-05 11:16:01');
INSERT INTO `usermessage` VALUES ('37', 'ceshi1', null, null, '0', '1', '你你您', '106.2.164.226', 'admin', null, '1', '2016-08-05 11:22:40');
INSERT INTO `usermessage` VALUES ('38', 'ceshi1', null, null, '0', '1', 'aaaa', '106.2.164.226', 'admin', null, '1', '2016-08-05 11:25:39');
INSERT INTO `usermessage` VALUES ('42', 'ceshi1', '70', null, '2', '0', 'langlang老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'langlang', 'admin', '1', '2016-08-05 11:37:16');
INSERT INTO `usermessage` VALUES ('43', 'ceshi2', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', 'ceshi2', '1', '2016-08-05 13:41:26');
INSERT INTO `usermessage` VALUES ('44', 'whrcfzzj', null, null, '1', '0', '恭喜您成功加入点评网，您的邀请码是：8awyDI', '106.2.164.226', null, null, '1', '2016-08-05 13:50:24');
INSERT INTO `usermessage` VALUES ('45', 'ceshi1', '6', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi2', 'ceshi1', '1', '2016-08-05 13:59:03');
INSERT INTO `usermessage` VALUES ('46', 'langlang', '9', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'qinying', 'langlang', '1', '2016-08-05 14:14:09');
INSERT INTO `usermessage` VALUES ('47', 'ceshi1', '70', '1', '6', '0', '《梨花又开放》', null, 'qinying', 'ceshi1', '1', '2016-08-05 14:22:13');
INSERT INTO `usermessage` VALUES ('48', 'ceshi1', '70', '1', '6', '0', '《梨花又开放》', null, 'ceshi2', 'ceshi1', '1', '2016-08-05 15:46:08');
INSERT INTO `usermessage` VALUES ('53', 'ceshi2', '71', null, '2', '0', 'yundi老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'yundi', 'admin', '1', '2016-08-05 16:20:07');
INSERT INTO `usermessage` VALUES ('129', '李民', '21', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'liliang', '李民', '1', '2016-08-09 13:29:11');
INSERT INTO `usermessage` VALUES ('52', 'qinying', '13', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '周杰伦', 'qinying', '1', '2016-08-05 16:09:15');
INSERT INTO `usermessage` VALUES ('54', 'ceshi1', '71', null, '4', '0', 'yundi老师点评了ceshi2的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'yundi', 'ceshi2', '1', '2016-08-05 16:20:07');
INSERT INTO `usermessage` VALUES ('55', 'ceshi1', null, null, '0', '1', 'ddddeee', '106.2.164.226', 'admin', null, '1', '2016-08-05 17:35:43');
INSERT INTO `usermessage` VALUES ('56', 'ceshi1', '70', '1', '6', '0', '《梨花又开放》', null, 'qinying', 'ceshi1', '1', '2016-08-05 17:42:52');
INSERT INTO `usermessage` VALUES ('57', 'yundi', '13', null, '7', '0', '学员ceshi1向您发起点评邀请', '106.2.164.226', 'ceshi1', 'admin', '1', '2016-08-05 17:56:29');
INSERT INTO `usermessage` VALUES ('71', 'ceshi1', '80', '1', '6', '0', '《天黑黑》', null, 'langlang', 'ceshi1', '1', '2016-08-08 09:58:14');
INSERT INTO `usermessage` VALUES ('113', 'ceshi1', '8', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'langlang', 'ceshi1', '1', '2016-08-08 16:03:42');
INSERT INTO `usermessage` VALUES ('69', 'ceshi1', '80', null, '2', '0', 'langlang老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'langlang', 'admin', '1', '2016-08-08 09:50:00');
INSERT INTO `usermessage` VALUES ('70', 'ceshi2', '80', null, '4', '0', 'langlang老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'langlang', 'ceshi1', '1', '2016-08-08 09:50:00');
INSERT INTO `usermessage` VALUES ('66', 'langlang', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', 'langlang', '1', '2016-08-08 09:43:05');
INSERT INTO `usermessage` VALUES ('72', 'ceshi1', '80', '1', '6', '0', '《天黑黑》', null, 'langlang', 'ceshi1', '1', '2016-08-08 09:58:17');
INSERT INTO `usermessage` VALUES ('73', 'ceshi1', '80', '1', '6', '0', '《天黑黑》', null, 'langlang', 'ceshi1', '1', '2016-08-08 09:58:20');
INSERT INTO `usermessage` VALUES ('74', 'langlang', '80', '1', '5', '0', '飞凤飞飞飞凤飞飞凤飞飞凤飞飞凤飞飞凤飞飞凤飞飞', null, 'ceshi2', 'langlang', '0', '2016-08-08 09:59:48');
INSERT INTO `usermessage` VALUES ('75', 'langlang', '80', '1', '5', '0', '嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎嘎', null, 'ceshi2', 'langlang', '0', '2016-08-08 10:00:28');
INSERT INTO `usermessage` VALUES ('76', 'ceshi2', '80', '1', '5', '0', '顶顶顶顶顶', null, 'ceshi1', 'ceshi2', '1', '2016-08-08 10:01:31');
INSERT INTO `usermessage` VALUES ('77', 'ceshi1', '80', '1', '5', '0', '你你你你你你您', null, 'ceshi2', 'ceshi1', '1', '2016-08-08 10:03:15');
INSERT INTO `usermessage` VALUES ('78', 'ceshi1', '80', '1', '6', '0', '《天黑黑》', null, 'yundi', 'ceshi1', '1', '2016-08-08 10:04:02');
INSERT INTO `usermessage` VALUES ('79', 'yundi', '80', '1', '5', '0', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', null, 'ceshi1', 'yundi', '0', '2016-08-08 10:04:39');
INSERT INTO `usermessage` VALUES ('80', 'wangchenkai', '78', '1', '6', '0', '你好吗~', null, 'yundi', 'wangchenkai', '1', '2016-08-08 10:09:19');
INSERT INTO `usermessage` VALUES ('81', 'yundi', '78', '1', '5', '0', '我来了\n', null, 'ceshi2', 'yundi', '0', '2016-08-08 10:10:15');
INSERT INTO `usermessage` VALUES ('82', 'ceshi2', '78', '1', '5', '0', '回复名师', null, 'ceshi1', 'ceshi2', '1', '2016-08-08 10:11:06');
INSERT INTO `usermessage` VALUES ('83', 'ceshi1', '80', '1', '6', '0', '《天黑黑》', null, '周杰伦', 'ceshi1', '1', '2016-08-08 10:27:36');
INSERT INTO `usermessage` VALUES ('84', '周杰伦', '80', '1', '5', '0', '和嘿嘿嘿嘿和', null, 'ceshi2', '周杰伦', '0', '2016-08-08 10:28:20');
INSERT INTO `usermessage` VALUES ('88', 'ceshi1', '81', null, '4', '0', '周杰伦老师点评了ceshi2的作品 点击可进入该点评视频详情页面', '106.2.164.226', '周杰伦', 'ceshi2', '1', '2016-08-08 11:12:31');
INSERT INTO `usermessage` VALUES ('90', 'ceshi1', '82', null, '2', '0', 'yundi老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'yundi', 'admin', '1', '2016-08-08 11:29:22');
INSERT INTO `usermessage` VALUES ('91', 'ceshi2', '82', null, '4', '0', 'yundi老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'yundi', 'ceshi1', '1', '2016-08-08 11:29:22');
INSERT INTO `usermessage` VALUES ('92', 'yundi', '22', null, '7', '0', '学员ceshi1向您发起点评邀请', '106.2.164.226', 'ceshi1', 'admin', '1', '2016-08-08 11:48:12');
INSERT INTO `usermessage` VALUES ('93', '周杰伦', '8', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'langlang', '周杰伦', '1', '2016-08-08 13:27:24');
INSERT INTO `usermessage` VALUES ('95', 'ceshi1', '83', null, '2', '0', 'yundi老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'yundi', 'admin', '1', '2016-08-08 13:48:03');
INSERT INTO `usermessage` VALUES ('96', 'ceshi2', '83', null, '4', '0', 'yundi老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'yundi', 'ceshi1', '1', '2016-08-08 13:48:03');
INSERT INTO `usermessage` VALUES ('99', '周杰伦', '23', null, '7', '0', '学员qinying向您发起点评邀请', '106.2.164.226', 'qinying', 'admin', '1', '2016-08-08 13:56:41');
INSERT INTO `usermessage` VALUES ('100', 'qinying', '84', null, '2', '0', 'langlang老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'langlang', 'admin', '1', '2016-08-08 13:57:27');
INSERT INTO `usermessage` VALUES ('101', 'ceshi2', '84', null, '4', '0', 'langlang老师点评了qinying的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'langlang', 'qinying', '1', '2016-08-08 13:57:27');
INSERT INTO `usermessage` VALUES ('102', '周杰伦', '84', null, '4', '0', 'langlang老师点评了qinying的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'langlang', 'qinying', '1', '2016-08-08 13:57:27');
INSERT INTO `usermessage` VALUES ('107', 'ceshi2', '13', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '周杰伦', 'ceshi2', '1', '2016-08-08 15:51:46');
INSERT INTO `usermessage` VALUES ('106', 'yundi', '26', null, '7', '0', '学员ceshi1向您发起点评邀请', '106.2.164.226', 'ceshi1', 'admin', '1', '2016-08-08 15:49:56');
INSERT INTO `usermessage` VALUES ('110', 'ceshi2', '86', null, '2', '0', 'yundi老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', 'yundi', 'admin', '1', '2016-08-08 16:01:25');
INSERT INTO `usermessage` VALUES ('111', 'ceshi1', '86', null, '4', '0', 'yundi老师点评了ceshi2的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'yundi', 'ceshi2', '1', '2016-08-08 16:01:25');
INSERT INTO `usermessage` VALUES ('112', '周杰伦', '86', null, '4', '0', 'yundi老师点评了ceshi2的作品 点击可进入该点评视频详情页面', '106.2.164.226', 'yundi', 'ceshi2', '1', '2016-08-08 16:01:25');
INSERT INTO `usermessage` VALUES ('115', 'ceshi1', null, null, '0', '1', 'fdfsafafd', '106.2.164.226', 'admin', null, '1', '2016-08-08 16:33:11');
INSERT INTO `usermessage` VALUES ('116', 'ceshi1', null, null, '0', '1', 'dfsf', '127.0.0.1', 'admin', null, '1', '2016-08-08 16:35:01');
INSERT INTO `usermessage` VALUES ('120', 'ceshi2', '91', null, '2', '0', '贝多芬老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '贝多芬', 'admin', '1', '2016-08-08 16:51:06');
INSERT INTO `usermessage` VALUES ('121', 'ceshi1', '91', null, '4', '0', '贝多芬老师点评了ceshi2的作品 点击可进入该点评视频详情页面', '106.2.164.226', '贝多芬', 'ceshi2', '1', '2016-08-08 16:51:06');
INSERT INTO `usermessage` VALUES ('122', '周杰伦', '91', null, '4', '0', '贝多芬老师点评了ceshi2的作品 点击可进入该点评视频详情页面', '106.2.164.226', '贝多芬', 'ceshi2', '1', '2016-08-08 16:51:06');
INSERT INTO `usermessage` VALUES ('123', 'ceshi2', '91', '1', '6', '0', 'qqqqq', null, '贝多芬', 'ceshi2', '1', '2016-08-08 16:55:10');
INSERT INTO `usermessage` VALUES ('124', '贝多芬', '91', '1', '5', '0', '我是贝多芬\n', null, 'ceshi2', '贝多芬', '0', '2016-08-08 16:55:42');
INSERT INTO `usermessage` VALUES ('125', 'wangchenkai', '17', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'lilith', 'wangchenkai', '1', null);
INSERT INTO `usermessage` VALUES ('126', 'ceshi2', '9', '1', '5', '0', '关注者也可收到点评的信息', null, 'qinying', 'ceshi2', '1', '2016-08-09 10:01:14');
INSERT INTO `usermessage` VALUES ('127', 'ceshi1', null, null, '0', '5', '我是管理员 这是手动发布的   重新发一下吗', '106.2.164.226', 'admin', null, '1', '2016-08-09 10:26:32');
INSERT INTO `usermessage` VALUES ('128', 'wangchenkai', null, null, '0', '7', '手动发送通知', '106.2.164.226', 'admin', null, '1', '2016-08-09 10:27:23');
INSERT INTO `usermessage` VALUES ('134', '徐孟', '94', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-09 13:50:20');
INSERT INTO `usermessage` VALUES ('131', '徐孟', null, null, '1', '0', '恭喜您成功加入点评网，您的邀请码是：03fpqQ', '106.2.164.226', null, null, '1', '2016-08-09 13:39:50');
INSERT INTO `usermessage` VALUES ('132', '李民', '24', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '徐孟', '李民', '1', '2016-08-09 13:40:01');
INSERT INTO `usermessage` VALUES ('135', '宗硕琪', null, null, '1', '0', '恭喜您成功加入点评网，您的邀请码是：4bivLT', '106.2.164.226', null, null, '1', '2016-08-09 13:51:36');
INSERT INTO `usermessage` VALUES ('136', 'langlang', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', 'langlang', '1', '2016-08-09 14:00:29');
INSERT INTO `usermessage` VALUES ('137', 'liliang', '93', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-09 14:01:30');
INSERT INTO `usermessage` VALUES ('139', '宗硕琪', '95', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-09 14:06:27');
INSERT INTO `usermessage` VALUES ('140', '李民', '26', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '王秋实', '李民', '1', '2016-08-09 14:08:39');
INSERT INTO `usermessage` VALUES ('141', '周杰伦', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', '周杰伦', '1', '2016-08-09 14:09:51');
INSERT INTO `usermessage` VALUES ('143', '王秋实', '96', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-09 14:19:58');
INSERT INTO `usermessage` VALUES ('144', 'yundi', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', 'yundi', '1', '2016-08-09 14:39:09');
INSERT INTO `usermessage` VALUES ('159', 'whrcfzzj', '71', '1', '5', '0', '怎么可以发布评论呢？', null, 'ceshi1', 'whrcfzzj', '1', '2016-08-10 11:21:24');
INSERT INTO `usermessage` VALUES ('147', '王洵', '6', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi2', '王洵', '0', '2016-08-09 16:01:32');
INSERT INTO `usermessage` VALUES ('148', '周杰伦', '20', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '李民', '周杰伦', '1', '2016-08-09 16:06:28');
INSERT INTO `usermessage` VALUES ('149', '周杰伦', '6', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi2', '周杰伦', '1', '2016-08-09 16:07:03');
INSERT INTO `usermessage` VALUES ('150', '李民', '1', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'admin', '李民', '1', '2016-08-09 16:17:22');
INSERT INTO `usermessage` VALUES ('151', 'admin', '20', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '李民', 'admin', '0', '2016-08-09 16:44:48');
INSERT INTO `usermessage` VALUES ('152', 'ceshi4', null, null, '1', '0', '恭喜您成功加入点评网，您的邀请码是：78pvyB', '106.2.164.226', null, null, '1', '2016-08-09 16:53:33');
INSERT INTO `usermessage` VALUES ('153', 'qinying', '84', '1', '6', '0', 'apologize_标清.flv', null, 'ceshi4', 'qinying', '1', '2016-08-09 16:57:52');
INSERT INTO `usermessage` VALUES ('162', '李民', '3', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'wangchenkai', '李民', '1', '2016-08-10 14:57:12');
INSERT INTO `usermessage` VALUES ('155', 'ceshi2', '71', '1', '6', '0', '童话', null, 'whrcfzzj', 'ceshi2', '1', '2016-08-10 10:25:57');
INSERT INTO `usermessage` VALUES ('156', 'ceshi2', '71', '1', '6', '0', '童话', null, 'whrcfzzj', 'ceshi2', '1', '2016-08-10 10:26:07');
INSERT INTO `usermessage` VALUES ('157', 'ceshi2', '71', '1', '6', '0', '童话', null, 'ceshi1', 'ceshi2', '1', '2016-08-10 10:28:29');
INSERT INTO `usermessage` VALUES ('158', 'ceshi2', '71', '1', '6', '0', '童话', null, 'ceshi1', 'ceshi2', '1', '2016-08-10 10:28:58');
INSERT INTO `usermessage` VALUES ('164', 'ceshi1', '121', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-10 15:28:45');
INSERT INTO `usermessage` VALUES ('165', 'ceshi2', '121', null, '4', '0', '李民老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', '李民', 'ceshi1', '0', '2016-08-10 15:28:45');
INSERT INTO `usermessage` VALUES ('166', 'langlang', '121', null, '4', '0', '李民老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', '李民', 'ceshi1', '1', '2016-08-10 15:28:45');
INSERT INTO `usermessage` VALUES ('167', 'lilith', '3', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'wangchenkai', 'lilith', '0', '2016-08-10 15:37:05');
INSERT INTO `usermessage` VALUES ('169', '李民', '2', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, 'ceshi1', '李民', '1', '2016-08-10 16:03:23');
INSERT INTO `usermessage` VALUES ('183', 'wangchenkai', '135', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-10 17:26:17');
INSERT INTO `usermessage` VALUES ('170', 'ceshi1', '20', null, '3', '0', '刚刚关注了您,点击进入该用户个人公开主页。', null, '李民', 'ceshi1', '1', '2016-08-10 16:12:50');
INSERT INTO `usermessage` VALUES ('175', 'ceshi2', '122', null, '4', '0', '李民老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', '李民', 'ceshi1', '0', '2016-08-10 16:49:53');
INSERT INTO `usermessage` VALUES ('174', 'ceshi1', '122', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-10 16:49:53');
INSERT INTO `usermessage` VALUES ('176', 'langlang', '122', null, '4', '0', '李民老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', '李民', 'ceshi1', '1', '2016-08-10 16:49:53');
INSERT INTO `usermessage` VALUES ('178', '李民', '49', null, '7', '0', '学员ceshi1向您发起点评邀请', '106.2.164.226', 'ceshi1', 'admin', '1', '2016-08-10 17:18:17');
INSERT INTO `usermessage` VALUES ('180', 'ceshi1', '134', null, '2', '0', '李民老师点评了您的作品  点击可进入该点评页的详情页', '106.2.164.226', '李民', 'admin', '1', '2016-08-10 17:19:50');
INSERT INTO `usermessage` VALUES ('181', 'ceshi2', '134', null, '4', '0', '李民老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', '李民', 'ceshi1', '0', '2016-08-10 17:19:50');
INSERT INTO `usermessage` VALUES ('182', 'langlang', '134', null, '4', '0', '李民老师点评了ceshi1的作品 点击可进入该点评视频详情页面', '106.2.164.226', '李民', 'ceshi1', '1', '2016-08-10 17:19:50');
INSERT INTO `usermessage` VALUES ('185', '李民', '41', null, '7', '0', '学员liliang向您发起点评邀请', '106.2.164.226', 'liliang', 'admin', '1', '2016-08-10 17:30:15');
INSERT INTO `usermessage` VALUES ('186', 'langlang', '42', null, '7', '0', '学员liliang向您发起点评邀请', '106.2.164.226', 'liliang', 'admin', '1', '2016-08-10 17:36:31');
INSERT INTO `usermessage` VALUES ('189', 'yundi', '136', null, '0', '0', '来了', '106.2.164.226', 'admin', '王秋实', '0', '2016-08-11 09:43:29');

-- ----------------------------
-- Table structure for `usermessagetem`
-- ----------------------------
DROP TABLE IF EXISTS `usermessagetem`;
CREATE TABLE `usermessagetem` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `tempName` varchar(20) COLLATE utf8_unicode_ci NOT NULL COMMENT '模板名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0->学员 1->名师',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户通知模板表';

-- ----------------------------
-- Records of usermessagetem
-- ----------------------------
INSERT INTO `usermessagetem` VALUES ('1', '注册加入', '0');
INSERT INTO `usermessagetem` VALUES ('2', '被名师点评', '0');
INSERT INTO `usermessagetem` VALUES ('3', '演奏视频审核未通过', '0');
INSERT INTO `usermessagetem` VALUES ('4', '关注的用户被点评', '0');
INSERT INTO `usermessagetem` VALUES ('5', '被关注', '0');
INSERT INTO `usermessagetem` VALUES ('6', '作品被评论', '0');
INSERT INTO `usermessagetem` VALUES ('7', '评论被回复', '0');
INSERT INTO `usermessagetem` VALUES ('8', '被邀请点评', '1');
INSERT INTO `usermessagetem` VALUES ('9', '点评视频审核未通过', '1');
INSERT INTO `usermessagetem` VALUES ('10', '关注的用户被点评', '1');
INSERT INTO `usermessagetem` VALUES ('11', '被关注', '1');
INSERT INTO `usermessagetem` VALUES ('12', '评论被回复', '1');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `realname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '真实姓名',
  `userGrade` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户等级',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别 1为男生 2为女生',
  `phone` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机号码',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '登录密码',
  `yaoqingma` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '系统生成的个人邀请码',
  `fromyaoqingma` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推荐人邀请码 选填',
  `pic` varchar(100) COLLATE utf8_unicode_ci DEFAULT '/home/image/layout/default.png' COMMENT '用户头像',
  `pianoGrade` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '钢琴等级',
  `learnYear` int(4) DEFAULT '0' COMMENT '开始学琴时间年',
  `learnMonth` int(2) DEFAULT '0' COMMENT '开始学习钢琴时间月',
  `provinceId` int(10) DEFAULT '110000' COMMENT '所在省',
  `cityId` int(10) DEFAULT '110100' COMMENT '所在市 ',
  `birthYear` int(4) DEFAULT NULL COMMENT '出生年',
  `birthMonth` int(2) DEFAULT NULL COMMENT '出生年',
  `birthDay` int(2) DEFAULT NULL COMMENT '用户头像',
  `type` tinyint(4) DEFAULT '0' COMMENT '用户身份\r\n            0代表学生学员  1教师学员，2代表名师  3代表公司后台用户',
  `company` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '所在单位',
  `school` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '毕业院校',
  `education` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '学历',
  `professional` varchar(20) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '职称',
  `checks` tinyint(4) DEFAULT '0' COMMENT '审核状态，0为激活 1为禁用',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最近登录时间',
  `email` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `postId` int(8) DEFAULT NULL COMMENT '岗位id',
  `departId` int(8) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表（学生、教师、名师）';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', 'admin', '1', '1', '18361301645', 'gYIdqm2bD2OqbNLW3tEHx7P61cB0O1ac1DP3NEP45ykvGbFrXh14XFbT7AqA', '$2y$10$GrgZNfpKnAAIHUhOyNYWceTZ4OXzS9mQ0W5AZkr3egwwZ4WUu5IP.', null, '654321', '/home/image/layout/default.png', null, '0', '0', '110000', '110100', null, null, null, '3', '中央音乐学院', '中央音乐学院', '专科', '', '0', '2016-06-30 16:48:58', '2016-08-10 17:43:42', 'admin@163.com', '1', '1');
INSERT INTO `users` VALUES ('2', 'ceshi1', null, null, '2', '15733277963', 'FW4d6Cn23zAwKXWdDtpn5p5CYWdd2xZ0u0MqdoKD69SCdEGWt9NfJubdz8jS', '$2y$10$FUMMr0eZUr.jM7GKI3flvOu68nY2lOCgwzEwhet6Jx0IkY/S7D.7a', '7vxIMZ', null, '/uploads/heads/cut1470300632.png', '钢琴三级', '2015', '3', '130000', '130600', '0', '0', '0', '0', null, null, null, '', '0', '2016-08-04 16:49:53', '2016-08-10 17:30:12', null, null, null);
INSERT INTO `users` VALUES ('3', 'wangchenkai', 'wangchenkai', '1', '1', '18992884732', 'FE9x0wJ8VQGROAUc6w2EVERkb50FreNmwAFwE0oWL9pTYOz0xwkNDJiicAEN', '$2y$10$GrgZNfpKnAAIHUhOyNYWceTZ4OXzS9mQ0W5AZkr3egwwZ4WUu5IP.', '654321', '', '/uploads/heads/cut1470391902.png', '', '0', '0', '110000', '110100', null, null, null, '1', '中央音乐学院', '中央音乐学院', '', '', '0', '2016-06-30 16:48:58', '2016-08-11 09:29:41', 'admin@163.com', '1', '1');
INSERT INTO `users` VALUES ('8', 'langlang', '朗朗', null, '1', '15733278541', '7TqLI2QyNGGrdeeHbry5kf2WSAqtzwVU77YMLcDSdUSUs2yKSRVoSW7wqswC', '$2y$10$RCIRvnXjHIBh8iKX6vIadOo7RsJq2S5nsZb65avo74NWj.qCDfFBy', null, null, '/uploads/heads/cut1470364787.png', null, '0', '0', '110000', '110100', null, null, null, '2', '世界的郎朗，华人的骄傲', null, '博士后', '钢琴师', '0', '2016-08-04 17:46:17', '2016-08-10 18:36:17', null, null, null);
INSERT INTO `users` VALUES ('5', '罗宁', '罗宁', '1', '1', '18610384373', 'e52FYrTyl9n0DhKw8A67F1G03aPC862hGAg0Errde1jOGK5Y7bzOI6Xgpj05', '$2y$10$GrgZNfpKnAAIHUhOyNYWceTZ4OXzS9mQ0W5AZkr3egwwZ4WUu5IP.', '', '654321', '/uploads/heads/cut1470649895.png', '', '0', '0', '110000', '110100', null, null, null, '2', '中央音乐学院', '中央音乐学院', '学历', '', '0', '2016-06-30 16:48:58', '2016-08-08 10:27:09', 'admin@163.com', '1', '1');
INSERT INTO `users` VALUES ('6', 'ceshi2', '', null, '1', '15733277965', 'pRgr2hETv1IYhNoPPjcQL2D2BaUI3X46XWuFPAYUfYpejPkCzLQuwPPVhp14', '$2y$10$hK/om9zywEKIAC3caWKqeucLveJ8vzRON0uP9RR1GoNccL.AQdT1C', '7GNQUY', '', '/uploads/heads/cut1470301768.png', '钢琴九级', '2006', '6', '110000', '110100', '1993', '1', '17', '0', '', '', '', '', '0', '2016-08-04 17:09:58', '2016-08-10 14:04:03', null, null, null);
INSERT INTO `users` VALUES ('7', 'xueyuan', null, null, '2', '18500291700', 'lQl5BhDLllHTsI6I5mKz4W3tKbGOi1BHdAyPSrwJAM8Sg37xIw3PrVKkiN2z', '$2y$10$efU89YOsPsjII3sbQv2QiOT5iBJFOErwC8VRnZX.JmgBnuMDwwX/a', 'jtAPXZ', null, '/home/image/layout/default.png', '钢琴二级', '2015', '2', '120000', '120100', '0', '0', '0', '0', null, null, null, '', '0', '2016-08-04 17:26:12', '2016-08-09 13:28:44', null, null, null);
INSERT INTO `users` VALUES ('9', 'qinying', '', null, '2', '18500291755', 'Dxt9gw4XZ9AxTnodKYKQucAYFWScPyt2fM0qFAJnqMQZ4aqWLh6vzMm307NJ', '$2y$10$7YIgvvxl3PbCWQ2KRGjgp.DMl290NAuvLHCEN23iOnqzRv4nvqHba', '2vBCJT', '', '/uploads/heads/cut1470309791.png', '钢琴五级', '2015', '3', '210000', '210100', '2004', '2', '16', '0', '', '', '', '', '0', '2016-08-04 19:23:38', '2016-08-10 16:34:05', null, null, null);
INSERT INTO `users` VALUES ('10', 'yundi', '李云迪', null, '1', '15235265984', 'gwU9MCTUdIRt6CYpRAKNu71SYIVuZHoUfAsoiCq4zXhvKRoo7eTfFw20Iqdw', '$2y$10$t7ArUexkfv0NC1skp8thseaPu2aSjUEw.yj6KeQNWiOPecZbUHN0.', null, null, '/uploads/heads/cut1470362341.png', null, '0', '0', '110000', '110100', null, null, null, '2', '中国音协', null, '博士后', '钢琴家', '0', '2016-08-05 09:59:32', '2016-08-10 17:28:33', null, null, null);
INSERT INTO `users` VALUES ('13', '周杰伦', '周杰伦', null, '1', '18500000700', 'p5GeFwOd8fmGm0qGDPfkoOf2ELe674Dyo1GuSk00ru9iucAlpTUD9nlaFhmM', '$2y$10$VLpGC/4IzSpQ1sZx2gco0.KZsGxqdclz/TaeECpitd8aBjIaSCMZa', null, null, '/uploads/heads/cut1470363716.png', null, '0', '0', '110000', '110100', null, null, null, '2', '自由职业人', null, '中专', '自由职业人', '0', '2016-08-05 10:23:22', '2016-08-10 17:11:41', null, null, null);
INSERT INTO `users` VALUES ('14', 'ceshi3', '', null, '2', '15232655852', '3fdRXDIgtDWC6HLLU7idEatH1dIUZCXDS9v8eFrmh4Ri9M9S9PgVkz3uMNJP', '$2y$10$jJAIVQFyTL4g7fEwBMXakOmUrXOeaSnWJl6/P7gkWxwIaa8k9OvQG', 'jlnuvY', '', '/home/image/layout/default.png', '钢琴二级', '2016', '0', '110000', '110100', '1999', '0', '0', '0', '', '', '', '', '0', '2016-08-05 11:49:39', '2016-08-08 16:37:37', null, null, null);
INSERT INTO `users` VALUES ('16', 'whrcfzzj', null, null, '1', '15175232670', 'AiUMZCvOKp3bQuz9sClZHDRiGtxN5Z8FbEB29TFTT2S7VJw9e69aM1zRHrDQ', '$2y$10$pmeJH3d5PA0n65GddUC4Cuz0VsaXEDZEURJnh6JLe1NdKHSWQiNEe', '8awyDI', null, '/uploads/heads/cut1470725224.png', '钢琴十级', '1994', '12', '130000', '130400', '1993', '12', null, '0', null, null, null, '', '0', '2016-08-05 13:50:13', '2016-08-11 09:29:12', null, null, null);
INSERT INTO `users` VALUES ('17', 'lilith', '莉莉丝', '1', '2', '18992809023', 'eiUddYuN7FmJqFK8LktRrDcbBjVOxTiExEWdXXxxhEiSdUJ6YHAjCYW3jMB0', '$2y$10$GrgZNfpKnAAIHUhOyNYWceTZ4OXzS9mQ0W5AZkr3egwwZ4WUu5IP.', '', '654321', '/uploads/heads/cut1470649882.png', '', '0', '0', '110000', '110100', null, null, null, '1', '中央音乐学院', '中央音乐学院', '学历', '', '0', '2016-06-30 16:48:58', '2016-08-05 18:00:26', 'admin@163.com', '1', '1');
INSERT INTO `users` VALUES ('20', '李民', '李民', null, '1', '13501111111', 'ysXWMtr4mu5V2Om9a6IetgQqoXnv8sHXTK7EzMmDvn229VcFz6QkY80whiM5', '$2y$10$GrgZNfpKnAAIHUhOyNYWceTZ4OXzS9mQ0W5AZkr3egwwZ4WUu5IP.', null, null, '/uploads/heads/cut1470713692.png', null, '0', '0', '110000', '110100', null, null, null, '2', '中央音乐学院', null, '博士后', '教授', '0', '2016-08-09 11:35:45', '2016-08-10 18:24:24', null, null, null);
INSERT INTO `users` VALUES ('21', 'liliang', '', null, '2', '18500291000', 'lFUG6h1b0zeZ0WFna08gY54NmA4Q306I0aUFGQXBC4mYQibsXPBxcRxgd1vX', '$2y$10$AWO75HjzFL/vwaun2t6BzuOjanfJCyp9T83C.vdjQhe1mu8U4qcTW', 'bhjoFW', '', '/uploads/heads/cut1470720161.png', '钢琴四级', '2015', '3', '110000', '110100', '2006', '2', '8', '0', '', '', '', '', '0', '2016-08-09 13:23:09', '2016-08-11 09:27:21', null, null, null);
INSERT INTO `users` VALUES ('22', '王洵', '王洵', null, '1', '18500000702', null, '$2y$10$ENFDurKtc5oZ5n3uT7rtz.8pZOM.jIfpOySLBmYgiHzmo58977hOa', null, null, '/uploads/heads/cut1470720289.png', null, '0', '0', '120000', '120100', null, null, null, '2', '自由职业人自由职业人', null, '硕士', '自由职业人', '0', '2016-08-09 13:26:02', '2016-08-09 13:26:02', null, null, null);
INSERT INTO `users` VALUES ('23', '张丰', '张丰', null, '1', '13587412312', null, '$2y$10$zbmA3YQ4PZuE3G/40bPBG.wago7VjelYlE010OGS2OT8j6MnPU2X.', null, null, '/uploads/heads/cut1470720392.png', null, '0', '0', '120000', '120100', null, null, null, '2', '天津音乐学院', null, '博士', '教授', '0', '2016-08-09 13:27:25', '2016-08-09 13:27:25', null, null, null);
INSERT INTO `users` VALUES ('24', '徐孟', null, null, '2', '15485233698', 'ciO1Ze33sL2wraPkG9jaCz6rfoqTdY6Ojf2yQjYPxQTOxhtQMJSljL60zLhY', '$2y$10$1fo0PlV6QXK2RRbRkFIGyu6Y5qlbAZMZe50jCLImgEzHem1MsCP8m', '03fpqQ', null, '/home/image/layout/default.png', '钢琴二级', '2013', '3', '0', '0', null, null, null, '0', null, null, null, '', '0', '2016-08-09 13:39:35', '2016-08-09 13:50:48', null, null, null);
INSERT INTO `users` VALUES ('25', '宗硕琪', null, null, '1', '15632589654', null, '$2y$10$0RrRtjZA4eDKMHnAgHtyIuAWbQY8c/xwTiOJn.ThUmZoG4svKuxGe', '4bivLT', null, '/home/image/layout/default.png', '等级', '0', '0', '0', '0', null, null, null, '0', null, null, null, '', '0', '2016-08-09 13:51:33', '2016-08-09 13:51:33', null, null, null);
INSERT INTO `users` VALUES ('26', '王秋实', '', null, '1', '18500000704', 'GAtGsvPN1nhQX7ijI1ZQXUujHHtIIFSPa3VXiKtW3bRh6V7E9vvvGyDKZXmS', '$2y$10$WoCHqngTMibv1PliUSK./.cmzPzF0W.elzUbb77Xiojw1VroEf.c2', '59clsE', '', '/uploads/heads/cut1470722846.png', '钢琴五级', '2014', '4', '150000', '150200', '2006', '4', '10', '0', '', '', '', '', '0', '2016-08-09 14:07:48', '2016-08-10 14:27:16', null, null, null);
INSERT INTO `users` VALUES ('27', 'ceshi4', '', null, '1', '15823659852', null, '$2y$10$sVt9qZwGM/HQkk/GiMpbxefXsW0Ha2ogrvdnIq2vqTcHS8T.MoFAO', '78pvyB', '', '/home/image/layout/default.png', '钢琴一级', '2015', '0', '110000', '0', '1998', '0', '0', '0', '', '', '', '', '0', '2016-08-09 16:53:33', '2016-08-09 16:53:33', null, null, null);
