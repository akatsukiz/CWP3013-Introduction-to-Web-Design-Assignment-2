-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 08, 2024 at 01:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `giftedstudentdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(50, 'John', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `code`
--

CREATE TABLE `code` (
  `code` varchar(6) NOT NULL,
  `email` varchar(20) NOT NULL,
  `type` set('teacher','marker') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `code`
--

INSERT INTO `code` (`code`, `email`, `type`) VALUES
('AB980', 'happy@gmail.com', 'teacher'),
('CG765', 'brian@gmail.com', 'marker');

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_code` varchar(10) NOT NULL,
  `exam_name` varchar(50) NOT NULL,
  `exam_date` date NOT NULL,
  `exam_time_start` time NOT NULL,
  `exam_time_end` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam`
--

INSERT INTO `exam` (`exam_code`, `exam_name`, `exam_date`, `exam_time_start`, `exam_time_end`) VALUES
('form5t', 'Form 5 Standardised Testing', '2024-04-01', '09:00:00', '11:00:00'),
('standard3t', 'Standard 3 Standardised Testing', '2024-04-06', '13:00:00', '15:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `exam_answer`
--

CREATE TABLE `exam_answer` (
  `exam_code` varchar(10) NOT NULL,
  `mcq_1` set('A','B','C','D') NOT NULL,
  `mcq_2` set('A','B','C','D') NOT NULL,
  `mcq_3` set('A','B','C','D') NOT NULL,
  `mcq_4` set('A','B','C','D') NOT NULL,
  `mcq_5` set('A','B','C','D') NOT NULL,
  `mcq_6` set('A','B','C','D') NOT NULL,
  `mcq_7` set('A','B','C','D') NOT NULL,
  `mcq_8` set('A','B','C','D') NOT NULL,
  `mcq_9` set('A','B','C','D') NOT NULL,
  `mcq_10` set('A','B','C','D') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_answer`
--

INSERT INTO `exam_answer` (`exam_code`, `mcq_1`, `mcq_2`, `mcq_3`, `mcq_4`, `mcq_5`, `mcq_6`, `mcq_7`, `mcq_8`, `mcq_9`, `mcq_10`) VALUES
('standard3t', 'B', 'C', 'C', 'C', 'C', 'B', 'D', 'A', 'A', 'C');

-- --------------------------------------------------------

--
-- Table structure for table `exam_question`
--

CREATE TABLE `exam_question` (
  `exam_code` varchar(10) NOT NULL,
  `mcq_1` varchar(100) NOT NULL,
  `mcq_2` varchar(100) NOT NULL,
  `mcq_3` varchar(100) NOT NULL,
  `mcq_4` varchar(100) NOT NULL,
  `mcq_5` varchar(100) NOT NULL,
  `mcq_6` varchar(100) NOT NULL,
  `mcq_7` varchar(100) NOT NULL,
  `mcq_8` varchar(100) NOT NULL,
  `mcq_9` varchar(100) NOT NULL,
  `mcq_10` varchar(100) NOT NULL,
  `short_ans_1` varchar(200) NOT NULL,
  `short_ans_2` varchar(200) NOT NULL,
  `essay` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_question`
--

INSERT INTO `exam_question` (`exam_code`, `mcq_1`, `mcq_2`, `mcq_3`, `mcq_4`, `mcq_5`, `mcq_6`, `mcq_7`, `mcq_8`, `mcq_9`, `mcq_10`, `short_ans_1`, `short_ans_2`, `essay`) VALUES
('standard3t', 'What is the correct plural form for sheep?', 'What is the plural form of Mango?', 'What is the plural form of Man?', 'Select the correct opposite gender for the \r\nword Father.', 'Which number is greater than 7,350?', 'There are fifteen apples on a tree. Six apples are on the ground. How to find total apples?', 'Which is the BEST number sentence for finding the distance a cheetah can run in four hours?', 'Which shape has the fewest sides?', 'Which number is the same as 1,670?', 'Which shape has five sides?', 'Give two examples of animals.', 'List out 3 colours.', 'Do you have a favorite holiday memory? Describe it.');

-- --------------------------------------------------------

--
-- Table structure for table `exam_result`
--

CREATE TABLE `exam_result` (
  `exam_code` varchar(10) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `mcq` int(2) NOT NULL,
  `short_ans_1` int(2) DEFAULT NULL,
  `short_ans_2` int(2) DEFAULT NULL,
  `essay` int(2) DEFAULT NULL,
  `overallscore` int(3) DEFAULT NULL,
  `grade` set('A','B','C','D','E','F') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `exam_result`
--

INSERT INTO `exam_result` (`exam_code`, `stu_id`, `mcq`, `short_ans_1`, `short_ans_2`, `essay`, `overallscore`, `grade`) VALUES
('standard3t', 1, 20, 20, 20, 15, 75, 'B'),
('standard3t', 4, 16, 10, 20, 33, 79, 'B'),
('standard3t', 7, 10, 15, 20, 38, 83, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `mark_change_request`
--

CREATE TABLE `mark_change_request` (
  `no` int(11) NOT NULL,
  `exam_code` varchar(10) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `section` set('Short Answer 1','Short Answer 2','Essay') NOT NULL,
  `original_mark` int(2) NOT NULL,
  `suggested_mark` int(2) NOT NULL,
  `reason` varchar(100) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `status` set('Pending','Reviewed') NOT NULL,
  `inserted_mark` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mark_change_request`
--

INSERT INTO `mark_change_request` (`no`, `exam_code`, `stu_id`, `section`, `original_mark`, `suggested_mark`, `reason`, `teacher_id`, `status`, `inserted_mark`) VALUES
(1, 'standard3t', 4, 'Essay', 33, 34, 'He just needs 1 more mark to get A, after reviewing his essay, I think its ok to add one more mark.', 5, 'Pending', NULL),
(2, 'standard3t', 1, 'Essay', 15, 20, 'He didn\'t manage to finish his essay but he always a top student.', 5, 'Pending', NULL),
(3, 'standard3t', 7, 'Short Answer 1', 10, 20, 'Even though the question is not expecting such answer, but human indeed is an animal.', 5, 'Reviewed', 15);

-- --------------------------------------------------------

--
-- Table structure for table `mcq_option`
--

CREATE TABLE `mcq_option` (
  `exam_code` varchar(10) NOT NULL,
  `question_no` set('mcq_1','mcq_2','mcq_3','mcq_4','mcq_5','mcq_6','mcq_7','mcq_8','mcq_9','mcq_10') NOT NULL,
  `option_a` varchar(50) NOT NULL,
  `option_b` varchar(50) NOT NULL,
  `option_c` varchar(50) NOT NULL,
  `option_d` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mcq_option`
--

INSERT INTO `mcq_option` (`exam_code`, `question_no`, `option_a`, `option_b`, `option_c`, `option_d`) VALUES
('standard3t', 'mcq_1', 'sheeps', 'sheep', 'sheepies', 'sheepes'),
('standard3t', 'mcq_2', 'mangos', 'mangose', 'mangoes', 'mangies'),
('standard3t', 'mcq_3', 'manes', 'mans', 'men', 'manies'),
('standard3t', 'mcq_4', 'Sister ', 'Uncle', 'Mother', 'Brother'),
('standard3t', 'mcq_5', '7206', '7333', '7801', '7060'),
('standard3t', 'mcq_6', '6 + 21 = 27', '15 + 6 = 21', '27 - 15 = 12', '15 - 6 = 9'),
('standard3t', 'mcq_7', '70 + 4 = 74 miles', '70 - 4 = 66 miles', '70 + 70 + 70 = 210 miles', '70 + 70 + 70 + 70 = 280 miles'),
('standard3t', 'mcq_8', 'triangle', 'pentagon', 'rectangle', ' hexagon'),
('standard3t', 'mcq_9', '16 hundreds and 7 tens', '1 hundred and 67 tens', '1 thousand and 6 hundreds', '16 thousands and 7 tens'),
('standard3t', 'mcq_10', 'hexagon', 'octagon', 'pentagon', 'rectangle');

-- --------------------------------------------------------

--
-- Table structure for table `student_answer`
--

CREATE TABLE `student_answer` (
  `exam_code` varchar(10) NOT NULL,
  `stu_id` int(11) NOT NULL,
  `mcq_1` set('A','B','C','D') DEFAULT NULL,
  `mcq_2` set('A','B','C','D') DEFAULT NULL,
  `mcq_3` set('A','B','C','D') DEFAULT NULL,
  `mcq_4` set('A','B','C','D') DEFAULT NULL,
  `mcq_5` set('A','B','C','D') DEFAULT NULL,
  `mcq_6` set('A','B','C','D') DEFAULT NULL,
  `mcq_7` set('A','B','C','D') DEFAULT NULL,
  `mcq_8` set('A','B','C','D') DEFAULT NULL,
  `mcq_9` set('A','B','C','D') DEFAULT NULL,
  `mcq_10` set('A','B','C','D') DEFAULT NULL,
  `short_ans_1` varchar(250) DEFAULT NULL,
  `short_ans_2` varchar(250) DEFAULT NULL,
  `essay` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `student_answer`
--

INSERT INTO `student_answer` (`exam_code`, `stu_id`, `mcq_1`, `mcq_2`, `mcq_3`, `mcq_4`, `mcq_5`, `mcq_6`, `mcq_7`, `mcq_8`, `mcq_9`, `mcq_10`, `short_ans_1`, `short_ans_2`, `essay`) VALUES
('standard3t', 1, 'B', 'C', 'C', 'C', 'C', 'B', 'D', 'A', 'A', 'C', 'Snake, Dog', 'Blue, Pink, White', 'One time, during Christmas, my family and I decorated our tree with twinkling lights and shiny ornaments. We listened to cheerful'),
('standard3t', 4, 'B', 'C', 'C', 'C', 'C', 'A', 'D', 'B', 'A', 'A', 'Crocodile, Patrick.', 'Pink, Purple, Blue.', 'My favorite holiday memory was when my family and I went to the mountains for Christmas. We stayed in a cozy cabin with a big fireplace. On Christmas Eve, we roasted marshmallows and sang songs around the fire. Then, on Christmas morning, we woke up to find presents under the tree and snow falling outside. We played in the snow all day and had a big feast together. It was the best holiday ever!'),
('standard3t', 7, 'B', 'A', 'C', 'B', 'B', 'D', 'D', 'A', 'C', 'A', 'Human, Cat', 'Grey, Purple, Blue', 'Once, during Halloween, my friends and I dressed up in spooky costumes and went trick-or-treating. We knocked on doors, shouting \"trick or treat!\" and giggling as we collected candy. The streets were filled with pumpkins glowing in the dark, and we felt like adventurers on a candy quest. Afterward, we gathered to share our loot and swap our favorite candies. It was a night of thrills and laughter that I\'ll never forget!');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `username` varchar(40) NOT NULL,
  `pass` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `school` varchar(50) NOT NULL,
  `phone_no` varchar(12) NOT NULL,
  `address` varchar(40) NOT NULL,
  `type` set('student','teacher','officer','admin') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `username`, `pass`, `email`, `school`, `phone_no`, `address`, `type`) VALUES
(1, 'Irwin', 'Wong', 'winwin', 'winwin', 'irwinwonghoekah@gmail.com', 'School', '0164107945', 'address', 'student'),
(4, 'Jack', 'Russell', 'Jacky', '1541561165', 'irwinwonghoekah@gmail.com', 'Al-Noor International School', '0178889136', '11C Jalan Tun Abdul Razak', 'student'),
(5, 'Amelia', 'Jeffreson', 'Mili', '541154161', 'irwinwong2003@gmail.com', 'Sri Kuala Lumpur International School', '0115249786', 'Jalan Bunus 6, Off Jalan Masjid India', 'teacher'),
(6, 'Jacob', 'Baker', 'Bicky', '4514165156', '0205226@student.kdupg.edu.my', 'Sayfol International School', '0156667892', 'Jln Pju 8/5G, Bandar Damansara Perdana', 'officer'),
(7, 'Josephine', 'Staryu', 'Star', '8724610384', '0205226@student.uow.edu.my', 'Chung Ling International School', '0124987624', '19 Jalan Oren', 'student');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `code`
--
ALTER TABLE `code`
  ADD UNIQUE KEY `code` (`code`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_code`);

--
-- Indexes for table `exam_answer`
--
ALTER TABLE `exam_answer`
  ADD PRIMARY KEY (`exam_code`);

--
-- Indexes for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD PRIMARY KEY (`exam_code`);

--
-- Indexes for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD PRIMARY KEY (`exam_code`,`stu_id`),
  ADD KEY `fk_exam_result_student_answer2` (`stu_id`);

--
-- Indexes for table `mark_change_request`
--
ALTER TABLE `mark_change_request`
  ADD PRIMARY KEY (`no`),
  ADD KEY `fk_mark_change_request_student_answer2` (`stu_id`),
  ADD KEY `fk_mark_change_request_user` (`teacher_id`),
  ADD KEY `fk_mark_change_request_student_answer1` (`exam_code`);

--
-- Indexes for table `mcq_option`
--
ALTER TABLE `mcq_option`
  ADD PRIMARY KEY (`exam_code`,`question_no`);

--
-- Indexes for table `student_answer`
--
ALTER TABLE `student_answer`
  ADD PRIMARY KEY (`exam_code`,`stu_id`),
  ADD KEY `fk_student_answer_user` (`stu_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mark_change_request`
--
ALTER TABLE `mark_change_request`
  MODIFY `no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `exam_answer`
--
ALTER TABLE `exam_answer`
  ADD CONSTRAINT `fk_exam_answer_exam_question` FOREIGN KEY (`exam_code`) REFERENCES `exam_question` (`exam_code`);

--
-- Constraints for table `exam_question`
--
ALTER TABLE `exam_question`
  ADD CONSTRAINT `fk_exam_question_exam` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`);

--
-- Constraints for table `exam_result`
--
ALTER TABLE `exam_result`
  ADD CONSTRAINT `fk_exam_result_student_answer1` FOREIGN KEY (`exam_code`) REFERENCES `student_answer` (`exam_code`),
  ADD CONSTRAINT `fk_exam_result_student_answer2` FOREIGN KEY (`stu_id`) REFERENCES `student_answer` (`stu_id`);

--
-- Constraints for table `mark_change_request`
--
ALTER TABLE `mark_change_request`
  ADD CONSTRAINT `fk_mark_change_request_exam_result` FOREIGN KEY (`exam_code`) REFERENCES `exam_result` (`exam_code`),
  ADD CONSTRAINT `fk_mark_change_request_exam_result2` FOREIGN KEY (`stu_id`) REFERENCES `exam_result` (`stu_id`),
  ADD CONSTRAINT `fk_mark_change_request_user` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `mcq_option`
--
ALTER TABLE `mcq_option`
  ADD CONSTRAINT `fk_mcq_option_exam_question` FOREIGN KEY (`exam_code`) REFERENCES `exam_question` (`exam_code`);

--
-- Constraints for table `student_answer`
--
ALTER TABLE `student_answer`
  ADD CONSTRAINT `fk_student_answer_exam` FOREIGN KEY (`exam_code`) REFERENCES `exam` (`exam_code`),
  ADD CONSTRAINT `fk_student_answer_user` FOREIGN KEY (`stu_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
