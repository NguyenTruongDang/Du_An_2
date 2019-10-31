-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 02:06 PM
-- Server version: 10.1.34-MariaDB
-- PHP Version: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuacuon`
--

-- --------------------------------------------------------

--
-- Table structure for table `binhluan`
--

CREATE TABLE `binhluan` (
  `id` int(11) NOT NULL,
  `id_tintuc` int(11) NOT NULL,
  `id_nguoidung` int(11) NOT NULL,
  `noidung` text NOT NULL,
  `parent_id` int(11) NOT NULL,
  `sender_name` varchar(200) NOT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cauhinh`
--

CREATE TABLE `cauhinh` (
  `id` int(11) NOT NULL,
  `ten` varchar(100) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `sdt` varchar(20) NOT NULL,
  `page_fb` varchar(100) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `map_gg` text NOT NULL,
  `analytics` text NOT NULL,
  `title_seo` varchar(225) NOT NULL,
  `desc_seo` text NOT NULL,
  `key_seo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `nguoidung`
--

CREATE TABLE `nguoidung` (
  `token` varchar(200) NOT NULL,
  `id` int(11) NOT NULL,
  `ten` varchar(225) NOT NULL,
  `ten_ko` varchar(200) NOT NULL,
  `avatar` varchar(200) NOT NULL,
  `mail` varchar(225) NOT NULL,
  `mat_khau` varchar(20) NOT NULL,
  `ngay_tao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trang_thai` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:đọc giả, 1:kiểm duyệt, 2:quản lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nguoidung`
--

INSERT INTO `nguoidung` (`token`, `id`, `ten`, `ten_ko`, `avatar`, `mail`, `mat_khau`, `ngay_tao`, `trang_thai`) VALUES
('4CgVUz9R08940b9QqSk1agaAlbOmSSHKte1aIf0IRc0dM5PMut', 3, 'Văn Hải', '', '', 'hainvps07661@fpt.edu.vn', '123456', '2019-10-08 07:16:51', 0),
('LLc8FUiPBn5yJbqxfyrG8Dz4MPTWdwNydP9kazgSxMsGNfckXo', 5, 'Trường Đăng', '', '', 'nguyentruongdang1010@gmail.com', '123456', '2019-10-08 12:54:56', 0),
('QDBrOFmdQxXWbl4MdpRoQLOPJ0Z2m9ufWpfmiCsSaNBUaV2n8S', 7, 'Văn Hải', 'Van-Hai', '', 'chutiembanh998@gmail.com', 'vanhai123', '2019-10-25 11:10:13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

CREATE TABLE `saved` (
  `id_tintuc` int(11) NOT NULL,
  `id_nguoidung` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `ten_tags` varchar(225) NOT NULL,
  `tags_ko` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `ten_tags`, `tags_ko`) VALUES
(1, 'tour', 'tour'),
(2, 'văn hải', 'van-hai');

-- --------------------------------------------------------

--
-- Table structure for table `theloai`
--

CREATE TABLE `theloai` (
  `id` int(11) NOT NULL,
  `tentl` varchar(200) NOT NULL,
  `tentl_ko` varchar(200) NOT NULL,
  `menu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: không hiển thị ở thanh menu, 1:hiển thị',
  `home` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: không hiển thị ở trang chủ, 1:hiển thị',
  `title_seo` varchar(225) NOT NULL,
  `desc_seo` text NOT NULL,
  `key_seo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theloai`
--

INSERT INTO `theloai` (`id`, `tentl`, `tentl_ko`, `menu`, `home`, `title_seo`, `desc_seo`, `key_seo`) VALUES
(1, 'Thể thao', 'The-thao', 1, 1, '', '', ''),
(2, 'Du lịch', 'Du-lich', 1, 1, '', '', ''),
(3, 'Giải trí', 'Giai-tri', 1, 0, '', '', ''),
(4, 'Khoa học', 'Khoa-hoc', 1, 0, '', '', ''),
(5, 'Thế giới', 'The-gioi', 1, 0, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `id` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `ava_img` varchar(200) NOT NULL,
  `alt_img` varchar(200) NOT NULL,
  `tieude` varchar(225) NOT NULL,
  `tieude_ko` varchar(225) NOT NULL,
  `mota` text NOT NULL,
  `noidung` longtext NOT NULL,
  `tags` text NOT NULL,
  `luotxem` bigint(20) NOT NULL DEFAULT '0',
  `ngaydang` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dacbiet` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0: tin bình thường, 1:tin đặc biệt',
  `hienthi` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:tin không hiển thị, 1:tin đặc biệt',
  `title_seo` varchar(225) NOT NULL,
  `desc_seo` text NOT NULL,
  `key_seo` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tintuc`
--

INSERT INTO `tintuc` (`id`, `id_type`, `id_user`, `ava_img`, `alt_img`, `tieude`, `tieude_ko`, `mota`, `noidung`, `tags`, `luotxem`, `ngaydang`, `dacbiet`, `hienthi`, `title_seo`, `desc_seo`, `key_seo`) VALUES
(2, 1, 3, '1571737744-img1.jpg', 'HLV-Park-Hang-seo-va-nhung-thu-thach-tren-dinh-cao', 'HLV Park Hang-seo và những thử thách trên đỉnh cao', 'HLV-Park-Hang-seo-va-nhung-thu-thach-tren-dinh-cao', 'Sau hai năm với những thành tựu chưa từng có, HLV Park Hang-seo sẽ đối diện rất nhiều sóng gió vì mục tiêu giữ đà thăng tiến cho bóng đá Việt Nam. ', '<p>Những ng&agrave;y n&agrave;y, c&aacute;ch đ&acirc;y hai năm, lời từ chối của chuy&ecirc;n gia Nhật Bản Sekizuka Takashi đ&atilde; mở ra c&aacute;nh cửa để b&oacute;ng đ&aacute; Việt Nam tiếp cận Park Hang-seo. Đ&oacute; c&oacute; thể xem l&agrave; một cơ duy&ecirc;n.&nbsp;L&uacute;c đ&oacute;, b&oacute;ng đ&aacute; Việt Nam đang kh&oacute; khăn về t&agrave;i ch&iacute;nh v&agrave; nh&acirc;n sự, c&ograve;n bầu Đức đ&atilde; tuy&ecirc;n bố xin từ chức ở VFF. Chuyến đi sang H&agrave;n Quốc k&yacute; hợp đồng với &ocirc;ng Park l&agrave; c&ocirc;ng việc cuối c&ugrave;ng m&agrave; bầu Đức xuất hiện với vai tr&ograve; l&atilde;nh đạo VFF.</p>\r\n\r\n<p>Nhưng c&oacute; lẽ bầu Đức kh&ocirc;ng tận tụy đến như vậy, nếu kh&ocirc;ng xuất ph&aacute;t từ một cơ duy&ecirc;n kh&aacute;c - ch&iacute;nh l&agrave; &quot;những đứa trẻ của &ocirc;ng&quot;, tức lứa cầu thủ U19 của HAGL. Bầu Đức khao kh&aacute;t được thấy C&ocirc;ng Phượng, Xu&acirc;n Trường, Tuấn Anh... th&agrave;nh c&ocirc;ng. &Ocirc;ng kh&ocirc;ng tiếc thời gian thuyết phục Nutifood rồi VP Milk đổ tiền để đầu tư cho lứa cầu thủ n&agrave;y. Bầu Đức cũng từng c&ocirc;ng khai ch&ecirc; t&agrave;i năng của HLV Ho&agrave;ng Anh Tuấn, v&igrave; &ocirc;ng tin rằng lứa U19 dự World Cup cũng l&agrave; những t&agrave;i năng chưa được đặt v&agrave;o tay của người th&iacute;ch hợp. Sau thất bại của HLV Nguyễn Hữu Thắng, bầu Đức c&agrave;ng n&ocirc;n n&oacute;ng hơn. Bằng cảm quan của một &ocirc;ng chủ tập đo&agrave;n, bầu Đức biết chỉ c&oacute; HLV ngoại mới đủ tầm để thăng hoa những tinh hoa &quot;trăm năm c&oacute; một&quot; m&agrave; b&oacute;ng đ&aacute; Việt Nam phải mất 10 năm mới sản sinh được. Đ&oacute; l&agrave; lứa cầu thủ được gieo mầm từ thời cực thịnh nhất của b&oacute;ng đ&aacute; Việt Nam những năm 2007-2010 với h&agrave;ng loạt &ocirc;ng bầu, l&ograve; đ&agrave;o tạo tư nh&acirc;n, v&agrave; h&agrave;ng trăm tỷ đồng đầu tư.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Hai năm trong bản hợp đồng đầu tiên của HLV Park Hang-seo sắp sửa kết thúc một cách mỹ mãn, và nếu tiếp tục với bóng đá Việt Nam, ông sẽ đối diện với những thử thách khắc nghiệt hơn trước rất nhiều. Ảnh: Đức Đồng.\" src=\"https://i-thethao.vnecdn.net/2019/10/22/hlv-park-hang-seo205-157172724-8838-1710-1571727541.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Hai năm trong bản hợp đồng đầu ti&ecirc;n của HLV Park Hang-seo sắp sửa kết th&uacute;c một c&aacute;ch mỹ m&atilde;n, v&agrave; nếu tiếp tục với b&oacute;ng đ&aacute; Việt Nam, &ocirc;ng sẽ đối diện với những thử th&aacute;ch khắc nghiệt hơn trước rất nhiều. Ảnh:<em>&nbsp;Đức Đồng.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Kh&ocirc;ng c&oacute; sự vĩ đại n&agrave;o lại khởi đầu từ may mắn cả</strong>. B&oacute;ng đ&aacute; Việt Nam gặp được Park Hang-seo, người đ&atilde; ki&ecirc;n định với triết l&yacute; b&oacute;ng đ&aacute; của &ocirc;ng bất chấp sự lận đận của sự nghiệp cầm qu&acirc;n. Từ chỗ chuẩn bị bước v&agrave;o sự v&ocirc; danh của tuổi gi&agrave;, Park Hang-seo&nbsp;như con phượng ho&agrave;ng t&aacute;i sinh những ngọn lửa tinh anh vốn bị che khuất b&ecirc;n dưới lớp tro dầy.</p>\r\n\r\n<p>Kể từ sau thế hệ v&agrave;ng đầu ti&ecirc;n với chiếc HC bạc SEA Games 1995, b&oacute;ng đ&aacute; Việt Nam khao kh&aacute;t một thế hệ v&agrave;ng kế tiếp đến mức thường xuy&ecirc;n gắn cụm từ hoa mỹ n&agrave;y v&agrave;o đội tuyển ở một v&agrave;i thời điểm. Lứa cầu thủ trẻ 2003 với n&ograve;ng cốt SLNA đ&atilde; bị tan hoang sau scandal b&aacute;n độ SEA Games 2005. Đội tuyển v&ocirc; địch AFF Cup 2008 thực ra kh&ocirc;ng phải l&agrave; một thế hệ được sinh ra c&ugrave;ng thời, m&agrave; l&agrave; sự kết nối giữa nh&oacute;m cầu thủ 2003 v&agrave; những người được r&egrave;n luyện nhờ V-League b&ugrave;ng nổ l&uacute;c đ&oacute;. Nhưng tập thể trong tay HLV Park Hang-seo thực sự l&agrave; v&agrave;ng r&ograve;ng. Đa số họ đến từ ba đội b&oacute;ng H&agrave; Nội, SLNA v&agrave; HAGL - những &quot;th&aacute;nh địa&quot; của trẻ v&agrave; b&oacute;ng đ&aacute; chuy&ecirc;n nghiệp. Nhờ vậy, họ c&oacute; tư duy, kỹ thuật cơ bản v&agrave; đặc biệt l&agrave; &yacute; thức chuy&ecirc;n nghiệp vượt xa so với c&aacute;i thời &quot;qu&acirc;n anh- qu&acirc;n t&ocirc;i&quot; k&egrave;n cựa nhau trước đ&acirc;y.</p>\r\n\r\n<p>Nếu kh&ocirc;ng t&iacute;nh &quot;l&atilde;o tướng&quot; Anh Đức, độ tuổi trung b&igrave;nh đội tuyển chỉ l&agrave;&nbsp; chừng 24-25. Họ l&agrave; những người đ&atilde; đ&aacute; quốc tế ở đẳng cấp ch&acirc;u &Aacute; v&agrave; World Cup từ năm 18 tuổi, đ&atilde; trải nghiệm V-League từ 19 tuổi v&agrave; từ năm 2017 đến nay, đ&atilde; c&ugrave;ng chơi b&oacute;ng trong m&agrave;u &aacute;o đội tuyển quốc gia. Nghĩa l&agrave;, họ c&oacute; thể thi đấu m&agrave; kh&ocirc;ng cần phải ngước mắt nh&igrave;n nhau tr&ecirc;n s&acirc;n &iacute;t nhất th&ecirc;m năm năm nữa.</p>\r\n\r\n<p>Nhưng, nếu n&oacute;i b&oacute;ng đ&aacute; Việt Nam ở&nbsp;<a href=\"https://vnexpress.net/bong-da/de-che-park-hang-seo-o-viet-nam-3998787.html\">đế chế Park Hang-seo</a>&nbsp;khởi đầu bởi những cơ duy&ecirc;n, th&igrave; đằng sau những vinh quang, sẽ kh&ocirc;ng c&ograve;n l&agrave; cơ duy&ecirc;n n&agrave;o nữa. Thế giới b&oacute;ng đ&aacute; l&agrave; những ngọn n&uacute;i tr&ugrave;ng điệp nối tiếp nhau. B&oacute;ng đ&aacute; Việt Nam c&oacute; đứng tr&ecirc;n đỉnh của Đ&ocirc;ng Nam &Aacute;, th&igrave; ngay trước mắt l&agrave; ngọn n&uacute;i &Aacute; ch&acirc;u. Nếu ch&uacute;ng ta gọi nơi dừng ch&acirc;n đ&oacute; l&agrave; đỉnh, th&igrave; ch&uacute;ng ta chỉ c&oacute; thể đi xuống. Nhưng nếu c&oacute; tham vọng, ch&uacute;ng ta phải biết rằng đ&oacute; chỉ l&agrave; vị tr&iacute; xuất ph&aacute;t cho cuộc chinh phục ngọn n&uacute;i cao hơn.</p>\r\n\r\n<p><strong>D&ugrave; &ocirc;ng Park c&oacute; một gia t&agrave;i với thế hệ t&agrave;i hoa trong tay, kh&ocirc;ng c&oacute; nghĩa mọi thứ đều đ&atilde; l&agrave; những thỏi v&agrave;ng</strong>. V-League kh&ocirc;ng đ&agrave;o tạo được một tay săn b&agrave;n n&agrave;o. 10 năm trước, Anh Đức&nbsp; kh&ocirc;ng c&oacute; &quot;cửa&quot; l&ecirc;n đội tuyển khi cạnh tranh với Việt Thắng, Quang Hải, C&ocirc;ng Vinh. H&agrave;ng tấn c&ocirc;ng của c&aacute;c đội tuyển Việt Nam hiện nay kh&ocirc;ng thiếu những nghệ nh&acirc;n, nhưng b&oacute;i kh&ocirc;ng ra một s&aacute;t thủ v&ograve;ng cấm. Đ&agrave;nh rằng Việt Nam c&oacute; thể giải quyết trận đấu bằng c&aacute;ch ki&ecirc;n tr&igrave; tạo dựng cơ hội để ghi b&agrave;n, nhưng đ&ocirc;i khi, ở c&aacute;c cuộc đối đầu đỉnh cao, chiến thắng chỉ đơn giản l&agrave; trừng phạt sai lầm của đối phương bằng một tiền đạo c&oacute; khả năng tận dụng cơ hội nhỏ nhoi nhất.</p>\r\n\r\n<p>N&ecirc;n thay v&igrave; chờ đợi một nh&acirc;n tố được s&agrave;ng lọc từ 26 v&ograve;ng đấu của V-League, HLV Park Hang-seo buộc phải mạo hiểm với những h&ograve;n đ&aacute; th&ocirc; như Nguyễn Tiến Linh hay Nguyễn Việt Phong. Chỉ c&oacute; điều, để m&agrave;i giũa họ, lu&ocirc;n cần c&oacute; thời gian v&agrave; ki&ecirc;n nhẫn.</p>\r\n\r\n<p>Qu&aacute; tr&igrave;nh đ&agrave;m ph&aacute;n hợp đồng của HLV Park Hang-seo v&agrave; VFF dường như bị &quot;tắc&quot; ở điểm n&agrave;y. &Ocirc;ng Park biết rằng đ&atilde; đến l&uacute;c t&iacute;nh bất ngờ kh&ocirc;ng c&ograve;n nữa, giờ l&agrave; l&uacute;c l&agrave;m việc cật lực, chấp nhận những thất bại ngắn hạn để bồi đắp đội ngũ hiện tại. Trong khi đ&oacute;, c&oacute; thể VFF lại đưa ra những y&ecirc;u cầu về th&agrave;nh t&iacute;ch, những mục ti&ecirc;u theo kiểu đ&atilde; v&ocirc; địch AFF Cup th&igrave; phải đoạt HC v&agrave;ng SEA Games, đ&atilde; l&agrave; &aacute; qu&acirc;n U23 ch&acirc;u &Aacute; th&igrave; kỳ tới dứt kho&aacute;t phải v&ocirc; địch... Đại loại, mọi thứ chỉ c&oacute; đi tới, phải tốt hơn...</p>\r\n\r\n<p>Nếu n&oacute;i về tham vọng, kh&ocirc;ng ai hơn &ocirc;ng Park. Nhưng con đường leo l&ecirc;n ngọn n&uacute;i &Aacute; ch&acirc;u ho&agrave;n to&agrave;n kh&aacute;c đỉnh cao Đ&ocirc;ng Nam &Aacute; m&agrave; thầy tr&ograve; &ocirc;ng đ&aacute; chinh phục. Nếu ở Đ&ocirc;ng Nam &Aacute;, ch&uacute;ng ta thường nằm trong nh&oacute;m 4 đội mạnh nhất, chuyện l&ecirc;n đỉnh chỉ l&agrave; vấn đề thời điểm. Ngược lại, với ngọn n&uacute;i ch&acirc;u lục, th&igrave; b&oacute;ng đ&aacute; Việt Nam cần phải thực tế: ch&uacute;ng ta bắt đầu bằng vị tr&iacute; 15-16, nghĩa l&agrave; xuất ph&aacute;t điểm k&eacute;m nhất, h&agrave;nh tr&igrave;nh th&igrave; d&agrave;i v&ocirc; tận. Đến l&uacute;c sẽ thất bại, đến l&uacute;c phải cần th&ecirc;m nh&acirc;n t&agrave;i, đến l&uacute;c V-League phải thể hiện tr&aacute;ch nhiệm của giải đấu h&agrave;ng đầu quốc gia.</p>\r\n\r\n<p>B&oacute;ng đ&aacute; Việt Nam vẫn đang chinh phục đỉnh cao ấy, c&oacute; thể bằng ngọn lửa được truyền bởi Park Hang-seo. Nhưng tr&ecirc;n cao lu&ocirc;n c&oacute; gi&oacute; mạnh. Giữ cho ngọn lửa đ&oacute; ch&aacute;y tiếp trong tim l&agrave; một chuyện, nhưng cũng phải giữ được đ&ocirc;i ch&acirc;n thật vững tr&ecirc;n từng bước đi v&agrave; h&atilde;y ngước nh&igrave;n đỉnh cao ch&acirc;u &Aacute; bằng một c&aacute;i đầu lạnh.</p>\r\n', 'text, text', 3, '2019-10-10 17:56:18', 1, 1, 'aaaaaaaa', 'aa', 'a'),
(3, 1, 3, '1571737968-img2.jpg', 'Cham-diem-cau-thu-Viet-Nam-o-tran-thang-Malaysia', 'Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia', 'Cham-diem-cau-thu-Viet-Nam-o-tran-thang-Malaysia', 'Nguyễn Quang Hải và Quế Ngọc Hải chơi chói sáng, trong khi thủ thành Đặng Văn Lâm để lại nhiều nỗi lo tối 10/10.', '<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Van-lam-1570720531_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Đặng Văn L&acirc;m (6 điểm - trong thang điểm 10)</strong></p>\r\n\r\n<p>Thủ m&ocirc;n Việt kiều chưa khắc phục được điểm yếu ra v&agrave;o v&agrave; ph&aacute;n đo&aacute;n ở những t&igrave;nh huống cố định. Trong hiệp 1, Văn L&acirc;m c&oacute; hai lần mắc lỗi vị tr&iacute;, trong đ&oacute; pha b&oacute;ng ở ph&uacute;t 24 su&yacute;t dẫn đến b&agrave;n thua.</p>\r\n\r\n<p>Thủ th&agrave;nh của Muangthong United chưa thực sự tự tin trước lối chơi tấn c&ocirc;ng bi&ecirc;n v&agrave; d&ugrave;ng nhiều b&oacute;ng bổng của Malaysia. Sang hiệp 2, Malaysia xuống sức v&agrave; &aacute;p lực l&ecirc;n khung th&agrave;nh Việt Nam giảm bớt, gi&uacute;p anh &iacute;t phải l&agrave;m việc.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Duy-manh-1570720529_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Đỗ Duy Mạnh (7 điểm)</strong></p>\r\n\r\n<p>Nằm trong nh&oacute;m cầu thủ H&agrave; Nội vừa phải c&agrave;y ải ở AFC Cup 2019, thể lực của Duy Mạnh kh&ocirc;ng thật sung sức. Anh chơi tr&ograve;n vai khi đ&aacute; lệch phải trong sơ đồ ba trung vệ, nhưng khi Việt Nam tấn c&ocirc;ng v&agrave; chuyển sang h&agrave;ng thủ bốn người, Duy Mạnh &iacute;t d&acirc;ng cao hỗ trợ Trọng Ho&agrave;ng tấn c&ocirc;ng. Điểm cộng của cầu thủ H&agrave; Nội l&agrave; anh kh&ocirc;ng để hổng c&aacute;nh giống như trận gặp Th&aacute;i Lan.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/11/qhn-1570756606_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Quế Ngọc Hải (8,5 điểm)</strong><br />\r\n<br />\r\nĐược xếp đ&aacute; trung t&acirc;m trong h&agrave;ng ph&ograve;ng ngự ba người, đội trưởng Việt Nam kh&ocirc;ng những kh&oacute;a chặt tiền đạo d&agrave;y dạn kinh nghiệm Talaha, buộc anh n&agrave;y rời s&acirc;n sớm, m&agrave; c&ograve;n xuất sắc mỗi khi ph&aacute;t động tấn c&ocirc;ng. B&agrave;n mở tỷ số của Quang Hải mang đậm dấu ấn của trung vệ Viettel. Từ đường chuyền lại của Văn Hậu, Ngọc Hải c&acirc;u bổng v&agrave;o khu 5m50 của Malaysia, tạo thời cơ cho Quang Hải ph&aacute; bẫy việt vị v&agrave; dứt điểm cận th&agrave;nh. Sang hiệp 2, trung vệ qu&ecirc; Nghệ An c&ograve;n c&oacute; chuỗi xử l&yacute; đầy nỗ lực ở ph&uacute;t 74 khi bọc l&oacute;t kịp thời cho đ&agrave;n em Tiến Dũng rồi nho&agrave;i người cứu phạt g&oacute;c.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Tien-dung-1570720530_1200x0.jpg\" /></p>\r\n\r\n<p><strong>B&ugrave;i Tiến Dũng (7 điểm)</strong></p>\r\n\r\n<p>Phải đối đầu với cầu thủ nhập tịch&nbsp;Sumareh, Tiến Dũng rơi v&agrave;o thế thua thiệt v&agrave; thường phải nhờ c&aacute;c đồng đội bọc l&oacute;t. Tương tự Duy Mạnh, trung vệ Viettel chơi tr&ograve;n vai v&agrave; gi&uacute;p Việt Nam c&oacute; trận thứ hai li&ecirc;n tiếp giữ sạch lưới ở v&ograve;ng loại World Cup 2022.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Trong-hoang-1570720530_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn Trọng Ho&agrave;ng (8 điểm)</strong></p>\r\n\r\n<p>Chơi kh&ocirc;ng thật hay trong hiệp 1 nhưng Trọng Ho&agrave;ng kịp lấy lại h&igrave;nh ảnh quen thuộc thời AFF Cup 2018 trong 45 ph&uacute;t c&ograve;n lại. Những pha băng l&ecirc;n tốc độ v&agrave; tinh qu&aacute;i của cầu thủ qu&ecirc; Nghệ An khiến Malaysia kh&ocirc;ng d&aacute;m d&acirc;ng đội h&igrave;nh l&ecirc;n cao, d&ugrave; ở thế bị dẫn. Ph&uacute;t 73, Trọng Ho&agrave;ng để lại dấu ấn với pha di chuyển kh&ocirc;n ngoan ở h&agrave;nh lang trong, nhận đường chọc khe rồi trả ngược lại trung lộ. Tuy nhi&ecirc;n, Văn To&agrave;n s&uacute;t trượt rồi Anh Đức đ&aacute; bồi tr&uacute;ng hậu vệ Malaysia đứng tr&ecirc;n vạch v&ocirc;i.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Van-hau-1570720531_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Đo&agrave;n Văn Hậu (6 điểm)</strong></p>\r\n\r\n<p>Chỉ c&oacute; hơn một ng&agrave;y tập c&ugrave;ng đồng đội, thể lực của Văn Hậu sau chuyến bay d&agrave;i từ H&agrave; Lan c&oacute; vẻ kh&ocirc;ng đảm bảo. Hậu vệ thuộc bi&ecirc;n chế Heerenveen chỉ ho&agrave;n th&agrave;nh nhiệm vụ ph&ograve;ng ngự, v&agrave; c&oacute; rất &iacute;t những đường ph&aacute;t động tấn c&ocirc;ng từ s&acirc;n nh&agrave;. Ở AFF Cup 2018, hai trong ba b&agrave;n thắng của Việt Nam v&agrave;o lưới Malaysia xuất ph&aacute;t từ c&aacute;nh tr&aacute;i của Văn Hậu. Nhưng tối 10/10, c&aacute;nh chơi nổi bật hơn l&agrave; bi&ecirc;n phải của Trọng Ho&agrave;ng.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Tuan-anh-1570720530_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn Tuấn Anh (8 điểm)</strong></p>\r\n\r\n<p>L&agrave; người chơi thấp hơn trong bộ đ&ocirc;i tiền vệ trung t&acirc;m, cầu thủ của HAGL c&oacute; ho&agrave;ng loạt t&igrave;nh huống tho&aacute;t pressing tốt. Ph&uacute;t 25, Tuấn Anh c&oacute; pha chuyền d&agrave;i vượt tuyến cho C&ocirc;ng Phượng phản c&ocirc;ng nhanh v&agrave; su&yacute;t kiếm được phạt đền. D&ugrave; vậy, khả năng tranh chấp hạn chế khiến Tuấn Anh kh&ocirc;ng đảm bảo được việc ph&ograve;ng ngự từ xa. Đầu hiệp 2, anh nhường chỗ cho Đức Huy v&igrave; chấn thương.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Hung-dung-1570720529_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Đỗ H&ugrave;ng Dũng (7,5 điểm)</strong></p>\r\n\r\n<p>&quot;L&aacute; phổi&quot; của tuyến giữa Việt Nam chơi trọn 90 ph&uacute;t, d&ugrave; vừa trở về từ Triều Ti&ecirc;n. Hiệp 1, anh chơi tiền vệ trung t&acirc;m theo kiểu l&ecirc;n c&ocirc;ng về thủ v&agrave; su&yacute;t gi&uacute;p Quang Hải mở tỷ số ở ph&uacute;t 27. Sang hiệp 2, H&ugrave;ng Dũng được đẩy l&ecirc;n chơi gần cấm địa Malaysia hơn - vị tr&iacute; giống như tại CLB H&agrave; Nội. Anh được san sẻ tr&aacute;ch nhiệm đ&aacute; phạt v&agrave; c&oacute; đường chuyền th&ocirc;ng minh cho Quang Hải ở ph&uacute;t 67, nhưng tiền vệ số 19 tung m&oacute;c trượt. Trong số những trụ cột ở Việt Nam, H&ugrave;ng Dũng lu&ocirc;n l&agrave; người chơi ổn định bậc nhất.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Quang-hai-1570720529_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn Quang Hải (8,5 điểm)</strong></p>\r\n\r\n<p>Sau v&agrave;i trận suy giảm phong độ v&igrave; thể lực kh&ocirc;ng đảm bảo, Quang Hải một lần nữa tỏa s&aacute;ng với pha dứt điểm một chạm tinh tế, mang về chiến thắng cho Việt Nam. Anh di chuyển kh&ocirc;n ngoan, lẻn xuống sau lưng hậu vệ Malaysia v&agrave; ngả người s&uacute;t kỹ thuật v&agrave;o cột gần. Trước đ&oacute;, tiền vệ H&agrave; Nội s&uacute;t tung lưới Malaysia nhưng kh&ocirc;ng được c&ocirc;ng nhận v&igrave; lỗi việt vị.&nbsp;</p>\r\n\r\n<p>Trong sơ đồ xuất ph&aacute;t, Quang Hải đ&aacute; tiền đạo lệch phải, nhưng thường xuy&ecirc;n l&ugrave;i s&acirc;u xuống ngang với hai tiền vệ trung t&acirc;m để &quot;chia b&agrave;i&quot; c&ugrave;ng Tuấn Anh, H&ugrave;ng Dũng. Sang hiệp 2, khi Việt Nam dẫn 1-0 v&agrave; chuyển sang chơi 5-4-1, Quang Hải giữ bi&ecirc;n tr&aacute;i v&agrave; thường xuy&ecirc;n chuyền ch&eacute;o c&aacute;nh cho Văn To&agrave;n tho&aacute;t xuống. Ch&iacute;nh những đường ban bật theo kiểu zic-zac n&agrave;y khiến Malaysia bối rối v&agrave; kh&ocirc;ng d&aacute;m mạo hiểm tấn c&ocirc;ng.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Van-toan-1570720531_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn Văn To&agrave;n (7 điểm)</strong></p>\r\n\r\n<p>L&agrave; tiền đạo Việt Nam c&oacute; phong độ tốt bậc nhất V-League 2019, Văn To&agrave;n rất mạnh trong những t&igrave;nh huống lẻn ra sau lưng hậu vệ đối phương. Trước trung vệ 32 tuổi Zaquan Adha, tiền đạo qu&ecirc; Hải Dương nhiều lần ph&aacute;t huy được ưu thế tốc độ. Sau khi C&ocirc;ng Phượng rời s&acirc;n, c&aacute;ch chơi của Việt Nam kh&aacute; giống HAGL. Tuyến giữa khi c&oacute; b&oacute;ng đều chuyền d&agrave;i l&ecirc;n cho Văn To&agrave;n đua tốc độ rồi t&igrave;m c&aacute;ch đưa b&oacute;ng v&agrave;o cấm địa Malaysia. Trong cả hai nhiệm vụ: hộ c&ocirc;ng cho C&ocirc;ng Phượng v&agrave; đ&aacute; cặp c&ugrave;ng Anh Đức, Văn To&agrave;n đều ho&agrave;n th&agrave;nh.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Cong-phuong-1570720528_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn C&ocirc;ng Phượng (6,5 điểm)</strong></p>\r\n\r\n<p>Được xếp chơi cao nhất tr&ecirc;n h&agrave;ng c&ocirc;ng, cũng l&agrave; cầu thủ được Malaysia ch&uacute; &yacute; đặc biệt, C&ocirc;ng Phượng lu&ocirc;n bị k&egrave;m rất chặt mỗi khi c&oacute; b&oacute;ng. Trong hơn một tiếng c&oacute; mặt tr&ecirc;n s&acirc;n, tiền đạo đang kho&aacute;c &aacute;o Sint-Truidense kh&ocirc;ng c&oacute; pha dứt điểm n&agrave;o. Cảm gi&aacute;c b&oacute;ng của anh cũng kh&ocirc;ng thật tốt khi c&oacute; hai đường chuyền hỏng kh&oacute; hiểu đầu hiệp 2, d&ugrave; ở thế trống trải. B&ugrave; lại, C&ocirc;ng Phượng thi đấu x&ocirc;ng x&aacute;o v&agrave; tạo ra những khoảng trống cho Văn To&agrave;n v&agrave; Quang Hải chiếm lĩnh.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Duc-huy-1570720528_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Phạm Đức Huy (7 điểm)</strong></p>\r\n\r\n<p>Tiền vệ H&agrave; Nội kh&ocirc;ng những cải thiện khả năng ph&ograve;ng ngự từ xa của Việt Nam trong hiệp 2, m&agrave; c&ograve;n để lại dấu ấn với đường chọc khe x&eacute; toang h&agrave;ng thủ Malaysia ở ph&uacute;t 73. Trọng Ho&agrave;ng đ&oacute;n đường chuyền, nhả lại cho Anh Đức dứt điểm, nhưng may mắn đứng về ph&iacute;a Malaysia khi hậu vệ &aacute;o v&agrave;ng kịp cản b&oacute;ng tr&ecirc;n vạch v&ocirc;i. Malaysia chỉ c&oacute; đ&uacute;ng một c&uacute; dứt điểm trong hiệp 2 d&ugrave; ở thế bị dẫn. Điều ấy c&oacute; được nhờ c&ocirc;ng của Đức Huy. Tuy nhi&ecirc;n, cũng c&oacute; một lần anh đặt đội nh&agrave; v&agrave;o thế nguy hiểm với đường chuyền ngang hỏng b&ecirc;n phần s&acirc;n nh&agrave;.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Anh-duc-1570720527_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn Anh Đức (6,5 điểm)</strong></p>\r\n\r\n<p>L&atilde;o tướng Anh Đức ph&aacute;t huy trọn vẹn kinh nghiệm v&agrave; khả năng chọn vị tr&iacute; khi v&agrave;o thay đ&agrave;n em C&ocirc;ng Phượng. Anh su&yacute;t ghi t&ecirc;n l&ecirc;n bảng tỷ số ở ph&uacute;t 73 sau c&uacute; đệm b&oacute;ng trong cấm địa, nhưng bị hậu vệ Malaysia cản lại. Tại AFF Cup 2018, tiền đạo B&igrave;nh Dương l&agrave; &quot;hung thần&quot; của Malaysia khi hai lần x&eacute; lưới đội b&oacute;ng n&agrave;y. Nhưng ở tối 10/10, hai c&aacute;nh của Việt Nam c&oacute; &iacute;t pha phối hợp xuống bi&ecirc;n tạt bổng để Anh Đức ph&aacute;t huy khả năng kh&ocirc;ng chiến.</p>\r\n\r\n<p><img alt=\"Chấm điểm cầu thủ Việt Nam ở trận thắng Malaysia\" src=\"https://i-vnexpress.vnecdn.net/2019/10/10/Viet-phong-1570720531_1200x0.jpg\" /></p>\r\n\r\n<p><strong>Nguyễn Việt Phong (kh&ocirc;ng cho điểm)</strong></p>\r\n\r\n<p>Chưa đầy 10 ph&uacute;t tr&ecirc;n s&acirc;n, t&iacute;nh cả thời gian b&ugrave; giờ, kh&ocirc;ng đủ để một cầu thủ mới như Việt Phong kịp t&igrave;m tiếng n&oacute;i chung với đồng đội. Tiền đạo Viettel c&oacute; một pha đua tốc độ ngay khi v&agrave;o thay Văn To&agrave;n, nhưng c&uacute; nước r&uacute;t trong trạng th&aacute;i sung sức của anh kh&ocirc;ng nhỉnh hơn hậu vệ Malaysia.</p>\r\n', 'tag1, tag2', 2, '2019-10-11 02:02:45', 1, 1, 'Xin chào', 'ssssssssss', 'abb, cc, dđ,cccccc'),
(4, 2, 3, '1571738039-img3.jpg', 'Chua-Mot-Cot-hon-tram-tuoi-o-Bien-Hoa', 'Chùa Một Cột hơn trăm tuổi ở Biên Hòa', 'Chua-Mot-Cot-hon-tram-tuoi-o-Bien-Hoa', 'ĐỒNG NAI Xây dựng từ thế kỷ 18, chánh điện chùa Bửu Sơn chỉ có một cột chịu lực ở chính giữa', '<p>ĐỒNG NAI&nbsp;X&acirc;y dựng từ thế kỷ 18, ch&aacute;nh điện ch&ugrave;a Bửu Sơn chỉ c&oacute; một cột chịu lực ở ch&iacute;nh giữa.</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-37-1571038346_680x0.jpg\" /></p>\r\n\r\n<p>Ch&ugrave;a Bửu Sơn (phường H&ograve;a B&igrave;nh, TP Bi&ecirc;n H&ograve;a) ban đầu chỉ dựng bằng v&aacute;ch tre, cột gỗ.&nbsp;Ch&aacute;nh điện ch&ugrave;a diện t&iacute;ch khoảng 100 m2, n&oacute;c h&igrave;nh b&aacute;t gi&aacute;c. Theo nh&agrave; ch&ugrave;a, b&aacute;t gi&aacute;c tượng trưng cho t&aacute;m con đường giải tho&aacute;t khỏi khổ đau trong gi&aacute;o l&yacute; Nh&agrave; Phật.</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-33-1571038335-1571059597_680x0.jpg\" /></p>\r\n\r\n<p>Năm 1937 v&agrave; 1965, ch&ugrave;a được tr&ugrave;ng tu lớn. Khi thi c&ocirc;ng ch&aacute;nh điện, nh&agrave; ch&ugrave;a cho dựng c&aacute;c v&igrave; k&egrave;o từ n&oacute;c kết nối v&agrave;o một cột chịu lực ở ch&iacute;nh giữa. V&igrave; vậy, người d&acirc;n thường gọi l&agrave; ch&ugrave;a Một Cột.<br />\r\n<br />\r\nKh&aacute;c với ch&ugrave;a Một Cột ở H&agrave; Nội - cột ch&iacute;nh ở b&ecirc;n ngo&agrave;i n&acirc;ng đỡ kết cấu to&agrave;n bộ ng&ocirc;i ch&ugrave;a - ch&ugrave;a Bửu Sơn c&oacute; một cột ch&iacute;nh ở b&ecirc;n trong, nằm giữa ch&aacute;nh điện với hệ thống tượng Phật bố tr&iacute; theo hệ ph&aacute;i Bắc t&ocirc;ng.&nbsp;</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-12-1571038295_680x0.jpg\" /></p>\r\n\r\n<p>Giữa cột ch&aacute;nh điện thờ một bức tượng đ&aacute; trong tư thế ngồi, cao 1,5 m, nặng gần một tấn. Pho tượng n&agrave;y l&agrave; thần Vishnu do người Chăm tạc v&agrave;o thế kỷ 15.</p>\r\n\r\n<p>Năm 1861, người Ph&aacute;p t&igrave;m thấy pho tượng n&agrave;y trong hốc c&acirc;y gần ch&ugrave;a. Thấy vậy, c&aacute;c hương l&atilde;o đến xin nh&agrave; cầm quyền Ph&aacute;p rước tượng về để thờ trong ch&ugrave;a. Từ khi c&oacute; tượng, người d&acirc;n trong v&ugrave;ng cũng quen gọi l&agrave; ch&ugrave;a Phật Bốn Tay.</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-19-1571038300-1571059592_680x0.jpg\" /></p>\r\n\r\n<p>Tầng dưới ch&aacute;nh điện thờ năm vị thập điện, hai vị Ph&aacute;n Quan v&agrave; Địa Tạng.&nbsp;</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-20-1571038308_680x0.jpg\" /></p>\r\n\r\n<p>Khu&ocirc;n vi&ecirc;n ch&ugrave;a c&ograve;n c&oacute; khu gửi tro cốt của người đ&atilde; khuất. Nh&agrave; ch&ugrave;a cho đặt một tượng Phật để người d&acirc;n tới d&acirc;ng hương, chi&ecirc;m b&aacute;i.</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-25-1571038325_680x0.jpg\" /></p>\r\n\r\n<p>Tượng Quan &Acirc;m ngh&igrave;n tay ngh&igrave;n mắt ngồi tr&ecirc;n đ&agrave;i sen được thờ trong am nhỏ ở s&acirc;n ch&ugrave;a.</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-23-1571038323_680x0.jpg\" /></p>\r\n\r\n<p>S&acirc;n ch&ugrave;a c&oacute; điện nhỏ thờ Bồ T&aacute;t Quan &acirc;m, đối diện l&agrave; bảo th&aacute;p cao 3 m để lưu trữ tro cốt c&aacute;c vị trụ tr&igrave; ch&ugrave;a.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-30-1571041848_680x0.jpg\" /></p>\r\n\r\n<p>Tr&ecirc;n n&oacute;c ch&ugrave;a tạc tượng voi b&ecirc;n cạnh bốn con hạc. Theo triết l&yacute; nh&agrave; Phật, voi l&agrave; một biểu tượng của sức mạnh t&acirc;m thức, canh g&aacute;c c&aacute;c ng&ocirc;i đền v&agrave; bảo vệ Đức Phật.</p>\r\n\r\n<p><img alt=\"Chùa Một Cột hơn trăm tuổi ở Biên Hòa\" src=\"https://i-vnexpress.vnecdn.net/2019/10/14/chuamotcotbienhoa-4-1571038289_680x0.jpg\" /></p>\r\n\r\n<p>Trải qua nhiều đợt tr&ugrave;ng tu, ch&ugrave;a Bửu Sơn c&oacute; kiến tr&uacute;c như hiện tại, với diện t&iacute;ch gần 1.000 m2, nằm giữa khu d&acirc;n cư TP Bi&ecirc;n H&ograve;a.</p>\r\n', 'â,aaaaaa', 11, '2019-10-12 12:48:26', 1, 1, 'aaaa', 'aaaaa', 'aaaaaa'),
(5, 3, 3, '1571738126-img4.jpg', 'Ta-Dinh-Phong-bi-don-bo-be-hai-con-trai', 'Tạ Đình Phong bị đồn bỏ bê hai con trai', 'Ta-Dinh-Phong-bi-don-bo-be-hai-con-trai', 'Nhiều tài khoản Weibo cho biết Lucas, con cả Tạ Đình Phong - Trương Bá Chi, trách bố không dành thời gian cho hai anh em.', '<p>Nhiều t&agrave;i khoản Weibo cho biết Lucas, con cả Tạ Đ&igrave;nh Phong - Trương B&aacute; Chi, tr&aacute;ch bố kh&ocirc;ng d&agrave;nh thời gian cho hai anh em.</p>\r\n\r\n<p>Ng&agrave;y 22/10, nhiều blogger giải tr&iacute; đăng tr&ecirc;n&nbsp;<em>Weibo</em>&nbsp;b&agrave;i viết với nội dung &quot;Lucas bất m&atilde;n với Tạ Đ&igrave;nh Phong&quot;. Cậu b&eacute; n&oacute;i: &quot;Ch&aacute;u v&agrave; em trai &iacute;t được gặp bố v&igrave; bố rất bận. Khi ch&aacute;u ốm, em trai sốt, chỉ c&oacute; mẹ ở b&ecirc;n. Bố kh&ocirc;ng xứng với mẹ ch&aacute;u&quot;.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Lucas (12 tuổi) và Quintus (9 tuổi) - hai con Trương Bá Chi, Tạ Đình Phong. Ảnh: Instagram.\" src=\"https://i-giaitri.vnecdn.net/2019/10/22/l-6648-1571716158.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Lucas (12 tuổi) v&agrave; Quintus (9 tuổi) - hai con Trương B&aacute; Chi, Tạ Đ&igrave;nh Phong. Ảnh:&nbsp;<em>Instagram</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&quot;Tạ Đ&igrave;nh Phong, Lucas&quot; trở th&agrave;nh từ kh&oacute;a nổi bật nhất&nbsp;<em>Weibo</em>. Nam diễn vi&ecirc;n nhận nhiều chỉ tr&iacute;ch bỏ b&ecirc; con c&aacute;i, mải m&ecirc; y&ecirc;u đương. Tr&ecirc;n&nbsp;<em>On</em>, Hoắc Vấn Hy -&nbsp;quản l&yacute; của Tạ Đ&igrave;nh Phong - n&oacute;i: &quot;Ch&uacute;ng t&ocirc;i kh&ocirc;ng phản hồi tin đồn&quot;.</p>\r\n\r\n<p>Ph&iacute;a Tạ Đ&igrave;nh Phong cũng từ chối trả lời tin đồn anh v&agrave; danh ca Vương Phi rạn nứt. H&ocirc;m 21/10,&nbsp;<em>Sohu</em>&nbsp;đăng ảnh Vương Phi rời nh&agrave; chồng cũ - L&yacute; &Aacute; Bằng - l&uacute;c đ&ecirc;m muộn.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Bá Chi và Đình Phong khi còn bên nhau. Ảnh: Elle.\" src=\"https://i-giaitri.vnecdn.net/2019/10/22/ba-chi2-6068-1571714813.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>B&aacute; Chi v&agrave; Đ&igrave;nh Phong khi c&ograve;n b&ecirc;n nhau. Ảnh:&nbsp;<em>Elle.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Tạ Đ&igrave;nh Phong v&agrave; Trương B&aacute; Chi ly dị năm 2011, hai con ở với mẹ. Sau khi ly h&ocirc;n, nam diễn vi&ecirc;n hiếm khi được tr&ocirc;ng thấy xuất hiện c&ugrave;ng c&aacute;c con. Tuy nhi&ecirc;n, &ocirc;ng Tạ Hiền, bố Tạ Đ&igrave;nh Phong, cho biết &ocirc;ng v&agrave; con trai đều đặn gặp Lucas, Quintus mỗi th&aacute;ng.</p>\r\n\r\n<p>Tạ Đ&igrave;nh Phong&nbsp;hẹn h&ograve; Vương Phi&nbsp;sau ly h&ocirc;n c&ograve;n Trương B&aacute; Chi cũng t&igrave;m được t&igrave;nh mới, sinh th&ecirc;m con trai. Nữ diễn vi&ecirc;n&nbsp;giấu danh t&iacute;nh&nbsp;cha của con thứ ba, cậu b&eacute; mang họ mẹ.</p>\r\n', '', 28, '2019-10-22 09:55:26', 1, 1, '', '', ''),
(6, 4, 3, '1571738208-img5.jpg', 'Voi-chau-Phi-chet-doi-hang-loat', 'Voi châu Phi chết đói hàng loạt', 'Voi-chau-Phi-chet-doi-hang-loat', 'Hạn hán nghiêm trọng trong hai tháng qua khiến hàng chục con voi chết đói tại khu bảo tồn tự nhiên lớn nhất Zimbabwe.', '<p>Hạn h&aacute;n nghi&ecirc;m trọng trong hai th&aacute;ng qua khiến h&agrave;ng chục con voi chết đ&oacute;i tại khu bảo tồn tự nhi&ecirc;n lớn nhất Zimbabwe.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Quần thể voi ở Zimbabwe đang phải đối mặt với tình trạng thiếu thức ăn, nước uống. Ảnh: TRT World.\" src=\"https://i-vnexpress.vnecdn.net/2019/10/22/voi-chau-phi-6884-1571713145.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Quần thể voi ở&nbsp;Zimbabwe đang phải đối mặt với t&igrave;nh trạng thiếu thức ăn, nước uống. Ảnh:&nbsp;<em>TRT World.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Kể từ th&aacute;ng 9, &iacute;t nhất 55 con voi ch&acirc;u Phi đ&atilde; được ghi nhận chết tại vườn quốc gia Hwange do thiếu thức ăn v&agrave; nước uống, Tinashe Farawo, ph&aacute;t ng&ocirc;n vi&ecirc;n của Cơ quan Quản l&yacute; Vườn quốc gia v&agrave; Động vật hoang d&atilde; ở Zimbabwe cho biết h&ocirc;m thứ Hai. Quốc gia Nam Phi n&agrave;y đang trải qua đợt hạn h&aacute;n được cho l&agrave; tồi tệ nhất trong v&agrave;i năm qua.</p>\r\n\r\n<p>&quot;Những con voi đ&atilde; phải di chuyển một qu&atilde;ng đường d&agrave;i để kiếm thức ăn v&agrave; nước uống. Một số con thậm ch&iacute; đ&atilde; x&acirc;m nhập khu d&acirc;n cư, ph&aacute; hủy t&agrave;i sản của người d&acirc;n v&agrave; đụng độ với con người&quot;, Farawo cho biết. Hơn 20 người đ&atilde; thiệt mạng do voi tấn c&ocirc;ng ở Zimbabwe trong năm nay.</p>\r\n\r\n<p>Hạn h&aacute;n đang l&agrave;m cạn kiệt nguồn nước ở vườn quốc gia Hwange. C&aacute;c nh&agrave; chức tr&aacute;ch đ&atilde; phải khoan giếng s&acirc;u tới 400 m để t&igrave;m nước uống cho động vật. Tuy nhi&ecirc;n, nỗ lực của họ chỉ đủ đ&aacute;p ứng nhu cầu của 15.000 con voi, trong khi quần thể voi ch&acirc;u Phi ở vườn quốc gia Hwange hiện c&oacute; tới 53.000 con.</p>\r\n\r\n<p>&quot;Đ&oacute; l&agrave; l&yacute; do v&igrave; sao ch&uacute;ng t&ocirc;i cho ph&eacute;p bu&ocirc;n b&aacute;n voi. Số tiền thu được c&oacute; thể g&acirc;y quỹ cho hoạt động bảo tồn v&agrave; chăm s&oacute;c ch&uacute;ng&quot;, Farawo n&oacute;i th&ecirc;m. V&agrave;o th&aacute;ng 5, Zimbabwe đ&atilde; thu về 2,7 triệu USD từ việc b&aacute;n 90 con voi cho Dubai v&agrave; Trung Quốc. Tuy nhi&ecirc;n, việc ch&iacute;nh phủ cho ph&eacute;p bu&ocirc;n b&aacute;n voi đ&atilde; vấp phải sự phản đối mạnh mẽ từ c&aacute;c nh&agrave; bảo tồn.</p>\r\n\r\n<p>Voi ch&acirc;u Phi hiện được liệt k&ecirc; l&agrave; lo&agrave;i dễ bị tổn thương trong S&aacute;ch Đỏ của Li&ecirc;n minh Bảo tồn Thi&ecirc;n nhi&ecirc;n Quốc tế. Theo một b&aacute;o c&aacute;o v&agrave;o th&aacute;ng 12/2016, c&oacute; khoảng 80.000 c&aacute; thể ph&acirc;n bố ở Zimbabwe v&agrave; 415.000 con sinh sống tr&ecirc;n to&agrave;n l&atilde;nh thổ ch&acirc;u Phi.</p>\r\n', '', 3, '2019-10-22 09:56:48', 0, 1, '', '', ''),
(7, 5, 3, '1571738362-img7.jpg', 'Nhung-song-gio-hau-cung-hoang-gia-Thai-Lan', 'Những sóng gió hậu cung hoàng gia Thái Lan', 'Nhung-song-gio-hau-cung-hoang-gia-Thai-Lan', 'Quốc vương Thái Lan Rama X được nhận xét là một người kín tiếng nhưng lại có đời sống hôn nhân gây chú ý với 5 người vợ.', '<p>Quốc vương Th&aacute;i Lan Rama X được nhận x&eacute;t l&agrave; một người k&iacute;n tiếng nhưng lại c&oacute; đời sống h&ocirc;n nh&acirc;n g&acirc;y ch&uacute; &yacute; với 5 người vợ.</p>\r\n\r\n<p>Ho&agrave;ng gia Th&aacute;i Lan h&ocirc;m 21/10 bất ngờ th&ocirc;ng b&aacute;o Quốc vương Rama X&nbsp;<a href=\"https://vnexpress.net/the-gioi/hoang-quy-phi-thai-lan-bi-tuoc-moi-danh-hieu-4000279.html?vn_source=Folder&amp;vn_campaign=Stream&amp;vn_medium=Item-10&amp;vn_term=Desktop&amp;vn_thumb=1\">phế truất</a>&nbsp;mọi tước hiệu, qu&acirc;n h&agrave;m v&agrave; hu&acirc;n chương của Ho&agrave;ng qu&yacute; phi Sineenat Wongvajirapakdi, 34 tuổi, với c&aacute;o buộc &acirc;m mưu lật đổ Ho&agrave;ng hậu Suthida. Th&ocirc;ng tin n&agrave;y khiến nhiều người Th&aacute;i Lan sốc, bởi Sineenat vừa mới được phong Ho&agrave;ng qu&yacute; phi chưa đầy ba th&aacute;ng trước v&agrave; b&agrave; l&agrave; Ho&agrave;ng qu&yacute; phi đầu ti&ecirc;n của Th&aacute;i Lan trong gần một thế kỷ. B&ecirc;n cạnh đ&oacute;, n&oacute; cũng g&oacute;p phần h&eacute; lộ những tranh đấu nơi hậu cung Th&aacute;i Lan.</p>\r\n\r\n<p>&quot;Động th&aacute;i bất ngờ của Vua Rama X cho thấy &ocirc;ng muốn được nh&igrave;n nhận như một bậc qu&acirc;n vương rất c&oacute; tr&aacute;ch nhiệm v&agrave; sẽ kh&ocirc;ng chấp nhận bất kỳ sự chia rẽ n&agrave;o trong ho&agrave;ng gia&quot;, Paul Chambers, nh&agrave; ph&acirc;n t&iacute;ch tại Đại học Naresuan, Th&aacute;i Lan, b&igrave;nh luận.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Quốc vương Maha Vajiralongkorn và Hoàng quý phi Sineenat Wongvajirapakdi trước khi bị tước danh hiệu. Ảnh: Reuters.\" src=\"https://i-vnexpress.vnecdn.net/2019/10/22/abc-9062-1571718985.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Quốc vương Maha Vajiralongkorn v&agrave; Ho&agrave;ng qu&yacute; phi Sineenat Wongvajirapakdi trước khi bị tước danh hiệu. Ảnh:&nbsp;<em>Reuters</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Quốc vương Maha Vajiralongkorn hay Rama X sinh ng&agrave;y 28/7/1952 ở Bangkok. &Ocirc;ng l&agrave; con trai duy nhất v&agrave; l&agrave; con thứ hai trong số 4 người con của cố quốc vương Bhumibol v&agrave; Ho&agrave;ng hậu Sirikit. Đời sống h&ocirc;n nh&acirc;n của Vua Rama X được cho l&agrave; kh&ocirc;ng b&igrave;nh lặng, với tổng cộng 5 người vợ.</p>\r\n\r\n<p>Th&aacute;ng 1/1977, &ocirc;ng kết h&ocirc;n với C&ocirc;ng nương Soamsawali Kitiyakara, một người em họ b&ecirc;n ngoại. Sau một năm, con g&aacute;i họ ch&agrave;o đời.&nbsp;Tuy nhi&ecirc;n, v&agrave;o cuối thập ni&ecirc;n 1970, Vajiralongkorn bắt đầu qua lại với nữ diễn vi&ecirc;n Yuvadhida Polpraserth v&agrave; c&oacute; 5 con chung với b&agrave; n&agrave;y.</p>\r\n\r\n<p>D&ugrave; C&ocirc;ng nương Soamsawali kh&ocirc;ng chấp nhận ly h&ocirc;n suốt nhiều năm, Vua Vajiralongkorn, l&uacute;c bấy giờ c&ograve;n l&agrave; Ho&agrave;ng Th&aacute;i tử, cuối c&ugrave;ng vẫn đệ đơn ly dị v&agrave;o năm 1993. &Ocirc;ng c&aacute;o buộc vợ l&agrave; người chịu tr&aacute;ch nhiệm ho&agrave;n to&agrave;n về cuộc h&ocirc;n nh&acirc;n đổ vỡ. B&agrave; Soamsawali kh&ocirc;ng thể phản b&aacute;c do luật chống khi qu&acirc;n. T&ograve;a &aacute;n cuối c&ugrave;ng ph&aacute;n quyết cho hai người ly dị v&agrave;o th&aacute;ng 7/1993. C&ocirc;ng nương Soamsawali v&agrave; con g&aacute;i vẫn tiếp tục tham gia v&agrave;o c&aacute;c nghi lễ của ho&agrave;ng gia Th&aacute;i Lan.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Nhà vua Vajiralongkorn và người vợ đầu Soamsawali Kitiyakara. Ảnh: Wordpress\" src=\"https://i-vnexpress.vnecdn.net/2019/10/22/soam-and-o-4442-1556789911-1157-1571718986.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Nh&agrave; vua Vajiralongkorn v&agrave; người vợ đầu Soamsawali Kitiyakara. Ảnh:&nbsp;<em>Wordpress</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Khi Vajiralongkorn l&agrave;m quen với Yuvadhida, b&agrave; đang l&agrave; một diễn vi&ecirc;n triển vọng. B&agrave; sinh con trai đầu l&ograve;ng v&agrave;o th&aacute;ng 8/1979, sau đ&oacute; c&oacute; th&ecirc;m ba con trai v&agrave; một con g&aacute;i. Đến th&aacute;ng 2/1994, hai người mới tổ chức h&ocirc;n lễ tại cung điện. Sau đ&aacute;m cưới, b&agrave; Yuvadhida được đổi t&ecirc;n th&agrave;nh Mom Sujarinee Mahidol na Ayudhaya, &yacute; chỉ rằng b&agrave; l&agrave; một thường d&acirc;n kết h&ocirc;n với người của ho&agrave;ng gia. B&agrave; cũng được bổ nhiệm l&agrave;m thiếu t&aacute; trong qu&acirc;n đội Th&aacute;i Lan v&agrave; tham gia v&agrave;o c&aacute;c nghi lễ ho&agrave;ng gia b&ecirc;n cạnh chồng.</p>\r\n\r\n<p>D&ugrave; vậy, cuộc h&ocirc;n nh&acirc;n kh&ocirc;ng k&eacute;o d&agrave;i bởi chỉ hai năm sau đ&oacute;, Mom Sujarinee chuyển sang Anh sinh sống c&ugrave;ng 5 người con. &Ocirc;ng Vajiralongkorn đ&atilde; d&aacute;n &aacute;p ph&iacute;ch quanh cung điện c&aacute;o buộc b&agrave; ngoại t&igrave;nh với một tướng kh&ocirc;ng qu&acirc;n.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Bà Yuvadhida (thứ hai từ phải sang, hàng sau) cùng chồng và các con. Ảnh: zway2go.com.\" src=\"https://i-vnexpress.vnecdn.net/2019/10/22/thailand-crown-prince-family-3502-1571718986.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>B&agrave; Yuvadhida (thứ hai từ phải sang, h&agrave;ng sau) c&ugrave;ng chồng v&agrave; c&aacute;c con. Ảnh: zway2go.com.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Th&aacute;ng 2/2001, Vajiralongkorn kết h&ocirc;n lần ba với b&agrave; Srirasmi Suwadee, một thường d&acirc;n c&oacute; xuất th&acirc;n khi&ecirc;m tốn tham gia v&agrave;o đội phục vụ ho&agrave;ng gia từ năm 1992. Cuộc h&ocirc;n nh&acirc;n được giữ b&iacute; mật đến đầu năm 2005, khi b&agrave; Srirasmi sinh con trai cho Ho&agrave;ng Th&aacute;i tử v&agrave; được sắc phong l&agrave;m c&ocirc;ng nương. Con trai của họ cũng ngay lập tức trở th&agrave;nh ho&agrave;ng tử.</p>\r\n\r\n<p>Sau 13 năm chung sống, th&aacute;ng 11/2014, Vajiralongkorn bất ngờ gửi thư l&ecirc;n Bộ Nội vụ Th&aacute;i Lan đề nghị&nbsp;<a href=\"https://vnexpress.net/the-gioi/vi-sao-thai-tu-thai-lan-tuoc-bo-ten-hoang-toc-cua-nha-vo-3114334.html#ctr=related_news_click\">tước tước hiệu ho&agrave;ng gia Akharaphongpreecha</a>&nbsp;từng ban cho&nbsp;<a href=\"https://vnexpress.net/the-gioi/chan-dung-vuong-phi-thai-lan-trong-vu-tuoc-ho-vua-ban-3115378.html\">Srirasmi</a>, với c&aacute;o buộc 7 người th&acirc;n của b&agrave; tham nhũng. Srirasmi sau đ&oacute; từ bỏ mọi tước hiệu, ly h&ocirc;n Vajiralongkorn v&agrave; nhận được một khoản tiền l&agrave; 200 triệu baht (5,5 triệu USD).</p>\r\n\r\n<p>Vajiralongkorn l&ecirc;n ng&ocirc;i v&agrave;o th&aacute;ng 10/2016, sau khi cha &ocirc;ng qua đời. Hồi th&aacute;ng 5, v&agrave;i ng&agrave;y trước lễ đăng quang, Quốc vương 66 tuổi bất ngờ th&ocirc;ng b&aacute;o&nbsp;<a href=\"https://vnexpress.net/the-gioi/quoc-vuong-thai-lan-ket-hon-voi-nu-tuong-3917135.html\">t&aacute;i h&ocirc;n lần thứ tư</a>&nbsp;với b&agrave;&nbsp;<a href=\"https://vnexpress.net/the-gioi/hanh-trinh-tu-tiep-vien-hang-khong-toi-hoang-hau-cua-nu-tuong-thai-lan-3917769.html\">Suthida Vajiralongkorn</a>&nbsp;Na Ayutthaya. B&agrave; Suthida, 41 tuổi, vướng tin đồn t&igrave;nh cảm với Nh&agrave; vua Vajiralongkorn từ l&uacute;c &ocirc;ng chưa l&ecirc;n ng&ocirc;i nhưng mối quan hệ kh&ocirc;ng được c&ocirc;ng khai.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Nhà vua Vajiralongkorn và người vợ thứ ba Srirasmi. Ảnh: Weekly Standard.\" src=\"https://i-vnexpress.vnecdn.net/2019/10/22/backup-5780-1556789913-6051-1571718986.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Nh&agrave; vua Vajiralongkorn v&agrave; người vợ thứ ba&nbsp;Srirasmi. Ảnh:<em>&nbsp;Weekly Standard.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Đến th&aacute;ng 7, Quốc vương Rama X bất ngờ sắc phong Sineenat Wongvajirapakdi, 34 tuổi, bạn g&aacute;i l&acirc;u năm của &ocirc;ng, trở th&agrave;nh vợ hai, mang tước hiệu Ho&agrave;ng qu&yacute; phi.</p>\r\n\r\n<p>Sineenat sinh năm 1985 tại tỉnh Nan, ph&iacute;a bắc Th&aacute;i Lan, tốt nghiệp học viện Qu&acirc;n y Ho&agrave;ng gia năm 23 tuổi. B&agrave; từng tham gia huấn luyện phi c&ocirc;ng ở Th&aacute;i Lan v&agrave; Đức, l&agrave; một th&agrave;nh vi&ecirc;n lực lượng cận vệ của Nh&agrave; vua v&agrave; được phong h&agrave;m thiếu tướng hồi th&aacute;ng 5.</p>\r\n\r\n<p>Ngo&agrave;i đời sống h&ocirc;n nh&acirc;n g&acirc;y ch&uacute; &yacute;, Vua Rama X thực tế l&agrave; một người kh&aacute; k&iacute;n tiếng. H&igrave;nh ảnh của &ocirc;ng được gi&aacute;m s&aacute;t cẩn thận bởi c&aacute;c cố vấn tin cậy, đội ngũ cận vệ v&agrave; những luật lệ nghi&ecirc;m khắc quy định c&aacute;ch truyền th&ocirc;ng Th&aacute;i Lan khắc họa về ho&agrave;ng gia. Những h&igrave;nh ảnh Quốc vương Vajiralongkorn ở nước ngo&agrave;i xuất hiện nhiều tr&ecirc;n truyền th&ocirc;ng quốc tế nhưng ch&uacute;ng lại kh&ocirc;ng được phổ biến tại Th&aacute;i Lan.</p>\r\n\r\n<p>&Ocirc;ng Vajiralongkorn hiếm khi trả lời phỏng vấn nhưng từng tr&ograve; chuyện với k&ecirc;nh BBC hồi năm 1979 về cuộc sống của một người kế vị ngai v&agrave;ng. &quot;Thật kh&oacute; để n&oacute;i cuộc sống của c&aacute; như thế n&agrave;o khi bạn l&agrave; c&aacute; hay cuộc sống của chim thế n&agrave;o khi bạn l&agrave; chim&quot;, Vajiralongkorn khi đ&oacute; chia sẻ.</p>\r\n\r\n<p>Vajiralongkorn tốt nghiệp trung học tại Anh trước khi chuyển tới r&egrave;n luyện tại Trường Qu&acirc;n sự Ho&agrave;ng gia Australia. &Ocirc;ng y&ecirc;u th&iacute;ch bay lượn, điều khiển chiến đấu cơ v&agrave; từng l&agrave;m sĩ quan nghiệp vụ trong qu&acirc;n đội Th&aacute;i Lan, tham gia huấn luyện với c&aacute;c lực lượng qu&acirc;n sự Anh, Mỹ, Australia.</p>\r\n\r\n<p>Qu&atilde;ng thời gian ở nước ngo&agrave;i, Vajiralongkorn rất th&iacute;ch sống tại Đức, nơi &ocirc;ng sở hữu một biệt thự b&ecirc;n hồ Starnberg, v&ugrave;ng Bavaria.</p>\r\n\r\n<p>Sau khi cha &ocirc;ng qua đời năm 2016, Vajiralongkorn g&acirc;y bất ngờ khi y&ecirc;u cầu tr&igrave; ho&atilde;n việc l&ecirc;n ng&ocirc;i để cho người d&acirc;n th&ecirc;m thời gian b&agrave;y tỏ tiếc thương với quốc vương qu&aacute; cố.</p>\r\n', '', 0, '2019-10-22 09:59:22', 0, 1, '', '', ''),
(8, 1, 3, '1571738554-img8.jpg', 'Ronaldo-kiem-tien-tu-Instagram-nhieu-hon-da-bong', 'Ronaldo kiếm tiền từ Instagram nhiều hơn đá bóng', 'Ronaldo-kiem-tien-tu-Instagram-nhieu-hon-da-bong', 'Cristiano Ronaldo được cho là bỏ túi 48 triệu USD từ bài đăng trên Instagram trong khi nhận lương 33 triệu USD tại Juventus. ', '<p>Cristiano Ronaldo được cho l&agrave; bỏ t&uacute;i 48 triệu USD từ b&agrave;i đăng tr&ecirc;n Instagram trong khi nhận lương 33 triệu USD tại Juventus.&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Ronaldo kiếm nhiều tiền từ Instagram hơn lương cầu thủ. Ảnh: Instagram/Cristiano.\" src=\"https://i-thethao.vnecdn.net/2019/10/22/Untitled-9440-1571714565.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ronaldo kiếm nhiều tiền từ Instagram hơn lương cầu thủ. Ảnh:&nbsp;<em>Instagram/Cristiano</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Kết luận được đưa ra dựa tr&ecirc;n nghi&ecirc;n cứu của c&ocirc;ng ty ph&aacute;t triển c&ocirc;ng cụ tương t&aacute;c với Instagram - Hopper HQ.&nbsp;&quot;Ronaldo l&agrave;<a href=\"https://vnexpress.net/the-thao/ronaldo-len-ngoi-vua-tren-mang-instagram-3831849.html\">&nbsp;người được theo d&otilde;i nhiều nhất tr&ecirc;n Instagram</a>&nbsp;n&ecirc;n c&aacute;c c&ocirc;ng ty phải trả gần một triệu USD cho c&aacute;c b&agrave;i đăng để tiếp cận lượng theo d&otilde;i khổng lồ của cậu ấy&quot;, Gi&aacute;m đốc marketing của Hopper HQ,&nbsp;Nicola Cronin&nbsp;cho biết.</p>\r\n\r\n<p>Ronaldo l&agrave; cầu thủ c&oacute; lượt theo d&otilde;i nhiều nhất hiện nay tr&ecirc;n&nbsp;<em>Instagram</em>, khoảng 186 triệu, v&agrave; nhờ đ&oacute; cũng trở th&agrave;nh người&nbsp;kiếm nhiều tiền nhất từ mạng x&atilde; hội n&agrave;y.&nbsp;Trong năm 2019, anh đ&atilde; đăng 49 b&agrave;i quảng c&aacute;o, với gi&aacute;&nbsp;ước t&iacute;nh 976.000 USD mỗi lần v&agrave; thu về khoảng&nbsp;48 triệu USD. Con số n&agrave;y&nbsp;nhiều gấp hai lần so với người thứ hai l&agrave; Lionel Messi.&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Ronaldo vượt xa những người khác trong top 20. Ảnh: AS.\" src=\"https://i-thethao.vnecdn.net/2019/10/22/Untitled-1953-1571714565.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Ronaldo vượt xa những người kh&aacute;c trong top 20. Ảnh:&nbsp;<em>AS</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>B&ecirc;n cạnh Ronaldo, top 20 người kiếm tiền nhiều nhất từ&nbsp;<em>Instagram&nbsp;</em>c&ograve;n c&oacute; một số cầu thủ kh&aacute;c như Lionel Messi, David Beckham, Neymar, Gareth Bale, Zlatan Ibrahimovic...</p>\r\n\r\n<p>Trong top 10 c&oacute; s&aacute;u người l&agrave; ng&ocirc;i sao thể thao, trong đ&oacute; c&oacute; cựu tuyển thủ Brazil Ronaldinho (đứng thứ 9). Gareth Bale l&agrave; cầu thủ duy nhất của Real trong top 20, kiếm được 1,12 triệu USD mỗi năm.</p>\r\n', '', 2, '2019-10-22 10:02:34', 0, 1, '', '', '');
INSERT INTO `tintuc` (`id`, `id_type`, `id_user`, `ava_img`, `alt_img`, `tieude`, `tieude_ko`, `mota`, `noidung`, `tags`, `luotxem`, `ngaydang`, `dacbiet`, `hienthi`, `title_seo`, `desc_seo`, `key_seo`) VALUES
(9, 1, 3, '1571738679-img9.jpg', 'Federer-khong-duoc-moi-du-dam-cuoi-cua-Nadal', 'Federer không được mời dự đám cưới của Nadal', 'Federer-khong-duoc-moi-du-dam-cuoi-cua-Nadal', 'Tay vợt Roger Federer không đến dự hôn lễ của Rafael Nadal, nhưng vẫn gửi tin nhắn chúc mừng đồng nghiệp Tây Ban Nha.', '<p>Tay vợt Roger Federer kh&ocirc;ng đến dự h&ocirc;n lễ của Rafael Nadal, nhưng vẫn gửi tin nhắn ch&uacute;c mừng đồng nghiệp T&acirc;y Ban Nha.</p>\r\n\r\n<p>&#39;T&ocirc;i kh&ocirc;ng được Nadal mời v&agrave; t&ocirc;i cũng kh&ocirc;ng kỳ vọng v&agrave;o điều đ&oacute;&quot;, Federer n&oacute;i với&nbsp;<em>Yahoo</em>&nbsp;<em>Sports</em>&nbsp;h&ocirc;m 21/10. &quot;Đ&oacute; kh&ocirc;ng phải vấn đề lớn. T&ocirc;i đ&atilde; gửi tin nhắn ch&uacute;c mừng cậu ấy v&agrave; cũng kh&ocirc;ng hy vọng cậu ấy đ&aacute;p lại. Nadal c&ograve;n nhiều việc phải l&agrave;m. T&ocirc;i mong sớm được gặp cậu ấy để hỏi thăm&quot;.</p>\r\n\r\n<p>Nadal l&agrave; người cuối c&ugrave;ng lập gia đ&igrave;nh trong nh&oacute;m &quot;Big Four&quot; gồm anh, Federer, Djokovic v&agrave; Murray. Thứ Bảy vừa qua, tay vợt T&acirc;y Ban Nha c&ugrave;ng bạn g&aacute;i l&acirc;u năm Xisca Perello l&agrave;m đ&aacute;m cưới tại l&acirc;u đ&agrave;i Sa Fortaleza ở đảo Mallorca. Danh s&aacute;ch hơn 350 kh&aacute;ch mời c&oacute; những người đ&atilde; v&agrave; đang cầm vợt như David Ferrer, Feliciano Lopez, Jaume Munar, Juan Monaco, nhưng kh&ocirc;ng c&oacute; Roger Federer - người được cho l&agrave; th&acirc;n t&igrave;nh với Nadal những năm gần đ&acirc;y.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Nadal và Xisca hạnh phúc trong ngày cưới. Ảnh: Tennis World.\" src=\"https://i-thethao.vnecdn.net/2019/10/22/rafael-nadal-and-maria-francis-8837-2642-1571731456.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Nadal v&agrave; Xisca hạnh ph&uacute;c trong ng&agrave;y cưới.&nbsp;<em>Ảnh: Tennis World.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&quot;T&ocirc;i kh&ocirc;ng c&oacute; th&ocirc;ng tin g&igrave; trước khi đ&aacute;m cưới diễn ra&quot;, Federer chia sẻ. &quot;Cuối tuần qua, t&ocirc;i l&ecirc;n kế hoạch nghỉ ngơi trước khi tham dự giải ATP tại Basel tuần n&agrave;y&quot;.</p>\r\n\r\n<p>Nadal v&agrave; Xisca hẹn h&ograve; trong 14 năm qua, trước khi cử h&agrave;nh h&ocirc;n lễ h&ocirc;m 19/10. Xisca, theo nhiều nguồn tin tại T&acirc;y Ban Nha, l&agrave; bạn g&aacute;i duy nhất của Nadal từ trước tới nay. L&acirc;u đ&agrave;i Sa Fortaleza - nơi diễn ra đ&aacute;m cưới - được x&acirc;y từ thế kỷ 17 v&agrave; cũng l&agrave; nơi diễn ra đ&aacute;m cưới của cầu thủ b&oacute;ng đ&aacute; Gareth Bale v&agrave; ng&ocirc;i sao b&oacute;ng rổ Rudy Fernandez.</p>\r\n\r\n<p>Danh s&aacute;ch kh&aacute;ch mời c&oacute; cả &ocirc;ng tr&ugrave;m đồng hồ Richard Mille, nh&agrave; vua Juan Carlos v&agrave; chủ tịch Real Madrid - Florentino Perez. Tuy nhi&ecirc;n, &ocirc;ng Perez vắng mặt v&igrave; kh&ocirc;ng muốn quay lại nơi vợ &ocirc;ng qua đời.</p>\r\n', '', 12, '2019-10-22 10:04:39', 0, 1, '', '', ''),
(10, 2, 3, '1572436293-img16.jpg', 'Giam-35-cho-khach-hang-mua-tour-o-mien-Bac', 'Giảm 35% cho khách hàng mua tour ở miền Bắc', 'Giam-35-cho-khach-hang-mua-tour-o-mien-Bac', 'Khách hàng đăng ký tour du lịch tại các văn phòng Vietravel miền Bắc từ 1 đến 3/11 sẽ được hưởng mức giá giảm tới 35%.', '<p>Kh&aacute;ch h&agrave;ng đăng k&yacute; tour du lịch tại c&aacute;c văn ph&ograve;ng Vietravel miền Bắc từ 1 đến 3/11 sẽ được hưởng mức gi&aacute; giảm tới 35%.</p>\r\n\r\n<p>Chương tr&igrave;nh khuyến mại nằm trong sự kiện Vietravel Fair được tổ chức đồng loạt tại văn ph&ograve;ng c&aacute;c chi nh&aacute;nh Vietravel miền Bắc, bao gồm H&agrave; Nội, Hải Ph&ograve;ng, Hải Dương, Th&aacute;i Nguy&ecirc;n, Quảng Ninh, Thanh H&oacute;a v&agrave; Vinh. Sự kiện l&agrave; hoạt động tri &acirc;n kh&aacute;ch h&agrave;ng nh&acirc;n dịp thương hiệu n&agrave;y nhận giải thưởng du lịch thế giới World Travel Awards.</p>\r\n\r\n<p>Theo đ&oacute;, trong 3 ng&agrave;y đầu th&aacute;ng 11, Vietravel sẽ mở b&aacute;n hơn 5.000 suất tour du lịch gi&aacute; giảm trực tiếp tới 35% k&egrave;m cam kết chất lượng tour kh&ocirc;ng đổi. Ưu đ&atilde;i &aacute;p dụng cho hơn 60 điểm đến trong v&agrave; ngo&agrave;i nước với lịch khởi h&agrave;nh từ th&aacute;ng 11/2019 đến hết qu&yacute; 1/2020. Tour du lịch trong nước c&oacute; mức gi&aacute; trọn g&oacute;i từ 590.000 đồng, tour du lịch nước ngo&agrave;i trọn g&oacute;i từ 6 triệu đồng.</p>\r\n\r\n<p>Du kh&aacute;ch đăng k&yacute; tour khuyến mại kh&ocirc;ng chỉ được hưởng mức gi&aacute; ưu đ&atilde;i tốt, m&agrave; c&ograve;n nhận th&ecirc;m phần qu&agrave; c&oacute; gi&aacute; trị từ Tổng cục Du lịch Th&aacute;i Lan, Singapore, H&agrave;n Quốc... cũng như c&aacute;c đối t&aacute;c lớn của c&ocirc;ng ty. Du kh&aacute;ch đăng k&yacute; 2 suất tour đồng gi&aacute; c&aacute;c mức 1,99 - 4,99 - 5,99 - 10,99 triệu đồng c&ograve;n được tặng miễn ph&iacute; v&eacute; v&agrave;o cửa c&aacute;c khu vui chơi trong nước trị gi&aacute; 450.000 đồng.</p>\r\n\r\n<p>&Ocirc;ng Phạm Văn Bảy, ph&oacute; gi&aacute;m đốc Vietravel H&agrave; Nội cho biết, kh&ocirc;ng chỉ c&aacute;c tour khởi h&agrave;nh ng&agrave;y thường được khuyến mại trong dịp n&agrave;y. C&aacute;c tour khởi h&agrave;nh dịp Tết Dương lịch, Tết &Acirc;m lịch cũng được đơn vị &aacute;p dụng ưu đ&atilde;i giảm tới 2 triệu đồng khi đăng k&yacute; trong 3 ng&agrave;y hội. Trường hợp c&aacute;c gia đ&igrave;nh chưa sắp xếp được thời gian khởi h&agrave;nh cụ thể, c&oacute; thể mua voucher du lịch với mức chiết khấu tới 3 triệu đồng để sử dụng sau.</p>\r\n', 'Văn Hải, tour', 1, '2019-10-30 11:51:33', 0, 1, '', '', ''),
(11, 2, 3, '1572436495-img11.jpg', 'Giam-35-cho-khach-hang-mua-tour-o-mien-Bac', 'Giảm 35% cho khách hàng mua tour ở miền Bắc', 'Giam-35-cho-khach-hang-mua-tour-o-mien-Bac', 'Khách hàng đăng ký tour du lịch tại các văn phòng Vietravel miền Bắc từ 1 đến 3/11 sẽ được hưởng mức giá giảm tới 35%.', '<p>&nbsp;</p>\r\n\r\n<p>Chương tr&igrave;nh khuyến mại nằm trong sự kiện Vietravel Fair được tổ chức đồng loạt tại văn ph&ograve;ng c&aacute;c chi nh&aacute;nh Vietravel miền Bắc, bao gồm H&agrave; Nội, Hải Ph&ograve;ng, Hải Dương, Th&aacute;i Nguy&ecirc;n, Quảng Ninh, Thanh H&oacute;a v&agrave; Vinh. Sự kiện l&agrave; hoạt động tri &acirc;n kh&aacute;ch h&agrave;ng nh&acirc;n dịp thương hiệu n&agrave;y nhận giải thưởng du lịch thế giới World Travel Awards.</p>\r\n\r\n<p>Theo đ&oacute;, trong 3 ng&agrave;y đầu th&aacute;ng 11, Vietravel sẽ mở b&aacute;n hơn 5.000 suất tour du lịch gi&aacute; giảm trực tiếp tới 35% k&egrave;m cam kết chất lượng tour kh&ocirc;ng đổi. Ưu đ&atilde;i &aacute;p dụng cho hơn 60 điểm đến trong v&agrave; ngo&agrave;i nước với lịch khởi h&agrave;nh từ th&aacute;ng 11/2019 đến hết qu&yacute; 1/2020. Tour du lịch trong nước c&oacute; mức gi&aacute; trọn g&oacute;i từ 590.000 đồng, tour du lịch nước ngo&agrave;i trọn g&oacute;i từ 6 triệu đồng.</p>\r\n\r\n<p>Du kh&aacute;ch đăng k&yacute; tour khuyến mại kh&ocirc;ng chỉ được hưởng mức gi&aacute; ưu đ&atilde;i tốt, m&agrave; c&ograve;n nhận th&ecirc;m phần qu&agrave; c&oacute; gi&aacute; trị từ Tổng cục Du lịch Th&aacute;i Lan, Singapore, H&agrave;n Quốc... cũng như c&aacute;c đối t&aacute;c lớn của c&ocirc;ng ty. Du kh&aacute;ch đăng k&yacute; 2 suất tour đồng gi&aacute; c&aacute;c mức 1,99 - 4,99 - 5,99 - 10,99 triệu đồng c&ograve;n được tặng miễn ph&iacute; v&eacute; v&agrave;o cửa c&aacute;c khu vui chơi trong nước trị gi&aacute; 450.000 đồng.</p>\r\n\r\n<p>&Ocirc;ng Phạm Văn Bảy, ph&oacute; gi&aacute;m đốc Vietravel H&agrave; Nội cho biết, kh&ocirc;ng chỉ c&aacute;c tour khởi h&agrave;nh ng&agrave;y thường được khuyến mại trong dịp n&agrave;y. C&aacute;c tour khởi h&agrave;nh dịp Tết Dương lịch, Tết &Acirc;m lịch cũng được đơn vị &aacute;p dụng ưu đ&atilde;i giảm tới 2 triệu đồng khi đăng k&yacute; trong 3 ng&agrave;y hội. Trường hợp c&aacute;c gia đ&igrave;nh chưa sắp xếp được thời gian khởi h&agrave;nh cụ thể, c&oacute; thể mua voucher du lịch với mức chiết khấu tới 3 triệu đồng để sử dụng sau.</p>\r\n', 'tour, văn hải', 19, '2019-10-30 11:54:55', 0, 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tintuc_tags`
--

CREATE TABLE `tintuc_tags` (
  `id_tags` int(11) NOT NULL,
  `id_tintuc` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tintuc_tags`
--

INSERT INTO `tintuc_tags` (`id_tags`, `id_tintuc`) VALUES
(1, 11),
(2, 11);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `c_u` (`id_nguoidung`),
  ADD KEY `c_n` (`id_tintuc`);

--
-- Indexes for table `cauhinh`
--
ALTER TABLE `cauhinh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nguoidung`
--
ALTER TABLE `nguoidung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `saved`
--
ALTER TABLE `saved`
  ADD KEY `s_u` (`id_nguoidung`),
  ADD KEY `s_n` (`id_tintuc`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_t` (`id_type`),
  ADD KEY `n_u` (`id_user`);

--
-- Indexes for table `tintuc_tags`
--
ALTER TABLE `tintuc_tags`
  ADD KEY `nt_n` (`id_tintuc`),
  ADD KEY `nt_t` (`id_tags`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `binhluan`
--
ALTER TABLE `binhluan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cauhinh`
--
ALTER TABLE `cauhinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `nguoidung`
--
ALTER TABLE `nguoidung`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `theloai`
--
ALTER TABLE `theloai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `binhluan`
--
ALTER TABLE `binhluan`
  ADD CONSTRAINT `c_n` FOREIGN KEY (`id_tintuc`) REFERENCES `tintuc` (`id`),
  ADD CONSTRAINT `c_u` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoidung` (`id`);

--
-- Constraints for table `saved`
--
ALTER TABLE `saved`
  ADD CONSTRAINT `s_n` FOREIGN KEY (`id_tintuc`) REFERENCES `tintuc` (`id`),
  ADD CONSTRAINT `s_u` FOREIGN KEY (`id_nguoidung`) REFERENCES `nguoidung` (`id`);

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `n_t` FOREIGN KEY (`id_type`) REFERENCES `theloai` (`id`),
  ADD CONSTRAINT `n_u` FOREIGN KEY (`id_user`) REFERENCES `nguoidung` (`id`);

--
-- Constraints for table `tintuc_tags`
--
ALTER TABLE `tintuc_tags`
  ADD CONSTRAINT `nt_n` FOREIGN KEY (`id_tintuc`) REFERENCES `tintuc` (`id`),
  ADD CONSTRAINT `nt_t` FOREIGN KEY (`id_tags`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
