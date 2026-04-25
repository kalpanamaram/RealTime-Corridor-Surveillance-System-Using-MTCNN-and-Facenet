-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2026 at 02:19 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `face_surveillance`
--

-- --------------------------------------------------------

--
-- Table structure for table `corridor_violations`
--

CREATE TABLE `corridor_violations` (
  `id` int(11) NOT NULL,
  `roll_no` varchar(20) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `detected_time` datetime DEFAULT NULL,
  `camera_location` varchar(100) DEFAULT NULL,
  `image_path` text DEFAULT NULL,
  `augmented_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `corridor_violations`
--

INSERT INTO `corridor_violations` (`id`, `roll_no`, `name`, `subject`, `detected_time`, `camera_location`, `image_path`, `augmented_path`) VALUES
(1, '22KT1A4917', '22KT1A4917', 'DS', '2026-02-21 14:21:44', 'Corridor Camera', 'output/22KT1A4917.jpg', NULL),
(2, '22KT1A4913', '22KT1A4913', 'DS', '2026-02-21 14:21:49', 'Corridor Camera', 'output/22KT1A4913.jpg', NULL),
(3, '22KT1A4715', '22KT1A4715', 'FLAT', '2026-02-21 14:21:57', 'Corridor Camera', 'output/22KT1A4715.jpg', NULL),
(4, '22KT1A4760', '22KT1A4760', 'FLAT', '2026-02-21 14:44:05', 'Corridor Camera', 'output/22KT1A4760.jpg', NULL),
(5, '22KT1A4708', '22KT1A4708', 'FLAT', '2026-02-21 14:44:08', 'Corridor Camera', 'output/22KT1A4708.jpg', NULL),
(6, '22KT1A0520', '22KT1A0520', 'FLAT', '2026-02-21 14:44:19', 'Corridor Camera', 'output/22KT1A0520.jpg', NULL),
(7, '22KT1A4762', '22KT1A4762', 'FLAT', '2026-02-21 14:44:23', 'Corridor Camera', 'output/22KT1A4762.jpg', NULL),
(8, '22KT1A4718', '22KT1A4718', 'FLAT', '2026-02-21 14:44:45', 'Corridor Camera', 'output/22KT1A4718.jpg', NULL),
(9, '22KT1A4746', '22KT1A4746', 'DS', '2026-03-28 11:22:24', NULL, 'students/22KT1A4746.jpg', 'proofs/22KT1A4746_1774677138.jpg'),
(10, '22KT1A4706', '22KT1A4706', 'DS', '2026-03-28 11:22:32', NULL, 'students/22KT1A4706.jpg', 'proofs/22KT1A4706_1774677141.jpg'),
(11, '22KT1A4904', '22KT1A4904', 'OS', '2026-03-28 11:22:35', NULL, 'students/22KT1A4904.jpg', 'proofs/22KT1A4904_1774677137.jpg'),
(12, '22KT1A4746', '22KT1A4746', 'DS', '2026-03-28 11:22:38', NULL, 'students/22KT1A4746.jpg', 'proofs/22KT1A4746_1774677143.jpg'),
(13, '22KT1A4760', '22KT1A4760', 'DS', '2026-03-28 11:26:20', NULL, 'students/22KT1A4760.jpg', 'proofs/22KT1A4760_1774677372.jpg'),
(14, '22KT1A4762', '22KT1A4762', 'FLAT', '2026-04-22 14:33:33', 'Corridor Camera', 'output/22KT1A4762.jpg', NULL),
(15, '22KT1A4950', '22KT1A4950', 'DS', '2026-04-22 14:34:02', 'Corridor Camera', 'output/22KT1A4950.jpg', NULL),
(16, '22KT1A4752', '22KT1A4752', 'FLAT', '2026-04-22 14:34:42', 'Corridor Camera', 'output/22KT1A4752.jpg', NULL),
(17, '22KT1A4711', '22KT1A4711', 'FLAT', '2026-04-22 14:35:29', 'Corridor Camera', 'output/22KT1A4711.jpg', NULL),
(18, '22KT1A0554', '22KT1A0554', 'FLAT', '2026-04-22 14:35:54', 'Corridor Camera', 'output/22KT1A0554.jpg', NULL),
(19, '22KT1A4744', '22KT1A4744', 'FLAT', '2026-04-22 14:35:57', 'Corridor Camera', 'output/22KT1A4744.jpg', NULL),
(20, '22KT1A4745', '22KT1A4745', 'FLAT', '2026-04-22 14:36:04', 'Corridor Camera', 'output/22KT1A4745.jpg', NULL),
(21, '22KT1A4712', '22KT1A4712', 'FLAT', '2026-04-22 14:36:17', 'Corridor Camera', 'output/22KT1A4712.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `subject`, `email`) VALUES
(1, 'OS', 'lb088970@gmail.com'),
(2, 'DBMS', 'f6442443@gmail.com'),
(3, 'WT', 'pscmrgirls@gmail.com'),
(4, 'DS', 'markmail229@gmail.com'),
(5, 'FLAT', 'maram.kalpana1@gmail.com'),
(6, 'Study Hour', 'maram.kalpana1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `roll_no` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `section` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`roll_no`, `name`, `department`, `year`, `section`) VALUES
('22KT1A0501', '22KT1A0501', 'CSE', 4, 'A'),
('22KT1A0502', '22KT1A0502', 'CSE', 4, 'A'),
('22KT1A0503', '22KT1A0503', 'CSE', 4, 'A'),
('22KT1A0504', '22KT1A0504', 'CSE', 4, 'A'),
('22KT1A0505', '22KT1A0505', 'CSE', 4, 'A'),
('22KT1A0506', '22KT1A0506', 'CSE', 4, 'A'),
('22KT1A0507', '22KT1A0507', 'CSE', 4, 'A'),
('22KT1A0508', '22KT1A0508', 'CSE', 4, 'A'),
('22KT1A0509', '22KT1A0509', 'CSE', 4, 'A'),
('22KT1A0510', '22KT1A0510', 'CSE', 4, 'A'),
('22KT1A0511', '22KT1A0511', 'CSE', 4, 'A'),
('22KT1A0512', '22KT1A0512', 'CSE', 4, 'A'),
('22KT1A0513', '22KT1A0513', 'CSE', 4, 'A'),
('22KT1A0514', '22KT1A0514', 'CSE', 4, 'A'),
('22KT1A0515', '22KT1A0515', 'CSE', 4, 'A'),
('22KT1A0516', '22KT1A0516', 'CSE', 4, 'A'),
('22KT1A0517', '22KT1A0517', 'CSE', 4, 'A'),
('22KT1A0518', '22KT1A0518', 'CSE', 4, 'A'),
('22KT1A0519', '22KT1A0519', 'CSE', 4, 'A'),
('22KT1A0520', '22KT1A0520', 'CSE', 4, 'A'),
('22KT1A0521', '22KT1A0521', 'CSE', 4, 'A'),
('22KT1A0522', '22KT1A0522', 'CSE', 4, 'A'),
('22KT1A0523', '22KT1A0523', 'CSE', 4, 'A'),
('22KT1A0524', '22KT1A0524', 'CSE', 4, 'A'),
('22KT1A0525', '22KT1A0525', 'CSE', 4, 'A'),
('22KT1A0526', '22KT1A0526', 'CSE', 4, 'A'),
('22KT1A0527', '22KT1A0527', 'CSE', 4, 'A'),
('22KT1A0528', '22KT1A0528', 'CSE', 4, 'A'),
('22KT1A0529', '22KT1A0529', 'CSE', 4, 'A'),
('22KT1A0530', '22KT1A0530', 'CSE', 4, 'A'),
('22KT1A0531', '22KT1A0531', 'CSE', 4, 'A'),
('22KT1A0532', '22KT1A0532', 'CSE', 4, 'A'),
('22KT1A0533', '22KT1A0533', 'CSE', 4, 'A'),
('22KT1A0534', '22KT1A0534', 'CSE', 4, 'A'),
('22KT1A0535', '22KT1A0535', 'CSE', 4, 'A'),
('22KT1A0536', '22KT1A0536', 'CSE', 4, 'A'),
('22KT1A0537', '22KT1A0537', 'CSE', 4, 'A'),
('22KT1A0538', '22KT1A0538', 'CSE', 4, 'A'),
('22KT1A0539', '22KT1A0539', 'CSE', 4, 'A'),
('22KT1A0540', '22KT1A0540', 'CSE', 4, 'A'),
('22KT1A0541', '22KT1A0541', 'CSE', 4, 'A'),
('22KT1A0542', '22KT1A0542', 'CSE', 4, 'A'),
('22KT1A0543', '22KT1A0543', 'CSE', 4, 'A'),
('22KT1A0544', '22KT1A0544', 'CSE', 4, 'A'),
('22KT1A0545', '22KT1A0545', 'CSE', 4, 'A'),
('22KT1A0546', '22KT1A0546', 'CSE', 4, 'A'),
('22KT1A0547', '22KT1A0547', 'CSE', 4, 'A'),
('22KT1A0548', '22KT1A0548', 'CSE', 4, 'A'),
('22KT1A0549', '22KT1A0549', 'CSE', 4, 'A'),
('22KT1A0550', '22KT1A0550', 'CSE', 4, 'A'),
('22KT1A0551', '22KT1A0551', 'CSE', 4, 'A'),
('22KT1A0552', '22KT1A0552', 'CSE', 4, 'A'),
('22KT1A0553', '22KT1A0553', 'CSE', 4, 'A'),
('22KT1A0554', '22KT1A0554', 'CSE', 4, 'A'),
('22KT1A0555', '22KT1A0555', 'CSE', 4, 'A'),
('22KT1A0556', '22KT1A0556', 'CSE', 4, 'A'),
('22KT1A0557', '22KT1A0557', 'CSE', 4, 'A'),
('22KT1A0558', '22KT1A0558', 'CSE', 4, 'A'),
('22KT1A0559', '22KT1A0559', 'CSE', 4, 'A'),
('22KT1A0560', '22KT1A0560', 'CSE', 4, 'A'),
('22KT1A0561', '22KT1A0561', 'CSE', 4, 'A'),
('22KT1A0562', '22KT1A0562', 'CSE', 4, 'A'),
('22KT1A0563', '22KT1A0563', 'CSE', 4, 'A'),
('22KT1A0564', '22KT1A0564', 'CSE', 4, 'A'),
('22KT1A0565', '22KT1A0565', 'CSE', 4, 'A'),
('22KT1A0566', '22KT1A0566', 'CSE', 4, 'A'),
('22KT1A0567', '22KT1A0567', 'CSE', 4, 'A'),
('22KT1A0568', '22KT1A0568', 'CSE', 4, 'A'),
('22KT1A0569', '22KT1A0569', 'CSE', 4, 'A'),
('22KT1A0570', '22KT1A0570', 'CSE', 4, 'A'),
('22KT1A0571', '22KT1A0571', 'CSE', 4, 'A'),
('22KT1A0572', '22KT1A0572', 'CSE', 4, 'A'),
('22KT1A0573', '22KT1A0573', 'CSE', 4, 'A'),
('22KT1A0574', '22KT1A0574', 'CSE', 4, 'A'),
('22KT1A0575', '22KT1A0575', 'CSE', 4, 'A'),
('22KT1A0576', '22KT1A0576', 'CSE', 4, 'A'),
('22KT1A0577', '22KT1A0577', 'CSE', 4, 'A'),
('22KT1A0578', '22KT1A0578', 'CSE', 4, 'A'),
('22KT1A0579', '22KT1A0579', 'CSE', 4, 'A'),
('22KT1A0580', '22KT1A0580', 'CSE', 4, 'A'),
('22KT1A0581', '22KT1A0581', 'CSE', 4, 'A'),
('22KT1A0582', '22KT1A0582', 'CSE', 4, 'A'),
('22KT1A0583', '22KT1A0583', 'CSE', 4, 'A'),
('22KT1A0584', '22KT1A0584', 'CSE', 4, 'A'),
('22KT1A0585', '22KT1A0585', 'CSE', 4, 'A'),
('22KT1A0586', '22KT1A0586', 'CSE', 4, 'A'),
('22KT1A0587', '22KT1A0587', 'CSE', 4, 'A'),
('22KT1A0588', '22KT1A0588', 'CSE', 4, 'A'),
('22KT1A0589', '22KT1A0589', 'CSE', 4, 'A'),
('22KT1A0590', '22KT1A0590', 'CSE', 4, 'A'),
('22KT1A0591', '22KT1A0591', 'CSE', 4, 'A'),
('22KT1A0592', '22KT1A0592', 'CSE', 4, 'A'),
('22KT1A0593', '22KT1A0593', 'CSE', 4, 'A'),
('22KT1A0594', '22KT1A0594', 'CSE', 4, 'A'),
('22KT1A0595', '22KT1A0595', 'CSE', 4, 'A'),
('22KT1A0596', '22KT1A0596', 'CSE', 4, 'A'),
('22KT1A0597', '22KT1A0597', 'CSE', 4, 'A'),
('22KT1A0598', '22KT1A0598', 'CSE', 4, 'A'),
('22KT1A0599', '22KT1A0599', 'CSE', 4, 'A'),
('22KT1A4701', '22KT1A4701', 'CIC', 4, 'A'),
('22KT1A4702', '22KT1A4702', 'CIC', 4, 'A'),
('22KT1A4703', '22KT1A4703', 'CIC', 4, 'A'),
('22KT1A4704', '22KT1A4704', 'CIC', 4, 'A'),
('22KT1A4705', '22KT1A4705', 'CIC', 4, 'A'),
('22KT1A4706', '22KT1A4706', 'CIC', 4, 'A'),
('22KT1A4707', '22KT1A4707', 'CIC', 4, 'A'),
('22KT1A4708', '22KT1A4708', 'CIC', 4, 'A'),
('22KT1A4709', '22KT1A4709', 'CIC', 4, 'A'),
('22KT1A4710', '22KT1A4710', 'CIC', 4, 'A'),
('22KT1A4711', '22KT1A4711', 'CIC', 4, 'A'),
('22KT1A4712', '22KT1A4712', 'CIC', 4, 'A'),
('22KT1A4713', '22KT1A4713', 'CIC', 4, 'A'),
('22KT1A4714', '22KT1A4714', 'CIC', 4, 'A'),
('22KT1A4715', '22KT1A4715', 'CIC', 4, 'A'),
('22KT1A4716', '22KT1A4716', 'CIC', 4, 'A'),
('22KT1A4717', '22KT1A4717', 'CIC', 4, 'A'),
('22KT1A4718', '22KT1A4718', 'CIC', 4, 'A'),
('22KT1A4719', '22KT1A4719', 'CIC', 4, 'A'),
('22KT1A4720', '22KT1A4720', 'CIC', 4, 'A'),
('22KT1A4721', '22KT1A4721', 'CIC', 4, 'A'),
('22KT1A4722', '22KT1A4722', 'CIC', 4, 'A'),
('22KT1A4723', '22KT1A4723', 'CIC', 4, 'A'),
('22KT1A4724', '22KT1A4724', 'CIC', 4, 'A'),
('22KT1A4725', '22KT1A4725', 'CIC', 4, 'A'),
('22KT1A4726', '22KT1A4726', 'CIC', 4, 'A'),
('22KT1A4727', '22KT1A4727', 'CIC', 4, 'A'),
('22KT1A4728', '22KT1A4728', 'CIC', 4, 'A'),
('22KT1A4729', '22KT1A4729', 'CIC', 4, 'A'),
('22KT1A4730', '22KT1A4730', 'CIC', 4, 'A'),
('22KT1A4731', '22KT1A4731', 'CIC', 4, 'A'),
('22KT1A4732', '22KT1A4732', 'CIC', 4, 'A'),
('22KT1A4733', '22KT1A4733', 'CIC', 4, 'A'),
('22KT1A4734', '22KT1A4734', 'CIC', 4, 'A'),
('22KT1A4735', '22KT1A4735', 'CIC', 4, 'A'),
('22KT1A4736', '22KT1A4736', 'CIC', 4, 'A'),
('22KT1A4737', '22KT1A4737', 'CIC', 4, 'A'),
('22KT1A4738', '22KT1A4738', 'CIC', 4, 'A'),
('22KT1A4739', '22KT1A4739', 'CIC', 4, 'A'),
('22KT1A4740', '22KT1A4740', 'CIC', 4, 'A'),
('22KT1A4741', '22KT1A4741', 'CIC', 4, 'A'),
('22KT1A4742', '22KT1A4742', 'CIC', 4, 'A'),
('22KT1A4743', '22KT1A4743', 'CIC', 4, 'A'),
('22KT1A4744', '22KT1A4744', 'CIC', 4, 'A'),
('22KT1A4745', '22KT1A4745', 'CIC', 4, 'A'),
('22KT1A4746', '22KT1A4746', 'CIC', 4, 'A'),
('22KT1A4747', '22KT1A4747', 'CIC', 4, 'A'),
('22KT1A4748', '22KT1A4748', 'CIC', 4, 'A'),
('22KT1A4749', '22KT1A4749', 'CIC', 4, 'A'),
('22KT1A4750', '22KT1A4750', 'CIC', 4, 'A'),
('22KT1A4751', '22KT1A4751', 'CIC', 4, 'A'),
('22KT1A4752', '22KT1A4752', 'CIC', 4, 'A'),
('22KT1A4753', '22KT1A4753', 'CIC', 4, 'A'),
('22KT1A4754', '22KT1A4754', 'CIC', 4, 'A'),
('22KT1A4755', '22KT1A4755', 'CIC', 4, 'A'),
('22KT1A4756', '22KT1A4756', 'CIC', 4, 'A'),
('22KT1A4757', '22KT1A4757', 'CIC', 4, 'A'),
('22KT1A4758', '22KT1A4758', 'CIC', 4, 'A'),
('22KT1A4759', '22KT1A4759', 'CIC', 4, 'A'),
('22KT1A4760', '22KT1A4760', 'CIC', 4, 'A'),
('22KT1A4761', '22KT1A4761', 'CIC', 4, 'A'),
('22KT1A4762', '22KT1A4762', 'CIC', 4, 'A'),
('22KT1A4763', '22KT1A4763', 'CIC', 4, 'A'),
('22KT1A4901', '22KT1A4901', 'CSO', 4, 'A'),
('22KT1A4902', '22KT1A4902', 'CSO', 4, 'A'),
('22KT1A4903', '22KT1A4903', 'CSO', 4, 'A'),
('22KT1A4904', '22KT1A4904', 'CSO', 4, 'A'),
('22KT1A4905', '22KT1A4905', 'CSO', 4, 'A'),
('22KT1A4906', '22KT1A4906', 'CSO', 4, 'A'),
('22KT1A4907', '22KT1A4907', 'CSO', 4, 'A'),
('22KT1A4908', '22KT1A4908', 'CSO', 4, 'A'),
('22KT1A4909', '22KT1A4909', 'CSO', 4, 'A'),
('22KT1A4910', '22KT1A4910', 'CSO', 4, 'A'),
('22KT1A4911', '22KT1A4911', 'CSO', 4, 'A'),
('22KT1A4912', '22KT1A4912', 'CSO', 4, 'A'),
('22KT1A4913', '22KT1A4913', 'CSO', 4, 'A'),
('22KT1A4914', '22KT1A4914', 'CSO', 4, 'A'),
('22KT1A4915', '22KT1A4915', 'CSO', 4, 'A'),
('22KT1A4916', '22KT1A4916', 'CSO', 4, 'A'),
('22KT1A4917', '22KT1A4917', 'CSO', 4, 'A'),
('22KT1A4918', '22KT1A4918', 'CSO', 4, 'A'),
('22KT1A4919', '22KT1A4919', 'CSO', 4, 'A'),
('22KT1A4920', '22KT1A4920', 'CSO', 4, 'A'),
('22KT1A4921', '22KT1A4921', 'CSO', 4, 'A'),
('22KT1A4922', '22KT1A4922', 'CSO', 4, 'A'),
('22KT1A4923', '22KT1A4923', 'CSO', 4, 'A'),
('22KT1A4924', '22KT1A4924', 'CSO', 4, 'A'),
('22KT1A4925', '22KT1A4925', 'CSO', 4, 'A'),
('22KT1A4926', '22KT1A4926', 'CSO', 4, 'A'),
('22KT1A4927', '22KT1A4927', 'CSO', 4, 'A'),
('22KT1A4928', '22KT1A4928', 'CSO', 4, 'A'),
('22KT1A4929', '22KT1A4929', 'CSO', 4, 'A'),
('22KT1A4930', '22KT1A4930', 'CSO', 4, 'A'),
('22KT1A4931', '22KT1A4931', 'CSO', 4, 'A'),
('22KT1A4932', '22KT1A4932', 'CSO', 4, 'A'),
('22KT1A4933', '22KT1A4933', 'CSO', 4, 'A'),
('22KT1A4934', '22KT1A4934', 'CSO', 4, 'A'),
('22KT1A4935', '22KT1A4935', 'CSO', 4, 'A'),
('22KT1A4936', '22KT1A4936', 'CSO', 4, 'A'),
('22KT1A4937', '22KT1A4937', 'CSO', 4, 'A'),
('22KT1A4938', '22KT1A4938', 'CSO', 4, 'A'),
('22KT1A4939', '22KT1A4939', 'CSO', 4, 'A'),
('22KT1A4940', '22KT1A4940', 'CSO', 4, 'A'),
('22KT1A4941', '22KT1A4941', 'CSO', 4, 'A'),
('22KT1A4942', '22KT1A4942', 'CSO', 4, 'A'),
('22KT1A4943', '22KT1A4943', 'CSO', 4, 'A'),
('22KT1A4944', '22KT1A4944', 'CSO', 4, 'A'),
('22KT1A4945', '22KT1A4945', 'CSO', 4, 'A'),
('22KT1A4946', '22KT1A4946', 'CSO', 4, 'A'),
('22KT1A4947', '22KT1A4947', 'CSO', 4, 'A'),
('22KT1A4948', '22KT1A4948', 'CSO', 4, 'A'),
('22KT1A4949', '22KT1A4949', 'CSO', 4, 'A'),
('22KT1A4950', '22KT1A4950', 'CSO', 4, 'A'),
('22KT1A4951', '22KT1A4951', 'CSO', 4, 'A'),
('22KT1A4952', '22KT1A4952', 'CSO', 4, 'A'),
('22KT1A4953', '22KT1A4953', 'CSO', 4, 'A'),
('22KT1A4954', '22KT1A4954', 'CSO', 4, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `timetable`
--

CREATE TABLE `timetable` (
  `id` int(11) NOT NULL,
  `department` varchar(50) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `section` varchar(5) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `timetable`
--

INSERT INTO `timetable` (`id`, `department`, `year`, `section`, `subject`, `start_time`, `end_time`) VALUES
(1, 'CSE', 4, 'A', 'OS', '09:00:00', '10:00:00'),
(2, 'CSE', 4, 'A', 'DBMS', '10:00:00', '11:00:00'),
(3, 'CSE', 4, 'A', 'WT', '11:15:00', '12:15:00'),
(4, 'CSE', 4, 'A', 'DS', '13:00:00', '14:00:00'),
(5, 'CSE', 4, 'A', 'FLAT', '14:00:00', '15:00:00'),
(6, 'CIC', 4, 'A', 'DBMS', '09:00:00', '10:00:00'),
(7, 'CIC', 4, 'A', 'OS', '10:00:00', '11:00:00'),
(8, 'CIC', 4, 'A', 'DS', '11:15:00', '12:15:00'),
(9, 'CIC', 4, 'A', 'WT', '13:00:00', '14:00:00'),
(10, 'CIC', 4, 'A', 'FLAT', '14:00:00', '15:00:00'),
(11, 'CSO', 4, 'A', 'WT', '09:00:00', '10:00:00'),
(12, 'CSO', 4, 'A', 'FLAT', '10:00:00', '11:00:00'),
(13, 'CSO', 4, 'A', 'OS', '11:15:00', '12:15:00'),
(14, 'CSO', 4, 'A', 'DBMS', '13:00:00', '14:00:00'),
(15, 'CSO', 4, 'A', 'DS', '14:00:00', '15:00:00'),
(16, 'CSE', 4, 'A', 'Study Hour', '17:00:00', '20:00:00'),
(17, 'CIC', 4, 'A', 'Study Hour', '17:00:00', '20:00:00'),
(18, 'CSO', 4, 'A', 'Study Hour', '17:00:00', '20:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'admin123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `corridor_violations`
--
ALTER TABLE `corridor_violations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`roll_no`);

--
-- Indexes for table `timetable`
--
ALTER TABLE `timetable`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `corridor_violations`
--
ALTER TABLE `corridor_violations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `timetable`
--
ALTER TABLE `timetable`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
