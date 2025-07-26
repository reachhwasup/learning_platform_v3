-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 26, 2025 at 12:13 PM
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
-- Database: `security_awareness_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `certificates`
--

CREATE TABLE `certificates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assessment_id` int(11) NOT NULL,
  `certificate_code` varchar(255) NOT NULL,
  `issued_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `certificates`
--

INSERT INTO `certificates` (`id`, `user_id`, `assessment_id`, `certificate_code`, `issued_at`) VALUES
(1, 2, 4, 'CERT-6866622E97DAF-2', '2025-07-03 10:57:50');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`) VALUES
(3, 'Finance'),
(2, 'Human Resources'),
(1, 'Information Technology'),
(4, 'Marketing'),
(5, 'Operations');

-- --------------------------------------------------------

--
-- Table structure for table `final_assessments`
--

CREATE TABLE `final_assessments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(5,2) NOT NULL,
  `status` enum('passed','failed') NOT NULL,
  `quiz_started_at` datetime DEFAULT NULL,
  `quiz_ended_at` datetime DEFAULT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `final_assessments`
--

INSERT INTO `final_assessments` (`id`, `user_id`, `score`, `status`, `quiz_started_at`, `quiz_ended_at`, `completed_at`) VALUES
(1, 2, 15.00, 'failed', NULL, NULL, '2025-07-03 06:06:42'),
(2, 2, 5.00, 'failed', NULL, NULL, '2025-07-03 06:07:43'),
(3, 2, 35.00, 'failed', NULL, NULL, '2025-07-03 10:38:39'),
(4, 2, 95.00, 'passed', NULL, NULL, '2025-07-03 10:57:50'),
(5, 6, 65.00, 'failed', NULL, NULL, '2025-07-22 10:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `module_order` int(11) NOT NULL,
  `pdf_material_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `title`, `description`, `module_order`, `pdf_material_path`, `created_at`, `updated_at`) VALUES
(1, 'Security', 'Information', 1, '1751522112_DOC-20221128-WA0011 (1).pdf', '2025-07-03 05:55:12', '2025-07-03 05:55:12'),
(2, 'Data Protection', '', 2, '1751559205_កាលបរិច្ឆេទ.pdf', '2025-07-03 16:13:25', '2025-07-03 16:13:25'),
(4, 'Introduction', '', 0, '1751559957_Certificate.pdf', '2025-07-03 16:25:57', '2025-07-03 16:25:57');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `module_id` int(11) DEFAULT NULL,
  `question_text` text NOT NULL,
  `question_type` enum('single','multiple') NOT NULL,
  `is_final_exam_question` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `module_id`, `question_text`, `question_type`, `is_final_exam_question`, `created_at`) VALUES
(1, 1, 'What does the \'S\' in HTTPS stand for?', 'single', 0, '2025-07-03 06:03:02'),
(3, 1, 'Which of these is a common sign of a phishing email? (Select all that apply)', 'multiple', 0, '2025-07-03 06:03:02'),
(4, 1, 'An unsolicited call from someone claiming to be from IT support asks for your password. This is likely an example of:', 'single', 0, '2025-07-03 06:03:02'),
(6, 1, 'If you hover your mouse over a link in an email, where should you look to verify its true destination?', 'single', 0, '2025-07-03 06:03:02'),
(9, 1, 'A sense of urgency, like \'Your account will be suspended in 24 hours!\', is a common tactic in phishing emails.', 'single', 0, '2025-07-03 06:03:02'),
(10, 1, 'What does the \'S\' in HTTPS stand for?', 'single', 0, '2025-07-03 08:20:29'),
(12, 1, 'Which of these is a common sign of a phishing email? (Select all that apply)', 'multiple', 0, '2025-07-03 08:20:29'),
(13, 1, 'An unsolicited call from someone claiming to be from IT support asks for your password. This is likely an example of:', 'single', 0, '2025-07-03 08:20:29'),
(15, 1, 'If you hover your mouse over a link in an email, where should you look to verify its true destination?', 'single', 0, '2025-07-03 08:20:29'),
(28, 1, 'What does the \'S\' in HTTPS stand for?', 'single', 0, '2025-07-03 10:53:19'),
(29, NULL, 'Which of the following are examples of PII (Personally Identifiable Information)? Select all that apply.', 'multiple', 1, '2025-07-03 10:53:19'),
(30, 1, 'Which of these is a common sign of a phishing email? (Select all that apply)', 'multiple', 0, '2025-07-03 10:53:19'),
(31, 1, 'An unsolicited call from someone claiming to be from IT support asks for your password. This is likely an example of:', 'single', 0, '2025-07-03 10:53:19'),
(32, NULL, 'Which type of Wi-Fi network is generally the safest to use for work?', 'single', 1, '2025-07-03 10:53:19'),
(33, 1, 'If you hover your mouse over a link in an email, where should you look to verify its true destination?', 'single', 0, '2025-07-03 10:53:19'),
(34, NULL, 'Finding a USB drive in the parking lot and plugging it into your work computer is...', 'single', 1, '2025-07-03 10:53:19'),
(35, NULL, 'Using public Wi-Fi at a coffee shop for confidential work is...', 'single', 1, '2025-07-03 10:53:19'),
(36, 1, 'A sense of urgency, like \'Your account will be suspended in 24 hours!\', is a common tactic in phishing emails.', 'single', 0, '2025-07-03 10:53:19'),
(37, NULL, 'What is the primary goal of a \'Denial of Service\' (DoS) attack?', 'single', 1, '2025-07-03 10:53:19'),
(38, NULL, 'Which of the following is an example of two-factor authentication (2FA)?', 'single', 1, '2025-07-03 10:53:19'),
(39, NULL, 'What does PII stand for?', 'single', 1, '2025-07-03 10:53:19'),
(40, NULL, 'You find a USB drive in the office kitchen. What is the safest course of action?', 'single', 1, '2025-07-03 10:53:19'),
(41, NULL, 'Which of these are characteristics of a strong password? (Select all that apply)', 'multiple', 1, '2025-07-03 10:53:19'),
(42, NULL, 'What is \'social engineering\' in the context of information security?', 'single', 1, '2025-07-03 10:53:19'),
(43, NULL, 'What is the main purpose of a firewall?', 'single', 1, '2025-07-03 10:53:19'),
(44, NULL, 'Is it generally safe to use public Wi-Fi (e.g., at a cafe or airport) for sensitive activities like online banking?', 'single', 1, '2025-07-03 10:53:19'),
(45, NULL, 'What does \'malware\' mean?', 'single', 1, '2025-07-03 10:53:19'),
(46, NULL, 'An email from your CEO asks you to urgently transfer money to a new supplier. The request is unusual. What should you do first?', 'single', 1, '2025-07-03 10:53:19'),
(47, NULL, 'What is \'spear phishing\'?', 'single', 1, '2025-07-03 10:53:19'),
(48, NULL, 'Which of the following are good practices for physical security at the office? (Select all that apply)', 'multiple', 1, '2025-07-03 10:53:19'),
(49, NULL, 'What is the \'principle of least privilege\'?', 'single', 1, '2025-07-03 10:53:19'),
(50, NULL, 'What should you do if you suspect your work computer has been infected with a virus?', 'single', 1, '2025-07-03 10:53:19'),
(51, NULL, 'What is a \'VPN\'?', 'single', 1, '2025-07-03 10:53:19'),
(52, NULL, 'Why is it a bad idea to use the same password for multiple websites?', 'single', 1, '2025-07-03 10:53:19'),
(53, NULL, 'Which of these indicates a website is likely secure for entering sensitive information?', 'single', 1, '2025-07-03 10:53:19'),
(54, NULL, 'What is \'data encryption\'?', 'single', 1, '2025-07-03 10:53:19'),
(55, NULL, 'You receive a text message with a link, claiming you\'ve won a prize. This could be an example of:', 'single', 1, '2025-07-03 10:53:19'),
(56, NULL, 'When creating a password, which of these is the LEAST secure?', 'single', 1, '2025-07-03 10:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `option_text` varchar(255) NOT NULL,
  `is_correct` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_options`
--

INSERT INTO `question_options` (`id`, `question_id`, `option_text`, `is_correct`) VALUES
(1, 1, 'Secure', 1),
(2, 1, 'System', 0),
(3, 1, 'Standard', 0),
(4, 1, 'Safe', 0),
(9, 3, 'Generic greetings like \'Dear Customer\'', 1),
(10, 3, 'Spelling and grammar mistakes', 1),
(11, 3, 'A request for personal information', 1),
(12, 3, 'An email from your direct manager', 0),
(13, 4, 'Vishing (Voice Phishing)', 1),
(14, 4, 'Spyware', 0),
(15, 4, 'A normal security check', 0),
(16, 4, 'Ransomware', 0),
(21, 6, 'In the email\'s subject line', 0),
(22, 6, 'In the bottom-left corner of your browser or email client', 1),
(23, 6, 'Nowhere, you must click it to find out', 0),
(24, 6, 'In the sender\'s address', 0),
(33, 9, '1', 1),
(34, 10, 'Secure', 1),
(35, 10, 'System', 0),
(36, 10, 'Standard', 0),
(37, 10, 'Safe', 0),
(42, 12, 'Generic greetings like \'Dear Customer\'', 1),
(43, 12, 'Spelling and grammar mistakes', 1),
(44, 12, 'A request for personal information', 1),
(45, 12, 'An email from your direct manager', 0),
(46, 13, 'Vishing (Voice Phishing)', 1),
(47, 13, 'Spyware', 0),
(48, 13, 'A normal security check', 0),
(49, 13, 'Ransomware', 0),
(54, 15, 'In the email\'s subject line', 0),
(55, 15, 'In the bottom-left corner of your browser or email client', 1),
(56, 15, 'Nowhere, you must click it to find out', 0),
(57, 15, 'In the sender\'s address', 0),
(100, 28, 'Secure', 1),
(101, 28, 'System', 0),
(102, 28, 'Standard', 0),
(103, 28, 'Safe', 0),
(104, 29, 'Full Name', 1),
(105, 29, 'Email Address', 1),
(106, 29, 'Favorite Color', 0),
(107, 29, 'Date of Birth', 1),
(108, 30, 'Generic greetings like \'Dear Customer\'', 1),
(109, 30, 'Spelling and grammar mistakes', 1),
(110, 30, 'A request for personal information', 1),
(111, 30, 'An email from your direct manager', 0),
(112, 31, 'Vishing (Voice Phishing)', 1),
(113, 31, 'Spyware', 0),
(114, 31, 'A normal security check', 0),
(115, 31, 'Ransomware', 0),
(116, 32, 'A password-protected company Wi-Fi network', 1),
(117, 32, 'Free public Wi-Fi at a cafe', 0),
(118, 32, 'Your neighbor\'s unlocked Wi-Fi', 0),
(119, 32, 'Any network with \'Free\' in the name', 0),
(120, 33, 'In the email\'s subject line', 0),
(121, 33, 'In the bottom-left corner of your browser or email client', 1),
(122, 33, 'Nowhere, you must click it to find out', 0),
(123, 33, 'In the sender\'s address', 0),
(124, 34, 'A good way to find its owner', 0),
(125, 34, 'A major security risk', 1),
(126, 34, 'Okay if you run a quick virus scan first', 0),
(127, 34, 'Harmless', 0),
(128, 35, 'Secure as long as the website is HTTPS', 0),
(129, 35, 'Risky, as others on the network could potentially intercept your data', 1),
(130, 35, 'Recommended for its convenience', 0),
(131, 35, 'Only risky if you are downloading files', 0),
(132, 36, '1', 1),
(133, 37, 'To steal data', 0),
(134, 37, 'To make a network or website unavailable to legitimate users', 1),
(135, 37, 'To install a virus', 0),
(136, 37, 'To gain administrator access', 0),
(137, 38, 'Using a password and a security question', 0),
(138, 38, 'Using your fingerprint and face ID', 0),
(139, 38, 'Using your password and a one-time code sent to your phone', 1),
(140, 38, 'Using two different passwords', 0),
(141, 39, 'Personal Internet Information', 0),
(142, 39, 'Personally Identifiable Information', 1),
(143, 39, 'Private Internet Identifier', 0),
(144, 39, 'Personalized Information Inquiry', 0),
(145, 40, 'Plug it into your computer to see who it belongs to', 0),
(146, 40, 'Give it to the IT department or security office without plugging it in', 1),
(147, 40, 'Ask your colleagues if it belongs to them', 0),
(148, 40, 'Ignore it', 0),
(149, 41, 'Is at least 12 characters long', 1),
(150, 41, 'Contains a mix of upper/lowercase letters, numbers, and symbols', 1),
(151, 41, 'Is a common word found in the dictionary', 0),
(152, 41, 'Is your date of birth', 0),
(153, 41, 'Is unique for each account', 1),
(154, 42, 'A type of friendly software', 0),
(155, 42, 'The psychological manipulation of people into performing actions or divulging confidential information', 1),
(156, 42, 'A method for securing social media accounts', 0),
(157, 42, 'A networking event for IT professionals', 0),
(158, 43, 'To prevent your computer from overheating', 0),
(159, 43, 'To scan for viruses in email attachments', 0),
(160, 43, 'To monitor and control incoming and outgoing network traffic based on security rules', 1),
(161, 43, 'To make your internet connection faster', 0),
(162, 44, 'Yes, as long as the Wi-Fi has a password', 0),
(163, 44, 'No, public Wi-Fi networks are often unsecured and can expose your data to attackers', 1),
(164, 44, 'Yes, modern banking websites are completely secure on any network', 0),
(165, 44, 'Only if you use a VPN', 1),
(166, 45, 'A type of computer hardware', 0),
(167, 45, 'A term for all male employees in a company', 0),
(168, 45, 'Malicious software designed to disrupt, damage, or gain unauthorized access to a computer system', 1),
(169, 45, 'A brand of antivirus software', 0),
(170, 46, 'Transfer the money immediately as requested', 0),
(171, 46, 'Verify the request by calling the CEO or speaking to them in person (not by replying to the email)', 1),
(172, 46, 'Forward the email to the finance department and assume they will handle it', 0),
(173, 46, 'Delete the email', 0),
(174, 47, 'A general phishing email sent to millions of people', 0),
(175, 47, 'A targeted phishing attack that uses personalized information to seem more legitimate', 1),
(176, 47, 'A type of fishing sport', 0),
(177, 47, 'A technique to block phishing emails', 0),
(178, 48, 'Locking your computer screen when you step away', 1),
(179, 48, 'Holding the door open for anyone, even if you don\'t recognize them', 0),
(180, 48, 'Wearing your ID badge where it is visible', 1),
(181, 48, 'Leaving sensitive documents face up on your desk overnight', 0),
(182, 49, 'Giving all users administrator rights for convenience', 0),
(183, 49, 'Giving users only the minimum levels of access/permissions that they need to perform their job functions', 1),
(184, 49, 'The principle that the least experienced person should handle security', 0),
(185, 49, 'A rule about not using privileged information for personal gain', 0),
(186, 50, 'Try to delete the suspicious files yourself', 0),
(187, 50, 'Unplug the computer from the network and report it to the IT/security department immediately', 1),
(188, 50, 'Continue working and hope it goes away', 0),
(189, 50, 'Install a new antivirus program', 0),
(190, 51, 'A Very Private Network, used for top-secret government communication', 0),
(191, 51, 'A Virtual Private Network, a tool that creates a secure, encrypted connection over a public network', 1),
(192, 51, 'A Virus Protection Network, another name for a firewall', 0),
(193, 51, 'A type of computer processor', 0),
(194, 52, 'It\'s difficult to remember which password belongs to which site', 0),
(195, 52, 'If one site is breached, attackers can use your password to access your other accounts', 1),
(196, 52, 'It can slow down your computer', 0),
(197, 52, 'Most websites do not allow it', 0),
(198, 53, 'The website address starts with \'http://\'', 0),
(199, 53, 'The website has a professional design', 0),
(200, 53, 'The website address starts with \'https://\' and shows a padlock icon', 1),
(201, 53, 'The website is popular and well-known', 0),
(202, 54, 'The process of deleting data permanently', 0),
(203, 54, 'The process of converting data into a code to prevent unauthorized access', 1),
(204, 54, 'The process of backing up data to the cloud', 0),
(205, 54, 'The process of organizing data into tables', 0),
(206, 55, 'Smishing (SMS Phishing)', 1),
(207, 55, 'Vishing', 0),
(208, 55, 'A legitimate contest', 0),
(209, 55, 'Spyware', 0),
(210, 56, 'A random combination of 15 letters, numbers, and symbols', 0),
(211, 56, 'A short, common word like \'password\' or \'123456\'', 1),
(212, 56, 'A phrase from a song or book', 0),
(213, 56, 'Your old password with one number changed', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `staff_id` varchar(50) NOT NULL,
  `position` varchar(100) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `role` enum('user','admin') NOT NULL DEFAULT 'user',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `password_reset_required` tinyint(1) NOT NULL DEFAULT 0,
  `signup_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `profile_picture` varchar(255) DEFAULT 'default_avatar.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `gender`, `dob`, `staff_id`, `position`, `department_id`, `role`, `status`, `password_reset_required`, `signup_at`, `profile_picture`) VALUES
(1, 'test', 'test', 'test1@gmail.com', '$2y$10$e/zsCi9zRjiyGyB9I9jQIOvpGzQnRul8WECTRGmch63rOp.yG5/6.', 'Male', '2025-07-08', 'test1', 'security', 2, 'admin', 'active', 1, '2025-07-03 05:51:43', 'default_avatar.png'),
(2, 'user', 'user', 'user@gmail.com', '$2y$10$MfKaogwYDuf6S6C.wrTPQOM0pH/bowDc1auqN26vtr1oV1lpBQ9aK', 'Female', '2016-01-04', 'user1', 'Audit', 4, 'user', 'active', 0, '2025-07-03 05:54:10', 'default_avatar.png'),
(3, 'user2', 'user2', 'user2@gmail.com', '$2y$10$TpXvEfAfr.7EvMhsdfkSEed4ezopHT7sQ.DFkuqyLA/uwmtvrqbpq', NULL, NULL, 'user2', NULL, 1, 'user', 'active', 0, '2025-07-03 16:15:27', 'default_avatar.png'),
(5, 'No', 'User3', 'user3@gmail.com', '$2y$10$jfWhqBezqXtzDtXL4VQVWObrWgrrLbmFLEopY.Ir3taytDbLgyZvK', 'Male', '2025-07-22', 'user3', 'Security', 1, 'admin', 'active', 0, '2025-07-21 17:03:33', 'default_avatar.png'),
(6, 'Nii', 'Nii', 'testnii@gmail.com', '$2y$10$MeNV67y7PmbdnbC5gs85G.sn0QFHSsmjSp25N2dtJnDqJTv73nrZq', 'Female', '2025-07-08', 'nii', 'Security', 5, 'user', 'active', 0, '2025-07-22 10:34:48', 'default_avatar.png');

-- --------------------------------------------------------

--
-- Table structure for table `user_answers`
--

CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `assessment_id` int(11) DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `selected_option_id` int(11) NOT NULL,
  `is_correct` tinyint(1) NOT NULL,
  `submitted_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_answers`
--

INSERT INTO `user_answers` (`id`, `user_id`, `assessment_id`, `question_id`, `selected_option_id`, `is_correct`, `submitted_at`) VALUES
(1, 2, NULL, 1, 1, 1, '2025-07-03 06:05:37'),
(2, 2, NULL, 3, 9, 1, '2025-07-03 06:05:37'),
(3, 2, NULL, 3, 10, 1, '2025-07-03 06:05:37'),
(4, 2, NULL, 3, 11, 1, '2025-07-03 06:05:37'),
(5, 2, NULL, 4, 13, 1, '2025-07-03 06:05:37'),
(6, 2, NULL, 9, 33, 1, '2025-07-03 06:05:37'),
(18, 2, 4, 53, 200, 1, '2025-07-03 10:57:50'),
(19, 2, 4, 55, 206, 1, '2025-07-03 10:57:50'),
(20, 2, 4, 45, 168, 1, '2025-07-03 10:57:50'),
(21, 2, 4, 52, 195, 1, '2025-07-03 10:57:50'),
(22, 2, 4, 46, 171, 1, '2025-07-03 10:57:50'),
(23, 2, 4, 37, 134, 1, '2025-07-03 10:57:50'),
(24, 2, 4, 56, 211, 1, '2025-07-03 10:57:50'),
(25, 2, 4, 44, 165, 0, '2025-07-03 10:57:50'),
(26, 2, 4, 39, 142, 1, '2025-07-03 10:57:50'),
(27, 2, 4, 38, 139, 1, '2025-07-03 10:57:50'),
(28, 2, 4, 50, 187, 1, '2025-07-03 10:57:50'),
(29, 2, 4, 49, 183, 1, '2025-07-03 10:57:50'),
(30, 2, 4, 54, 203, 1, '2025-07-03 10:57:50'),
(31, 2, 4, 42, 155, 1, '2025-07-03 10:57:50'),
(32, 2, 4, 47, 175, 1, '2025-07-03 10:57:50'),
(33, 2, 4, 35, 129, 1, '2025-07-03 10:57:50'),
(34, 2, 4, 34, 125, 1, '2025-07-03 10:57:50'),
(35, 2, 4, 43, 160, 1, '2025-07-03 10:57:50'),
(36, 2, 4, 48, 178, 1, '2025-07-03 10:57:50'),
(37, 2, 4, 48, 180, 1, '2025-07-03 10:57:50'),
(38, 2, 4, 41, 149, 1, '2025-07-03 10:57:50'),
(39, 2, 4, 41, 150, 1, '2025-07-03 10:57:50'),
(40, 2, 4, 41, 153, 1, '2025-07-03 10:57:50'),
(41, 3, NULL, 4, 13, 1, '2025-07-03 16:21:46'),
(42, 3, NULL, 6, 22, 1, '2025-07-03 16:21:46'),
(43, 3, NULL, 36, 132, 1, '2025-07-03 16:21:46'),
(44, 3, NULL, 3, 9, 1, '2025-07-03 16:21:46'),
(45, 3, NULL, 3, 10, 1, '2025-07-03 16:21:46'),
(46, 3, NULL, 3, 11, 1, '2025-07-03 16:21:46'),
(47, 6, 5, 34, 125, 1, '2025-07-22 10:48:34'),
(48, 6, 5, 42, 155, 1, '2025-07-22 10:48:34'),
(49, 6, 5, 47, 175, 1, '2025-07-22 10:48:34'),
(50, 6, 5, 45, 168, 1, '2025-07-22 10:48:34'),
(51, 6, 5, 48, 178, 0, '2025-07-22 10:48:34'),
(52, 6, 5, 48, 179, 0, '2025-07-22 10:48:34'),
(53, 6, 5, 48, 180, 0, '2025-07-22 10:48:34'),
(54, 6, 5, 48, 181, 0, '2025-07-22 10:48:34'),
(55, 6, 5, 43, 160, 1, '2025-07-22 10:48:34'),
(56, 6, 5, 40, 148, 0, '2025-07-22 10:48:34'),
(57, 6, 5, 53, 200, 1, '2025-07-22 10:48:34'),
(58, 6, 5, 49, 185, 0, '2025-07-22 10:48:34'),
(59, 6, 5, 50, 187, 1, '2025-07-22 10:48:34'),
(60, 6, 5, 39, 142, 1, '2025-07-22 10:48:34'),
(61, 6, 5, 41, 149, 0, '2025-07-22 10:48:34'),
(62, 6, 5, 41, 150, 0, '2025-07-22 10:48:34'),
(63, 6, 5, 41, 151, 0, '2025-07-22 10:48:34'),
(64, 6, 5, 41, 152, 0, '2025-07-22 10:48:34'),
(65, 6, 5, 41, 153, 0, '2025-07-22 10:48:34'),
(66, 6, 5, 56, 211, 1, '2025-07-22 10:48:34'),
(67, 6, 5, 29, 104, 0, '2025-07-22 10:48:34'),
(68, 6, 5, 29, 105, 0, '2025-07-22 10:48:34'),
(69, 6, 5, 29, 106, 0, '2025-07-22 10:48:34'),
(70, 6, 5, 29, 107, 0, '2025-07-22 10:48:34'),
(71, 6, 5, 32, 116, 1, '2025-07-22 10:48:34'),
(72, 6, 5, 46, 171, 1, '2025-07-22 10:48:34'),
(73, 6, 5, 38, 138, 0, '2025-07-22 10:48:34'),
(74, 6, 5, 55, 206, 1, '2025-07-22 10:48:34'),
(75, 6, 5, 54, 203, 1, '2025-07-22 10:48:34'),
(76, 6, 5, 44, 163, 0, '2025-07-22 10:48:34');

-- --------------------------------------------------------

--
-- Table structure for table `user_progress`
--

CREATE TABLE `user_progress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `completed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_progress`
--

INSERT INTO `user_progress` (`id`, `user_id`, `module_id`, `completed_at`) VALUES
(1, 2, 1, '2025-07-03 06:05:08'),
(2, 3, 1, '2025-07-03 16:20:30'),
(3, 3, 2, '2025-07-03 16:22:08'),
(4, 3, 4, '2025-07-03 16:56:52'),
(5, 6, 4, '2025-07-22 10:36:28'),
(6, 6, 1, '2025-07-22 10:38:24'),
(7, 6, 2, '2025-07-22 10:39:28');

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `video_path` varchar(255) NOT NULL,
  `thumbnail_path` varchar(255) DEFAULT NULL,
  `upload_by` int(11) NOT NULL,
  `upload_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `edit_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `module_id`, `title`, `description`, `video_path`, `thumbnail_path`, `upload_by`, `upload_at`, `edit_at`) VALUES
(1, 1, 'Ttest', 'Hello ', 'module_1_1751522691.mp4', 'module_1_thumb_1751558999.png', 1, '2025-07-03 06:04:51', '2025-07-03 16:12:14'),
(2, 2, 'test', '', 'module_2_video_1751559226.mp4', 'module_2_thumb_1751559226.png', 1, '2025-07-03 16:13:46', '2025-07-03 16:13:46'),
(4, 4, 'Ttest1', '', 'module_4_video_1751559978.mp4', 'module_4_thumb_1751559978.jpg', 1, '2025-07-03 16:26:18', '2025-07-03 16:26:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `certificate_code` (`certificate_code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `assessment_id` (`assessment_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `final_assessments`
--
ALTER TABLE `final_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_order` (`module_order`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question_options`
--
ALTER TABLE `question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `staff_id` (`staff_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `selected_option_id` (`selected_option_id`);

--
-- Indexes for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_module_unique` (`user_id`,`module_id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`),
  ADD KEY `upload_by` (`upload_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `final_assessments`
--
ALTER TABLE `final_assessments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `question_options`
--
ALTER TABLE `question_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_answers`
--
ALTER TABLE `user_answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `user_progress`
--
ALTER TABLE `user_progress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `certificates_ibfk_2` FOREIGN KEY (`assessment_id`) REFERENCES `final_assessments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `final_assessments`
--
ALTER TABLE `final_assessments`
  ADD CONSTRAINT `final_assessments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_options`
--
ALTER TABLE `question_options`
  ADD CONSTRAINT `question_options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`);

--
-- Constraints for table `user_answers`
--
ALTER TABLE `user_answers`
  ADD CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`selected_option_id`) REFERENCES `question_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_progress`
--
ALTER TABLE `user_progress`
  ADD CONSTRAINT `user_progress_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_progress_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `videos`
--
ALTER TABLE `videos`
  ADD CONSTRAINT `videos_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `videos_ibfk_2` FOREIGN KEY (`upload_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
