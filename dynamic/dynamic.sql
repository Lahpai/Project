-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2023 at 04:16 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dynamic`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE `author` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(256) NOT NULL,
  `author_email` varchar(256) NOT NULL,
  `author_password` varchar(256) NOT NULL,
  `author_bio` longtext NOT NULL,
  `author_role` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`author_id`, `author_name`, `author_email`, `author_password`, `author_bio`, `author_role`) VALUES
(1, 'San ', 'san@gmail.com', '$2y$10$3cNQt9KvUx1MQpMp91pUsOSAf7yYBUyWFgUSV5rWr6O1m9HntzTWS', 'Hi', 'admin'),
(2, 'Dave', 'dave@gmail.com', '$2y$10$cPFeQn/CM/C9.ise6aiSS.YREcUWXOK4OCV1NXGgRC.Q9o3QuPjVC', 'Enter Bio', 'author');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Sports'),
(2, 'Technology ');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_content` longtext NOT NULL,
  `post_category` int(20) NOT NULL,
  `post_author` int(20) NOT NULL,
  `post_date` varchar(255) NOT NULL,
  `post_keywords` varchar(255) NOT NULL,
  `post_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `post_title`, `post_content`, `post_category`, `post_author`, `post_date`, `post_keywords`, `post_image`) VALUES
(1, 'Football', '<p>Football, in its various forms, has a rich history and has produced many iconic athletes and memorable moments in the world of sports.</p>', 1, 1, '31/10/23', 'Football Soccer', 'uploads/6540593808d636.44852119.jpg'),
(2, 'Premier League weekend review', '<p>Following a weekend of Premier League drama, Alex Keble looks at the key talking points and tactical lessons including:</p>', 1, 1, '31/10/23', 'Football Soccer', 'uploads/654139a873d039.11749532.jpg'),
(3, 'Lionel Messi wins eighth Ballon d’Or', '<p><a style=\"-webkit-font-smoothing: antialiased; margin: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-variant-position: inherit; font-stretch: inherit; font-size: 16px; line-height: inherit; font-family: HaasGrotTextR-55Roman; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: #0000ee;\" href=\"https://www.foxsports.com/soccer/lionel-messi-player\">Lionel Messi</a><span style=\"font-family: HaasGrotTextR-55Roman; font-size: 16px;\">&nbsp;was crowned the Ballon d\'Or winner as the world\'s best soccer player for the eighth time during the annual awards ceremony Monday in Paris.</span></p>', 1, 1, '31/10/23', 'Football Soccer', 'uploads/65407f151b57a2.22663933.jpg'),
(4, 'What’s the Internet Like Today?', '<p>Every day as I get my son ready for daycare, I recite seven words: &ldquo;Hey Google, what&rsquo;s the weather like today?&rdquo; The results from this now-&lsquo;ritual&rsquo; search dictate what he&rsquo;ll wear, what type of extra clothes I will pack, and whether we&rsquo;ll need a jacket for the bike ride.</p>\r\n<p>Whatever way you seek to learn the day&rsquo;s forecast, the medium that you&rsquo;re consulting isn&rsquo;t physically measuring or predicting the weather but is relaying the measurements and predictions of those that do in a digestible manner. The Internet plays a significant role in distributing and communicating this information but also helps meteorologists collect data from all parts of the world, including remote sensors, to improve these predictions.</p>\r\n<p>Meteorologists will be the first to admit they don&rsquo;t always get their predictions right. However, they do an exceptional job considering the thousands of different factors they need to account for, and hundreds they can&rsquo;t, to determine why it rained in one neighborhood but didn&rsquo;t in the next. The fact that you can get such localized weather conditions is a modern marvel that most take for granted.</p>\r\n<p>Considering society&rsquo;s reliance on reliable, secure, and increasingly fast Internet connectivity, measuring the Internet is similarly important and challenging as predicting the weather and measuring the climate. It&rsquo;s why we established Internet Society Pulse, which in many ways works like your weather app to provide a snapshot of the health, availability, and evolution of the Internet.</p>\r\n<p>While the Internet is not bound by geopolitical borders, it&rsquo;s natural that many people are interested to know the strengths and weaknesses of the Internet in their own country. The Internet Society Pulse Country Reports help with this by consolidating and providing context surrounding the four Pulse research themes for every country, state, and region globally.</p>', 2, 1, '01/11/23', 'Internet', 'uploads/6541ad837da607.96888054.jpg'),
(5, 'Has Humane Created the Next iPhone—or the Next Google Glass?', '<p class=\"first\" style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; box-sizing: border-box; text-size-adjust: 100%; margin: 0px 0px 1em; font-family: metaserif, Georgia, serif; color: #222426; font-size: 18px; background-color: #fffdfa; text-rendering: optimizelegibility !important; -webkit-font-smoothing: antialiased !important;\">In late September, a stakeholder in Humane received a humbled message from the startup. The Information&nbsp;<a style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; box-sizing: border-box; text-size-adjust: 100%; background-color: transparent; color: #222426; text-decoration-line: none; transition: color 0.2s ease 0s; background-image: linear-gradient(rgba(121, 130, 149, 0.25) 0%, #798295 100%); background-position: 0px 96%; background-size: 1px 1px; background-repeat: repeat-x; text-shadow: #ffffff 4px 0px, #ffffff 2px 0px, #ffffff 1px 0px, #ffffff -3px 0px, #ffffff -2px 0px, #ffffff -3px 0px; text-rendering: optimizelegibility !important; -webkit-font-smoothing: antialiased !important;\" href=\"https://www.theinformation.com/articles/designer-jony-ive-and-open-ais-sam-altman-discuss-ai-hardware-project?rc=ivonh2\">had just broken the news</a>&nbsp;that OpenAI CEO Sam Altman&nbsp;had been secretly meeting with renowned former Apple designer Jony Ive. The duo was dreaming up the &ldquo;iPhone of artificial intelligence,&rdquo; according to later reports, and had been speaking with SoftBank CEO Masayoshi Son about funding their plans.</p>\r\n<p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; box-sizing: border-box; text-size-adjust: 100%; margin: 0px 0px 1em; font-family: metaserif, Georgia, serif; color: #222426; font-size: 18px; background-color: #fffdfa; text-rendering: optimizelegibility !important; -webkit-font-smoothing: antialiased !important;\">Unfortunately for Humane, the idea sounded uncannily similar to the product it had been stealthily working on for years: a wearable assistant built in part on&nbsp;<a class=\"org-chart-link\" style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; box-sizing: border-box; text-size-adjust: 100%; background-color: transparent; color: #222426; text-decoration-line: none; background-image: linear-gradient(rgba(121, 130, 149, 0.25) 0%, #798295 100%); transition: color 0.2s ease 0s; background-position: 0px 96%; background-size: 1px 1px; background-repeat: repeat-x; text-shadow: #ffffff 4px 0px, #ffffff 2px 0px, #ffffff 1px 0px, #ffffff -3px 0px, #ffffff -2px 0px, #ffffff -3px 0px; text-rendering: optimizelegibility !important; -webkit-font-smoothing: antialiased !important;\" href=\"https://www.theinformation.com/org-charts/openai\">OpenAI</a>&nbsp;technology. Even more embarrassing,&nbsp;Altman is a significant shareholder in Humane, according to&nbsp;filings&nbsp;the company has submitted to the&nbsp;Federal Communications Commission. The previously unreported message to stakeholders, which The Information viewed, explained that Humane was not involved in the Altman-Ive project in any way.</p>\r\n<p style=\"--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-scroll-snap-strictness: proximity; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(59,130,246,.5); --tw-ring-offset-shadow: 0 0 #0000; --tw-ring-shadow: 0 0 #0000; --tw-shadow: 0 0 #0000; --tw-shadow-colored: 0 0 #0000; box-sizing: border-box; text-size-adjust: 100%; margin: 0px 0px 1em; font-family: metaserif, Georgia, serif; color: #222426; font-size: 18px; background-color: #fffdfa; text-rendering: optimizelegibility !important; -webkit-font-smoothing: antialiased !important;\">Altman later said his plans with Ive were in a &ldquo;very nascent stage,&rdquo; but the news of his straying attention couldn&rsquo;t have come at a worse time for Humane. The five-year-old company had been planning to unveil the full details of its blockbuster first product, the Ai Pin, to coincide with the solar eclipse on October 14. Instead, the company quietly pushed the launch date to November 9.</p>', 2, 2, '01/11/23', 'The AI future is calling...', 'uploads/6541aefe79db88.93346786.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`setting_name`, `setting_value`) VALUES
('home_jumbo_desc', 'Welcome to my Dynamic Website!'),
('home_jumbo_title', 'My Website');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `author`
--
ALTER TABLE `author`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`setting_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `author`
--
ALTER TABLE `author`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
