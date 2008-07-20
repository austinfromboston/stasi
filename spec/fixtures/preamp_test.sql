-- MySQL dump 10.10
--
-- Host: localhost    Database: preamp
-- ------------------------------------------------------
-- Server version	5.0.27-standard-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alert_emails`
--

DROP TABLE IF EXISTS `alert_emails`;
CREATE TABLE `alert_emails` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) NOT NULL default '',
  `domain` varchar(100) NOT NULL default '',
  `added` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `user_ID` int(11) NOT NULL default '0',
  `First_Name` varchar(100) NOT NULL default '',
  `Last_Name` varchar(100) NOT NULL default '',
  `Phone` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
CREATE TABLE `alerts` (
  `id` int(11) NOT NULL auto_increment,
  `publish` tinyint(4) default NULL,
  `alert_text` text,
  `alert_title` varchar(255) default NULL,
  `date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `amp_clients`
--

DROP TABLE IF EXISTS `amp_clients`;
CREATE TABLE `amp_clients` (
  `client_id` int(11) NOT NULL auto_increment,
  `Organization` varchar(100) NOT NULL default '',
  `URL` varchar(100) default NULL,
  `username` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `alt_db` varchar(250) default NULL,
  `no_sync` tinyint(4) NOT NULL default '0',
  `date_started` date default NULL,
  `date_closed` date default NULL,
  `URL_others` varchar(100) default NULL,
  `db_others` varchar(100) default NULL,
  `dns` varchar(100) default NULL,
  `main_name` varchar(100) default NULL,
  `main_email` varchar(100) default NULL,
  `main_phone` varchar(100) default NULL,
  `billing_name` varchar(100) default NULL,
  `billing_email` varchar(100) default NULL,
  `billing_phone` varchar(100) default NULL,
  `other_name` varchar(100) default NULL,
  `other_email` text,
  `other_phone` varchar(100) default NULL,
  `rate_hourly` int(11) NOT NULL default '95',
  `rate_montly` int(11) NOT NULL default '0',
  `support_hours` float NOT NULL default '0.5',
  `service` text,
  `Street` varchar(255) default NULL,
  `Street_2` varchar(255) default NULL,
  `City` varchar(255) default NULL,
  `State` varchar(255) default NULL,
  `Zip` varchar(255) default NULL,
  `project_contact` int(11) NOT NULL default '0',
  `billing_contact` int(11) NOT NULL default '0',
  `tech_contact` int(11) NOT NULL default '0',
  `client_status` enum('setup','active','off','closed','free') NOT NULL default 'active',
  `notes` text,
  `balence` float NOT NULL default '0',
  `ampsite` varchar(10) default NULL,
  `support_contract` varchar(10) default NULL,
  `development_contract` varchar(10) default NULL,
  `bay_area` varchar(10) default NULL,
  PRIMARY KEY  (`client_id`)
) ENGINE=MyISAM AUTO_INCREMENT=173 DEFAULT CHARSET=latin1;

--
-- Table structure for table `amp_db`
--

DROP TABLE IF EXISTS `amp_db`;
CREATE TABLE `amp_db` (
  `id` int(11) NOT NULL auto_increment,
  `amp_id` int(11) NOT NULL default '0',
  `client_id` int(11) NOT NULL default '0',
  `username` varchar(50) NOT NULL default '',
  `password` varchar(50) NOT NULL default '',
  `db` varchar(50) NOT NULL default '',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Table structure for table `amp_domains`
--

DROP TABLE IF EXISTS `amp_domains`;
CREATE TABLE `amp_domains` (
  `domain_id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `amp_id` int(11) NOT NULL default '0',
  `domain` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`domain_id`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

--
-- Table structure for table `amp_sites`
--

DROP TABLE IF EXISTS `amp_sites`;
CREATE TABLE `amp_sites` (
  `amp_id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `username` varchar(255) NOT NULL default '',
  `password` varchar(255) NOT NULL default '',
  `alt_db` varchar(250) default NULL,
  `no_sync` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`amp_id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Table structure for table `amp_user`
--

DROP TABLE IF EXISTS `amp_user`;
CREATE TABLE `amp_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `First_Name` varchar(255) NOT NULL default '',
  `Last_Name` varchar(255) NOT NULL default '',
  `Email` varchar(255) NOT NULL default '',
  `Cell_Phone` varchar(255) NOT NULL default '',
  `Work_Phone` varchar(255) NOT NULL default '',
  `Home_Phone` varchar(255) NOT NULL default '',
  `IM` varchar(255) NOT NULL default '',
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `bandwidth`
--

DROP TABLE IF EXISTS `bandwidth`;
CREATE TABLE `bandwidth` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `gig_over` float NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=631 DEFAULT CHARSET=latin1;

--
-- Table structure for table `billing_client`
--

DROP TABLE IF EXISTS `billing_client`;
CREATE TABLE `billing_client` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(250) NOT NULL default '',
  `rate` int(11) NOT NULL default '0',
  `email` varchar(250) NOT NULL default '',
  `address` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `billing_group`
--

DROP TABLE IF EXISTS `billing_group`;
CREATE TABLE `billing_group` (
  `id` int(11) NOT NULL auto_increment,
  `clientid` int(11) NOT NULL default '0',
  `taskid` int(11) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `billing_task`
--

DROP TABLE IF EXISTS `billing_task`;
CREATE TABLE `billing_task` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(250) default NULL,
  `details` text,
  `staff` varchar(100) default NULL,
  `groupid` int(11) NOT NULL default '0',
  `hours` float NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `billed` int(11) NOT NULL default '0',
  `invoice_id` int(11) default NULL,
  `client_id` int(11) NOT NULL default '0',
  `type` enum('support','setup','bug fix') NOT NULL default 'support',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1429 DEFAULT CHARSET=latin1;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `amount` float default NULL,
  `HTML` text,
  `date` date default NULL,
  `contract_amount` float default NULL,
  `over_amount` float default NULL,
  `over_hours` float default NULL,
  `services_amount` float default NULL,
  `url` varchar(255) default NULL,
  `balence` float default NULL,
  `emailed` date NOT NULL default '0000-00-00',
  `single_bill` tinyint(4) default NULL,
  `band_amount` float NOT NULL default '0',
  `band_over` float NOT NULL default '0',
  `unit_amount` float default NULL,
  `unit_desc` text,
  `unit_amount2` float default NULL,
  `unit_desc2` text,
  `unit_amount3` float default NULL,
  `unit_desc3` text,
  `no_balence` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2536 DEFAULT CHARSET=latin1 PACK_KEYS=0;

--
-- Table structure for table `invoice_merged`
--

DROP TABLE IF EXISTS `invoice_merged`;
CREATE TABLE `invoice_merged` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `amount` float default NULL,
  `HTML` text,
  `date` date default NULL,
  `contract_amount` float default NULL,
  `over_amount` float default NULL,
  `over_hours` float default NULL,
  `services_amount` float default NULL,
  `url` varchar(255) default NULL,
  `balence` float default NULL,
  `emailed` date NOT NULL default '0000-00-00',
  `single_bill` tinyint(4) default NULL,
  `band_amount` float NOT NULL default '0',
  `band_over` float NOT NULL default '0',
  `unit_amount` float default NULL,
  `unit_desc` text,
  `unit_amount2` float default NULL,
  `unit_desc2` text,
  `unit_amount3` float default NULL,
  `unit_desc3` text,
  `no_balence` tinyint(4) NOT NULL default '0',
  `range_start` date NOT NULL default '0000-00-00',
  `range_stop` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=624 DEFAULT CHARSET=latin1 PACK_KEYS=0;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `userdatamod` tinyint(4) default NULL,
  `userdatamodid` int(11) default NULL,
  `file` text,
  `perid` int(11) default NULL,
  `navhtml` text,
  `publish` tinyint(4) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

--
-- Table structure for table `new_clients`
--

DROP TABLE IF EXISTS `new_clients`;
CREATE TABLE `new_clients` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `project_contact` text,
  `notes` text,
  `ck_bid` tinyint(4) default NULL,
  `ck_contract` tinyint(4) default NULL,
  `quote` varchar(100) default NULL,
  `status` varchar(255) default NULL,
  `date` date default NULL,
  `rfp_date` date default NULL,
  `project_date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `date_paid` date default NULL,
  `type` enum('paypal','check','cash') default NULL,
  `amount` float default NULL,
  `note` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=594 DEFAULT CHARSET=latin1;

--
-- Table structure for table `per_description`
--

DROP TABLE IF EXISTS `per_description`;
CREATE TABLE `per_description` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `publish` tinyint(4) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

--
-- Table structure for table `per_group`
--

DROP TABLE IF EXISTS `per_group`;
CREATE TABLE `per_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` varchar(255) default NULL,
  `subsite` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Table structure for table `per_section`
--

DROP TABLE IF EXISTS `per_section`;
CREATE TABLE `per_section` (
  `groupid` int(11) NOT NULL default '0',
  `typeid` int(11) NOT NULL default '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL auto_increment,
  `groupid` int(11) NOT NULL default '0',
  `perid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=344 DEFAULT CHARSET=latin1;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int(11) NOT NULL auto_increment,
  `client_id` int(11) NOT NULL default '0',
  `invoice_id` int(11) default '0',
  `service_description` text,
  `service_cost` float default NULL,
  `service_name` text,
  `service_date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=latin1;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `id` int(11) NOT NULL auto_increment,
  `server` text,
  `amppath` text,
  `database` varchar(100) default NULL,
  `mainentry` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=244 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sysvar`
--

DROP TABLE IF EXISTS `sysvar`;
CREATE TABLE `sysvar` (
  `magicquotes` tinyint(4) default NULL,
  `searchinstallbase` varchar(100) default NULL,
  `basepath` varchar(100) default NULL,
  `filepath` varchar(100) default NULL,
  `emfaq` varchar(150) default NULL,
  `emendorse` varchar(150) default NULL,
  `emgroup` varchar(150) default NULL,
  `emmedia` varchar(150) default NULL,
  `emride` varchar(150) default NULL,
  `emhousing` varchar(150) default NULL,
  `emcalendar` varchar(150) default NULL,
  `websitename` varchar(150) default NULL,
  `emfrom` varchar(150) default NULL,
  `id` int(11) NOT NULL auto_increment,
  `sendmailpath` varchar(100) default NULL,
  `empledge` text,
  `webname` varchar(255) default NULL,
  `metadescription` text,
  `metacontent` text,
  `template` int(11) default NULL,
  `emailfromname` varchar(100) default NULL,
  `thumb` int(11) NOT NULL default '50',
  `optw` int(11) NOT NULL default '200',
  `optl` int(11) NOT NULL default '150',
  `cacheSecs` int(11) NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(250) default NULL,
  `details` text,
  `staff` varchar(100) default NULL,
  `groupid` int(11) NOT NULL default '0',
  `hours` float NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `billable` int(11) NOT NULL default '0',
  `client_id` int(11) NOT NULL default '0',
  `status` varchar(50) NOT NULL default '',
  `due_date` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` text,
  `password` text,
  `permission` tinyint(4) default NULL,
  `email` text,
  `system_home` text NOT NULL,
  `system_allow_only` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Table structure for table `users_sessions`
--

DROP TABLE IF EXISTS `users_sessions`;
CREATE TABLE `users_sessions` (
  `id` int(11) NOT NULL auto_increment,
  `hash` char(40) default NULL,
  `secret` char(32) default NULL,
  `last_time` int(11) default NULL,
  `in_time` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `hash` (`hash`),
  KEY `last_time` (`last_time`)
) ENGINE=MyISAM AUTO_INCREMENT=30458 DEFAULT CHARSET=latin1;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-07-20  5:10:43
