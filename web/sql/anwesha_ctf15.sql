-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 07, 2015 at 08:37 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
CREATE USER 'ctf'@'localhost'; GRANT SELECT, INSERT, UPDATE, DELETE ON *.* TO 'ctf'@'localhost';
CREATE DATABASE IF NOT EXISTS anwesha_ctf15;
USE anwesha_ctf15;
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `anwesha_ctf15`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `Pid` int(11) NOT NULL,
  `Ppage` varchar(50) NOT NULL,
  `Panswer` varchar(50) NOT NULL,
  `Ppoint` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`Pid`, `Ppage`, `Panswer`, `Ppoint`) VALUES
(0, 'juststarted.jsp', 'so_i_started', 5),
(1, 'findf.jsp', 'so_you_found!!', 5),
(2, 'LoginForFlag.jsp', 'But_i_was_hidden', 10),
(3, 'Select.jsp', 'yummy_mango', 10),
(4, 'Browser.jsp', 'browser_was_fu**ed', 10),
(5, 'prompt.jsp', 'javascipt_is_pain_in_a**', 15),
(6, 'RegisterForFlag.jsp', 'cookie_was_bitter', 15),
(7, 'FindText.jsp', 'you_are_smart_a**', 20),
(8, 'decode.jsp', 'you_fu**ing_cracked_it', 20),
(9, 'disassembler.jsp', 'you_fu**ed_this_program', 20),
(10, 'encoding.jsp', 'Character_Set_Sucks', 25);

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE IF NOT EXISTS `auth` (
  `Id` varchar(50) NOT NULL,
  `Pass` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `problems`
--

CREATE TABLE IF NOT EXISTS `problems` (
  `Id` varchar(50) NOT NULL,
  `p1` int(11) NOT NULL,
  `p2` int(11) NOT NULL,
  `p3` int(11) NOT NULL,
  `p4` int(11) NOT NULL,
  `p5` int(11) NOT NULL,
  `p6` int(11) NOT NULL,
  `p7` int(11) NOT NULL,
  `p8` int(11) NOT NULL,
  `p9` int(11) NOT NULL,
  `p10` int(11) NOT NULL,
  `p11` int(11) NOT NULL,
  `p12` int(11) NOT NULL,
  `p13` int(11) NOT NULL,
  `p14` int(11) NOT NULL,
  `p15` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `Name` varchar(50) NOT NULL,
  `Id` varchar(10) NOT NULL,
  `clg` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `ph_no` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
 ADD PRIMARY KEY (`Pid`);

--
-- Indexes for table `auth`
--
ALTER TABLE `auth`
 ADD PRIMARY KEY (`Id`), ADD UNIQUE KEY `Id` (`Id`), ADD UNIQUE KEY `Id_2` (`Id`), ADD UNIQUE KEY `Id_5` (`Id`), ADD FULLTEXT KEY `Id_3` (`Id`), ADD FULLTEXT KEY `Id_4` (`Id`);

--
-- Indexes for table `userinfo`
--
ALTER TABLE `userinfo`
 ADD PRIMARY KEY (`Id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
