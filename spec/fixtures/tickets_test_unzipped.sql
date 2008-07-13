-- MySQL dump 10.10
--
-- Host: localhost    Database: tickets_dump
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
-- Table structure for table `swalertactions`
--

DROP TABLE IF EXISTS `swalertactions`;
CREATE TABLE `swalertactions` (
  `alertactionid` int(10) unsigned NOT NULL auto_increment,
  `alertruleid` int(10) unsigned NOT NULL default '0',
  `actiontype` smallint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`alertactionid`),
  KEY `alertactions1` (`actiontype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swalertrules`
--

DROP TABLE IF EXISTS `swalertrules`;
CREATE TABLE `swalertrules` (
  `alertruleid` int(10) unsigned NOT NULL auto_increment,
  `alertscope` smallint(1) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `departmentid` int(10) unsigned NOT NULL default '0',
  `priorityid` int(10) unsigned NOT NULL default '0',
  `ticketstatusid` int(10) unsigned NOT NULL default '0',
  `alerttype` smallint(1) unsigned NOT NULL default '0',
  `execassign` smallint(1) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY  (`alertruleid`),
  KEY `alertrules1` (`alertscope`,`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swattachmentchunks`
--

DROP TABLE IF EXISTS `swattachmentchunks`;
CREATE TABLE `swattachmentchunks` (
  `chunkid` int(10) unsigned NOT NULL auto_increment,
  `attachmentid` int(10) unsigned NOT NULL default '0',
  `contents` mediumblob NOT NULL,
  PRIMARY KEY  (`chunkid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swattachments`
--

DROP TABLE IF EXISTS `swattachments`;
CREATE TABLE `swattachments` (
  `attachmentid` int(10) unsigned NOT NULL auto_increment,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `ticketpostid` int(10) unsigned NOT NULL default '0',
  `downloaditemid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `filetype` varchar(150) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `attachmenttype` smallint(1) unsigned NOT NULL default '0',
  `storefilename` varchar(255) NOT NULL,
  PRIMARY KEY  (`attachmentid`),
  KEY `attachments1` (`ticketpostid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swattachmenttypes`
--

DROP TABLE IF EXISTS `swattachmenttypes`;
CREATE TABLE `swattachmenttypes` (
  `attachmenttypeid` int(10) unsigned NOT NULL auto_increment,
  `extension` varchar(10) NOT NULL,
  `maxsize` int(10) unsigned NOT NULL default '0',
  `mimetype` varchar(150) NOT NULL,
  PRIMARY KEY  (`attachmenttypeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swauditlogs`
--

DROP TABLE IF EXISTS `swauditlogs`;
CREATE TABLE `swauditlogs` (
  `auditlogid` int(10) unsigned NOT NULL auto_increment,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `departmentid` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `logtype` smallint(3) unsigned NOT NULL default '0',
  `actiontype` smallint(3) unsigned NOT NULL default '0',
  `actionmsg` varchar(255) NOT NULL,
  PRIMARY KEY  (`auditlogid`),
  KEY `auditlogs1` (`ticketid`,`actiontype`),
  KEY `auditlogs2` (`dateline`,`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swbreaklines`
--

DROP TABLE IF EXISTS `swbreaklines`;
CREATE TABLE `swbreaklines` (
  `breaklineid` int(10) unsigned NOT NULL auto_increment,
  `breakline` varchar(255) NOT NULL,
  PRIMARY KEY  (`breaklineid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendarcategories`
--

DROP TABLE IF EXISTS `swcalendarcategories`;
CREATE TABLE `swcalendarcategories` (
  `calendarcategoryid` int(10) unsigned NOT NULL auto_increment,
  `categorytype` smallint(1) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL default '0',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`calendarcategoryid`),
  KEY `calendarcategories1` (`categorytype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendardata`
--

DROP TABLE IF EXISTS `swcalendardata`;
CREATE TABLE `swcalendardata` (
  `calendardataid` int(10) unsigned NOT NULL auto_increment,
  `datatype` smallint(1) unsigned NOT NULL default '0',
  `typeid` int(10) unsigned NOT NULL default '0',
  `contents` text NOT NULL,
  PRIMARY KEY  (`calendardataid`),
  KEY `calendardata1` (`datatype`,`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendarevents`
--

DROP TABLE IF EXISTS `swcalendarevents`;
CREATE TABLE `swcalendarevents` (
  `calendareventid` int(10) unsigned NOT NULL auto_increment,
  `eventtype` enum('public','private') NOT NULL default 'public',
  `ownerstaffid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `isalldayevent` smallint(1) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `startdateline` int(10) unsigned NOT NULL default '0',
  `duration` int(10) unsigned NOT NULL default '0',
  `enddateline` int(10) unsigned NOT NULL default '0',
  `activitytype` smallint(1) unsigned NOT NULL default '0',
  `location` varchar(255) NOT NULL,
  `calendarstatusid` int(10) unsigned NOT NULL default '0',
  `calendarlabelid` int(10) unsigned NOT NULL default '0',
  `calendarcategoryid` int(10) unsigned NOT NULL default '0',
  `lastupdate` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`calendareventid`),
  KEY `calendarevent1` (`eventtype`,`staffid`,`startdateline`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendarlabels`
--

DROP TABLE IF EXISTS `swcalendarlabels`;
CREATE TABLE `swcalendarlabels` (
  `calendarlabelid` int(10) unsigned NOT NULL auto_increment,
  `labeltype` smallint(1) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `labelcolorcode` varchar(20) NOT NULL default '#FFFFFF',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`calendarlabelid`),
  KEY `calendarlabels1` (`labeltype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendarlinks`
--

DROP TABLE IF EXISTS `swcalendarlinks`;
CREATE TABLE `swcalendarlinks` (
  `linktype` smallint(1) unsigned NOT NULL default '0',
  `entryid` varchar(50) NOT NULL,
  `typeid` int(10) unsigned NOT NULL default '0',
  `guidid` int(10) unsigned NOT NULL default '0',
  `lastupdate` int(10) unsigned NOT NULL default '0',
  `lastswiftupdate` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `linktype` (`linktype`,`entryid`,`typeid`,`guidid`),
  KEY `calendarlinks1` (`entryid`),
  KEY `calendarlinks2` (`guidid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendarpriorities`
--

DROP TABLE IF EXISTS `swcalendarpriorities`;
CREATE TABLE `swcalendarpriorities` (
  `calendarpriorityid` int(10) unsigned NOT NULL auto_increment,
  `prioritytype` smallint(1) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `prioritycolorcode` varchar(20) NOT NULL default '#FFFFFF',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`calendarpriorityid`),
  KEY `calendarpriorities1` (`prioritytype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendarstatus`
--

DROP TABLE IF EXISTS `swcalendarstatus`;
CREATE TABLE `swcalendarstatus` (
  `calendarstatusid` int(10) unsigned NOT NULL auto_increment,
  `statustype` smallint(1) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `statuscolorcode` varchar(20) NOT NULL default '#FFFFFF',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`calendarstatusid`),
  KEY `calendarstatus1` (`statustype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcalendartasks`
--

DROP TABLE IF EXISTS `swcalendartasks`;
CREATE TABLE `swcalendartasks` (
  `calendartaskid` int(10) unsigned NOT NULL auto_increment,
  `ownerstaffid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `duedate` int(10) unsigned NOT NULL default '0',
  `startdate` int(10) unsigned NOT NULL default '0',
  `contactid` int(10) unsigned NOT NULL default '0',
  `completepercent` int(3) unsigned NOT NULL default '0',
  `iscomplete` smallint(1) unsigned NOT NULL default '0',
  `tasktype` enum('public','private') NOT NULL default 'public',
  `subject` varchar(255) NOT NULL,
  `calendarlabelid` int(10) unsigned NOT NULL default '0',
  `calendarstatusid` int(10) unsigned NOT NULL default '0',
  `calendarpriorityid` int(10) unsigned NOT NULL default '0',
  `lastupdate` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`calendartaskid`),
  KEY `calendartasks1` (`ownerstaffid`,`duedate`,`iscomplete`),
  KEY `calendartasks2` (`tasktype`,`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcatchallrules`
--

DROP TABLE IF EXISTS `swcatchallrules`;
CREATE TABLE `swcatchallrules` (
  `catchallruleid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `ruleexpr` varchar(255) NOT NULL,
  `emailqueueid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `sortorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`catchallruleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcommentdata`
--

DROP TABLE IF EXISTS `swcommentdata`;
CREATE TABLE `swcommentdata` (
  `commentdataid` int(10) unsigned NOT NULL auto_increment,
  `commentid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`commentdataid`),
  KEY `commentdata1` (`commentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcomments`
--

DROP TABLE IF EXISTS `swcomments`;
CREATE TABLE `swcomments` (
  `commentid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `commenttype` smallint(2) unsigned NOT NULL default '0',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `isapproved` smallint(1) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`commentid`),
  KEY `comments1` (`commenttype`,`isapproved`,`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcontacts`
--

DROP TABLE IF EXISTS `swcontacts`;
CREATE TABLE `swcontacts` (
  `contactid` int(10) unsigned NOT NULL auto_increment,
  `contacttype` enum('public','private') NOT NULL default 'public',
  `staffid` int(10) unsigned NOT NULL default '0',
  `fullname` varchar(255) NOT NULL,
  `jobtitle` varchar(255) NOT NULL,
  `initials` varchar(5) NOT NULL,
  `calendarcategoryid` int(10) unsigned NOT NULL default '0',
  `email1address` varchar(255) NOT NULL,
  `email2address` varchar(255) NOT NULL,
  `email3address` varchar(255) NOT NULL,
  `customerid` varchar(100) NOT NULL,
  `mobiletelephonenumber` varchar(255) NOT NULL,
  `cartelephonenumber` varchar(255) NOT NULL,
  `pagernumber` varchar(255) NOT NULL,
  `othertelephonenumber` varchar(255) NOT NULL,
  `imaddress` varchar(100) NOT NULL,
  `companyname` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `officelocation` varchar(255) NOT NULL,
  `businessaddress` varchar(255) NOT NULL,
  `businesstelephonenumber` varchar(255) NOT NULL,
  `business2telephonenumber` varchar(255) NOT NULL,
  `businessfaxnumber` varchar(255) NOT NULL,
  `businesshomepage` varchar(255) NOT NULL,
  `homeaddress` varchar(255) NOT NULL,
  `hometelephonenumber` varchar(255) NOT NULL,
  `home2telephonenumber` varchar(255) NOT NULL,
  `homefaxnumber` varchar(255) NOT NULL,
  `birthdaydateline` int(10) unsigned NOT NULL default '0',
  `anniversarydateline` int(10) unsigned NOT NULL default '0',
  `mailingaddress` varchar(255) NOT NULL,
  `otheraddress` varchar(255) NOT NULL,
  `webpage` varchar(255) NOT NULL,
  `assistantname` varchar(255) NOT NULL,
  `assistanttelephonenumber` varchar(255) NOT NULL,
  `lastupdate` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`contactid`),
  KEY `contacts1` (`contacttype`,`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcron`
--

DROP TABLE IF EXISTS `swcron`;
CREATE TABLE `swcron` (
  `cronid` int(10) unsigned NOT NULL auto_increment,
  `nextrun` int(10) unsigned NOT NULL default '0',
  `lastrun` int(10) unsigned NOT NULL default '0',
  `chour` int(11) NOT NULL default '0',
  `cminute` int(11) NOT NULL default '0',
  `cday` int(11) NOT NULL default '0',
  `module` varchar(120) NOT NULL,
  `action` varchar(120) NOT NULL,
  `autorun` smallint(1) unsigned NOT NULL default '0',
  `name` varchar(150) NOT NULL,
  PRIMARY KEY  (`cronid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcronlogs`
--

DROP TABLE IF EXISTS `swcronlogs`;
CREATE TABLE `swcronlogs` (
  `cronlogid` int(10) unsigned NOT NULL auto_increment,
  `cronid` int(10) unsigned NOT NULL default '0',
  `crontitle` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY  (`cronlogid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcustomfielddeplinks`
--

DROP TABLE IF EXISTS `swcustomfielddeplinks`;
CREATE TABLE `swcustomfielddeplinks` (
  `customfieldgroupid` int(10) unsigned NOT NULL default '0',
  `departmentid` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `customfieldgroupid` (`customfieldgroupid`,`departmentid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcustomfieldgroups`
--

DROP TABLE IF EXISTS `swcustomfieldgroups`;
CREATE TABLE `swcustomfieldgroups` (
  `customfieldgroupid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(200) NOT NULL,
  `grouptype` smallint(2) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customfieldgroupid`),
  KEY `customfieldgroups1` (`grouptype`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcustomfieldlinks`
--

DROP TABLE IF EXISTS `swcustomfieldlinks`;
CREATE TABLE `swcustomfieldlinks` (
  `customfieldlinkid` int(10) unsigned NOT NULL auto_increment,
  `linktype` smallint(1) unsigned NOT NULL default '0',
  `typeid` int(10) unsigned NOT NULL default '0',
  `customfieldgroupid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customfieldlinkid`),
  UNIQUE KEY `linktype` (`linktype`,`typeid`,`customfieldgroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcustomfieldoptions`
--

DROP TABLE IF EXISTS `swcustomfieldoptions`;
CREATE TABLE `swcustomfieldoptions` (
  `customfieldoptionid` int(10) unsigned NOT NULL auto_increment,
  `customfieldid` int(10) unsigned NOT NULL default '0',
  `optionvalue` varchar(255) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL default '0',
  `isselected` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customfieldoptionid`),
  KEY `customfieldoptions1` (`customfieldid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcustomfields`
--

DROP TABLE IF EXISTS `swcustomfields`;
CREATE TABLE `swcustomfields` (
  `customfieldid` int(10) unsigned NOT NULL auto_increment,
  `customfieldgroupid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `fieldtype` smallint(2) unsigned NOT NULL default '0',
  `fieldname` varchar(100) NOT NULL,
  `defaultvalue` varchar(255) NOT NULL,
  `isrequired` smallint(1) unsigned NOT NULL default '0',
  `usereditable` smallint(1) unsigned NOT NULL default '0',
  `staffeditable` smallint(1) unsigned NOT NULL default '0',
  `regexpvalidate` varchar(255) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customfieldid`),
  KEY `customfields1` (`customfieldgroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swcustomfieldvalues`
--

DROP TABLE IF EXISTS `swcustomfieldvalues`;
CREATE TABLE `swcustomfieldvalues` (
  `customfieldvalueid` int(10) unsigned NOT NULL auto_increment,
  `customfieldid` int(10) unsigned NOT NULL default '0',
  `typeid` int(10) unsigned NOT NULL default '0',
  `fieldvalue` varchar(255) NOT NULL,
  `isserialized` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`customfieldvalueid`),
  KEY `customfieldvalues1` (`customfieldid`,`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swdepartments`
--

DROP TABLE IF EXISTS `swdepartments`;
CREATE TABLE `swdepartments` (
  `departmentid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `departmenttype` enum('public','private') NOT NULL default 'public',
  `departmentmodule` enum('tickets','bugs','livesupport','knowledgebase') NOT NULL default 'tickets',
  `isdefault` int(1) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`departmentid`),
  KEY `departments1` (`departmentmodule`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swdownloadcategories`
--

DROP TABLE IF EXISTS `swdownloadcategories`;
CREATE TABLE `swdownloadcategories` (
  `downloadcategoryid` int(10) unsigned NOT NULL auto_increment,
  `parentcategoryid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `totalitems` int(10) unsigned NOT NULL default '0',
  `categorytype` varchar(20) NOT NULL default 'public',
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`downloadcategoryid`),
  KEY `downloadcategories1` (`parentcategoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swdownloaddesc`
--

DROP TABLE IF EXISTS `swdownloaddesc`;
CREATE TABLE `swdownloaddesc` (
  `downloaddescid` int(10) unsigned NOT NULL auto_increment,
  `downloaditemid` int(10) unsigned NOT NULL default '0',
  `description` mediumtext NOT NULL,
  PRIMARY KEY  (`downloaddescid`),
  KEY `downloaddesc1` (`downloaditemid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swdownloaditems`
--

DROP TABLE IF EXISTS `swdownloaditems`;
CREATE TABLE `swdownloaditems` (
  `downloaditemid` int(10) unsigned NOT NULL auto_increment,
  `downloadcategoryid` int(10) unsigned NOT NULL default '0',
  `downloadmaskid` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `version` varchar(50) NOT NULL,
  `filelink` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `storedfilename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `filetype` varchar(150) NOT NULL,
  `totaldownloads` int(10) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `updatedateline` int(10) unsigned NOT NULL default '0',
  `itempassword` varchar(50) NOT NULL,
  `totalcomments` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`downloaditemid`),
  KEY `downloaditems1` (`downloadcategoryid`),
  KEY `downloaditems2` (`downloadmaskid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swemailqueues`
--

DROP TABLE IF EXISTS `swemailqueues`;
CREATE TABLE `swemailqueues` (
  `emailqueueid` int(10) unsigned NOT NULL auto_increment,
  `email` varchar(255) NOT NULL,
  `type` enum('tickets','bugs') NOT NULL default 'tickets',
  `fetchtype` enum('pipe','pop3','pop3ssl','imap','imapssl') NOT NULL default 'pipe',
  `host` varchar(255) NOT NULL,
  `port` varchar(10) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userpassword` varchar(255) NOT NULL,
  `customfromname` varchar(200) NOT NULL,
  `customfromemail` varchar(255) NOT NULL,
  `priorityid` int(10) unsigned NOT NULL default '0',
  `ticketstatusid` int(10) unsigned NOT NULL default '0',
  `departmentid` int(10) unsigned NOT NULL default '0',
  `prefix` varchar(30) NOT NULL,
  `ticketautoresponder` smallint(1) unsigned NOT NULL default '0',
  `replyautoresponder` smallint(1) unsigned NOT NULL default '0',
  `registrationrequired` smallint(1) unsigned NOT NULL default '0',
  `tgroupid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`emailqueueid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swescalationrules`
--

DROP TABLE IF EXISTS `swescalationrules`;
CREATE TABLE `swescalationrules` (
  `escalationruleid` int(10) unsigned NOT NULL auto_increment,
  `slaplanid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `priorityid` int(10) unsigned NOT NULL default '0',
  `ticketstatusid` int(10) unsigned NOT NULL default '0',
  `departmentid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`escalationruleid`),
  KEY `escalationrules1` (`slaplanid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swfloodhash`
--

DROP TABLE IF EXISTS `swfloodhash`;
CREATE TABLE `swfloodhash` (
  `floodhashid` int(10) unsigned NOT NULL auto_increment,
  `dateline` int(10) unsigned NOT NULL default '0',
  `emailhash` varchar(32) NOT NULL,
  `subjecthash` varchar(32) NOT NULL,
  PRIMARY KEY  (`floodhashid`),
  KEY `floodhash1` (`emailhash`,`subjecthash`),
  KEY `floodhash2` (`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swgroupassigns`
--

DROP TABLE IF EXISTS `swgroupassigns`;
CREATE TABLE `swgroupassigns` (
  `groupassignid` int(10) unsigned NOT NULL auto_increment,
  `departmentid` int(10) unsigned NOT NULL default '0',
  `staffgroupid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`groupassignid`),
  UNIQUE KEY `departmentid` (`departmentid`,`staffgroupid`),
  KEY `groupassigns1` (`staffgroupid`),
  KEY `groupassigns2` (`departmentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swkbarticledata`
--

DROP TABLE IF EXISTS `swkbarticledata`;
CREATE TABLE `swkbarticledata` (
  `kbarticledataid` int(10) unsigned NOT NULL auto_increment,
  `kbarticleid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`kbarticledataid`),
  KEY `kbarticledata1` (`kbarticleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swkbarticlefiles`
--

DROP TABLE IF EXISTS `swkbarticlefiles`;
CREATE TABLE `swkbarticlefiles` (
  `kbarticlefileid` int(10) unsigned NOT NULL auto_increment,
  `kbarticleid` int(10) unsigned NOT NULL default '0',
  `filename` varchar(255) NOT NULL,
  `storedfilename` varchar(255) NOT NULL,
  `filesize` int(10) unsigned NOT NULL default '0',
  `filetype` varchar(150) NOT NULL,
  `totaldownloads` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`kbarticlefileid`),
  KEY `kbarticlefiles1` (`kbarticleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swkbarticlelinks`
--

DROP TABLE IF EXISTS `swkbarticlelinks`;
CREATE TABLE `swkbarticlelinks` (
  `kbarticlelinkid` int(10) unsigned NOT NULL auto_increment,
  `kbcategoryid` int(10) unsigned NOT NULL default '0',
  `kbarticleid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`kbarticlelinkid`),
  UNIQUE KEY `kbcategoryid` (`kbcategoryid`,`kbarticleid`),
  KEY `kbarticlelinks1` (`kbarticleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swkbarticles`
--

DROP TABLE IF EXISTS `swkbarticles`;
CREATE TABLE `swkbarticles` (
  `kbarticleid` int(10) unsigned NOT NULL auto_increment,
  `staffid` int(10) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `isedited` smallint(1) unsigned NOT NULL default '0',
  `editeddateline` int(10) unsigned NOT NULL default '0',
  `editedstaffid` int(10) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  `totalcomments` int(10) unsigned NOT NULL default '0',
  `hasattachments` smallint(1) unsigned NOT NULL default '1',
  `dateline` int(10) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `articlestatus` enum('published','draft','private') NOT NULL default 'published',
  `articlerating` float unsigned NOT NULL default '0',
  `ratinghits` int(10) unsigned NOT NULL default '0',
  `ratingcount` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`kbarticleid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swkbcategories`
--

DROP TABLE IF EXISTS `swkbcategories`;
CREATE TABLE `swkbcategories` (
  `kbcategoryid` int(10) unsigned NOT NULL auto_increment,
  `parentcategoryid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `totalarticles` int(10) unsigned NOT NULL default '0',
  `categorytype` enum('public','private') NOT NULL default 'public',
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`kbcategoryid`),
  KEY `kbcategories1` (`parentcategoryid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swlanguagephrases`
--

DROP TABLE IF EXISTS `swlanguagephrases`;
CREATE TABLE `swlanguagephrases` (
  `phraseid` int(10) unsigned NOT NULL auto_increment,
  `languageid` int(10) unsigned NOT NULL default '0',
  `section` varchar(100) NOT NULL,
  `code` varchar(100) NOT NULL,
  `sectioncode` varchar(255) NOT NULL,
  `contents` text NOT NULL,
  PRIMARY KEY  (`phraseid`),
  UNIQUE KEY `languageid` (`languageid`,`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swlanguages`
--

DROP TABLE IF EXISTS `swlanguages`;
CREATE TABLE `swlanguages` (
  `languageid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `languagecode` varchar(20) NOT NULL,
  `charset` varchar(200) NOT NULL,
  `author` varchar(120) NOT NULL,
  `textdirection` enum('ltr','rtl') NOT NULL default 'ltr',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  `isdefault` smallint(1) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`languageid`),
  KEY `languages1` (`languagecode`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swmailqueuedata`
--

DROP TABLE IF EXISTS `swmailqueuedata`;
CREATE TABLE `swmailqueuedata` (
  `mailqueuedataid` int(10) unsigned NOT NULL auto_increment,
  `toemail` varchar(255) NOT NULL,
  `fromemail` varchar(255) NOT NULL,
  `fromname` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `datatext` mediumtext NOT NULL,
  `datahtml` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `ishtml` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mailqueuedataid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swnews`
--

DROP TABLE IF EXISTS `swnews`;
CREATE TABLE `swnews` (
  `newsid` int(10) unsigned NOT NULL auto_increment,
  `tgroupid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `newstype` enum('public','private') NOT NULL default 'public',
  `subject` varchar(255) NOT NULL,
  `emailsubject` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `expiry` int(10) unsigned NOT NULL default '0',
  `edited` smallint(1) unsigned NOT NULL default '0',
  `editedstaffid` int(10) unsigned NOT NULL default '0',
  `editeddateline` int(10) unsigned NOT NULL default '0',
  `totalcomments` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`newsid`),
  KEY `news1` (`tgroupid`,`newstype`,`expiry`,`dateline`),
  KEY `news2` (`newstype`,`expiry`,`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swnewsdata`
--

DROP TABLE IF EXISTS `swnewsdata`;
CREATE TABLE `swnewsdata` (
  `newsdataid` int(10) unsigned NOT NULL auto_increment,
  `newsid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`newsdataid`),
  KEY `newsdata1` (`newsid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swnewssubscribers`
--

DROP TABLE IF EXISTS `swnewssubscribers`;
CREATE TABLE `swnewssubscribers` (
  `newssubscriberid` int(10) unsigned NOT NULL auto_increment,
  `tgroupid` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `email` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `validated` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`newssubscriberid`),
  UNIQUE KEY `email` (`email`),
  KEY `newssubscribers1` (`tgroupid`,`validated`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swnewsverihash`
--

DROP TABLE IF EXISTS `swnewsverihash`;
CREATE TABLE `swnewsverihash` (
  `newsverihashid` varchar(32) NOT NULL,
  `newssubscriberid` int(10) unsigned NOT NULL default '0',
  `hash` varchar(50) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`newsverihashid`),
  KEY `newsverihash1` (`newssubscriberid`),
  KEY `newsverihash2` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swparserbans`
--

DROP TABLE IF EXISTS `swparserbans`;
CREATE TABLE `swparserbans` (
  `parserbanid` int(10) unsigned NOT NULL auto_increment,
  `email` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parserbanid`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swparserlogdata`
--

DROP TABLE IF EXISTS `swparserlogdata`;
CREATE TABLE `swparserlogdata` (
  `parserlogdataid` int(10) unsigned NOT NULL auto_increment,
  `parserlogid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`parserlogdataid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swparserlogs`
--

DROP TABLE IF EXISTS `swparserlogs`;
CREATE TABLE `swparserlogs` (
  `parserlogid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `ticketmaskid` varchar(20) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `emailqueueid` int(10) unsigned NOT NULL default '0',
  `logtype` enum('failure','success') NOT NULL default 'failure',
  `subject` varchar(255) NOT NULL,
  `fromemail` varchar(255) NOT NULL,
  `toemail` varchar(255) NOT NULL,
  `size` int(10) unsigned NOT NULL default '0',
  `description` varchar(255) NOT NULL,
  `parsetimetaken` float unsigned NOT NULL default '0',
  `responsetype` enum('ticket','reply','bug') NOT NULL default 'ticket',
  `ticketpostid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parserlogid`),
  KEY `parserlogs2` (`ticketpostid`),
  KEY `parserlogs3` (`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swparserrules`
--

DROP TABLE IF EXISTS `swparserrules`;
CREATE TABLE `swparserrules` (
  `parserruleid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `sortorder` int(10) unsigned NOT NULL default '0',
  `ruletype` smallint(1) unsigned NOT NULL default '0',
  `matchtype` smallint(1) unsigned NOT NULL default '0',
  `stopprocessing` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`parserruleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swpredefinedcategories`
--

DROP TABLE IF EXISTS `swpredefinedcategories`;
CREATE TABLE `swpredefinedcategories` (
  `predefinedcategoryid` int(10) unsigned NOT NULL auto_increment,
  `parentcategoryid` int(10) unsigned NOT NULL default '0',
  `categorytype` smallint(1) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY  (`predefinedcategoryid`),
  KEY `predefinedcategory1` (`parentcategoryid`),
  KEY `predefinedcategory2` (`categorytype`,`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swpredefinedreplies`
--

DROP TABLE IF EXISTS `swpredefinedreplies`;
CREATE TABLE `swpredefinedreplies` (
  `predefinedreplyid` int(10) unsigned NOT NULL auto_increment,
  `predefinedcategoryid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`predefinedreplyid`),
  KEY `predefinedreply1` (`predefinedcategoryid`),
  KEY `predefinedreply2` (`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swpredefinedreplydata`
--

DROP TABLE IF EXISTS `swpredefinedreplydata`;
CREATE TABLE `swpredefinedreplydata` (
  `predefinedreplydataid` int(10) unsigned NOT NULL auto_increment,
  `predefinedreplyid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`predefinedreplydataid`),
  KEY `predefinedreplydata1` (`predefinedreplyid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swprivatemessagedata`
--

DROP TABLE IF EXISTS `swprivatemessagedata`;
CREATE TABLE `swprivatemessagedata` (
  `privatemessagedataid` int(10) unsigned NOT NULL auto_increment,
  `privatemessageid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`privatemessagedataid`),
  KEY `privatemessagedata1` (`privatemessageid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swprivatemessages`
--

DROP TABLE IF EXISTS `swprivatemessages`;
CREATE TABLE `swprivatemessages` (
  `privatemessageid` int(10) unsigned NOT NULL auto_increment,
  `fromstaffid` int(10) unsigned NOT NULL default '0',
  `tostaffid` int(10) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `msgtype` smallint(1) unsigned NOT NULL default '0',
  `msgstatus` smallint(1) unsigned NOT NULL default '0',
  `readdate` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`privatemessageid`),
  KEY `privatemessages1` (`tostaffid`,`msgtype`,`msgstatus`),
  KEY `privatemessages2` (`fromstaffid`,`msgtype`,`msgstatus`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swqueuesignatures`
--

DROP TABLE IF EXISTS `swqueuesignatures`;
CREATE TABLE `swqueuesignatures` (
  `queuesignatureid` int(10) unsigned NOT NULL auto_increment,
  `dateline` int(10) unsigned NOT NULL default '0',
  `emailqueueid` int(10) unsigned NOT NULL default '0',
  `contents` text NOT NULL,
  PRIMARY KEY  (`queuesignatureid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swregistry`
--

DROP TABLE IF EXISTS `swregistry`;
CREATE TABLE `swregistry` (
  `vkey` varchar(50) NOT NULL,
  `data` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `isvolatile` smallint(5) unsigned NOT NULL default '0',
  `datasize` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`vkey`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swruleactions`
--

DROP TABLE IF EXISTS `swruleactions`;
CREATE TABLE `swruleactions` (
  `ruleactionid` int(10) unsigned NOT NULL auto_increment,
  `parserruleid` int(10) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL,
  `typeid` int(10) unsigned NOT NULL default '0',
  `typedata` mediumtext NOT NULL,
  `typechar` varchar(255) NOT NULL,
  PRIMARY KEY  (`ruleactionid`),
  KEY `ruleactions1` (`parserruleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swrulecriteria`
--

DROP TABLE IF EXISTS `swrulecriteria`;
CREATE TABLE `swrulecriteria` (
  `rulecriteriaid` int(10) unsigned NOT NULL auto_increment,
  `parserruleid` int(10) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL,
  `ruleop` smallint(2) unsigned NOT NULL default '0',
  `rulematch` varchar(255) NOT NULL,
  PRIMARY KEY  (`rulecriteriaid`),
  KEY `rulecriteria1` (`parserruleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsessions`
--

DROP TABLE IF EXISTS `swsessions`;
CREATE TABLE `swsessions` (
  `sessionid` varchar(32) NOT NULL,
  `ipaddress` varchar(30) NOT NULL,
  `lastactivity` int(10) unsigned NOT NULL default '0',
  `useragent` varchar(60) NOT NULL default '0',
  `isloggedin` smallint(1) unsigned NOT NULL default '0',
  `sessiontype` int(10) unsigned NOT NULL default '0',
  `typeid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `status` smallint(6) NOT NULL default '0',
  `captcha` varchar(10) NOT NULL,
  `iswinapp` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sessionid`),
  KEY `sessions1` (`sessiontype`,`lastactivity`,`status`),
  KEY `typeid` (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsettings`
--

DROP TABLE IF EXISTS `swsettings`;
CREATE TABLE `swsettings` (
  `settingid` int(10) unsigned NOT NULL auto_increment,
  `section` varchar(50) NOT NULL,
  `vkey` varchar(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY  (`settingid`),
  KEY `sections` (`section`,`vkey`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsettingsfields`
--

DROP TABLE IF EXISTS `swsettingsfields`;
CREATE TABLE `swsettingsfields` (
  `sfieldid` int(10) unsigned NOT NULL auto_increment,
  `sgroupid` int(10) unsigned NOT NULL default '0',
  `name` varchar(200) NOT NULL,
  `customvalue` mediumtext NOT NULL,
  `iscustom` int(1) unsigned NOT NULL default '0',
  `settingtype` varchar(100) NOT NULL default 'text',
  `module` varchar(100) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`sfieldid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsettingsgroups`
--

DROP TABLE IF EXISTS `swsettingsgroups`;
CREATE TABLE `swsettingsgroups` (
  `sgroupid` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `module` varchar(100) NOT NULL,
  `displayorder` int(5) NOT NULL default '0',
  `ishidden` int(1) NOT NULL default '0',
  PRIMARY KEY  (`sgroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsignatures`
--

DROP TABLE IF EXISTS `swsignatures`;
CREATE TABLE `swsignatures` (
  `signatureid` int(10) unsigned NOT NULL auto_increment,
  `dateline` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `signature` mediumtext NOT NULL,
  PRIMARY KEY  (`signatureid`),
  KEY `signatures1` (`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swslaplanprioritylink`
--

DROP TABLE IF EXISTS `swslaplanprioritylink`;
CREATE TABLE `swslaplanprioritylink` (
  `planprioritylinkid` int(10) unsigned NOT NULL auto_increment,
  `slaplanid` int(10) unsigned NOT NULL default '0',
  `priorityid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`planprioritylinkid`),
  UNIQUE KEY `slaplanid` (`slaplanid`,`priorityid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swslaplans`
--

DROP TABLE IF EXISTS `swslaplans`;
CREATE TABLE `swslaplans` (
  `slaplanid` int(10) unsigned NOT NULL auto_increment,
  `departmentid` int(10) unsigned NOT NULL default '0',
  `slascheduleid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `overduehrs` float unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`slaplanid`),
  KEY `slaplans1` (`departmentid`),
  KEY `slaplans2` (`slascheduleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swslaplanstatuslink`
--

DROP TABLE IF EXISTS `swslaplanstatuslink`;
CREATE TABLE `swslaplanstatuslink` (
  `planstatuslinkid` int(10) unsigned NOT NULL auto_increment,
  `slaplanid` int(10) unsigned NOT NULL default '0',
  `ticketstatusid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`planstatuslinkid`),
  UNIQUE KEY `slaplanid` (`slaplanid`,`ticketstatusid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swslaschedules`
--

DROP TABLE IF EXISTS `swslaschedules`;
CREATE TABLE `swslaschedules` (
  `slascheduleid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `sunday_enabled` smallint(1) unsigned NOT NULL default '0',
  `sunday_open` varchar(6) NOT NULL default '00:00',
  `sunday_close` varchar(6) NOT NULL default '00:00',
  `monday_enabled` smallint(1) unsigned NOT NULL default '0',
  `monday_open` varchar(6) NOT NULL default '00:00',
  `monday_close` varchar(6) NOT NULL default '00:00',
  `tuesday_enabled` smallint(1) unsigned NOT NULL default '0',
  `tuesday_open` varchar(6) NOT NULL default '00:00',
  `tuesday_close` varchar(6) NOT NULL default '00:00',
  `wednesday_enabled` smallint(1) unsigned NOT NULL default '0',
  `wednesday_open` varchar(6) NOT NULL default '00:00',
  `wednesday_close` varchar(6) NOT NULL default '00:00',
  `thursday_enabled` smallint(1) unsigned NOT NULL default '0',
  `thursday_open` varchar(6) NOT NULL default '00:00',
  `thursday_close` varchar(6) NOT NULL default '00:00',
  `friday_enabled` smallint(1) unsigned NOT NULL default '0',
  `friday_open` varchar(6) NOT NULL default '00:00',
  `friday_close` varchar(6) NOT NULL default '00:00',
  `saturday_enabled` smallint(1) unsigned NOT NULL default '0',
  `saturday_open` varchar(6) NOT NULL default '00:00',
  `saturday_close` varchar(6) NOT NULL default '00:00',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`slascheduleid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swstaff`
--

DROP TABLE IF EXISTS `swstaff`;
CREATE TABLE `swstaff` (
  `staffid` int(10) unsigned NOT NULL auto_increment,
  `fullname` varchar(100) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `staffgroupid` int(10) unsigned NOT NULL default '0',
  `email` varchar(150) NOT NULL,
  `mobilenumber` varchar(20) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `lastvisit2` int(10) unsigned NOT NULL default '0',
  `lastactivity` int(10) unsigned NOT NULL default '0',
  `timezoneoffset` varchar(10) NOT NULL default '0',
  `enabledst` smallint(1) unsigned NOT NULL default '0',
  `startofweek` int(10) unsigned NOT NULL default '1',
  `pmunread` int(10) unsigned NOT NULL default '0',
  `groupassigns` smallint(1) unsigned NOT NULL default '1',
  `enablepmalerts` smallint(1) unsigned NOT NULL default '1',
  `enablepmjsalerts` smallint(1) unsigned NOT NULL default '1',
  `ticketviewid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`staffid`),
  KEY `staff1` (`staffgroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swstaffassigns`
--

DROP TABLE IF EXISTS `swstaffassigns`;
CREATE TABLE `swstaffassigns` (
  `staffassignid` int(10) unsigned NOT NULL auto_increment,
  `departmentid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`staffassignid`),
  UNIQUE KEY `departmentid` (`departmentid`,`staffid`),
  KEY `staffassigns1` (`staffid`),
  KEY `staffassigns2` (`departmentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swstaffgroup`
--

DROP TABLE IF EXISTS `swstaffgroup`;
CREATE TABLE `swstaffgroup` (
  `staffgroupid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `isadmin` smallint(1) NOT NULL default '0',
  PRIMARY KEY  (`staffgroupid`),
  KEY `staffgroup1` (`isadmin`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swstaffgroupsettings`
--

DROP TABLE IF EXISTS `swstaffgroupsettings`;
CREATE TABLE `swstaffgroupsettings` (
  `sgroupsettingid` int(10) unsigned NOT NULL auto_increment,
  `staffgroupid` int(10) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`sgroupsettingid`),
  UNIQUE KEY `staffgroupid` (`staffgroupid`,`name`),
  KEY `staffgroupsettings1` (`staffgroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swstaffschedules`
--

DROP TABLE IF EXISTS `swstaffschedules`;
CREATE TABLE `swstaffschedules` (
  `staffscheduleid` int(10) unsigned NOT NULL auto_increment,
  `staffid` int(10) unsigned NOT NULL default '0',
  `sunday_enabled` smallint(1) unsigned NOT NULL default '0',
  `sunday_open` varchar(6) NOT NULL default '00:00',
  `sunday_close` varchar(6) NOT NULL default '00:00',
  `monday_enabled` smallint(1) unsigned NOT NULL default '0',
  `monday_open` varchar(6) NOT NULL default '00:00',
  `monday_close` varchar(6) NOT NULL default '00:00',
  `tuesday_enabled` smallint(1) unsigned NOT NULL default '0',
  `tuesday_open` varchar(6) NOT NULL default '00:00',
  `tuesday_close` varchar(6) NOT NULL default '00:00',
  `wednesday_enabled` smallint(1) unsigned NOT NULL default '0',
  `wednesday_open` varchar(6) NOT NULL default '00:00',
  `wednesday_close` varchar(6) NOT NULL default '00:00',
  `thursday_enabled` smallint(1) unsigned NOT NULL default '0',
  `thursday_open` varchar(6) NOT NULL default '00:00',
  `thursday_close` varchar(6) NOT NULL default '00:00',
  `friday_enabled` smallint(1) unsigned NOT NULL default '0',
  `friday_open` varchar(6) NOT NULL default '00:00',
  `friday_close` varchar(6) NOT NULL default '00:00',
  `saturday_enabled` smallint(1) unsigned NOT NULL default '0',
  `saturday_open` varchar(6) NOT NULL default '00:00',
  `saturday_close` varchar(6) NOT NULL default '00:00',
  PRIMARY KEY  (`staffscheduleid`),
  KEY `staffschedules1` (`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsynclog`
--

DROP TABLE IF EXISTS `swsynclog`;
CREATE TABLE `swsynclog` (
  `synclogid` int(10) unsigned NOT NULL auto_increment,
  `synctype` smallint(1) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `syncstatus` smallint(1) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `deviceinformation` varchar(255) NOT NULL default '0',
  PRIMARY KEY  (`synclogid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swsyncworksguid`
--

DROP TABLE IF EXISTS `swsyncworksguid`;
CREATE TABLE `swsyncworksguid` (
  `guidid` int(10) unsigned NOT NULL auto_increment,
  `swguid` varchar(50) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`guidid`),
  KEY `syncworksguid` (`swguid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtempfiles`
--

DROP TABLE IF EXISTS `swtempfiles`;
CREATE TABLE `swtempfiles` (
  `tempfileid` int(10) unsigned NOT NULL auto_increment,
  `filename` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tempfileid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtemplatecategories`
--

DROP TABLE IF EXISTS `swtemplatecategories`;
CREATE TABLE `swtemplatecategories` (
  `tcategoryid` int(10) unsigned NOT NULL auto_increment,
  `tgroupid` int(10) unsigned NOT NULL default '0',
  `name` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `module` varchar(100) NOT NULL,
  PRIMARY KEY  (`tcategoryid`),
  KEY `templatecategories1` (`tgroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtemplatedata`
--

DROP TABLE IF EXISTS `swtemplatedata`;
CREATE TABLE `swtemplatedata` (
  `templatedataid` int(10) unsigned NOT NULL auto_increment,
  `templateid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  `contentsdefault` mediumtext NOT NULL,
  PRIMARY KEY  (`templatedataid`),
  KEY `templatedata1` (`templateid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtemplategroups`
--

DROP TABLE IF EXISTS `swtemplategroups`;
CREATE TABLE `swtemplategroups` (
  `tgroupid` int(10) unsigned NOT NULL auto_increment,
  `languageid` int(10) unsigned NOT NULL default '0',
  `guestusergroupid` int(10) unsigned NOT NULL default '0',
  `regusergroupid` int(10) unsigned NOT NULL default '0',
  `title` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `companyname` varchar(255) NOT NULL,
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  `grouppassword` varchar(32) NOT NULL default '0',
  `restrictgroups` smallint(1) unsigned NOT NULL default '0',
  `isdefault` smallint(1) unsigned NOT NULL default '0',
  `loginapi_moduleid` int(10) unsigned NOT NULL default '0',
  `ticketstatusid` int(10) unsigned NOT NULL default '0',
  `priorityid` int(10) unsigned NOT NULL default '0',
  `departmentid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tgroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtemplates`
--

DROP TABLE IF EXISTS `swtemplates`;
CREATE TABLE `swtemplates` (
  `templateid` int(10) unsigned NOT NULL auto_increment,
  `tgroupid` int(10) unsigned NOT NULL default '0',
  `tcategoryid` int(10) unsigned NOT NULL default '0',
  `name` varchar(60) NOT NULL,
  `templatelength` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `modified` enum('user','upgrade','notmodified') NOT NULL default 'notmodified',
  `contentshash` varchar(32) NOT NULL,
  `contentsdefaulthash` varchar(32) NOT NULL,
  PRIMARY KEY  (`templateid`),
  KEY `templates1` (`tgroupid`,`name`),
  KEY `templates2` (`tcategoryid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtgroupassigns`
--

DROP TABLE IF EXISTS `swtgroupassigns`;
CREATE TABLE `swtgroupassigns` (
  `tgroupassignid` int(10) unsigned NOT NULL auto_increment,
  `toassignid` int(10) unsigned NOT NULL default '0',
  `type` smallint(5) unsigned NOT NULL default '0',
  `tgroupid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`tgroupassignid`),
  KEY `tgroupassigns1` (`tgroupid`,`type`),
  KEY `tgroupassigns2` (`toassignid`,`type`,`tgroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketdrafts`
--

DROP TABLE IF EXISTS `swticketdrafts`;
CREATE TABLE `swticketdrafts` (
  `ticketdraftid` int(10) unsigned NOT NULL auto_increment,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`ticketdraftid`),
  UNIQUE KEY `ticketdrafts1` (`ticketid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketemails`
--

DROP TABLE IF EXISTS `swticketemails`;
CREATE TABLE `swticketemails` (
  `ticketemailid` int(10) unsigned NOT NULL auto_increment,
  `email` varchar(255) NOT NULL,
  PRIMARY KEY  (`ticketemailid`),
  UNIQUE KEY `ticketemails1` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketfilterfields`
--

DROP TABLE IF EXISTS `swticketfilterfields`;
CREATE TABLE `swticketfilterfields` (
  `ticketfilterfieldid` int(10) unsigned NOT NULL auto_increment,
  `ticketfilterid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `fieldtitle` varchar(255) NOT NULL,
  `fieldoper` int(10) unsigned NOT NULL default '0',
  `fieldvalue` varchar(255) NOT NULL,
  PRIMARY KEY  (`ticketfilterfieldid`),
  KEY `ticketfilterfields` (`ticketfilterid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketfilters`
--

DROP TABLE IF EXISTS `swticketfilters`;
CREATE TABLE `swticketfilters` (
  `ticketfilterid` int(10) unsigned NOT NULL auto_increment,
  `dateline` int(10) unsigned NOT NULL default '0',
  `filtertype` enum('public','private') NOT NULL default 'public',
  `title` varchar(255) NOT NULL,
  `staffid` int(10) unsigned NOT NULL default '0',
  `filteroptions` enum('all','any') NOT NULL default 'all',
  PRIMARY KEY  (`ticketfilterid`),
  KEY `ticketfilters1` (`filtertype`,`staffid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketlabellinks`
--

DROP TABLE IF EXISTS `swticketlabellinks`;
CREATE TABLE `swticketlabellinks` (
  `ticketlabellinkid` int(10) unsigned NOT NULL auto_increment,
  `ticketlabelid` int(10) unsigned NOT NULL default '0',
  `ticketid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketlabellinkid`),
  UNIQUE KEY `ticketlabellinks1` (`ticketlabelid`,`ticketid`),
  KEY `ticketlabellinks2` (`ticketid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketlabels`
--

DROP TABLE IF EXISTS `swticketlabels`;
CREATE TABLE `swticketlabels` (
  `ticketlabelid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `labeltype` enum('public','private') NOT NULL default 'public',
  `staffid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketlabelid`),
  KEY `ticketlabels1` (`labeltype`,`staffid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketlocks`
--

DROP TABLE IF EXISTS `swticketlocks`;
CREATE TABLE `swticketlocks` (
  `ticketid` int(10) unsigned NOT NULL default '0',
  `lockstaffid` int(10) unsigned NOT NULL default '0',
  `lockdateline` int(10) unsigned NOT NULL default '0',
  UNIQUE KEY `ticketlocks1` (`ticketid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketmergelog`
--

DROP TABLE IF EXISTS `swticketmergelog`;
CREATE TABLE `swticketmergelog` (
  `mergelogid` int(10) unsigned NOT NULL auto_increment,
  `oldticketid` int(10) unsigned NOT NULL default '0',
  `oldticketmaskid` varchar(20) NOT NULL,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`mergelogid`),
  KEY `ticketmergelog1` (`oldticketid`),
  KEY `ticketmergelog2` (`oldticketmaskid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketmessageids`
--

DROP TABLE IF EXISTS `swticketmessageids`;
CREATE TABLE `swticketmessageids` (
  `ticketmessageid` int(10) unsigned NOT NULL auto_increment,
  `messageid` varchar(15) NOT NULL,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `ticketpostid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketmessageid`),
  KEY `ticketmessageids1` (`messageid`,`ticketid`),
  KEY `ticketmessageids2` (`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketnotes`
--

DROP TABLE IF EXISTS `swticketnotes`;
CREATE TABLE `swticketnotes` (
  `ticketnoteid` int(10) unsigned NOT NULL auto_increment,
  `typeid` int(10) unsigned NOT NULL default '0',
  `notetype` smallint(1) unsigned NOT NULL default '0',
  `forstaffid` int(10) unsigned NOT NULL default '0',
  `bystaffid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `notes` text NOT NULL,
  PRIMARY KEY  (`ticketnoteid`),
  KEY `ticketnotes1` (`typeid`,`notetype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketpostindex`
--

DROP TABLE IF EXISTS `swticketpostindex`;
CREATE TABLE `swticketpostindex` (
  `ticketwordid` int(10) unsigned NOT NULL default '0',
  `ticketpostid` int(10) unsigned NOT NULL default '0',
  `insubject` smallint(1) unsigned NOT NULL default '0',
  UNIQUE KEY `ticketpostindex` (`ticketwordid`,`ticketpostid`,`insubject`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketposts`
--

DROP TABLE IF EXISTS `swticketposts`;
CREATE TABLE `swticketposts` (
  `ticketpostid` int(10) unsigned NOT NULL auto_increment,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `emailto` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `ipaddress` varchar(255) NOT NULL,
  `hasattachments` smallint(1) NOT NULL default '0',
  `edited` smallint(1) unsigned NOT NULL default '0',
  `editedbystaffid` int(10) unsigned NOT NULL default '0',
  `editeddateline` int(10) unsigned NOT NULL default '0',
  `creator` smallint(1) NOT NULL default '0',
  `ishtml` smallint(1) unsigned NOT NULL default '0',
  `isemailed` smallint(1) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  `contenthash` varchar(32) NOT NULL,
  `subjecthash` varchar(32) NOT NULL,
  PRIMARY KEY  (`ticketpostid`),
  KEY `ticketposts1` (`ticketid`,`staffid`),
  KEY `ticketposts2` (`email`,`subjecthash`),
  KEY `ticketposts3` (`creator`,`staffid`,`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketpriorities`
--

DROP TABLE IF EXISTS `swticketpriorities`;
CREATE TABLE `swticketpriorities` (
  `priorityid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL default '0',
  `type` enum('public','private') NOT NULL default 'public',
  `frcolorcode` varchar(100) NOT NULL,
  `bgcolorcode` varchar(100) NOT NULL,
  `iscustom` smallint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (`priorityid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketrecipients`
--

DROP TABLE IF EXISTS `swticketrecipients`;
CREATE TABLE `swticketrecipients` (
  `recipientid` int(10) unsigned NOT NULL auto_increment,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `ticketemailid` int(10) unsigned NOT NULL default '0',
  `recipienttype` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`recipientid`),
  UNIQUE KEY `ticketrecipients` (`ticketid`,`ticketemailid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtickets`
--

DROP TABLE IF EXISTS `swtickets`;
CREATE TABLE `swtickets` (
  `ticketid` int(10) unsigned NOT NULL auto_increment,
  `ticketmaskid` varchar(20) NOT NULL,
  `departmentid` int(10) unsigned NOT NULL default '0',
  `ticketstatusid` int(10) unsigned NOT NULL default '0',
  `priorityid` int(10) unsigned NOT NULL default '0',
  `emailqueueid` int(10) unsigned NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `ownerstaffid` int(10) unsigned NOT NULL default '0',
  `assignstatus` smallint(1) unsigned NOT NULL default '0',
  `fullname` varchar(255) NOT NULL,
  `email` varchar(180) NOT NULL,
  `lastreplier` varchar(255) NOT NULL,
  `replyto` varchar(255) NOT NULL,
  `subject` varchar(150) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `lastactivity` int(10) unsigned NOT NULL default '0',
  `laststaffreplytime` int(10) unsigned NOT NULL default '0',
  `slaplanid` int(10) unsigned NOT NULL default '0',
  `ticketslaplanid` int(10) unsigned NOT NULL default '0',
  `duetime` int(10) unsigned NOT NULL default '0',
  `totalreplies` int(10) unsigned NOT NULL default '0',
  `ipaddress` varchar(120) NOT NULL,
  `flagtype` smallint(1) unsigned NOT NULL default '0',
  `hasnotes` smallint(1) unsigned NOT NULL default '0',
  `hasattachments` smallint(1) unsigned NOT NULL default '0',
  `isemailed` smallint(1) unsigned NOT NULL default '0',
  `edited` smallint(1) unsigned NOT NULL default '0',
  `editedbystaffid` int(10) unsigned NOT NULL default '0',
  `editeddateline` int(10) unsigned NOT NULL default '0',
  `creator` smallint(1) NOT NULL default '0',
  `charset` varchar(100) NOT NULL,
  `transferencoding` varchar(50) NOT NULL,
  `timeworked` int(10) unsigned NOT NULL default '0',
  `dateicon` int(10) unsigned NOT NULL default '0',
  `lastpostid` int(10) unsigned NOT NULL default '0',
  `firstpostid` int(10) unsigned NOT NULL default '0',
  `tgroupid` int(10) unsigned NOT NULL default '0',
  `messageid` varchar(15) NOT NULL,
  `escalationruleid` int(10) unsigned NOT NULL default '0',
  `hasdraft` smallint(1) unsigned NOT NULL default '0',
  `hasbilling` smallint(1) unsigned NOT NULL default '0',
  `isphonecall` smallint(1) unsigned NOT NULL default '0',
  `isescalated` smallint(1) unsigned NOT NULL default '0',
  `phoneno` varchar(255) NOT NULL,
  `autoclosetimeline` int(10) unsigned NOT NULL default '0',
  `islabeled` smallint(1) unsigned NOT NULL default '0',
  `lastuserreplytime` int(10) unsigned NOT NULL default '0',
  `escalatedtime` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketid`),
  KEY `ticketcount` (`departmentid`,`ticketstatusid`,`ownerstaffid`),
  KEY `tickets1` (`userid`),
  KEY `tickets2` (`slaplanid`,`duetime`,`ticketstatusid`),
  KEY `tickets3` (`departmentid`,`ticketstatusid`,`lastactivity`),
  KEY `tickets4` (`email`,`subject`),
  KEY `tickets5` (`departmentid`,`ticketstatusid`,`userid`),
  KEY `tickets6` (`departmentid`,`ticketstatusid`,`duetime`),
  KEY `tickets7` (`dateline`),
  KEY `tickets8` (`departmentid`,`ticketstatusid`,`lastuserreplytime`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketsearches`
--

DROP TABLE IF EXISTS `swticketsearches`;
CREATE TABLE `swticketsearches` (
  `ticketsearchid` int(10) unsigned NOT NULL auto_increment,
  `staffid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `keywords` varchar(255) NOT NULL,
  `resultscount` int(10) unsigned NOT NULL default '0',
  `timetaken` float unsigned NOT NULL default '0',
  `ticketidlist` mediumtext NOT NULL,
  `relevancelist` mediumtext NOT NULL,
  `rejectedwords` varchar(255) NOT NULL,
  `ticketfilterid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketsearchid`),
  KEY `ticketsearches1` (`dateline`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketstatus`
--

DROP TABLE IF EXISTS `swticketstatus`;
CREATE TABLE `swticketstatus` (
  `ticketstatusid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `displayorder` int(10) unsigned NOT NULL default '0',
  `iscustom` smallint(1) unsigned NOT NULL default '1',
  `displayinmainlist` smallint(1) unsigned NOT NULL default '0',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  `statustype` smallint(1) unsigned NOT NULL default '0',
  `displaycount` smallint(1) unsigned NOT NULL default '0',
  `statuscolor` varchar(50) NOT NULL,
  `departmentid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketstatusid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtickettimetrack`
--

DROP TABLE IF EXISTS `swtickettimetrack`;
CREATE TABLE `swtickettimetrack` (
  `timetrackid` int(10) unsigned NOT NULL auto_increment,
  `ticketid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `creatorstaffid` int(10) unsigned NOT NULL default '0',
  `timespent` int(10) unsigned NOT NULL default '0',
  `timebillable` int(10) unsigned NOT NULL default '0',
  `forstaffid` int(10) unsigned NOT NULL default '0',
  `notes` mediumtext NOT NULL,
  PRIMARY KEY  (`timetrackid`),
  KEY `tickettimetrack` (`ticketid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketviewfields`
--

DROP TABLE IF EXISTS `swticketviewfields`;
CREATE TABLE `swticketviewfields` (
  `ticketviewfieldid` int(10) unsigned NOT NULL auto_increment,
  `ticketviewid` int(10) unsigned NOT NULL default '0',
  `ticketviewfieldtype` smallint(1) unsigned NOT NULL default '0',
  `customfieldid` int(10) unsigned NOT NULL default '0',
  `fieldlinkid` smallint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketviewfieldid`),
  KEY `ticketviewfields1` (`ticketviewid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketviews`
--

DROP TABLE IF EXISTS `swticketviews`;
CREATE TABLE `swticketviews` (
  `ticketviewid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(255) NOT NULL,
  `viewtype` smallint(1) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `viewalltickets` smallint(1) unsigned NOT NULL default '0',
  `viewunassigned` smallint(1) unsigned NOT NULL default '0',
  `viewassigned` smallint(1) unsigned NOT NULL default '0',
  `sortby` smallint(3) unsigned NOT NULL default '0',
  `sortorder` smallint(1) unsigned NOT NULL default '0',
  `ismaster` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  `ticketsperpage` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`ticketviewid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swticketwords`
--

DROP TABLE IF EXISTS `swticketwords`;
CREATE TABLE `swticketwords` (
  `ticketwordid` int(10) unsigned NOT NULL auto_increment,
  `contents` char(50) NOT NULL,
  PRIMARY KEY  (`ticketwordid`),
  UNIQUE KEY `ticketwords` (`contents`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtroubleshootercat`
--

DROP TABLE IF EXISTS `swtroubleshootercat`;
CREATE TABLE `swtroubleshootercat` (
  `troubleshootercatid` int(10) unsigned NOT NULL auto_increment,
  `staffid` int(10) unsigned NOT NULL default '0',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`troubleshootercatid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtroubleshooterdata`
--

DROP TABLE IF EXISTS `swtroubleshooterdata`;
CREATE TABLE `swtroubleshooterdata` (
  `troubleshooterdataid` int(10) unsigned NOT NULL auto_increment,
  `troubleshooterid` int(10) unsigned NOT NULL default '0',
  `contents` mediumtext NOT NULL,
  PRIMARY KEY  (`troubleshooterdataid`),
  KEY `troubleshooterdata1` (`troubleshooterid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtroubleshooterlinks`
--

DROP TABLE IF EXISTS `swtroubleshooterlinks`;
CREATE TABLE `swtroubleshooterlinks` (
  `troubleshooterlinkid` int(10) unsigned NOT NULL auto_increment,
  `troubleshootercatid` int(10) unsigned NOT NULL default '0',
  `parenttroubleshooterid` int(10) unsigned NOT NULL default '0',
  `childtroubleshooterid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`troubleshooterlinkid`),
  UNIQUE KEY `troubleshootercatid` (`troubleshootercatid`,`parenttroubleshooterid`,`childtroubleshooterid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtroubleshootersteps`
--

DROP TABLE IF EXISTS `swtroubleshootersteps`;
CREATE TABLE `swtroubleshootersteps` (
  `troubleshooterid` int(10) unsigned NOT NULL auto_increment,
  `troubleshootercatid` int(10) unsigned NOT NULL default '0',
  `staffid` int(10) unsigned NOT NULL default '0',
  `subject` varchar(255) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `edited` smallint(1) unsigned NOT NULL default '0',
  `editedstaffid` int(10) unsigned NOT NULL default '0',
  `displayorder` int(10) unsigned NOT NULL default '0',
  `views` int(10) unsigned NOT NULL default '0',
  `totalcomments` int(10) unsigned NOT NULL default '0',
  `redirecttickets` smallint(1) unsigned NOT NULL default '0',
  `redirectdepartmentid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`troubleshooterid`),
  KEY `troubleshootersteps1` (`troubleshootercatid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swtwdeletelog`
--

DROP TABLE IF EXISTS `swtwdeletelog`;
CREATE TABLE `swtwdeletelog` (
  `twdeletelogid` int(10) unsigned NOT NULL auto_increment,
  `entrytype` smallint(1) unsigned NOT NULL default '0',
  `entryid` varchar(50) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `guidid` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`twdeletelogid`),
  KEY `twdeletelog1` (`dateline`),
  KEY `twdeletelog2` (`guidid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `swuseremails`
--

DROP TABLE IF EXISTS `swuseremails`;
CREATE TABLE `swuseremails` (
  `useremailid` int(10) unsigned NOT NULL auto_increment,
  `userid` int(10) unsigned NOT NULL default '0',
  `email` varchar(255) NOT NULL,
  `isprimary` smallint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`useremailid`),
  UNIQUE KEY `email` (`email`),
  KEY `usersemail1` (`userid`),
  KEY `usersemail2` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swusergroups`
--

DROP TABLE IF EXISTS `swusergroups`;
CREATE TABLE `swusergroups` (
  `usergroupid` int(10) unsigned NOT NULL auto_increment,
  `title` varchar(100) NOT NULL,
  `grouptype` enum('guest','registered','custom') NOT NULL default 'custom',
  `ismaster` smallint(1) unsigned NOT NULL default '0',
  `slaplanid` int(10) unsigned NOT NULL default '0',
  `slaexpiry` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`usergroupid`),
  KEY `usergroups1` (`grouptype`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swusergroupsettings`
--

DROP TABLE IF EXISTS `swusergroupsettings`;
CREATE TABLE `swusergroupsettings` (
  `ugroupsettingid` int(10) unsigned NOT NULL auto_increment,
  `usergroupid` int(10) unsigned NOT NULL default '0',
  `name` varchar(100) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY  (`ugroupsettingid`),
  UNIQUE KEY `usergroupid` (`usergroupid`,`name`),
  KEY `usergroupsettings1` (`usergroupid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swusers`
--

DROP TABLE IF EXISTS `swusers`;
CREATE TABLE `swusers` (
  `userid` int(10) unsigned NOT NULL auto_increment,
  `usergroupid` int(10) unsigned NOT NULL default '0',
  `fullname` varchar(200) NOT NULL,
  `phone` varchar(200) NOT NULL,
  `userpassword` varchar(50) NOT NULL,
  `userpasswordtxt` varchar(50) NOT NULL,
  `dateline` int(10) unsigned NOT NULL default '0',
  `lastvisit` int(10) unsigned NOT NULL default '0',
  `lastactivity` int(10) unsigned NOT NULL default '0',
  `enabled` smallint(1) unsigned NOT NULL default '0',
  `loginapi_moduleid` int(10) unsigned NOT NULL default '1',
  `loginapi_userid` varchar(100) NOT NULL,
  `languageid` int(10) unsigned NOT NULL default '0',
  `timezoneoffset` varchar(10) NOT NULL default '0',
  `enabledst` smallint(1) unsigned NOT NULL default '0',
  `useremailcount` int(10) unsigned NOT NULL default '0',
  `allowemail` smallint(1) unsigned NOT NULL default '0',
  `slaplanid` int(10) unsigned NOT NULL default '0',
  `slaexpiry` int(10) unsigned NOT NULL default '0',
  `ismanager` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`userid`),
  KEY `users1` (`usergroupid`),
  KEY `users3` (`loginapi_moduleid`,`loginapi_userid`),
  KEY `users4` (`enabled`,`dateline`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Table structure for table `swuserverifyhash`
--

DROP TABLE IF EXISTS `swuserverifyhash`;
CREATE TABLE `swuserverifyhash` (
  `userverifyhashid` varchar(50) NOT NULL default '0',
  `userid` int(10) unsigned NOT NULL default '0',
  `dateline` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`userverifyhashid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2008-07-12 19:30:27
