-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 12:13 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `project_list`
--

CREATE TABLE `project_list` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(2) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `manager_id` int(30) NOT NULL,
  `user_ids` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_list`
--

INSERT INTO `project_list` (`id`, `name`, `description`, `status`, `start_date`, `end_date`, `manager_id`, `user_ids`, `date_created`) VALUES
(4, 'GC Dev2Dev', '												&lt;span style=&quot;color: rgba(0, 0, 0, 0.87); font-family: Poppins, sans-serif; font-size: 15.008px; text-align: justify; white-space: pre-line;&quot;&gt;GC Dev 2 Dev is a web application&amp;nbsp;&lt;/span&gt;&lt;font color=&quot;rgba(0, 0, 0, 0.870588235294118)&quot; face=&quot;Poppins, sans-serif&quot;&gt;&lt;span style=&quot;font-size: 15.008px; white-space: pre-line;&quot;&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.&lt;/span&gt;&lt;/font&gt;', 0, '2022-11-26', '2022-12-06', 8, '', '2022-12-06 00:23:12'),
(5, 'GC Go Library', 'GC Go Library is&amp;nbsp;Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 0, '2022-11-03', '2022-12-12', 7, '', '2022-12-10 03:24:47'),
(6, 'AllCaps', '&lt;p style=&quot;font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;;&quot;&gt;Lorem ipsum dolor sit amet. Ad odio quam et neque illo qui recusandae consequatur id incidunt velit aut voluptas iure et unde magnam? A nisi recusandae est voluptatem incidunt sed natus dolorem in laborum quos est galisum sunt qui quia consequatur.&lt;/p&gt;&lt;p style=&quot;font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;;&quot;&gt;A earum eligendi aut nobis quidem et laboriosam quia est veritatis placeat. Sit natus omnis qui autem rerum ut sint repellat aut accusamus atque quo temporibus delectus! Qui saepe sint sit culpa atque non magni numquam ut ipsum temporibus sed ipsam cumque aut accusantium quibusdam.&lt;/p&gt;											', 3, '2022-11-20', '2023-05-13', 6, '', '2023-01-18 15:44:45');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `cover_img` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `address`, `cover_img`) VALUES
(1, 'Capstone Project Team Monitoring System', 'info@sample.comm', '+6948 8542 623', 'East Tapinac, Olongapo City, Zambales', '');

-- --------------------------------------------------------

--
-- Table structure for table `task_list`
--

CREATE TABLE `task_list` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `task_list`
--

INSERT INTO `task_list` (`id`, `project_id`, `task`, `description`, `status`, `date_created`) VALUES
(5, 4, 'Submit your Project Poster', '				Make sure to submit it on time			', 2, '2022-12-06 14:55:39'),
(6, 4, 'Project AVP', '				I would like to see your AVP presentation of your project this night			', 3, '2022-12-06 14:58:04'),
(7, 4, 'Review and Debug Errors', '				I saw some issues on your web app that needs to be fixed immediately			', 3, '2022-12-09 20:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1 = admin, 2 = staff',
  `avatar` text NOT NULL DEFAULT 'no-image-available.png',
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Administrator', '', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, 'no-image-available.png', '2022-11-26 10:57:04'),
(6, 'Royce', 'Ogot', '201911397@gordoncollege.edu.ph', '58b9c86a0d0a5118f5b74b1835f72cc8', 2, '1670246580_BSIT_OGOT_ROYCE.jpeg', '2022-12-05 21:23:27'),
(7, 'Lloyd', 'Mariano', 'lloydmariano@gmail.com', '4bf183ea9cf95d311518e7ed542a9f89', 2, '1670309280_1606978560_avatar.jpg', '2022-12-06 14:48:24'),
(8, 'Ken Matthew', 'Ammay', 'kenammay@gmail.com', 'b3906075d9ee220bf34c854b453a238b', 2, 'no-image-available.png', '2022-12-10 03:22:27'),
(9, 'Von', 'Tandoc', 'vontandoc@gmail.com', 'c292c58dc89573a27c7623cf875c5686', 2, 'no-image-available.png', '2022-12-10 03:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `user_productivity`
--

CREATE TABLE `user_productivity` (
  `id` int(30) NOT NULL,
  `project_id` int(30) NOT NULL,
  `task_id` int(30) NOT NULL,
  `comment` text NOT NULL,
  `subject` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `user_id` int(30) NOT NULL,
  `time_rendered` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_productivity`
--

INSERT INTO `user_productivity` (`id`, `project_id`, `task_id`, `comment`, `subject`, `date`, `start_time`, `end_time`, `user_id`, `time_rendered`, `date_created`) VALUES
(5, 4, 0, '&lt;span style=&quot;color: rgba(0, 0, 0, 0.87); font-family: Poppins, sans-serif; font-size: 15.008px; text-align: justify; white-space: pre-line;&quot;&gt;Uploaded my team&rsquo;s 2nd RESEARCH PRESENTATION Video presentation on&amp;nbsp; the Google Drive.&lt;/span&gt;', '2nd RESEARCH PRESENTATION Video presentation', '2022-12-05', '10:05:00', '10:25:00', 6, 0.333333, '2022-12-06 00:26:16'),
(6, 4, 0, 'Edited my&lt;span style=&quot;color: rgba(0, 0, 0, 0.87); font-family: Poppins, sans-serif; font-size: 15.008px; text-align: justify; white-space: pre-line;&quot;&gt;&amp;nbsp;2nd RESEARCH PRESENTATION Video presentation&lt;/span&gt;', '2nd RESEARCH PRESENTATION Video presentation', '2022-12-05', '00:00:00', '23:30:00', 6, 23.5, '2022-12-06 00:27:41'),
(7, 4, 6, '													', '2nd RESEARCH PRESENTATION Video presentation', '2022-12-04', '19:00:00', '03:30:00', 6, -15.5, '2022-12-06 14:59:27'),
(8, 4, 7, '&lt;p style=&quot;font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;;&quot;&gt;Lorem ipsum dolor sit amet. Ad odio quam et neque illo qui recusandae consequatur id incidunt velit aut voluptas iure et unde magnam? A nisi recusandae est voluptatem incidunt sed natus dolorem in laborum quos est galisum sunt qui quia consequatur.&lt;/p&gt;&lt;p style=&quot;font-family: system-ui, -apple-system, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, &amp;quot;Liberation Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;;&quot;&gt;A earum eligendi aut nobis quidem et laboriosam quia est veritatis placeat. Sit natus omnis qui autem rerum ut sint repellat aut accusamus atque quo temporibus delectus! Qui saepe sint sit culpa atque non magni numquam ut ipsum temporibus sed ipsam cumque aut accusantium quibusdam.&lt;/p&gt;													', 'Errors debugged', '2023-01-17', '07:49:00', '19:49:00', 1, 12, '2023-01-18 15:49:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `project_list`
--
ALTER TABLE `project_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_list`
--
ALTER TABLE `task_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_productivity`
--
ALTER TABLE `user_productivity`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `project_list`
--
ALTER TABLE `project_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_list`
--
ALTER TABLE `task_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_productivity`
--
ALTER TABLE `user_productivity`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
