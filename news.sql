-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 01, 2019 at 11:38 AM
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
-- Database: `news`
--

-- --------------------------------------------------------

--
-- Table structure for table `cauhinh`
--

CREATE TABLE `cauhinh` (
  `id` int(11) NOT NULL,
  `ten` varchar(200) NOT NULL,
  `diachi` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dienthoai` varchar(20) NOT NULL,
  `web` varchar(100) NOT NULL,
  `fanpage` varchar(200) NOT NULL,
  `titleseo` varchar(220) NOT NULL,
  `keyseo` longtext NOT NULL,
  `descseo` text NOT NULL,
  `logo` varchar(200) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `map` text NOT NULL,
  `ana` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cauhinh`
--

INSERT INTO `cauhinh` (`id`, `ten`, `diachi`, `email`, `dienthoai`, `web`, `fanpage`, `titleseo`, `keyseo`, `descseo`, `logo`, `icon`, `map`, `ana`) VALUES
(1, 'Tin tức xyz', 'Trần Duy Hưng, Cầu Giấy, Hà Nội', 'Mail@mail', '0123456789', 'tintuc.com', 'facebook@fanpage', 'Cập nhật tin tức 24/24', 'ghg,ggggggggg,hhhh,bbbbbbbbbb,vvvvvv', 'Tin rức cập nhập', '1568738712-logo.png', '1568738712-icon.png', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.5553365051564!2d105.79735701440705!3d21.010454393780034!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135aca73b308285%3A0xf4ff5c3693337023!2zVHLhuqduIER1eSBIxrBuZywgQ-G6p3UgR2nhuqV5LCBIw6AgTuG7mWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1566976868335!5m2!1svi!2s\" width=\"100%\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\"></iframe>', '');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` tinyint(11) NOT NULL,
  `idtintuc` tinyint(11) NOT NULL,
  `iduser` tinyint(11) NOT NULL,
  `content` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `idtintuc`, `iduser`, `content`, `date`) VALUES
(50, 22, 27, 'Hay quá bạn', '2019-08-29 14:49:03'),
(53, 26, 30, 'aaaaaa', '2019-08-31 08:13:40'),
(54, 26, 27, 'aaaaaaa', '2019-08-31 08:14:02');

-- --------------------------------------------------------

--
-- Table structure for table `saved`
--

CREATE TABLE `saved` (
  `id` tinyint(4) NOT NULL,
  `iduser` tinyint(4) NOT NULL,
  `idtintuc` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` tinyint(11) NOT NULL,
  `name` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `theloai`
--

CREATE TABLE `theloai` (
  `id` tinyint(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `nameko` varchar(200) NOT NULL,
  `menu` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:ko hiện ở menu, 1:hiện ',
  `home` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:ko hiện ở home, 1:hiện',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:ko hiển thị đb, 1: hiển',
  `title_seo` text NOT NULL,
  `desc_seo` text NOT NULL,
  `key_seo` longtext NOT NULL,
  `parent_id` tinyint(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theloai`
--

INSERT INTO `theloai` (`id`, `name`, `nameko`, `menu`, `home`, `status`, `title_seo`, `desc_seo`, `key_seo`, `parent_id`) VALUES
(3, 'Khoa học', 'Khoa-hoc', 1, 1, 0, 'tttttt', 'aaaaaaa', 'c', 0),
(4, 'Thể thao', 'The-thao', 1, 0, 0, 'tttttt', 'aaaaaaa', 'dd', 0),
(5, 'Thế giới', 'The-gioi', 1, 1, 0, 'tttttt', 'aaaaaaa', 'fffffff', 0),
(6, 'Giải trí', 'Giai-tri', 1, 1, 0, 'tttttt', 'aaaaaaa', 'ccc', 0),
(7, 'Du lịch', 'Du-lich', 1, 0, 0, 'tttttt', 'aaaaaaa', 'ccccc', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tintuc`
--

CREATE TABLE `tintuc` (
  `id` tinyint(11) NOT NULL,
  `idtype` tinyint(11) NOT NULL,
  `iduser` tinyint(11) NOT NULL,
  `img` varchar(200) NOT NULL,
  `title` varchar(225) NOT NULL,
  `titleko` varchar(225) NOT NULL,
  `ndesc` text NOT NULL,
  `content` longtext NOT NULL,
  `tags` varchar(225) NOT NULL,
  `view` int(225) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '1: đặc biệt, 0:bình thường',
  `title_seo` text NOT NULL,
  `desc_seo` text NOT NULL,
  `key_seo` longtext NOT NULL,
  `shhi` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:ko, 1:có'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tintuc`
--

INSERT INTO `tintuc` (`id`, `idtype`, `iduser`, `img`, `title`, `titleko`, `ndesc`, `content`, `tags`, `view`, `date`, `status`, `title_seo`, `desc_seo`, `key_seo`, `shhi`) VALUES
(3, 3, 27, 'img11.jpg', 'Robot NASA trèo vách đá dốc đứng ở Thung lũng Chết	', 'Robot-NASA-treo-vach-da-doc-dung-o-Thung-lung-Chet', 'Robot LEMUR leo trèo bằng móc câu gắn ở 64 ngón chân và dùng trí tuệ nhân tạo vượt chướng ngại vật trên vách đá cheo leo tại California, Mỹ.', 'Robot LEMUR leo trèo bằng móc câu gắn ở 64 ngón chân và dùng trí tuệ nhân tạo vượt chướng ngại vật trên vách đá cheo leo tại California, Mỹ.', '', 14, '2019-08-13 00:41:28', 1, '', '', '', 1),
(4, 4, 27, 'img2.jpg', 'Việt Nam trông chờ Thái Lan để có vé bán kết U18 Đông Nam Á', 'Viet-Nam-trong-cho-Thai-Lan-de-co-ve-ban-ket-U18-Dong-Nam-A', 'Bên cạnh việc phải đánh bại Campuchia, đội chủ nhà còn phải cầu mong Thái Lan hạ Malaysia ở lượt trận cuối cùng bảng B ngày 15/8.', 'Bên cạnh việc phải đánh bại Campuchia, đội chủ nhà còn phải cầu mong Thái Lan hạ Malaysia ở lượt trận cuối cùng bảng B ngày 15/8. Bên cạnh việc phải đánh bại Campuchia, đội chủ nhà còn phải cầu mong Thái Lan hạ Malaysia ở lượt trận cuối cùng bảng B ngày 15/8.', '', 12, '2019-08-13 00:41:28', 0, '', '', '', 1),
(5, 5, 27, 'img3.jpg', 'Hơn 85.000 người Mỹ muốn đổi tên đường trước tháp Trump', 'Hon-85000-nguoi-My-muon-doi-ten-duong-truoc-thap-Trump', 'Bà Elizabeth Rowin, 56 tuổi ở New York, năm ngoái kiến nghị lấy tên Obama đặt cho đoạn phố trước Tháp Trump và được nhiều người ủng hộ.', 'HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello', '', 37, '2019-08-13 00:41:28', 1, '', '', '', 1),
(6, 6, 27, 'img12.jpg', 'Lý Nhã Kỳ diện váy thêu chỉ vàng dự sinh nhật đại gia Ấn Độ', 'Ly-Nha-Ky-dien-vay-theu-chi-vang-du-sinh-nhat-dai-gia-An-Do', 'Lý Nhã Kỳ được đại gia Ấn Nitin Shah tặng váy thêu chỉ vàng để dự chuỗi tiệc sinh nhật kéo dài một tuần, từ ngày 12/8 ở Mumbai.', 'Lý Nhã Kỳ được đại gia Ấn Nitin Shah tặng váy thêu chỉ vàng để dự chuỗi tiệc sinh nhật kéo dài một tuần, từ ngày 12/8 ở Mumbai. Lý Nhã Kỳ được đại gia Ấn Nitin Shah tặng váy thêu chỉ vàng để dự chuỗi tiệc sinh nhật kéo dài một tuần, từ ngày 12/8 ở Mumbai.', '', 2, '2019-08-13 00:41:28', 0, '', '', '', 1),
(7, 7, 27, 'img5.jpg', 'Quán cơm tấm 30 năm đông khách trong hẻm nhỏ Sài Gòn', 'Quan-com-tam-30-nam-dong-khach-trong-hem-nho-Sai-Gon', 'Quán lâu năm nên có nhiều khách quen, bán chủ yếu các món từ sườn, bì, chả đến trứng ốp la, tép rang.', 'Quán lâu năm nên có nhiều khách quen, bán chủ yếu các món từ sườn, bì, chả đến trứng ốp la, tép rang. Quán lâu năm nên có nhiều khách quen, bán chủ yếu các món từ sườn, bì, chả đến trứng ốp la, tép rang.', '', 32, '2019-08-13 00:41:28', 1, '', '', '', 1),
(8, 3, 27, 'img1.jpg', 'Sân bay đầu tiên sử dụng hoàn toàn điện mặt trời ở Mỹ', 'San-bay-dau-tien-su-dung-hoan-toan-dien-mat-troi-o-My', 'Sân bay Chattanooga tại Tennessee hoạt động nhờ trang trại điện mặt trời rộng bằng 16 sân bóng.', 'Sân bay Chattanooga tại Tennessee hoạt động nhờ trang trại điện mặt trời rộng bằng 16 sân bóng. Sân bay Chattanooga tại Tennessee hoạt động nhờ trang trại điện mặt trời rộng bằng 16 sân bóng. Sân bay Chattanooga tại Tennessee hoạt động nhờ trang trại điện mặt trời rộng bằng 16 sân bóng.', '', 35, '2019-08-13 00:41:28', 0, '', '', '', 1),
(9, 4, 27, 'img7.jpg', 'Kyrgios đối đầu Nadal, Federer tại Laver Cup', 'Kyrgios-doi-dau-Nadal-Federer-tai-Laver-Cup', 'Ngôi sao lắm tài nhiều tật vừa được HLV John McEnroe chọn vào đội hình tuyển Thế giới dự giải đấu ở Geneva, Thụy Sĩ tháng 9/2019.', 'Ngôi sao lắm tài nhiều tật vừa được HLV John McEnroe chọn vào đội hình tuyển Thế giới dự giải đấu ở Geneva, Thụy Sĩ tháng 9/2019. Ngôi sao lắm tài nhiều tật vừa được HLV John McEnroe chọn vào đội hình tuyển Thế giới dự giải đấu ở Geneva, Thụy Sĩ tháng 9/2019.', '', 4, '2019-08-13 00:41:28', 0, '', '', '', 1),
(10, 5, 27, 'img8.jpg', 'Người cháu đưa bà thăm 29 công viên quốc gia Mỹ', 'Nguoi-chau-dua-ba-tham-29-cong-vien-quoc-gia-My', 'Khi nghe người bà 89 tuổi nói chưa bao giờ nhìn thấy biển hay các dãy núi, Brad Ryan quyết định giúp bà thỏa ước nguyện.', 'Khi nghe người bà 89 tuổi nói chưa bao giờ nhìn thấy biển hay các dãy núi, Brad Ryan quyết định giúp bà thỏa ước nguyện.', '', 6, '2019-08-13 00:41:28', 0, '', '', '', 1),
(11, 6, 27, 'img9.jpg', 'Câu chuyện đời thường trong sách \'Sài Gòn thương còn hổng hết\'', 'Cau-chuyen-doi-thuong-trong-sach-Sai-Gon-thuong-con-hong-het', 'Sách của Hoàng My kể góc khác của Sài Gòn đô thị, về con hẻm xóm lao động, những đứa bé nhà nghèo bươn chải cùng cha mẹ.', 'Sách của Hoàng My kể góc khác của Sài Gòn đô thị, về con hẻm xóm lao động, những đứa bé nhà nghèo bươn chải cùng cha mẹ. Sách của Hoàng My kể góc khác của Sài Gòn đô thị, về con hẻm xóm lao động, những đứa bé nhà nghèo bươn chải cùng cha mẹ.', '', 1, '2019-08-13 00:41:28', 0, '', '', '', 1),
(12, 7, 27, 'img4.jpg', 'Phong cảnh thiên nhiên đẹp như tranh ở Trung Quốc', 'Phong-canh-thien-nhien-dep-nhu-tranh-o-Trung-Quoc', 'Bên cạnh nền văn hóa, lịch sử lâu đời, Trung Quốc còn sở hữu phong cảnh thiên nhiên ấn tượng như núi cầu vồng, hồ Kanas và ruộng bậc thang.', 'Bên cạnh nền văn hóa, lịch sử lâu đời, Trung Quốc còn sở hữu phong cảnh thiên nhiên ấn tượng như núi cầu vồng, hồ Kanas và ruộng bậc thang. Bên cạnh nền văn hóa, lịch sử lâu đời, Trung Quốc còn sở hữu phong cảnh thiên nhiên ấn tượng như núi cầu vồng, hồ Kanas và ruộng bậc thang.', '', 42, '2019-08-13 00:41:28', 1, '', '', '', 1),
(13, 7, 27, 'img13.jpg', 'Sân bay Hong Kong có an toàn với du khách sau biểu tình không?', 'San-bay-Hong-Kong-co-an-toan-voi-du-khach-sau-bieu-tinh-khong', 'Dù sân bay đã hoạt động bình thường trở lại, tôi có cảm giác bất an khi đến đây ', 'Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ', '', 3, '2019-08-14 03:02:01', 0, '', '', '', 1),
(14, 7, 27, 'img14.jpg', 'Bí quyết ăn uống khỏe mạnh của người Nhật', 'Bi-quyet-an-uong-khoe-manh-cua-nguoi-Nhat', 'Khác với các bữa ăn kiểu Âu nhiều năng lượng món Á nhiều gia vị, bữa ăn truyền thống của Nhật giàu vitamin, chủ yếu làm từ cá, rong biển.', 'Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello ', '', 16, '2019-08-14 03:02:01', 0, '', '', '', 1),
(15, 7, 27, 'img15.jpg', 'Làm sao khi trùng tên trong danh sách đen xin visa Đài Loan?', 'Lam-sao-khi-trung-ten-trong-danh-sach-den-xin-visa-Dai-Loan', 'Em gái tôi bị trùng tên trong danh sách đen của Đài Loan nên không thể đăng ký xin visa online.', 'Em gái tôi bị trùng tên trong danh sách đen của Đài Loan nên không thể đăng ký xin visa online. Em gái tôi bị trùng tên trong danh sách đen của Đài Loan nên không thể đăng ký xin visa online. Em gái tôi bị trùng tên trong danh sách đen của Đài Loan nên không thể đăng ký xin visa online.', '', 23, '2019-08-14 03:02:01', 0, '', '', '', 1),
(16, 7, 27, 'img16.jpg', 'Rắn bò lên từ cống, khách nam bỏ chạy khi đang tắm ở Bali', 'Ran-bo-len-tu-cong-khach-nam-bo-chay-khi-dang-tam-o-Bali', 'Khi thấy con rắn, nam du khách vứt ngay vòi sen và rời khỏi phòng tắm của căn villa thuê gần bãi biển Canggu trên đảo Bali, Indonesia.', '<p>Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hekllo Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello</p>\r\n', '', 49, '2019-08-14 03:02:01', 0, '', '', '', 1),
(17, 5, 27, 'img20.jpg', 'Australia bắt số ma túy có thể bào chế 12 triệu viên thuốc lắc', 'Australia-bat-so-ma-tuy-co-the-bao-che-12-trieu-vien-thuoc-lac', 'Cảnh sát Australia ngày 13/8 triệt phá đường dây ma túy xuyên quốc gia, thu giữ 766 kg bột MDMA chuyên dùng để chế thuốc lắc.', '<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"766kg ma túy bị cảnh sát Queesland thu giữ . Ảnh: PA.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/14/1024-7719-1565758543.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>C&aacute;c g&oacute;i bột ma t&uacute;y MDMA bị cảnh s&aacute;t Queesland tịch thu. Ảnh:&nbsp;<em>PA.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Cảnh s&aacute;t bang Queensland, đ&ocirc;ng bắc Australia, cho biết đ&atilde; bắt 6 nghi phạm trong đường d&acirc;y, gồm 4 c&ocirc;ng d&acirc;n Anh v&agrave; hai c&ocirc;ng d&acirc;n Australia, c&ugrave;ng lượng ma t&uacute;y bị tịch thu c&oacute;&nbsp;trị gi&aacute; khoảng 61 triệu USD.</p>\r\n\r\n<p>Jon Wacker, quan chức thuộc cơ quan điều tra ma t&uacute;y v&agrave; trọng phạm ở Queensland, cho biết số ma t&uacute;y bị bắt lần n&agrave;y chiếm khoảng 7% tổng lượng ma t&uacute;y bị thu giữ mỗi năm tại Australia. Wacker khẳng định đường d&acirc;y c&oacute; li&ecirc;n quan đến một tổ chức tội phạm quy m&ocirc; ở Anh.</p>\r\n\r\n<p>Theo cảnh s&aacute;t, đ&acirc;y l&agrave; loại bột MDMA tinh khiết nhất từng thấy ở Queensland, c&oacute; thể chế tạo được tới 12 triệu vi&ecirc;n thuốc lắc.</p>\r\n\r\n<p>&quot;C&aacute;c tập đo&agrave;n tội phạm c&oacute; tổ chức đang thu lợi đ&aacute;ng kể từ cộng đồng Australia ch&uacute;ng ta, nhưng nghi&ecirc;m trọng hơn l&agrave; ch&uacute;ng đặt người trẻ Australia v&agrave;o t&igrave;nh trạng nguy hiểm. C&aacute;c hoạt động triệt ph&aacute; lần n&agrave;y tập trung v&agrave;o việc ti&ecirc;u diệt đường d&acirc;y đ&oacute;&quot;, Wacker n&oacute;i th&ecirc;m.</p>\r\n\r\n<p>Cuộc điều tra lần n&agrave;y c&oacute; sự tham gia của cơ quan tội phạm quốc gia Anh, cảnh s&aacute;t Australia v&agrave; New Zealand, Lực lượng Bi&ecirc;n ph&ograve;ng Australia, Ủy ban T&igrave;nh b&aacute;o H&igrave;nh sự Australia (ACIC) v&agrave; c&aacute;c cơ quan kh&aacute;c. Katie Willis, quan chức của ACIC, cho biết việc bắt 766 kg bột MDMA c&oacute; thể t&aacute;c động mạnh tới thị trường bu&ocirc;n b&aacute;n ma t&uacute;y bất hợp ph&aacute;p.</p>\r\n', '', 74, '2019-08-14 03:42:28', 1, '', '', '', 1),
(18, 5, 27, 'img18.jpg', 'Hãng hàng không Hong Kong gánh sức ép từ biểu tình', 'Hang-hang-khong-Hong-Kong-ganh-suc-ep-tu-bieu-tinh', 'Cathay Pacific phải tuân thủ yêu cầu của Bắc Kinh về biểu tình ở Hong Kong do hãng hàng không phụ thuộc lớn vào thị trường Trung Quốc đại lục.', '<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Máy bay của hãng Cathay Pacific tại Singapore tháng 6/2018. Ảnh: Reuters.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/14/205759-6969-1565758749.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>M&aacute;y bay của h&atilde;ng Cathay Pacific tại Singapore th&aacute;ng 6/2018. Ảnh:&nbsp;<em>Reuters</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Đầu tuần trước, c&aacute;c l&atilde;nh đạo của Cathay Pacific, h&atilde;ng h&agrave;ng kh&ocirc;ng nổi tiếng ở Hong Kong, n&oacute;i rằng quan điểm ch&iacute;nh trị của nh&acirc;n vi&ecirc;n kh&ocirc;ng phải l&agrave; mối quan t&acirc;m của họ. &quot;Ch&uacute;ng t&ocirc;i chắc chắn kh&ocirc;ng muốn &eacute;p họ phải suy nghĩ theo một hướng nhất định&quot;, chủ tịch John Slosar, n&oacute;i. &quot;Họ đều l&agrave; những người trưởng th&agrave;nh v&agrave; chuy&ecirc;n nghiệp. Ch&uacute;ng t&ocirc;i rất t&ocirc;n trọng họ&quot;.</p>\r\n\r\n<p>Tuy nhi&ecirc;n, giọng điệu của Cathay Pacific đ&atilde; thay đổi từ cuối tuần trước. Ch&iacute;nh phủ Trung Quốc ng&agrave;y 9/8 y&ecirc;u cầu họ cấm c&aacute;c nh&acirc;n vi&ecirc;n ủng hộ hoặc tham gia biểu t&igrave;nh ở Hong Kong l&agrave;m bất cứ c&ocirc;ng việc n&agrave;o li&ecirc;n quan đến c&aacute;c chuyến bay tới Trung Quốc đại lục. Họ cũng y&ecirc;u cầu h&atilde;ng n&agrave;y gửi th&ocirc;ng tin về tất cả c&aacute;c th&agrave;nh vi&ecirc;n phi h&agrave;nh đo&agrave;n đến hoặc bay qua Trung Quốc đại lục để Bắc Kinh ph&ecirc; duyệt trước.</p>\r\n\r\n<p>Cathay Pacific ng&agrave;y 10/8 cho biết họ đ&atilde; cấm bay một phi c&ocirc;ng bị buộc tội g&acirc;y bạo động ở Hong Kong v&agrave; sa thải hai nh&acirc;n vi&ecirc;n mặt đất v&igrave; c&oacute; h&agrave;nh vi sai tr&aacute;i. Đầu tuần n&agrave;y, Cathay Pacific y&ecirc;u cầu hơn 32.000 nh&acirc;n vi&ecirc;n kh&ocirc;ng được hỗ trợ hoặc tham gia v&agrave;o c&aacute;c cuộc biểu t&igrave;nh bất hợp ph&aacute;p,&nbsp;cảnh b&aacute;o rằng họ c&oacute; thể bị sa thải.</p>\r\n\r\n<p>H&atilde;ng Cathay Pacific được th&agrave;nh lập v&agrave;o năm 1946. Cổ đ&ocirc;ng lớn nhất của họ l&agrave; Swire Pacific, tập đo&agrave;n c&oacute; trụ sở tại Hong Kong c&oacute; nguồn gốc từ Anh. Chủ sở hữu lớn thứ hai l&agrave; h&atilde;ng h&agrave;ng kh&ocirc;ng quốc gia Trung Quốc Air China. Cathay vận h&agrave;nh c&aacute;c chuyến bay đến v&agrave; đi từ Hong Kong với 22 th&agrave;nh phố ở Trung Quốc đại lục. Hầu hết c&aacute;c đường bay giữa Mỹ với Hong Kong đều phải bay qua Trung Quốc đại lục.</p>\r\n\r\n<p>Philippe Lacamp, một l&atilde;nh đạo trong h&atilde;ng h&agrave;ng kh&ocirc;ng, n&oacute;i rằng họ đ&atilde; tu&acirc;n thủ y&ecirc;u cầu từ Bắc Kinh. &quot;Bạn kh&ocirc;ng thể đơn giản n&oacute;i với cơ quan quản l&yacute; rằng &#39;xin lỗi, ch&uacute;ng t&ocirc;i kh&ocirc;ng th&iacute;ch y&ecirc;u cầu của c&aacute;c anh, ch&uacute;ng t&ocirc;i vẫn cứ bay&quot;, Lacamp n&oacute;i. &quot;Ch&uacute;ng t&ocirc;i sẽ bị cấm khỏi kh&ocirc;ng phận Trung Quốc nếu kh&ocirc;ng tu&acirc;n thủ&quot;.</p>\r\n\r\n<p>Giới chuy&ecirc;n gia nhận định Cathay phụ thuộc rất nhiều v&agrave;o thị trường Trung Quốc đại lục. Gi&aacute;m đốc điều h&agrave;nh Cathay Pacific Rupert Hogg đ&atilde; n&oacute;i r&otilde; với nh&acirc;n vi&ecirc;n trong một email rằng c&aacute;c hoạt động của c&ocirc;ng ty tại Trung Quốc đại lục l&agrave; &quot;trọng yếu&quot;.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Cảnh sát Hong Kong đụng độ với người biểu tình tại sân bay ngày 13/8. Ảnh: Reuters.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/14/2019-08-13T163932Z-1449566124-2533-9101-1565761544.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Cảnh s&aacute;t Hong Kong đụng độ với người biểu t&igrave;nh tại s&acirc;n bay ng&agrave;y 13/8. Ảnh:&nbsp;<em>Reuters</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>T&igrave;nh h&igrave;nh ở Hong Kong đang g&acirc;y ảnh hưởng đến một số h&atilde;ng h&agrave;ng kh&ocirc;ng c&ugrave;ng mối quan hệ của họ với Trung Quốc. B&ecirc;n c&oacute; nguy cơ chịu thiệt hại nhiều nhất l&agrave; Cathay Pacific. Khi c&aacute;c cuộc biểu t&igrave;nh khiến s&acirc;n bay Hong Kong ng&agrave;y 13/8 phải đ&oacute;ng cửa ng&agrave;y thứ hai, Cathay đ&atilde; hủy h&agrave;ng chục chuyến bay - nhiều hơn bất kỳ h&atilde;ng h&agrave;ng kh&ocirc;ng n&agrave;o kh&aacute;c.</p>\r\n\r\n<p>&quot;Cathay Pacific, với tư c&aacute;ch l&agrave; b&ecirc;n đứng đầu thị trường với thị phần lớn, r&otilde; r&agrave;ng l&agrave; h&atilde;ng h&agrave;ng kh&ocirc;ng chịu ảnh hưởng lớn nhất&quot;, Brendan Sobie, nh&agrave; ph&acirc;n t&iacute;ch của trang tin Trung t&acirc;m H&agrave;ng kh&ocirc;ng n&oacute;i.</p>\r\n\r\n<p>Sobie chỉ ra rằng gần 1/5 lượng kh&aacute;ch h&agrave;ng của Cathay Pacific, bao gồm h&atilde;ng con Cathay Dragon, l&agrave; đến từ Trung Quốc đại lục. &quot;Sự li&ecirc;n quan của Cathay Pacific&nbsp;với Trung Quốc đại lục thậm ch&iacute; c&ograve;n cao hơn khi t&iacute;nh đến c&aacute;c h&agrave;nh kh&aacute;ch v&agrave;o S&acirc;n bay Quốc tế Hong Kong từ miền nam Trung Quốc th&ocirc;ng qua ph&agrave; v&agrave; vận tải đường bộ. Do đ&oacute;, Trung Quốc đại lục l&agrave; thị trường cực kỳ quan trọng đối với Cathay&quot;.</p>\r\n\r\n<p>Y&ecirc;u cầu từ cơ quan an to&agrave;n h&agrave;ng kh&ocirc;ng của Trung Quốc đại lục với Cathay Pacific&nbsp;thể hiện sự ảnh hưởng đối với c&aacute;c c&ocirc;ng ty quốc tế kiếm lời nhờ thị trường Trung Quốc. Một số người ở Hong Kong lo ngại rằng c&aacute;ch can thiệp của Trung Quốc đặt ra mối đe dọa kinh tế, kh&ocirc;ng chỉ đối với Cathay&nbsp;Pacific, m&agrave; c&ograve;n đối với tất cả c&ocirc;ng ty đa quốc gia ở Hong Kong.</p>\r\n\r\n<p>&quot;Nếu bạn l&agrave; chủ doanh nghiệp, bạn sẽ nghĩ &#39;trời ơi, t&ocirc;i chỉ đơn giản l&agrave; muốn kinh doanh ở đ&acirc;y th&ocirc;i, thế m&agrave; giờ họ đang r&agrave; so&aacute;t nh&acirc;n vi&ecirc;n của t&ocirc;i&quot;, Carol Ng, thuộc Li&ecirc;n đo&agrave;n Tổ bay Hong Kong, n&oacute;i. &quot;Lo lắng n&agrave;y c&oacute; thể g&acirc;y thiệt hại cho kinh tế Hong Kong nhiều hơn cả c&aacute;c cuộc biểu t&igrave;nh&quot;.</p>\r\n', '', 34, '2019-08-14 03:42:28', 0, '', '', '', 1),
(19, 5, 27, 'img19.jpg', 'Nga tuyên bố đứng đầu thế giới về vũ khí hạt nhân mới', 'Nga-tuyen-bo-dung-dau-the-gioi-ve-vu-khi-hat-nhan-moi', 'Điện Kremlin hôm qua cho rằng Nga đã thắng Mỹ trong phát triển vũ khí hạt nhân tối tân, bất chấp vụ nổ động cơ tên lửa gần đây.', '<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Tên lửa đạn đạo xuyên lục địa Sarmat trong đợt thử nghiệm năm 2017. Ảnh: Bộ Quốc phòng Nga.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/14/Sarmat-5719-1561696200-7034-1565747757.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>T&ecirc;n lửa đạn đạo xuy&ecirc;n lục địa&nbsp;Sarmat trong đợt thử nghiệm năm 2017. Ảnh:&nbsp;<em>Bộ Quốc ph&ograve;ng Nga.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&quot;Mỹ kh&ocirc;ng phải quốc gia đứng đầu trong ph&aacute;t triển vũ kh&iacute; hạt nh&acirc;n mới. Tổng thống của ch&uacute;ng t&ocirc;i đ&atilde; nhiều lần n&oacute;i rằng tr&igrave;nh độ của Nga trong lĩnh vực n&agrave;y vượt xa c&aacute;c quốc gia kh&aacute;c v&agrave; l&agrave; độc nhất v&ocirc; nhị&quot;, ph&aacute;t ng&ocirc;n vi&ecirc;n Điện Kremlin Dmitry Peskov ng&agrave;y 13/8 tuy&ecirc;n bố.</p>\r\n\r\n<p>Ph&aacute;t biểu được Peskov đưa ra sau khi Tổng thống Mỹ Donald Trump b&igrave;nh luận về vụ nổ động cơ t&ecirc;n lửa ở đ&ocirc;ng bắc nước Nga hồi giữa tuần trước. Trump cho rằng Mỹ sở hữu c&ocirc;ng nghệ tương tự nhưng ti&ecirc;n tiến hơn so với mẫu t&ecirc;n lửa h&agrave;nh tr&igrave;nh trang bị động cơ hạt nh&acirc;n m&agrave; Nga đang ph&aacute;t triển.</p>\r\n\r\n<p>Gi&aacute;m đốc Tập đo&agrave;n năng lượng hạt nh&acirc;n Nga (Rosatom) Alexei Likhachev h&ocirc;m 12/8 x&aacute;c nhận động cơ t&ecirc;n lửa của nước n&agrave;y ph&aacute;t nổ khi thử nghiệm&nbsp;loại vũ kh&iacute; mới&nbsp;ngo&agrave;i khơi th&agrave;nh phố Arkhangelsk h&ocirc;m 8/8, khiến 5 chuy&ecirc;n gia thiệt mạng.&nbsp;Cơ quan Dự b&aacute;o Thời tiết Nga (Rosgidromet) sau đ&oacute; cho hay nồng độ ph&oacute;ng xạ ở th&agrave;nh phố Severodvinsk gần đ&oacute; tăng 4-16 lần sau vụ nổ.</p>\r\n\r\n<p>Một quan chức cấp cao Mỹ khẳng định Washington tin rằng vụ nổ c&oacute; li&ecirc;n quan đến chương tr&igrave;nh t&ecirc;n lửa h&agrave;nh tr&igrave;nh trang bị động cơ hạt nh&acirc;n Burevestnik m&agrave; Tổng thống Nga Vladimir Putin c&ocirc;ng bố năm ngo&aacute;i. Theo quan chức n&agrave;y, vụ nổ c&oacute; thể thể hiện sự thụt l&ugrave;i đ&aacute;ng kể trong chương tr&igrave;nh t&ecirc;n lửa Nga.</p>\r\n\r\n<p>Burevestnik l&agrave; một trong&nbsp;6 si&ecirc;u vũ kh&iacute; được Tổng thống Nga Vladimir Putin c&ocirc;ng bố&nbsp;hồi th&aacute;ng 3/2018. Về l&yacute; thuyết, việc trang bị động cơ chạy bằng năng lượng hạt nh&acirc;n gi&uacute;p &quot;si&ecirc;u t&ecirc;n lửa h&agrave;nh tr&igrave;nh&quot; n&agrave;y c&oacute;&nbsp;tầm bắn kh&ocirc;ng giới hạnv&agrave; c&oacute; thể bay theo những quỹ đạo kh&oacute; lường nhất để xuy&ecirc;n thủng l&aacute; chắn t&ecirc;n lửa đối phương.</p>\r\n', '', 91, '2019-08-14 03:42:28', 0, '', '', '', 1),
(22, 3, 27, '1567099406-img21.jpg', 'Nữ thủ khoa ở Sài Gòn mê công nghệ', 'Nu-thu-khoa-o-Sai-Gon-me-cong-nghe', 'Nguyễn Ngọc Băng Tâm mê Toán từ nhỏ, thi THPT quốc gia được 28,5 điểm, trở thành thủ khoa đầu vào ngành Khoa học máy tính', '<p>Băng T&acirc;m l&agrave; cựu học sinh lớp chuy&ecirc;n To&aacute;n trường Phổ th&ocirc;ng Năng Khiếu (Đại học Quốc gia TP HCM). Với điểm thi THPT quốc gia ở tổ hợp A1 28,5 điểm (To&aacute;n 9,6; L&yacute; 9,5; tiếng Anh 9,4), nữ sinh l&agrave; người c&oacute; điểm x&eacute;t tuyển cao nhất trường Đại học Khoa học Tự nhi&ecirc;n TP HCM.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Nguyễn Ngọc Băng Tâm tại trường Đại học Khoa học Tự nhiên. Ảnh: HCMUS.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/28/thu-khoa-nguyen-ngoc-bang-tam-6972-1566967857.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Băng T&acirc;m tại trường Đại học Khoa học Tự nhi&ecirc;n. Ảnh:&nbsp;<em>HCMUS.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Được ba mẹ định hướng&nbsp;tự lập từ nhỏ, T&acirc;m bước v&agrave;o bậc THPT đ&atilde; lu&ocirc;n chủ động trong việc học v&agrave; định hướng nghề nghiệp tương lai. Kh&ocirc;ng đặt nặng &aacute;p lực nhưng c&ocirc; lu&ocirc;n tự nhủ phải cố gắng đạt kết quả tốt nhất ở trường Phổ th&ocirc;ng Năng khiếu, bởi xung quanh bạn b&egrave; nhiều người giỏi.</p>\r\n\r\n<p>Suốt 12 năm liền T&acirc;m đều đạt học lực lực giỏi, đặc biệt l&agrave; To&aacute;n. Năm lớp 12, nữ sinh đạt giải nhất kỳ thi học sinh giỏi cấp th&agrave;nh phố.&nbsp;&quot;Đ&ocirc;i khi những b&agrave;i to&aacute;n kh&oacute; lại được tạo n&ecirc;n từ rất nhiều b&agrave;i to&aacute;n dễ. Ai biết g&oacute;p nhặt những kiến thức nhỏ x&iacute;u ấy th&igrave; sẽ dễ chinh phục được b&agrave;i to&aacute;n hơn&quot;, nữ sinh chia sẻ về niềm y&ecirc;u th&iacute;ch học To&aacute;n.&nbsp;</p>\r\n\r\n<p>Theo T&acirc;m, To&aacute;n kh&ocirc;ng chỉ truyền tải cho người học những tri thức khoa học m&agrave; c&ograve;n tư duy logic, kỹ năng xử l&yacute; vấn đề, t&iacute;nh ki&ecirc;n tr&igrave; v&agrave; khả năng suy luận. Ch&iacute;nh niềm đam m&ecirc; m&ocirc;n học n&agrave;y l&agrave; một cơ duy&ecirc;n khiến c&ocirc; chọn ng&agrave;nh Khoa học m&aacute;y t&iacute;nh - vốn l&agrave; sự lựa chọn của nhiều nam sinh. &quot;Nhiều người n&oacute;i Khoa học m&aacute;y t&iacute;nh kh&oacute; nhằn với nữ, nhưng theo em học tốt hay kh&ocirc;ng&nbsp;phụ thuộc&nbsp;v&agrave;o tr&igrave;nh độ v&agrave; kỹ năng của mỗi người&quot;, T&acirc;m n&oacute;i.</p>\r\n\r\n<p>Thường xuy&ecirc;n sử dụng c&aacute;c ứng dụng tr&ecirc;n điện thoại, T&acirc;m lu&ocirc;n so s&aacute;nh v&agrave; tự đặt c&acirc;u hỏi về mức độ hiệu quả cũng như tốc độ của c&aacute;c ứng dụng hiện tại. Lập tr&igrave;nh vi&ecirc;n c&oacute; đ&oacute;ng g&oacute;p lớn với sự ph&aacute;t triển của c&ocirc;ng nghệ. &quot;Lập tr&igrave;nh vi&ecirc;n c&oacute; thể l&agrave;m thay đổi thế giới của mỗi người theo những c&aacute;ch thật ri&ecirc;ng biệt v&agrave; em muốn được tham gia tạo n&ecirc;n sự thay đổi đ&oacute;&quot;, T&acirc;m chia sẻ.</p>\r\n\r\n<p>Trong một lần du lịch Singapore, T&acirc;m nhận thấy hệ thống giao th&ocirc;ng c&ocirc;ng cộng được kết nối bằng thẻ rất hiện đại n&ecirc;n c&ocirc; ấp ủ ước mơ x&acirc;y dựng một hệ thống tương tự tại Việt Nam. C&ocirc;&nbsp;cho rằng&nbsp;x&atilde; hội v&agrave; c&ocirc;ng nghệ lu&ocirc;n thay đổi kh&ocirc;ng ngừng, n&ecirc;n cần r&egrave;n luyện khả năng th&iacute;ch ứng v&agrave; ph&aacute;t triển trong mọi m&ocirc;i trường.&nbsp;</p>\r\n\r\n<p>&quot;Việc trở th&agrave;nh thủ khoa đại học vừa l&agrave; nền tảng vừa l&agrave; động lực th&uacute;c đẩy em cố gắng hơn nữa để kh&ocirc;ng phụ sự kỳ vọng của mọi người&quot;, nữ sinh b&agrave;y tỏ. Bước v&agrave;o giảng đường đại học, T&acirc;m muốn tham gia những chương tr&igrave;nh trao đổi sinh vi&ecirc;n để c&oacute; cơ hội học tập nhiều m&ocirc;i trường kh&aacute;c nhau.</p>\r\n\r\n<p>Từng c&oacute; thời gian dạy T&acirc;m hai năm phổ th&ocirc;ng, c&ocirc; L&ecirc; Thị Quỳnh Anh (gi&aacute;o vi&ecirc;n Vật l&yacute; trường Phổ th&ocirc;ng Năng khiếu) đ&aacute;nh gi&aacute; nữ sinh l&agrave; người th&ocirc;ng minh, chăm chỉ v&agrave; c&oacute; năng lực học tập rất tốt. T&acirc;m cũng thể hiện sự nghi&ecirc;m t&uacute;c trong mọi việc, từ học tập đến hoạt động trường lớp. &quot;T&ocirc;i tin em sẽ th&agrave;nh c&ocirc;ng bởi sự tự tin v&agrave; mạnh mẽ vốn c&oacute;&quot;, c&ocirc; gi&aacute;o n&oacute;i.</p>\r\n', '', 30, '2019-08-29 14:29:10', 0, 'Nữ thủ khoa ở Sài Gòn mê công nghệ', '', '', 1),
(23, 4, 27, '1567231197-img22.jpg', 'Man Utd chia tay Smalling và Darmian.', 'Man-Utd-chia-tay-Smalling-va-Darmian', 'HLV Man Utd, Solskjaer xác nhận các hậu vệ Chris Smalling và Matteo Darmian sang Italy theo diện cho mượn.', '<p>Theo&nbsp;<em>Sky Italy&nbsp;</em>h&ocirc;m 30/3, AS Roma đạt thỏa thuận mượn&nbsp;<a href=\"https://vnexpress.net/bong-da/cdv-man-utd-muon-tong-khu-young-jones-va-smalling-3922654.html\">Chris Smalling</a>&nbsp;với ph&iacute; 3,2 triệu USD trong một năm. &quot;Kỳ chuyển nhượng h&egrave; 2019 chỉ c&ograve;n v&agrave;i ng&agrave;y. Cơ hội n&agrave;y thuộc về Smalling v&agrave; ch&uacute;ng t&ocirc;i đ&atilde; thảo luận rất kỹ về n&oacute;&quot;, Ole Gunnar Solskjaer n&oacute;i c&ugrave;ng ng&agrave;y, trong buổi họp b&aacute;o trước trận gặp Southampton ở v&ograve;ng bốn Ngoại hạng Anh.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Smalling ra mắt AS Roma tối 30/8. Ảnh: Reuters.\" src=\"https://i-thethao.vnecdn.net/2019/08/31/0-smallingJPG-3583-1567214053.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Smalling ra mắt AS Roma tối 30/8. Ảnh:&nbsp;<em>Reuters.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Sau khi chi&ecirc;u mộ Harry Maguire, Man Utd khủng hoảng thừa trung vệ. &quot;Quỷ Đỏ&quot; c&oacute; bảy người c&oacute; thể chơi vị tr&iacute; n&agrave;y, gồm Maguire, Smalling, Victor Lindelof, Phil Jones, Marcos Rojo, Eric Bailly v&agrave; Axel Tuanzebe. Trong số n&agrave;y, Bailly chấn thương, c&ograve;n Maguire, Lindelof, Tuanzebe được Solskjaer ưu ti&ecirc;n. Những người c&ograve;n lại sẽ được thanh l&yacute; từ giờ đến cuối kỳ chuyển nhượng.</p>\r\n\r\n<p>&quot;Ch&uacute;ng t&ocirc;i c&oacute; qu&aacute; nhiều trung vệ v&agrave; t&ocirc;i kh&ocirc;ng thể đảm bảo suất đ&aacute; ch&iacute;nh cho Smalling. Cậu ấy đ&atilde; l&ecirc;n đường sang Roma. Đ&oacute; l&agrave; một CLB tốt, ở một giải đấu tốt. Kh&ocirc;ng nhiều cầu thủ Anh c&oacute; cơ hội chơi b&oacute;ng ở Italy, v&agrave; t&ocirc;i chắc rằng cậu ấy sẽ trở lại mạnh mẽ hơn. Hy vọng Smalling th&iacute;ch trải nghiệm n&agrave;y&quot;, Solskjaer n&oacute;i th&ecirc;m.</p>\r\n\r\n<p>Trước Smalling, Man Utd cũng chia tay&nbsp;<a href=\"https://vnexpress.net/bong-da/sanchez-ra-mat-inter-3975038.html\">Alexis Sanchez</a>. Cựu cầu thủ Arsenal được cho mượn sang Inter Milan. B&ecirc;n cạnh đ&oacute;, đội b&oacute;ng &aacute;o đỏ cũng rục rịch chia tay&nbsp;<a href=\"https://vnexpress.net/bong-da/man-utd-hoan-tat-vu-chuyen-nhuong-darmian-3247233.html\">Matteo Darmian</a>. Hậu vệ người Italy đ&atilde; về nước để ho&agrave;n tất hợp đồng trị gi&aacute; 1,7 triệu USD với Parma.</p>\r\n\r\n<p>Trong h&egrave; 2019, Man Utd b&aacute;n v&agrave; cho mượn năm cầu thủ, l&agrave; Romelu Lukaku, Sanchez, Smalling, Darmian v&agrave; Joel Pereira. Họ cũng để ba người ra đi dưới dạng tự do l&agrave; Antonio Valencia, James Wilson v&agrave;&nbsp;<a href=\"https://vnexpress.net/bong-da/herrera-ky-hop-dong-nam-nam-voi-psg-3948210.html\">Ander Herrera</a>. D&ugrave; vậy, đội một của họ vẫn c&ograve;n 26 cầu thủ.</p>\r\n', '', 2, '2019-08-31 12:59:58', 0, 'Man Utd chia tay Smalling và Darmian', '', '', 1),
(26, 5, 27, '1567232775-img23.jpg', 'Chuyên gia Mỹ: Phạm vi quan ngại về Biển Đông đang mở rộng', 'Chuyen-gia-My-Pham-vi-quan-ngai-ve-Bien-Dong-dang-mo-rong', 'Nhiều nước trên thế giới lên tiếng về tình hình Biển Đông, cho thấy phạm vi quan ngại đã được mở rộng, theo giới chuyên gia.', '<p>&quot;C&aacute;c nước ch&acirc;u &Acirc;u v&agrave; Ấn Độ cho thấy họ đang quan ngại về t&igrave;nh h&igrave;nh Biển Đ&ocirc;ng. Phạm vi lo ngại tr&ecirc;n thế giới về diễn biến ở đ&acirc;y đang mở rộng&quot;, Jeffrey Ordaniel, chuy&ecirc;n gia của Diễn đ&agrave;n Th&aacute;i B&igrave;nh Dương, nghi&ecirc;n cứu về khu vực Ấn Độ - Th&aacute;i B&igrave;nh Dương tại Honolulu, Mỹ, n&oacute;i với&nbsp;<em>VnExpress</em>.</p>\r\n\r\n<p>Ordaniel nhắc đến việc&nbsp;Anh, Ph&aacute;p, Đức&nbsp;<a href=\"https://vnexpress.net/the-gioi/nhieu-nuoc-lo-ngai-tinh-hinh-bien-dong-3975040.html\">ra tuy&ecirc;n bố chung</a>&nbsp;h&ocirc;m 29/8, nhấn mạnh cần thực thi C&ocirc;ng ước Li&ecirc;n Hợp Quốc về Luật biển (UNCLOS) năm 1982, nhằm tạo khu&ocirc;n khổ ph&aacute;p l&yacute; to&agrave;n diện cho hoạt động ở c&aacute;c v&ugrave;ng biển, trong đ&oacute; c&oacute; Biển Đ&ocirc;ng. Tuy&ecirc;n bố cũng nhắc đến ph&aacute;n quyết của T&ograve;a Trọng t&agrave;i về Biển Đ&ocirc;ng dựa theo UNCLOS năm 2016.&nbsp;C&ugrave;ng ng&agrave;y Ấn Độ phản đối đe dọa hoặc d&ugrave;ng vũ lực ở khu vực. Trước đ&oacute;, Mỹ, Nhật, Australia cũng b&agrave;y tỏ quan ngại đối với t&igrave;nh h&igrave;nh Biển Đ&ocirc;ng, trong bối cảnh Trung Quốc điều t&agrave;u khảo s&aacute;t Địa chất Hải Dương 8 x&acirc;m phạm v&ugrave;ng biển Việt Nam.</p>\r\n\r\n<p><strong>Tuy nhi&ecirc;n, Ordaniel cho rằng c&aacute;c nước vẫn tỏ ra thận trọng,&nbsp;</strong>kh&ocirc;ng n&ecirc;u đ&iacute;ch danh Trung Quốc do c&acirc;n nhắc tới mối quan hệ với Bắc Kinh.</p>\r\n\r\n<p>&quot;Ba nước ch&acirc;u &Acirc;u v&agrave; Ấn Độ đều k&ecirc;u gọi tất cả c&aacute;c b&ecirc;n tu&acirc;n theo luật quốc tế v&agrave; giải quyết tranh chấp một c&aacute;ch h&ograve;a b&igrave;nh&quot;,&nbsp;Ordaniel n&oacute;i.</p>\r\n\r\n<p>Theo Tiến sĩ Collin Koh Swee Lean, chuy&ecirc;n gia tại Trường nghi&ecirc;n cứu quốc tế S. Rajaratnam, Singapore (RSIS), c&aacute;c tuy&ecirc;n bố của ba nước ch&acirc;u &Acirc;u v&agrave; Ấn Độ mang t&iacute;nh &quot;nhắc nhở chung chung với tất cả c&aacute;c b&ecirc;n&quot; về c&aacute;c nguy&ecirc;n tắc.&nbsp;</p>\r\n\r\n<p>&quot;Tuy&ecirc;n bố của c&aacute;c nước khiến Bắc Kinh cảm thấy phiền to&aacute;i nhưng sẽ kh&oacute; thay đổi c&aacute;ch h&agrave;nh xử&quot;, Collin nhận x&eacute;t. &Ocirc;ng l&yacute; giải Trung Quốc dường như quan t&acirc;m đến dư luận trong nước nhiều hơn l&agrave; quốc tế.</p>\r\n\r\n<p>Carl Schuster, nh&agrave; nghi&ecirc;n cứu tại Đại học Th&aacute;i B&igrave;nh Dương&nbsp;Hawaii, Mỹ cũng lưu &yacute; c&aacute;c tuy&ecirc;n bố của Anh, Ph&aacute;p, Đức thể hiện sự quan ngại về căng thẳng, nhưng kh&ocirc;ng nhắc đến h&agrave;nh động phi ph&aacute;p n&agrave;o của Trung Quốc.&nbsp;</p>\r\n\r\n<p>N&oacute; cho thấy c&aacute;c nước đ&atilde; &quot;c&acirc;n nhắc kỹ&quot;, Mark Hoskin, chuy&ecirc;n gia tại Đại học London, Anh, nhận định.</p>\r\n\r\n<p>&Ocirc;ng ủng hộ đoạn cuối của Tuy&ecirc;n bố của ba nước ch&acirc;u &Acirc;u, khi hoan ngh&ecirc;nh đ&agrave;m ph&aacute;n COC giữa ASEAN v&agrave; Trung Quốc nhằm hướng tới văn bản dựa tr&ecirc;n luật lệ, hiệu quả v&agrave; tu&acirc;n theo UNCLOS. Hoskin đ&aacute;nh gi&aacute;&nbsp;COC l&agrave; cơ chế tốt,&nbsp;gi&uacute;p đưa ra một giải ph&aacute;p ngoại giao cho tranh chấp ở Biển Đ&ocirc;ng.</p>\r\n\r\n<p>COC l&agrave; t&agrave;i liệu m&agrave; Trung Quốc v&agrave; ASEAN thảo luận từ năm 2002 khi căng thẳng trong tranh chấp ở Biển Đ&ocirc;ng gia tăng.&nbsp;Dự thảo văn bản đơn nhất COC được đưa ra từ th&aacute;ng 8 năm ngo&aacute;i. H&ocirc;m 2/8, một quan chức Th&aacute;i Lan cho biết&nbsp;<a href=\"https://vnexpress.net/the-gioi/asean-va-trung-quoc-se-thao-luan-du-thao-coc-vao-thang-10-3962038.html\">bản dự thảo COC thứ hai sẽ được thảo luận</a>&nbsp;trong th&aacute;ng 10/2019. Dự kiến&nbsp;ASEAN v&agrave; Trung Quốc sẽ đi s&acirc;u v&agrave;o c&aacute;c chi tiết cụ thể của văn kiện.&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Tàu Hải Dương 8 của Trung Quốc. Ảnh: Bloomberg.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/30/5563162b-5640-1567164791.png\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>T&agrave;u Hải Dương 8 của Trung Quốc. Ảnh:&nbsp;<em>Bloomberg.</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><strong>Đ&aacute;nh gi&aacute; về việc c&aacute;c t&agrave;u của Trung Quốc x&acirc;m phạm&nbsp;</strong><strong>v&ugrave;ng biển Việt Nam gần hai th&aacute;ng qua</strong>,&nbsp;Ordaniel cho rằng đ&acirc;y l&agrave; một nỗ lực của Bắc Kinh nhằm tạo n&ecirc;n thực tế mới ở Biển Đ&ocirc;ng, biến v&ugrave;ng kh&ocirc;ng c&oacute; tranh chấp th&agrave;nh c&oacute; tranh chấp.&nbsp;C&aacute;c t&agrave;u của Trung Quốc vi phạm Tuy&ecirc;n bố của c&aacute;c b&ecirc;n ở Biển Đ&ocirc;ng (DOC) giữa nước n&agrave;y v&agrave; ASEAN, vi phạm C&ocirc;ng ước luật biển năm 1982 của Li&ecirc;n Hợp Quốc (UNCLOS).&nbsp;</p>\r\n\r\n<p>&quot;Đ&aacute;ng tiếc l&agrave; Trung Quốc kh&ocirc;ng thể hiện bất cứ thiện ch&iacute; n&agrave;o về việc điều chỉnh quan điểm của m&igrave;nh&quot;, Ordaniel n&oacute;i.</p>\r\n\r\n<p>Chuy&ecirc;n gia CSIS nhấn mạnh việc Trung Quốc điều t&agrave;u khảo s&aacute;t Hải Dương 8 v&agrave; t&agrave;u hộ tống đến v&ugrave;ng đặc quyền kinh tế v&agrave; thềm lục địa của Việt Nam thể hiện sự thiếu thiện ch&iacute; của Bắc Kinh trong việc theo đuổi một bộ Quy tắc ứng xử c&oacute; &yacute; nghĩa.&nbsp;H&agrave;nh động của Trung Quốc ở v&ugrave;ng biển của Việt Nam cho thấy H&agrave; Nội v&agrave; c&aacute;c b&ecirc;n c&ugrave;ng c&oacute; tranh chấp c&oacute; th&ecirc;m l&yacute; do để bảo đảm COC n&ecirc;n x&aacute;c định r&otilde; phạm vi c&aacute;c hoạt động v&agrave; khu vực địa l&yacute; li&ecirc;n quan đến c&aacute;ch h&agrave;nh xử ở Biển Đ&ocirc;ng. COC c&agrave;ng bớt mơ hồ c&agrave;ng tốt.&nbsp;</p>\r\n\r\n<p>&quot;Tuy nhi&ecirc;n, với một COC r&otilde; r&agrave;ng như thế, c&oacute; lẽ c&aacute;c nước kh&ocirc;ng n&ecirc;n tr&ocirc;ng đợi n&oacute; sẽ sớm trở th&agrave;nh hiện thực&quot;. Ordaniel n&oacute;i.</p>\r\n\r\n<p>Robert McCoy, người từng l&agrave;m việc trong Kh&ocirc;ng lực Mỹ v&agrave; theo d&otilde;i s&aacute;t t&igrave;nh h&igrave;nh ở ch&acirc;u &Aacute;, khẳng định ph&aacute;n quyết của T&ograve;a trọng t&agrave;i quốc tế đưa ra năm 2016 l&agrave;&nbsp;một căn cứ ph&aacute;p l&yacute; kh&aacute;c để x&aacute;c định quyền của c&aacute;c nước ở Biển Đ&ocirc;ng. Theo đ&oacute;, T&ograve;a b&aacute;c bỏ y&ecirc;u s&aacute;ch muốn chiếm gần trọn Biển Đ&ocirc;ng của Bắc Kinh. McCoy cho rằng Trung Quốc sẽ tiếp tục &quot;l&agrave;m điều m&igrave;nh muốn ở Biển Đ&ocirc;ng&quot;, bất chấp đ&oacute; l&agrave; v&ugrave;ng đặc quyền kinh tế hay v&ugrave;ng biển của Việt Nam.&nbsp;</p>\r\n\r\n<p>&quot;R&otilde; r&agrave;ng l&agrave; Trung Quốc kh&ocirc;ng c&oacute; &yacute; định tu&acirc;n theo ph&aacute;n quyết năm 2016&quot;, McCoy n&oacute;i.</p>\r\n\r\n<p>Gi&aacute;o sư Robert Ross, Đại học Harvard, Mỹ, dự đo&aacute;n Trung Quốc&nbsp;sẽ tiếp tục g&acirc;y &aacute;p lực với c&aacute;c nước ven Biển Đ&ocirc;ng do năng lực tr&ecirc;n biển của Bắc Kinh đang gia tăng.&nbsp;&quot;Chưa r&otilde; diễn biến sắp tới thế n&agrave;o nhưng &iacute;t khả năng Trung Quốc sẽ thỏa hiệp&quot;, Ross n&oacute;i.</p>\r\n\r\n<p>Collin cảnh b&aacute;o nếu kh&ocirc;ng c&oacute; biện ph&aacute;p khiến Trung Quốc r&uacute;t t&agrave;u khỏi v&ugrave;ng biển của Việt Nam, Bắc Kinh sẽ tiếp tục tin rằng sự &eacute;p buộc của m&igrave;nh l&agrave; c&oacute; t&aacute;c dụng.</p>\r\n\r\n<p>&quot;Khi đ&oacute;, Trung Quốc sẽ &aacute;p dụng c&aacute;c h&agrave;nh động như vậy đối với c&aacute;c b&ecirc;n c&ugrave;ng c&oacute; tranh chấp c&ograve;n lại, nhằm khiến họ chấp thuận tham vọng của Bắc Kinh&quot;, Collin n&oacute;i.</p>\r\n\r\n<p>Schuster nhận định nếu Việt Nam tho&aacute;i lui, Trung Quốc sẽ tiếp tục x&acirc;m phạm lợi &iacute;ch của Việt Nam. H&agrave; Nội cũng kh&ocirc;ng phải &quot;nạn nh&acirc;n&quot; duy nhất, c&aacute;c nước kh&aacute;c c&ugrave;ng c&oacute; tranh chấp với Bắc Kinh sẽ gặp phải t&igrave;nh huống n&agrave;y.&nbsp;</p>\r\n\r\n<p>Chuy&ecirc;n gia Ordaniel gợi &yacute; c&aacute;ch tốt nhất để c&aacute;c nước li&ecirc;n quan trong khu vực c&oacute; thể l&agrave;m l&agrave; ngăn chặn Trung Quốc c&oacute; h&agrave;nh động qu&aacute; mức.&nbsp;</p>\r\n\r\n<p>&quot;Phản ứng mạnh mẽ của Việt Nam trước hoạt động của Trung Quốc ở Nam Biển Đ&ocirc;ng cho thấy H&agrave; Nội quyết t&acirc;m với định hướng đ&oacute;&quot;, Ordaniel n&oacute;i.</p>\r\n', '', 17, '2019-08-31 13:26:15', 1, '', '', '', 1),
(27, 3, 27, '1567232863-img24.jpg', 'Gần 4 triệu năm trước, mực nước biển cao hơn 16 m', 'Gan-4-trieu-nam-truoc-muc-nuoc-bien-cao-hon-16-m', 'Phát hiện mới về mực nước biển trong thế Thượng Thân có thể giúp các nhà khoa học dự đoán chính xác hơn biến đổi khí hậu trong tương lai.', '<p>&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Hang động Artà từng có thời gian dài ngập trong nước biển. Ảnh: UPI.\" src=\"https://i-vnexpress.vnecdn.net/2019/08/31/hang-dong-5041-1567226830.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Hang động Art&agrave; từng c&oacute; thời gian d&agrave;i ngập trong nước biển. Ảnh:&nbsp;<em>UPI</em>.</p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Một nh&oacute;m c&aacute;c nh&agrave; khoa học quốc tế đ&atilde; t&igrave;m thấy những mỏ đ&aacute; cổ xưa b&ecirc;n trong hang động Art&agrave;, nằm tr&ecirc;n h&ograve;n đảo Mallorca của T&acirc;y Ban Nha, cho thấy mực nước biển c&aacute;ch đ&acirc;y 3,5 - 4 triệu năm từng cao hơn 16 m so với ng&agrave;y nay,&nbsp;<em>UPI&nbsp;</em>30/8 đưa tin. V&agrave;o thời điểm đ&oacute;, nhiệt độ tr&ecirc;n Tr&aacute;i Đất n&oacute;ng hơn từ 2 đến 3 độ C.</p>\r\n\r\n<p>Nghi&ecirc;n cứu tập trung v&agrave;o sự h&igrave;nh th&agrave;nh của c&aacute;c lớp trầm t&iacute;ch b&ecirc;n hang động. C&aacute;c nh&agrave; khoa học đ&atilde; thu thập 70 mẫu kho&aacute;ng vật v&agrave; ph&acirc;n t&iacute;ch cẩn thận trong ph&ograve;ng th&iacute; nghiệm. Họ sử dụng phương ph&aacute;p đo đồng vị ph&oacute;ng xạ urani - ch&igrave; để x&aacute;c định nguồn gốc v&agrave; ni&ecirc;n đại của mẫu vật.</p>\r\n\r\n<p>Kết quả cho thấy c&aacute;c lớp trầm t&iacute;ch đ&atilde; c&oacute; từ thế Thượng T&acirc;n (thế thứ hai thuộc kỷ T&acirc;n Cận, trong đại T&acirc;n Sinh) v&agrave; được h&igrave;nh th&agrave;nh dưới sự t&aacute;c động của nước mặn v&agrave; kh&ocirc;ng kh&iacute; b&ecirc;n trong hang động. Điều n&agrave;y cho thấy hang Art&agrave;, ng&agrave;y nay nằm s&acirc;u trong đất liền hơn 100 m, từng c&oacute; thời gian d&agrave;i ngập trong nước biển, Gi&aacute;o sư Joan J. Forn&oacute;s từ Đại học Illes Balears giải th&iacute;ch.&nbsp;</p>\r\n\r\n<p>&quot;Mực nước biển thay đổi l&ecirc;n xuống trong hang Art&agrave; c&oacute; thể do sự ph&aacute;t triển v&agrave; tan chảy của c&aacute;c tảng băng, hoặc do qu&aacute; tr&igrave;nh n&acirc;ng cao v&agrave; sụt l&uacute;n của h&ograve;n đảo g&acirc;y ra&quot;, Gi&aacute;o sư Jacky Austermann từ Đại học Columbia, một th&agrave;nh vi&ecirc;n kh&aacute;c của nh&oacute;m nghi&ecirc;n cứu cho biết th&ecirc;m.&nbsp;Dựa tr&ecirc;n c&aacute;c m&ocirc; h&igrave;nh băng tan chảy, nh&oacute;m nghi&ecirc;n cứu cho rằng sự sụp đổ của hai dải băng lớn ở Greenland v&agrave; T&acirc;y Nam Cực l&agrave; nguy&ecirc;n nh&acirc;n ch&iacute;nh khiến mực nước biển d&acirc;ng cao trong những năm gần đ&acirc;y.</p>\r\n\r\n<p>Nghi&ecirc;n cứu c&oacute; sự tham gia của c&aacute;c nh&agrave; khoa học từ Đại học New Mexico, Đại học South Florida, Đại học Columbia của Mỹ v&agrave; Đại học Illes Balears của T&acirc;y Ban Nha.</p>\r\n', '', 4, '2019-08-31 13:27:43', 0, '', '', '', 1),
(29, 3, 27, '1567793902-img25.jpg', 'Lên phương án tiêu độc nhà kho Rạng Đông', 'Len-phuong-an-tieu-doc-nha-kho-Rang-Dong', '', '<p>H&Agrave; NỘIBinh chủng Ho&aacute; học đang kiểm tra mức độ nhiễm độc thuỷ ng&acirc;n c&aacute;c vật chất quanh nh&agrave; kho của Rạng Đ&ocirc;ng, l&agrave;m cơ sở x&acirc;y dựng phương &aacute;n ti&ecirc;u tẩy.</p>\r\n\r\n<p>Ng&agrave;y 6/9, Thượng t&aacute; Đậu Xu&acirc;n Ho&agrave;i, Ph&oacute; viện trưởng Viện Ho&aacute; học M&ocirc;i trường Qu&acirc;n sự (Binh chủng Ho&aacute; học) cho biết, đơn vị đang ph&acirc;n t&iacute;ch 25 mẫu&nbsp;đất, b&ugrave;n, tro xỉ, vữa tường... lấy từ đ&aacute;m ch&aacute;y ở C&ocirc;ng ty b&oacute;ng đ&egrave;n, ph&iacute;ch nước Rạng Đ&ocirc;ng v&agrave;o chiều qua.</p>\r\n\r\n<p>C&aacute;c&nbsp;c&aacute;n bộ của Viện l&agrave;m li&ecirc;n tục suốt đ&ecirc;m 5/9 để nhanh ch&oacute;ng đưa ra kết quả theo chỉ đạo&nbsp;của thủ trưởng Binh chủng.&nbsp;</p>\r\n\r\n<p>&quot;Quy tr&igrave;nh ph&acirc;n t&iacute;ch thuỷ ng&acirc;n tương đối phức tạp.&nbsp;Lấy mẫu về ch&uacute;ng t&ocirc;i phải ng&acirc;m trong axit 16 tiếng, đun hồi lưu khoảng 2 tiếng... sau đ&oacute; mới đưa mẫu v&agrave;o chạy m&aacute;y. Mỗi mẫu phải l&agrave;m 3 lần để đối chứng v&agrave; lấy số liệu trung b&igrave;nh, kiểm tra lại bằng nhiều phương ph&aacute;p kh&aacute;c nhau&quot;, thượng t&aacute; Ho&agrave;i n&oacute;i v&agrave; cho biết, dự kiến một hai ng&agrave;y tới sẽ c&oacute; kết quả sơ bộ.&nbsp;</p>\r\n\r\n<p>Dựa tr&ecirc;n kết quả ph&acirc;n t&iacute;ch, Viện&nbsp;sẽ x&acirc;y dựng phương &aacute;n ti&ecirc;u độc,&nbsp;thu gom xử l&yacute; c&aacute;c vật tư, ho&aacute; chất ở&nbsp;khu vực bị ch&aacute;y của nh&agrave; m&aacute;y Rạng Đ&ocirc;ng.&nbsp;</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Các cán bộ của Viện Hóa học môi trường quân sự (Binh chủng Hoá học) lấy mẫu tại khu vực cháy kho Nhà máy Rạng Đông về phân tích chỉ số ô nhiễm.\" src=\"https://i-vnexpress.vnecdn.net/2019/09/06/IMG-8445-JPG-2543-1567767305.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>C&aacute;c c&aacute;n bộ của Viện H&oacute;a học m&ocirc;i trường qu&acirc;n sự (Binh chủng Ho&aacute; học) lấy mẫu tại khu vực ch&aacute;y kho Nh&agrave; m&aacute;y Rạng Đ&ocirc;ng về ph&acirc;n t&iacute;ch chỉ số &ocirc; nhiễm. Ảnh:<em>&nbsp;CTV</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Giải th&iacute;ch nguy&ecirc;n nh&acirc;n Viện tiến h&agrave;nh ph&acirc;n t&iacute;ch c&aacute;c mẫu vật lấy từ đ&aacute;m ch&aacute;y sau khi Bộ T&agrave;i nguy&ecirc;n M&ocirc;i trường đ&atilde; c&ocirc;ng bố kết quả quan trắc, &ocirc;ng Ho&agrave;i n&oacute;i, cơ quan quản l&yacute; nh&agrave; nước mới&nbsp;c&ocirc;ng bố một số kết quả quan trắc, như: Thuỷ ng&acirc;n trong kh&ocirc;ng kh&iacute;, nước, đất..., từ đ&oacute; đ&aacute;nh gi&aacute; mức độ ảnh hưởng đến người d&acirc;n. Kế thừa kết quả quan trắc n&agrave;y, Viện lấy th&ecirc;m c&aacute;c mẫu tập trung v&agrave;o những khu vực m&agrave; sau n&agrave;y Binh chủng Ho&aacute; học phải xử l&yacute; ti&ecirc;u độc.&nbsp;</p>\r\n\r\n<p>&quot;Ch&uacute;ng t&ocirc;i cần biết tro xỉ ch&aacute;y vương v&atilde;i trong nh&agrave; xưởng, kho, vữa tường, b&ugrave;n đất ở cổng r&atilde;nh, ngo&agrave;i s&ocirc;ng T&ocirc; Lịch, rồi số lượng lớn b&oacute;ng đ&egrave;n đ&atilde; ch&aacute;y... c&oacute; mức độ &ocirc; nhiễm thế n&agrave;o, tồn lưu trong đất ra, khi đ&oacute; mới c&oacute; phương &aacute;n xử l&yacute; hiệu quả&quot;, &ocirc;ng Ho&agrave;i cho hay.</p>\r\n\r\n<p>Những vật chất n&agrave;o c&oacute; h&agrave;m lượng chất nguy hại nhiều, sẽ được Binh chủng Ho&aacute; học ti&ecirc;u độc, c&ograve;n ở ngưỡng cho ph&eacute;p th&igrave; vận chuyển v&agrave; thải như b&igrave;nh thường.</p>\r\n\r\n<table align=\"center\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\">\r\n	<tbody>\r\n		<tr>\r\n			<td><img alt=\"Nhân viên Viện Hoá học và Môi trường Quân sự làm việc cường độ cao để nhanh chóng có kết quả, để đưa ra phương án tiêu độc khu vực cháy nhà máy Rạng Đông. \" src=\"https://i-vnexpress.vnecdn.net/2019/09/06/2019-0907-07042000-2466-1567775060.jpg\" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n			<p>Nh&acirc;n vi&ecirc;n Viện Ho&aacute; học v&agrave; M&ocirc;i trường Qu&acirc;n sự l&agrave;m việc cường độ cao để nhanh ch&oacute;ng c&oacute; kết quả, để đưa ra phương &aacute;n ti&ecirc;u độc khu vực ch&aacute;y nh&agrave; m&aacute;y Rạng Đ&ocirc;ng. Ảnh:&nbsp;<em>CTV</em></p>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>Trước đ&oacute; tại cuộc họp b&aacute;o chiều 4/9, Thứ trưởng T&agrave;i nguy&ecirc;n M&ocirc;i trường V&otilde; Tuấn Nh&acirc;n cho biết Bộ T&agrave;i nguy&ecirc;n M&ocirc;i trường đ&atilde; kiến nghị H&agrave; Nội phối hợp Bộ tư lệnh ho&aacute; học (Bộ Quốc ph&ograve;ng) tẩy độc khu vực ch&aacute;y; tiếp tục thống k&ecirc; ch&iacute;nh x&aacute;c h&agrave;ng ho&aacute; nguy&ecirc;n vật liệu đang sử dụng bị ch&aacute;y, đặc biệt l&agrave; lượng thuỷ ng&acirc;n lỏng để b&aacute;o c&aacute;o cho cơ quan chức năng.</p>\r\n', '', 0, '2019-09-07 01:18:22', 0, '', '', '', 0),
(31, 3, 27, '', '', '', '', '', 'hải, xin chào, hello', 0, '2019-09-13 12:43:32', 0, '', '', '', 0),
(37, 3, 27, '', '', '', '', '', 'Xin chào, một', 0, '2019-09-13 14:35:50', 0, '', '', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tintuc-tags`
--

CREATE TABLE `tintuc-tags` (
  `idtintuc` tinyint(11) NOT NULL,
  `idtags` tinyint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` tinyint(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `mail` varchar(225) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `adr` varchar(225) NOT NULL,
  `acc` varchar(225) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0:Đọc giả, 1:Admin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `mail`, `phone`, `adr`, `acc`, `pass`, `status`) VALUES
(27, 'Nguyễn Văn Hải', 'hai@mail', '0867832034', '376/11 Chu Văn An B.Thạnh TP.HCM', 'hai', '123', 1),
(28, 'Nguyen Van Tuan', 'tuan@gmail.com', '', '', 'tuan123', '123', 1),
(29, 'Nguyen Quoc Huy', 'huy@gmail.com', '', '', 'huy123', '123', 1),
(30, 'Nguyễn Văn A', 'vana@mail', '', '', 'vana', '123', 0),
(31, 'aaaa', 'aaaaaaa', '', '', 'aaaa', 'a', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cauhinh`
--
ALTER TABLE `cauhinh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cmtt` (`idtintuc`),
  ADD KEY `cmus` (`iduser`);

--
-- Indexes for table `saved`
--
ALTER TABLE `saved`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stt` (`idtintuc`),
  ADD KEY `sus` (`iduser`);

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
  ADD KEY `tttl` (`idtype`),
  ADD KEY `ttu` (`iduser`);

--
-- Indexes for table `tintuc-tags`
--
ALTER TABLE `tintuc-tags`
  ADD KEY `tintuc` (`idtintuc`),
  ADD KEY `tags` (`idtags`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cauhinh`
--
ALTER TABLE `cauhinh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `saved`
--
ALTER TABLE `saved`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theloai`
--
ALTER TABLE `theloai`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tintuc`
--
ALTER TABLE `tintuc`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` tinyint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `cmtt` FOREIGN KEY (`idtintuc`) REFERENCES `tintuc` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cmus` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `saved`
--
ALTER TABLE `saved`
  ADD CONSTRAINT `stt` FOREIGN KEY (`idtintuc`) REFERENCES `tintuc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sus` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tintuc`
--
ALTER TABLE `tintuc`
  ADD CONSTRAINT `tttl` FOREIGN KEY (`idtype`) REFERENCES `theloai` (`id`),
  ADD CONSTRAINT `ttu` FOREIGN KEY (`iduser`) REFERENCES `user` (`id`);

--
-- Constraints for table `tintuc-tags`
--
ALTER TABLE `tintuc-tags`
  ADD CONSTRAINT `tags` FOREIGN KEY (`idtags`) REFERENCES `tags` (`id`),
  ADD CONSTRAINT `tintuc` FOREIGN KEY (`idtintuc`) REFERENCES `tintuc` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
