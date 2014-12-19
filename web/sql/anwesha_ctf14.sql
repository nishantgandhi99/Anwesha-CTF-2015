-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 30, 2014 at 01:11 PM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `anwesha_ctf14`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `Pid` int(11) NOT NULL,
  `Ppage` varchar(50) NOT NULL,
  `Panswer` varchar(50) NOT NULL,
  `Ppoint` int(11) NOT NULL,
  PRIMARY KEY (`Pid`)
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
  `Pass` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id` (`Id`),
  UNIQUE KEY `Id_2` (`Id`),
  UNIQUE KEY `Id_5` (`Id`),
  FULLTEXT KEY `Id_3` (`Id`),
  FULLTEXT KEY `Id_4` (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth`
--

INSERT INTO `auth` (`Id`, `Pass`) VALUES
('nishant', '584ae3a6ab89d67b476b2e732e7f73d6'),
('xyz', 'd16fb36f0911f878998c136191af705e'),
('a', '0cc175b9c0f1b6a831c399e269772661'),
('R', '4b43b0aee35624cd95b910189b3dc231'),
('ni', 'e6c151d449e1db05b1ffb5ad5ec656cf');

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

--
-- Dumping data for table `problems`
--

INSERT INTO `problems` (`Id`, `p1`, `p2`, `p3`, `p4`, `p5`, `p6`, `p7`, `p8`, `p9`, `p10`, `p11`, `p12`, `p13`, `p14`, `p15`, `total`) VALUES
('nishant', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 15),
('xyz', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20),
('a', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 55),
('R', 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20),
('ni', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

CREATE TABLE IF NOT EXISTS `userinfo` (
  `Name` varchar(50) NOT NULL,
  `Id` varchar(10) NOT NULL,
  `clg` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `ph_no` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userinfo`
--

INSERT INTO `userinfo` (`Name`, `Id`, `clg`, `email`, `ph_no`) VALUES
('nish', 'nishant', 'nishant', 'x@y.com', '123456'),
('xyz', 'xyz', 'xyz', 'x@y.com', '123456'),
('a', 'a', 'a', 'z@m.com', '1'),
('r', 'R', 'r', 'x@y.com', '45'),
('ni', 'ni', 'ni', 'v@c.com', '78');

