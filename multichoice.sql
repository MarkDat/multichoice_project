-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2021 at 02:52 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `multichoice`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getListExamsByIdGrade` (IN `id` INT)  BEGIN
   SELECT e.idexam,s.idsubject,g.idgrade,e.createddate,e.modifieddate,e.titleexam ,s.namesubject,g.namegrade FROM exam e, grade g, subject s,sub_g_s sgs WHERE g.idgrade=sgs.idgrade AND s.idsubject=sgs.idsubject AND e.idsubject = s.idsubject AND g.idgrade = id Group BY e.idexam ORDER BY e.modifieddate DESC;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListExamsByIdSubject` (IN `id` INT)  BEGIN
    	SELECT e.idexam,s.idsubject,g.idgrade,e.createddate,e.modifieddate,e.titleexam ,s.namesubject,g.namegrade 
	FROM exam e, grade g, subject s,sub_g_s sgs 
	WHERE g.idgrade=sgs.idgrade AND s.idsubject=sgs.idsubject AND e.idsubject = s.idsubject and s.idsubject = id
	Group BY e.idexam ORDER BY e.modifieddate DESC;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getListSubjectsByIdGrade` (IN `id` INT)  BEGIN
   	SELECT s.* FROM `subject` s,`grade` g, sub_g_s gs WHERE s.idsubject=gs.idsubject and g.idgrade=gs.idgrade and g.idgrade = id;
  END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `lexam` ()  BEGIN
	SELECT *  FROM exam;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `idexam` bigint(20) NOT NULL,
  `idsubject` bigint(20) DEFAULT NULL,
  `createddate` date DEFAULT NULL,
  `modifieddate` date DEFAULT NULL,
  `titleexam` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`idexam`, `idsubject`, `createddate`, `modifieddate`, `titleexam`) VALUES
(1, 1, '2021-03-03', '2021-03-03', 'De thi 1'),
(2, 1, '2021-03-03', '2021-03-03', 'THPT Lý'),
(3, 1, '2021-03-03', '2021-03-03', 'THPT Hoá'),
(4, 2, '2021-03-03', '2021-03-03', 'THPT Toán'),
(5, 2, '2021-03-03', '2021-03-03', 'THPT Lý'),
(6, 2, '2021-03-03', '2021-03-03', 'THPT Tiếng Anh'),
(7, 3, '2021-03-03', '2021-03-03', 'THPT Toán'),
(8, 3, '2021-03-03', '2021-03-03', 'THPT Hoá'),
(9, 3, '2021-03-03', '2021-03-03', 'THPT Sinh'),
(10, 4, '2021-03-03', '2021-03-03', 'THPT Ngữ Văn'),
(11, 4, '2021-03-03', '2021-03-03', 'THPT Lịch Sử'),
(12, 4, '2021-03-03', '2021-03-03', 'THPT Địa Lý'),
(13, 5, '2021-03-03', '2021-03-03', 'THPT Toán'),
(14, 5, '2021-03-03', '2021-03-03', 'THPT Ngữ Văn'),
(15, 5, '2021-03-03', '2021-03-05', 'THPT Tiếng Anh'),
(16, 3, '2021-03-07', '2021-03-07', 'Đề thi hóa phần hữu cơ');

-- --------------------------------------------------------

--
-- Table structure for table `grade`
--

CREATE TABLE `grade` (
  `idgrade` bigint(20) NOT NULL,
  `namegrade` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `grade`
--

INSERT INTO `grade` (`idgrade`, `namegrade`) VALUES
(1, 'Khối A'),
(2, 'Khối A1'),
(3, 'Khối B'),
(4, 'Khối C'),
(5, 'Khối D'),
(6, 'Khối D1');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `idq` bigint(20) NOT NULL,
  `idexam` bigint(20) DEFAULT NULL,
  `createddate` date DEFAULT NULL,
  `modifieddate` date DEFAULT NULL,
  `content` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `img` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `rsa` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `rsb` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `rsc` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `rsd` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `rs` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`idq`, `idexam`, `createddate`, `modifieddate`, `content`, `img`, `rsa`, `rsb`, `rsc`, `rsd`, `rs`) VALUES
(1, 1, '2021-03-03', '2021-03-03', 'Trong mặt phẳng phức, cho số phức. Điểm biểu diễn cho số phức là điểm nào sau đây?', '', 'N(3;-1).', 'M(-1;-2).', 'P(-1;3).', 'Q(1;2).', 'N(3;-1).'),
(2, 1, '2021-03-03', '2021-03-03', 'Trong mặt phẳng cho một tập hợp gồm 6 điểm phân biệt. Có bao nhiêu vectơ khác vectơ có điểm đầu và điểm cuối thuộc tập hợp này ?', '', '6C2', '6', '6A2', '24', '6A2'),
(3, 1, '2021-01-01', '2021-01-01', 'Cho số phức. Phần ảo của số phức bằng', '', '6', '5', '3', '2', '5'),
(4, 1, '2021-01-01', '2021-01-01', 'Trong không gian, cho hình chóp có đáy là hình vuông và vuông góc với đáy. Cho biết. Phương trình mặt phẳng là', '', 'x+y-2z+9=0', 'x-y-2z-9=0', 'x-y-2z+9=0', 'x-y+2z+9=0', 'x-y-2z+9=0'),
(5, 1, '2021-01-01', '2021-01-01', 'Cho một đa giác đều có 18  đỉnh nội tiếp trong một đường tròn tâm. Gọi là tập hợp các tam giác có các đỉnh là các đỉnh của  đa giác đều trên. Tính xác suất   để chọn được một tam giác từ tập là tam giác cân nhưng không phải tam giác đều.', '', '144/136', '7/816', '23/136', '21/136', '23/136'),
(6, 2, '2021-01-01', '2021-01-01', 'Trên trục x có hai vật tham gia hai dao động điều hoà cùng tần số với các li độ x1 và x2 có đồ thị biến thiên theo thời gian như hình vẽ C. Vận tốc tương đối giữa hai vật có giá trị cực đại gần nhất với các giá trị nào sau đây?', '12_vatly_1.png', '39 cm/s', '22 cm/s', '38 cm/s', '23 cm/s', '22 cm/s'),
(7, 2, '2021-01-01', '2021-01-01', 'Điểm sáng A đặt trên trục chính của một thấu kính, cách thấu kính 30 cm, Chọn trục tọa độ Ox vuông góc với trục chính của thấu kính, gốc O nằm trên trục chính của thấu kính. Cho A dao động điều hòa quanh vị trí cân bằng O theo phương của trục Ox. Biết phương trình dao động của A và ảnh A của nó qua thấu kính có đồ thị được biểu diễn như hình vẽ bên. Khoảng cách lớn nhất giữa vật sáng và ảnh của nó khi điểm sáng A dao động có giá trị gần với', '12_vatly_3.png', '25,7 cm', '25 cm', '31,6 cm', '41,2 cm', '25 cm'),
(8, 2, '2021-01-01', '2021-01-01', 'Một con lắc lò xo đang dao động điều hòa. Hình bên là đồ thị biểu diễn sự phụ thuộc của động năng Wđ của con lắc theo thời gian t. Hiệu t2 – t1 có giá trị gần nhất với giá trị nào sau đây?', '12_vatly_2.png', '0,27 s', '0,24 s', '0,22 s', '0,20 s', '0,27 s'),
(9, 2, '2021-01-01', '2021-01-01', 'Một vật nặng có khối lượng m = 0,01 kg dao động điều hòa quanh vị trí cân bằng. Đồ thị hình bên mô tả lực kéo về F tác dụng lên vật theo li độ x. Chu kì dao động của vật là', '12_vatly_5.png', '0,152 s', '0,314 s', '0,256 s', '1,265 s', '0,265 s'),
(10, 2, '2021-01-01', '2021-01-01', 'Một con lắc lò xo đang dao động điều hòa, lực đàn hồi\r\ncủa lò xo phụ thuộc vào chiều dài của lò xo như đồ thị hình vẽ.\r\nCho g = 10 m/s2. Biên độ và chu kì dao động của con lắc là\r\n', '12_vatly_6.png', 'A =8 cm; T = 0,56 s', 'A = 6 cm; T = 0,28 s', 'A = 6 cm; T = 0,56s', 'A = 4 cm; T = 0,28 s', 'A = 4 cm; T = 0,28 s'),
(11, 2, '2021-01-01', '2021-01-01', 'Hai chất điểm có khối lượng lần lượt là m1, m2 dao động điều hòa cùng phương cùng tần số.\r\nĐồ thị biểu diễn động năng của m1 và thế năng của m2 theo li độ như hình vẽ. Tỉ số m2/ m1  là:\r\n', '12_vatly_7.png', '2/3', '9/4', '4/9', '3/2', '4/9'),
(12, 2, '2021-01-01', '2021-01-01', 'Động năng và thế năng của một vật dao động\r\nđiều hòa phụ thuộc vào li độ theo đồ thi như hình vẽ. Biên độ dao\r\nđộng của vật là:\r\n', '12_vatly_8.png', '6 cm', '7 cm', '5 cm', '6,5 cm', '5 cm'),
(13, 2, '2021-01-01', '2021-01-01', 'Một con lắc lò xo treo vào môṭ điểm cố định ở nơi có gia tốc trong̣ trường g = π2 (m/s2). Cho con lắc dao động điều hoà theo phương thẳng đứng . Hình bên là đồ thị biểu diễn sự phụ thuộc của thế năng đàn hồi Wđh của lò xo vào thời gian t. Khối lượng của con lắc gần giá trị nào sau đây?', '12_vatly_9.png', '0,35kg', '0,65kg', '0,45kg', '0,55kg', '0,45kg'),
(14, 2, '2021-01-01', '2021-01-01', 'Hai chất điểm (1) và (2) có cùng khối lượng, dao động điều hòa trên hai đường thẳng song song, có vị trí cân bằng cùng thuộc một đường thẳng vuông góc với quỹ đạo. Đồ thị sự phụ thuộc của li độ vào  thời gian của hai chất điểm như hình bên. Tại thời điểm hai chất điểm có cùng li độ lần thứ hai kể từ lúc ban đầu t = 0, tỉ số động năng của hai chất điểm Wd1/Wd2 bằng:', '12_vatly_10.png', '1', '2', '3', '4', '1'),
(15, 2, '2021-01-01', '2021-01-01', 'Một con lắc lò xo đang dao động điều hòa. Hình bên là đồ thị biểu diễn sự phụ thuộc của động năng Wđ của con lắc theo thời gian t. Hiệu t2 – t1 có giá trị gần nhất với giá trị nào sau đây?', '12_vatly_4.png', 'qua vị trí cân bằng theo chiều âm.', 'qua vị trí cân bằng theo chiều dương.', 'ở biên âm', 'ở biên dương', 'qua vị trí cân bằng theo chiều dương.'),
(16, 3, '2021-01-01', '2021-01-01', 'Canxi cacbonat được dùng sản xuất vôi, thủy tinh, xi măng. Công thức của canxi cacbonat là', '', 'CaCO3', 'Ca(OH)2', 'CaO', 'CaCl2', 'CaCO3'),
(17, 3, '2021-01-01', '2021-01-01', 'Kim loại nào sau đây có tính khử mạnh nhất?', '', 'Mg', 'Cu', 'Al', 'Na', 'Na'),
(18, 3, '2021-01-01', '2021-01-01', 'Chất X có công thức Fe(NO3)3. Tên gọi của X là', '', 'sắt (II) nitrit', 'sắt (III) nitrat', 'sắt (II) nitrat', 'sắt (III) nitrit', 'sắt (III) nitrat'),
(19, 3, '2021-01-01', '2021-01-01', 'Dung dịch nào sau đây làm quỳ tím chuyển sang màu xanh?', '', 'etylamin', 'glyxin', 'axit glutamic', 'alanin', 'etylamin'),
(20, 3, '2021-01-01', '2021-01-01', 'Sắt có số oxi hóa +3 trong hợp chất nào sau đây?', '', 'Fe(OH)3', 'FeO', 'Fe(OH)2', 'FeSO4', 'Fe(OH)3'),
(21, 3, '2021-01-01', '2021-01-01', ' Dung dịch nào sau đây có pH > 7?', '', 'HCL', 'NaCl', 'Ca(OH)2', 'H2SO4', 'Ca(OH)2'),
(22, 3, '2021-01-01', '2021-01-01', 'Kim loại nào sau đây điều chế được bằng phương pháp thủy luyện?', '', 'Ba', 'Ag', 'Na', 'K', 'Ag'),
(23, 3, '2021-01-01', '2021-01-01', 'Kim loại nào sau đây tác dụng với dung dịch H2SO4 loãng sinh ra khí H2?', '', 'Ca(OH)2', 'Mg(OH)2', 'Mg', 'BaO', 'Mg'),
(24, 3, '2021-01-01', '2021-01-01', 'Chất nào sau đây được dùng để làm mềm nước cứng có tính cứng vĩnh cửu?', '', 'HNO3', 'KCL', 'NaNO3', 'Na2CO3', 'Na2CO3'),
(25, 3, '2021-01-01', '2021-01-01', 'Số nguyên tử cacbon trong phân tử fructozơ là', '', '22', '6', '12', '11', '6'),
(33, 1, '2021-03-07', '2021-03-07', 'Câu này dùng để test đó nghe, bạn có ăng kuc k ?', '', 'Có aaa', 'Chán ác', 'Méokk', 'Yesnt\'s', 'Kó');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `iduser` bigint(20) DEFAULT NULL,
  `idexam` bigint(20) DEFAULT NULL,
  `createddate` date DEFAULT NULL,
  `modifieddate` date DEFAULT NULL,
  `testday` date DEFAULT NULL,
  `mark` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`iduser`, `idexam`, `createddate`, `modifieddate`, `testday`, `mark`) VALUES
(1, 1, '2021-03-03', '2021-03-03', '2021-03-03', 5),
(2, 2, '2021-03-03', '2021-03-03', '2021-03-03', 4.5);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `idrole` bigint(20) NOT NULL,
  `rolename` varchar(225) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`idrole`, `rolename`, `code`) VALUES
(1, 'Admin', 'ADMIN'),
(2, 'User', 'USER');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `idsubject` bigint(20) NOT NULL,
  `namesubject` varchar(50) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `createddate` date DEFAULT NULL,
  `modifieddate` date DEFAULT NULL,
  `img` text COLLATE utf8mb4_vietnamese_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`idsubject`, `namesubject`, `createddate`, `modifieddate`, `img`) VALUES
(1, 'Toán', '2021-01-01', '2021-01-01', ''),
(2, 'Lý', '2021-01-01', '2021-01-01', ''),
(3, 'Hoá', '2021-01-01', '2021-01-01', ''),
(4, 'Sinh', '2021-01-01', '2021-01-01', ''),
(5, 'Ngữ Văn', '2021-02-02', '2021-02-02', ''),
(6, 'Địa', '2021-02-02', '2021-02-02', ''),
(7, 'Lịch Sử', '2021-02-02', '2021-02-02', ''),
(8, 'GDCD', '2021-02-02', '2021-02-02', ''),
(9, 'Tiếng Anh', '2021-03-01', '2021-03-01', ''),
(10, 'Tiếng Trung', '2021-03-01', '2021-03-01', ''),
(11, 'Tiếng Hàn', '2021-03-01', '2021-03-01', '');

-- --------------------------------------------------------

--
-- Table structure for table `sub_g_s`
--

CREATE TABLE `sub_g_s` (
  `idgrade` bigint(20) DEFAULT NULL,
  `idsubject` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `sub_g_s`
--

INSERT INTO `sub_g_s` (`idgrade`, `idsubject`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 9),
(3, 1),
(3, 3),
(3, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 1),
(5, 5),
(5, 9);

-- --------------------------------------------------------

--
-- Table structure for table `sub_rl_ud`
--

CREATE TABLE `sub_rl_ud` (
  `idrole` bigint(20) DEFAULT NULL,
  `iduser` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `sub_rl_ud`
--

INSERT INTO `sub_rl_ud` (`idrole`, `iduser`) VALUES
(1, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `iduser` bigint(20) NOT NULL,
  `fullname` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `email` varchar(55) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `createddate` date DEFAULT NULL,
  `modifieddate` date DEFAULT NULL,
  `username` varchar(25) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `pwd` varchar(16) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `status` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`iduser`, `fullname`, `email`, `address`, `phone`, `createddate`, `modifieddate`, `username`, `pwd`, `status`) VALUES
(1, 'Administrator', 'admin@gmail.com', 'DN', '123123123', '2021-03-03', '2021-03-03', 'admin', '123456', 0),
(2, 'Trần Đình Huy', 'tranhuy99dlk@gmail.com', '65 trần tấn mới, hoà cường bắc, quận hải châu, TP Đà Nẵng', '0905280264', '2021-03-03', '2021-03-03', 'trandinhhuy', '', 0),
(3, 'Kỳ Hữu Đông', 'kyhuudong@gmail.com', 'Ông Ích Khiêm', '123123123', '2021-03-03', '2021-03-03', 'kyhuudong', '', 0),
(4, 'Nguyễn Thị Thu Hiền', 'nguyenthithuhien@gmail.com', 'Nguyễn Hữu Thọ, TP Đà Nẵng', '0905123321', '2021-03-03', '2021-03-03', 'nguyenthithuhien', '', 0),
(5, 'Phùng Hoàng Phú Lộc', 'phunghoangphuloc@gmail.com', 'Trường Chinh, TP Đà Nẵng', '0905280264', '2021-03-03', '2021-03-03', 'phunghoangphuloc', '', 0),
(6, 'Lương Phan Thành Đạt', 'luongphanthanhdat@gmail.com', 'Điện Biên Phủ, TP Đà Nẵng', '123456123', '2021-03-03', '2021-03-03', 'luongphanthanhdat', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`idexam`),
  ADD KEY `idSubject` (`idsubject`);

--
-- Indexes for table `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`idgrade`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`idq`),
  ADD KEY `idEXAM` (`idexam`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD KEY `idUser` (`iduser`),
  ADD KEY `idExam` (`idexam`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`idrole`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`idsubject`);

--
-- Indexes for table `sub_g_s`
--
ALTER TABLE `sub_g_s`
  ADD KEY `idGrade` (`idgrade`),
  ADD KEY `idSubject` (`idsubject`);

--
-- Indexes for table `sub_rl_ud`
--
ALTER TABLE `sub_rl_ud`
  ADD KEY `idRole` (`idrole`),
  ADD KEY `idUser` (`iduser`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`iduser`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `exam`
--
ALTER TABLE `exam`
  MODIFY `idexam` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `grade`
--
ALTER TABLE `grade`
  MODIFY `idgrade` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `idq` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `idrole` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `idsubject` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `iduser` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam`
--
ALTER TABLE `exam`
  ADD CONSTRAINT `EXAM_ibfk_1` FOREIGN KEY (`idsubject`) REFERENCES `subject` (`idsubject`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `QUESTION_ibfk_1` FOREIGN KEY (`idexam`) REFERENCES `exam` (`idexam`);

--
-- Constraints for table `result`
--
ALTER TABLE `result`
  ADD CONSTRAINT `RESULT_ibfk_1` FOREIGN KEY (`iduser`) REFERENCES `user_details` (`iduser`),
  ADD CONSTRAINT `RESULT_ibfk_2` FOREIGN KEY (`idexam`) REFERENCES `exam` (`idexam`);

--
-- Constraints for table `sub_g_s`
--
ALTER TABLE `sub_g_s`
  ADD CONSTRAINT `SUB_G_S_ibfk_1` FOREIGN KEY (`idgrade`) REFERENCES `grade` (`idgrade`),
  ADD CONSTRAINT `SUB_G_S_ibfk_2` FOREIGN KEY (`idsubject`) REFERENCES `subject` (`idsubject`);

--
-- Constraints for table `sub_rl_ud`
--
ALTER TABLE `sub_rl_ud`
  ADD CONSTRAINT `SUB_RL_UD_ibfk_1` FOREIGN KEY (`idrole`) REFERENCES `role` (`idrole`),
  ADD CONSTRAINT `SUB_RL_UD_ibfk_2` FOREIGN KEY (`iduser`) REFERENCES `user_details` (`iduser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
