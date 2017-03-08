-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: wiki_demo
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

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
-- Table structure for table `approved_revs`
--

DROP TABLE IF EXISTS `approved_revs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_revs` (
  `page_id` int(11) DEFAULT NULL,
  `rev_id` int(11) DEFAULT NULL,
  UNIQUE KEY `approved_revs_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_revs`
--

LOCK TABLES `approved_revs` WRITE;
/*!40000 ALTER TABLE `approved_revs` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_revs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approved_revs_files`
--

DROP TABLE IF EXISTS `approved_revs_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approved_revs_files` (
  `file_title` varbinary(255) NOT NULL,
  `approved_timestamp` binary(14) NOT NULL,
  `approved_sha1` varbinary(32) NOT NULL,
  UNIQUE KEY `approved_revs_file_title` (`file_title`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approved_revs_files`
--

LOCK TABLES `approved_revs_files` WRITE;
/*!40000 ALTER TABLE `approved_revs_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `approved_revs_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archive`
--

DROP TABLE IF EXISTS `archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive` (
  `ar_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ar_namespace` int(11) NOT NULL DEFAULT '0',
  `ar_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ar_text` mediumblob NOT NULL,
  `ar_comment` varbinary(767) NOT NULL,
  `ar_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ar_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `ar_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ar_minor_edit` tinyint(4) NOT NULL DEFAULT '0',
  `ar_flags` tinyblob NOT NULL,
  `ar_rev_id` int(10) unsigned DEFAULT NULL,
  `ar_text_id` int(10) unsigned DEFAULT NULL,
  `ar_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `ar_len` int(10) unsigned DEFAULT NULL,
  `ar_page_id` int(10) unsigned DEFAULT NULL,
  `ar_parent_id` int(10) unsigned DEFAULT NULL,
  `ar_sha1` varbinary(32) NOT NULL DEFAULT '',
  `ar_content_model` varbinary(32) DEFAULT NULL,
  `ar_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`ar_id`),
  KEY `name_title_timestamp` (`ar_namespace`,`ar_title`,`ar_timestamp`),
  KEY `ar_usertext_timestamp` (`ar_user_text`,`ar_timestamp`),
  KEY `ar_revid` (`ar_rev_id`),
  KEY `usertext_timestamp` (`ar_user_text`,`ar_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive`
--

LOCK TABLES `archive` WRITE;
/*!40000 ALTER TABLE `archive` DISABLE KEYS */;
/*!40000 ALTER TABLE `archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bot_passwords`
--

DROP TABLE IF EXISTS `bot_passwords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_passwords` (
  `bp_user` int(11) NOT NULL,
  `bp_app_id` varbinary(32) NOT NULL,
  `bp_password` tinyblob NOT NULL,
  `bp_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `bp_restrictions` blob NOT NULL,
  `bp_grants` blob NOT NULL,
  PRIMARY KEY (`bp_user`,`bp_app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bot_passwords`
--

LOCK TABLES `bot_passwords` WRITE;
/*!40000 ALTER TABLE `bot_passwords` DISABLE KEYS */;
/*!40000 ALTER TABLE `bot_passwords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `cat_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cat_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `cat_pages` int(11) NOT NULL DEFAULT '0',
  `cat_subcats` int(11) NOT NULL DEFAULT '0',
  `cat_files` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`),
  UNIQUE KEY `cat_title` (`cat_title`),
  KEY `cat_pages` (`cat_pages`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Pages_with_broken_file_links',1,0,0);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorylinks`
--

DROP TABLE IF EXISTS `categorylinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorylinks` (
  `cl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `cl_to` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cl_sortkey` varbinary(230) NOT NULL DEFAULT '',
  `cl_sortkey_prefix` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `cl_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cl_collation` varbinary(32) NOT NULL DEFAULT '',
  `cl_type` enum('page','subcat','file') NOT NULL DEFAULT 'page',
  UNIQUE KEY `cl_from` (`cl_from`,`cl_to`),
  KEY `cl_sortkey` (`cl_to`,`cl_type`,`cl_sortkey`,`cl_from`),
  KEY `cl_timestamp` (`cl_to`,`cl_timestamp`),
  KEY `cl_collation_ext` (`cl_collation`,`cl_to`,`cl_type`,`cl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorylinks`
--

LOCK TABLES `categorylinks` WRITE;
/*!40000 ALTER TABLE `categorylinks` DISABLE KEYS */;
INSERT INTO `categorylinks` VALUES (8,'Pages_with_broken_file_links','FILE LINK','','2017-03-08 10:09:33','uppercase','page');
/*!40000 ALTER TABLE `categorylinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `change_tag`
--

DROP TABLE IF EXISTS `change_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_tag` (
  `ct_rc_id` int(11) DEFAULT NULL,
  `ct_log_id` int(11) DEFAULT NULL,
  `ct_rev_id` int(11) DEFAULT NULL,
  `ct_tag` varchar(255) NOT NULL,
  `ct_params` blob,
  UNIQUE KEY `change_tag_rc_tag` (`ct_rc_id`,`ct_tag`),
  UNIQUE KEY `change_tag_log_tag` (`ct_log_id`,`ct_tag`),
  UNIQUE KEY `change_tag_rev_tag` (`ct_rev_id`,`ct_tag`),
  KEY `change_tag_tag_id` (`ct_tag`,`ct_rc_id`,`ct_rev_id`,`ct_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_tag`
--

LOCK TABLES `change_tag` WRITE;
/*!40000 ALTER TABLE `change_tag` DISABLE KEYS */;
INSERT INTO `change_tag` VALUES (1,NULL,35,'visualeditor',NULL),(4,NULL,38,'visualeditor',NULL);
/*!40000 ALTER TABLE `change_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echo_email_batch`
--

DROP TABLE IF EXISTS `echo_email_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `echo_email_batch` (
  `eeb_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `eeb_user_id` int(10) unsigned NOT NULL,
  `eeb_event_priority` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `eeb_event_id` int(10) unsigned NOT NULL,
  `eeb_event_hash` varbinary(32) NOT NULL,
  PRIMARY KEY (`eeb_id`),
  UNIQUE KEY `echo_email_batch_user_event` (`eeb_user_id`,`eeb_event_id`),
  KEY `echo_email_batch_user_hash_priority` (`eeb_user_id`,`eeb_event_hash`,`eeb_event_priority`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echo_email_batch`
--

LOCK TABLES `echo_email_batch` WRITE;
/*!40000 ALTER TABLE `echo_email_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `echo_email_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echo_event`
--

DROP TABLE IF EXISTS `echo_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `echo_event` (
  `event_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_type` varbinary(64) NOT NULL,
  `event_variant` varbinary(64) DEFAULT NULL,
  `event_agent_id` int(10) unsigned DEFAULT NULL,
  `event_agent_ip` varbinary(39) DEFAULT NULL,
  `event_page_namespace` int(10) unsigned DEFAULT NULL,
  `event_page_title` varbinary(255) DEFAULT NULL,
  `event_extra` blob,
  `event_page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `echo_event_type` (`event_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echo_event`
--

LOCK TABLES `echo_event` WRITE;
/*!40000 ALTER TABLE `echo_event` DISABLE KEYS */;
INSERT INTO `echo_event` VALUES (1,'page-linked',NULL,NULL,'127.0.0.1',NULL,NULL,'a:3:{s:17:\"link-from-page-id\";i:35;s:10:\"page_title\";s:9:\"Test_Page\";s:14:\"page_namespace\";i:0;}',NULL),(2,'thank-you-edit',NULL,1,NULL,NULL,NULL,'a:2:{s:11:\"notifyAgent\";b:1;s:9:\"editCount\";i:1;}',37);
/*!40000 ALTER TABLE `echo_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echo_notification`
--

DROP TABLE IF EXISTS `echo_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `echo_notification` (
  `notification_event` int(10) unsigned NOT NULL,
  `notification_user` int(10) unsigned NOT NULL,
  `notification_timestamp` binary(14) NOT NULL,
  `notification_read_timestamp` binary(14) DEFAULT NULL,
  `notification_bundle_base` tinyint(1) NOT NULL DEFAULT '1',
  `notification_bundle_hash` varbinary(32) NOT NULL,
  `notification_bundle_display_hash` varbinary(32) NOT NULL,
  UNIQUE KEY `user_event` (`notification_user`,`notification_event`),
  KEY `echo_user_timestamp` (`notification_user`,`notification_timestamp`),
  KEY `echo_notification_user_base_read_timestamp` (`notification_user`,`notification_bundle_base`,`notification_read_timestamp`),
  KEY `echo_notification_user_base_timestamp` (`notification_user`,`notification_bundle_base`,`notification_timestamp`,`notification_event`),
  KEY `echo_notification_user_hash_timestamp` (`notification_user`,`notification_bundle_hash`,`notification_timestamp`),
  KEY `echo_notification_user_hash_base_timestamp` (`notification_user`,`notification_bundle_display_hash`,`notification_bundle_base`,`notification_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echo_notification`
--

LOCK TABLES `echo_notification` WRITE;
/*!40000 ALTER TABLE `echo_notification` DISABLE KEYS */;
INSERT INTO `echo_notification` VALUES (2,1,'20170308115100',NULL,1,'','');
/*!40000 ALTER TABLE `echo_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `echo_target_page`
--

DROP TABLE IF EXISTS `echo_target_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `echo_target_page` (
  `etp_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `etp_user` int(10) unsigned NOT NULL DEFAULT '0',
  `etp_page` int(10) unsigned NOT NULL DEFAULT '0',
  `etp_event` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`etp_id`),
  KEY `echo_target_page_user_event` (`etp_user`,`etp_event`),
  KEY `echo_target_page_user_page_event` (`etp_user`,`etp_page`,`etp_event`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `echo_target_page`
--

LOCK TABLES `echo_target_page` WRITE;
/*!40000 ALTER TABLE `echo_target_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `echo_target_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `externallinks`
--

DROP TABLE IF EXISTS `externallinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `externallinks` (
  `el_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `el_from` int(10) unsigned NOT NULL DEFAULT '0',
  `el_to` blob NOT NULL,
  `el_index` blob NOT NULL,
  PRIMARY KEY (`el_id`),
  KEY `el_from` (`el_from`,`el_to`(40)),
  KEY `el_to` (`el_to`(60),`el_from`),
  KEY `el_index` (`el_index`(60))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `externallinks`
--

LOCK TABLES `externallinks` WRITE;
/*!40000 ALTER TABLE `externallinks` DISABLE KEYS */;
INSERT INTO `externallinks` VALUES (1,8,'http://example.com/somefile.pdf','http://com.example./somefile.pdf'),(2,10,'http://en.wikipedia.org/wiki/Non-breaking_space','http://org.wikipedia.en./wiki/Non-breaking_space'),(3,24,'http://www.mediawiki.org/wiki/Extension:Semantic_Internal_Objects','http://org.mediawiki.www./wiki/Extension:Semantic_Internal_Objects'),(4,25,'http://www.mediawiki.org/wiki/Extension:Semantic_Internal_Objects','http://org.mediawiki.www./wiki/Extension:Semantic_Internal_Objects');
/*!40000 ALTER TABLE `externallinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filearchive`
--

DROP TABLE IF EXISTS `filearchive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filearchive` (
  `fa_id` int(11) NOT NULL AUTO_INCREMENT,
  `fa_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `fa_archive_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT '',
  `fa_storage_group` varbinary(16) DEFAULT NULL,
  `fa_storage_key` varbinary(64) DEFAULT '',
  `fa_deleted_user` int(11) DEFAULT NULL,
  `fa_deleted_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted_reason` varbinary(767) DEFAULT '',
  `fa_size` int(10) unsigned DEFAULT '0',
  `fa_width` int(11) DEFAULT '0',
  `fa_height` int(11) DEFAULT '0',
  `fa_metadata` mediumblob,
  `fa_bits` int(11) DEFAULT '0',
  `fa_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `fa_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT NULL,
  `fa_minor_mime` varbinary(100) DEFAULT 'unknown',
  `fa_description` varbinary(767) DEFAULT NULL,
  `fa_user` int(10) unsigned DEFAULT '0',
  `fa_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `fa_timestamp` binary(14) DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `fa_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `fa_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`fa_id`),
  KEY `fa_name` (`fa_name`,`fa_timestamp`),
  KEY `fa_storage_group` (`fa_storage_group`,`fa_storage_key`),
  KEY `fa_deleted_timestamp` (`fa_deleted_timestamp`),
  KEY `fa_user_timestamp` (`fa_user_text`,`fa_timestamp`),
  KEY `fa_sha1` (`fa_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filearchive`
--

LOCK TABLES `filearchive` WRITE;
/*!40000 ALTER TABLE `filearchive` DISABLE KEYS */;
/*!40000 ALTER TABLE `filearchive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `img_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `img_size` int(10) unsigned NOT NULL DEFAULT '0',
  `img_width` int(11) NOT NULL DEFAULT '0',
  `img_height` int(11) NOT NULL DEFAULT '0',
  `img_metadata` mediumblob NOT NULL,
  `img_bits` int(11) NOT NULL DEFAULT '0',
  `img_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `img_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT NULL,
  `img_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `img_description` varbinary(767) NOT NULL,
  `img_user` int(10) unsigned NOT NULL DEFAULT '0',
  `img_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `img_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `img_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`img_name`),
  KEY `img_usertext_timestamp` (`img_user_text`,`img_timestamp`),
  KEY `img_size` (`img_size`),
  KEY `img_timestamp` (`img_timestamp`),
  KEY `img_sha1` (`img_sha1`(10)),
  KEY `img_media_mime` (`img_media_type`,`img_major_mime`,`img_minor_mime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES ('Test_image.png',3516,260,164,'a:6:{s:10:\"frameCount\";i:0;s:9:\"loopCount\";i:1;s:8:\"duration\";d:0;s:8:\"bitDepth\";i:8;s:9:\"colorType\";s:10:\"truecolour\";s:8:\"metadata\";a:4:{s:11:\"XResolution\";s:8:\"3779/100\";s:11:\"YResolution\";s:8:\"3779/100\";s:14:\"ResolutionUnit\";i:3;s:15:\"_MW_PNG_VERSION\";i:1;}}',8,'BITMAP','image','png','',1,'Admin','20170308115100','ev4wslmcte1886dx763my2n1b9c3tep');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagelinks`
--

DROP TABLE IF EXISTS `imagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagelinks` (
  `il_from` int(10) unsigned NOT NULL DEFAULT '0',
  `il_from_namespace` int(11) NOT NULL DEFAULT '0',
  `il_to` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  UNIQUE KEY `il_from` (`il_from`,`il_to`),
  UNIQUE KEY `il_to` (`il_to`,`il_from`),
  KEY `il_backlinks_namespace` (`il_from_namespace`,`il_to`,`il_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagelinks`
--

LOCK TABLES `imagelinks` WRITE;
/*!40000 ALTER TABLE `imagelinks` DISABLE KEYS */;
INSERT INTO `imagelinks` VALUES (8,10,'International_Space_Station.pdf'),(8,10,'My_Fictitious_File.doc');
/*!40000 ALTER TABLE `imagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interwiki`
--

DROP TABLE IF EXISTS `interwiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interwiki` (
  `iw_prefix` varchar(32) NOT NULL,
  `iw_url` blob NOT NULL,
  `iw_api` blob NOT NULL,
  `iw_wikiid` varchar(64) NOT NULL,
  `iw_local` tinyint(1) NOT NULL,
  `iw_trans` tinyint(4) NOT NULL DEFAULT '0',
  UNIQUE KEY `iw_prefix` (`iw_prefix`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interwiki`
--

LOCK TABLES `interwiki` WRITE;
/*!40000 ALTER TABLE `interwiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `interwiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ipblocks`
--

DROP TABLE IF EXISTS `ipblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ipblocks` (
  `ipb_id` int(11) NOT NULL AUTO_INCREMENT,
  `ipb_address` tinyblob NOT NULL,
  `ipb_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by` int(10) unsigned NOT NULL DEFAULT '0',
  `ipb_by_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `ipb_reason` varbinary(767) NOT NULL,
  `ipb_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `ipb_auto` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_anon_only` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_create_account` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_enable_autoblock` tinyint(1) NOT NULL DEFAULT '1',
  `ipb_expiry` varbinary(14) NOT NULL DEFAULT '',
  `ipb_range_start` tinyblob NOT NULL,
  `ipb_range_end` tinyblob NOT NULL,
  `ipb_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_block_email` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_allow_usertalk` tinyint(1) NOT NULL DEFAULT '0',
  `ipb_parent_block_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ipb_id`),
  UNIQUE KEY `ipb_address` (`ipb_address`(255),`ipb_user`,`ipb_auto`,`ipb_anon_only`),
  KEY `ipb_user` (`ipb_user`),
  KEY `ipb_range` (`ipb_range_start`(8),`ipb_range_end`(8)),
  KEY `ipb_timestamp` (`ipb_timestamp`),
  KEY `ipb_expiry` (`ipb_expiry`),
  KEY `ipb_parent_block_id` (`ipb_parent_block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ipblocks`
--

LOCK TABLES `ipblocks` WRITE;
/*!40000 ALTER TABLE `ipblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `ipblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `iwlinks`
--

DROP TABLE IF EXISTS `iwlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `iwlinks` (
  `iwl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `iwl_prefix` varbinary(20) NOT NULL DEFAULT '',
  `iwl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  UNIQUE KEY `iwl_from` (`iwl_from`,`iwl_prefix`,`iwl_title`),
  KEY `iwl_prefix_title_from` (`iwl_prefix`,`iwl_title`,`iwl_from`),
  KEY `iwl_prefix_from_title` (`iwl_prefix`,`iwl_from`,`iwl_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `iwlinks`
--

LOCK TABLES `iwlinks` WRITE;
/*!40000 ALTER TABLE `iwlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `iwlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `job` (
  `job_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_cmd` varbinary(60) NOT NULL DEFAULT '',
  `job_namespace` int(11) NOT NULL,
  `job_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `job_timestamp` varbinary(14) DEFAULT NULL,
  `job_params` blob NOT NULL,
  `job_random` int(10) unsigned NOT NULL DEFAULT '0',
  `job_attempts` int(10) unsigned NOT NULL DEFAULT '0',
  `job_token` varbinary(32) NOT NULL DEFAULT '',
  `job_token_timestamp` varbinary(14) DEFAULT NULL,
  `job_sha1` varbinary(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`job_id`),
  KEY `job_sha1` (`job_sha1`),
  KEY `job_cmd_token` (`job_cmd`,`job_token`,`job_random`),
  KEY `job_cmd_token_id` (`job_cmd`,`job_token`,`job_id`),
  KEY `job_cmd` (`job_cmd`,`job_namespace`,`job_title`,`job_params`(128)),
  KEY `job_timestamp` (`job_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (8,'cirrusSearchIncomingLinkCount',0,'Test_Page','20170308114944','a:2:{s:7:\"cluster\";N;s:9:\"requestId\";s:27:\"WL-vxdUjEh-AB3qO94ESCQAAAAA\";}',812927011,0,'',NULL,'9t3ila5pi4ay0wowwbm97ruabapmeu8'),(9,'refreshLinksPrioritized',6,'Test_image.png','20170308115100','a:4:{s:16:\"rootJobTimestamp\";s:14:\"20170308115100\";s:23:\"useRecursiveLinksUpdate\";b:1;s:14:\"triggeringUser\";a:2:{s:6:\"userId\";i:1;s:8:\"userName\";s:5:\"Admin\";}s:20:\"triggeringRevisionId\";i:37;}',507425900,0,'',NULL,'6chg8sv95l4dp2lba0bi66ubg8hlvzg'),(11,'recentChangesUpdate',-1,'RecentChanges','20170308115100','a:2:{s:4:\"type\";s:11:\"cacheUpdate\";s:9:\"requestId\";s:27:\"WL-wJP5tIAAeadwlCcrW3wAAAAE\";}',1363737962,0,'',NULL,'t0ui7t0cg0b9prp29q7plzaevrijg70'),(12,'htmlCacheUpdate',6,'Test_image.png','20170308115100','a:6:{s:5:\"table\";s:10:\"imagelinks\";s:9:\"recursive\";b:1;s:13:\"rootJobIsSelf\";b:1;s:16:\"rootJobSignature\";s:40:\"45ebe37eb56dab785e8fd0f5e4e188972cc09c96\";s:16:\"rootJobTimestamp\";s:14:\"20170308115100\";s:9:\"requestId\";s:27:\"WL-wJP5tIAAeadwlCcrW3wAAAAE\";}',411314512,0,'',NULL,'ktwnlxrdaj2w32co7nm2voclospus8z'),(13,'htmlCacheUpdate',6,'Test_image.png','20170308115100','a:6:{s:5:\"table\";s:9:\"pagelinks\";s:9:\"recursive\";b:1;s:13:\"rootJobIsSelf\";b:1;s:16:\"rootJobSignature\";s:40:\"0dd45e53a3c9857edfba66ba26494be2e76d750f\";s:16:\"rootJobTimestamp\";s:14:\"20170308115100\";s:9:\"requestId\";s:27:\"WL-wJP5tIAAeadwlCcrW3wAAAAE\";}',788891624,0,'',NULL,'s0bbfxqre4nuwx3cz4o0pw8huek3v58'),(14,'refreshLinksPrioritized',0,'Test_Page','20170308115254','a:4:{s:16:\"rootJobTimestamp\";s:14:\"20170308115254\";s:23:\"useRecursiveLinksUpdate\";b:1;s:14:\"triggeringUser\";a:2:{s:6:\"userId\";i:1;s:8:\"userName\";s:5:\"Admin\";}s:20:\"triggeringRevisionId\";i:38;}',2127875717,0,'',NULL,'b1c5fm7d3wfxxs92bheol75gad51yvl'),(15,'htmlCacheUpdate',0,'Test_Page','20170308115254','a:6:{s:5:\"table\";s:13:\"templatelinks\";s:9:\"recursive\";b:1;s:13:\"rootJobIsSelf\";b:1;s:16:\"rootJobSignature\";s:40:\"f910ca9868f1400d3d19c4e234ec1f82c8b85d89\";s:16:\"rootJobTimestamp\";s:14:\"20170308115254\";s:9:\"requestId\";s:27:\"WL-wlf5tIAAeadwlCcrW4AAAAAE\";}',660655227,0,'',NULL,'7qsimr0ynzdzovurauoilyfouk6bryn'),(16,'htmlCacheUpdate',0,'Test_Page','20170308115254','a:6:{s:5:\"table\";s:8:\"redirect\";s:9:\"recursive\";b:1;s:13:\"rootJobIsSelf\";b:1;s:16:\"rootJobSignature\";s:40:\"2af6eefe0c0712067da95033cbd679f81230f589\";s:16:\"rootJobTimestamp\";s:14:\"20170308115254\";s:9:\"requestId\";s:27:\"WL-wlf5tIAAeadwlCcrW4AAAAAE\";}',1354112928,0,'',NULL,'j3racpagsq6brc5g6qfp2tuhvwvf5bc'),(17,'htmlCacheUpdate',0,'Test_Page','20170308115254','a:6:{s:5:\"table\";s:9:\"pagelinks\";s:9:\"recursive\";b:1;s:13:\"rootJobIsSelf\";b:1;s:16:\"rootJobSignature\";s:40:\"bb009b547b0c16c83a284b82a37c39572dc328cb\";s:16:\"rootJobTimestamp\";s:14:\"20170308115254\";s:9:\"requestId\";s:27:\"WL-wlf5tIAAeadwlCcrW4AAAAAE\";}',802398676,0,'',NULL,'j5tvar06u28zvkgzwtw0zp3thve5wdo');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `l10n_cache`
--

DROP TABLE IF EXISTS `l10n_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `l10n_cache` (
  `lc_lang` varbinary(32) NOT NULL,
  `lc_key` varchar(255) NOT NULL,
  `lc_value` mediumblob NOT NULL,
  KEY `lc_lang_key` (`lc_lang`,`lc_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `l10n_cache`
--

LOCK TABLES `l10n_cache` WRITE;
/*!40000 ALTER TABLE `l10n_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `l10n_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langlinks`
--

DROP TABLE IF EXISTS `langlinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langlinks` (
  `ll_from` int(10) unsigned NOT NULL DEFAULT '0',
  `ll_lang` varbinary(20) NOT NULL DEFAULT '',
  `ll_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  UNIQUE KEY `ll_from` (`ll_from`,`ll_lang`),
  KEY `ll_lang` (`ll_lang`,`ll_title`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langlinks`
--

LOCK TABLES `langlinks` WRITE;
/*!40000 ALTER TABLE `langlinks` DISABLE KEYS */;
/*!40000 ALTER TABLE `langlinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_search`
--

DROP TABLE IF EXISTS `log_search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_search` (
  `ls_field` varbinary(32) NOT NULL,
  `ls_value` varchar(255) NOT NULL,
  `ls_log_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `ls_field_val` (`ls_field`,`ls_value`,`ls_log_id`),
  KEY `ls_log_id` (`ls_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_search`
--

LOCK TABLES `log_search` WRITE;
/*!40000 ALTER TABLE `log_search` DISABLE KEYS */;
INSERT INTO `log_search` VALUES ('associated_rev_id','37',1);
/*!40000 ALTER TABLE `log_search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logging`
--

DROP TABLE IF EXISTS `logging`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logging` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varbinary(32) NOT NULL DEFAULT '',
  `log_action` varbinary(32) NOT NULL DEFAULT '',
  `log_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  `log_user` int(10) unsigned NOT NULL DEFAULT '0',
  `log_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `log_namespace` int(11) NOT NULL DEFAULT '0',
  `log_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `log_page` int(10) unsigned DEFAULT NULL,
  `log_comment` varbinary(767) NOT NULL DEFAULT '',
  `log_params` blob NOT NULL,
  `log_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`),
  KEY `type_time` (`log_type`,`log_timestamp`),
  KEY `user_time` (`log_user`,`log_timestamp`),
  KEY `page_time` (`log_namespace`,`log_title`,`log_timestamp`),
  KEY `times` (`log_timestamp`),
  KEY `log_user_type_time` (`log_user`,`log_type`,`log_timestamp`),
  KEY `log_page_id_time` (`log_page`,`log_timestamp`),
  KEY `type_action` (`log_type`,`log_action`,`log_timestamp`),
  KEY `log_user_text_type_time` (`log_user_text`,`log_type`,`log_timestamp`),
  KEY `log_user_text_time` (`log_user_text`,`log_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logging`
--

LOCK TABLES `logging` WRITE;
/*!40000 ALTER TABLE `logging` DISABLE KEYS */;
INSERT INTO `logging` VALUES (1,'upload','upload','20170308115100',1,'Admin',6,'Test_image.png',37,'','a:3:{s:8:\"img_sha1\";s:31:\"ev4wslmcte1886dx763my2n1b9c3tep\";s:13:\"img_timestamp\";s:14:\"20170308115100\";s:17:\"associated_rev_id\";i:37;}',0);
/*!40000 ALTER TABLE `logging` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `math`
--

DROP TABLE IF EXISTS `math`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `math` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_outputhash` varbinary(16) NOT NULL,
  `math_html_conservativeness` tinyint(4) NOT NULL,
  `math_html` blob,
  `math_mathml` blob,
  PRIMARY KEY (`math_inputhash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `math`
--

LOCK TABLES `math` WRITE;
/*!40000 ALTER TABLE `math` DISABLE KEYS */;
/*!40000 ALTER TABLE `math` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mathoid`
--

DROP TABLE IF EXISTS `mathoid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mathoid` (
  `math_inputhash` varbinary(16) NOT NULL,
  `math_input` blob NOT NULL,
  `math_tex` blob,
  `math_mathml` blob,
  `math_svg` blob,
  `math_style` tinyint(4) DEFAULT NULL,
  `math_input_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`math_inputhash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mathoid`
--

LOCK TABLES `mathoid` WRITE;
/*!40000 ALTER TABLE `mathoid` DISABLE KEYS */;
/*!40000 ALTER TABLE `mathoid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_deps`
--

DROP TABLE IF EXISTS `module_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_deps` (
  `md_module` varbinary(255) NOT NULL,
  `md_skin` varbinary(32) NOT NULL,
  `md_deps` mediumblob NOT NULL,
  UNIQUE KEY `md_module_skin` (`md_module`,`md_skin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_deps`
--

LOCK TABLES `module_deps` WRITE;
/*!40000 ALTER TABLE `module_deps` DISABLE KEYS */;
INSERT INTO `module_deps` VALUES ('ext.cite.visualEditor','vector|en','[\"extensions/Cite/modules/ve-cite/icons/ref-cite-book.svg\",\"extensions/Cite/modules/ve-cite/icons/ref-cite-journal-ltr.svg\",\"extensions/Cite/modules/ve-cite/icons/ref-cite-journal-rtl.svg\",\"extensions/Cite/modules/ve-cite/icons/ref-cite-news-ltr.svg\",\"extensions/Cite/modules/ve-cite/icons/ref-cite-news-rtl.svg\",\"extensions/Cite/modules/ve-cite/icons/ref-cite-web.svg\",\"extensions/Cite/modules/ve-cite/icons/reference-existing-ltr.svg\",\"extensions/Cite/modules/ve-cite/icons/reference-existing-rtl.svg\",\"extensions/Cite/modules/ve-cite/icons/reference-ltr.svg\",\"extensions/Cite/modules/ve-cite/icons/reference-rtl.svg\",\"extensions/Cite/modules/ve-cite/icons/references-ltr.svg\",\"extensions/Cite/modules/ve-cite/icons/references-rtl.svg\"]'),('ext.collapsiblevector.collapsibleNav','vector|en','[\"extensions/CollapsibleVector/modules/ext.collapsiblevector.collapsibleNav.less\",\"extensions/CollapsibleVector/modules/images/arrow-collapsed-ltr.png\",\"extensions/CollapsibleVector/modules/images/arrow-collapsed-ltr.svg\",\"extensions/CollapsibleVector/modules/images/arrow-expanded.png\",\"extensions/CollapsibleVector/modules/images/arrow-expanded.svg\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('ext.echo.styles.badge','apioutput|en','[\"extensions/Echo/modules/echo.variables.less\",\"extensions/Echo/modules/nojs/mw.echo.badge.less\"]'),('ext.echo.styles.badge','vector|en','[\"extensions/Echo/modules/echo.variables.less\",\"extensions/Echo/modules/echo.variables.vector.less\",\"extensions/Echo/modules/nojs/mw.echo.badge.less\",\"extensions/Echo/modules/nojs/mw.echo.badge.vector.less\"]'),('ext.math.visualEditor','vector|en','[\"extensions/Math/modules/ve-math/math-display-block.svg\",\"extensions/Math/modules/ve-math/math-display-default.svg\",\"extensions/Math/modules/ve-math/math-display-inline.svg\",\"extensions/Math/modules/ve-math/math.svg\"]'),('ext.smw.style','apioutput|en','[\"extensions/SemanticMediaWiki/res/images/browse_icon.png\",\"extensions/SemanticMediaWiki/res/images/browse_iconsmall.png\",\"extensions/SemanticMediaWiki/res/images/rdf_flyer.10.png\",\"extensions/SemanticMediaWiki/res/images/rdf_flyer.12.png\",\"extensions/SemanticMediaWiki/res/images/rdf_flyer.18.png\",\"extensions/SemanticMediaWiki/res/images/search_icon.png\",\"extensions/SemanticMediaWiki/res/images/searchgray_iconsmall.png\",\"extensions/SemanticMediaWiki/res/images/world.png\"]'),('ext.smw.style','vector|en','[\"extensions/SemanticMediaWiki/res/images/browse_icon.png\",\"extensions/SemanticMediaWiki/res/images/browse_iconsmall.png\",\"extensions/SemanticMediaWiki/res/images/rdf_flyer.10.png\",\"extensions/SemanticMediaWiki/res/images/rdf_flyer.12.png\",\"extensions/SemanticMediaWiki/res/images/rdf_flyer.18.png\",\"extensions/SemanticMediaWiki/res/images/search_icon.png\",\"extensions/SemanticMediaWiki/res/images/searchgray_iconsmall.png\",\"extensions/SemanticMediaWiki/res/images/world.png\"]'),('ext.smw.tooltip.styles','apioutput|en','[\"extensions/SemanticMediaWiki/res/smw/../images/info.png\",\"extensions/SemanticMediaWiki/res/smw/../images/note.png\",\"extensions/SemanticMediaWiki/res/smw/../images/warning.png\"]'),('ext.smw.tooltip.styles','vector|en','[\"extensions/SemanticMediaWiki/res/smw/../images/info.png\",\"extensions/SemanticMediaWiki/res/smw/../images/note.png\",\"extensions/SemanticMediaWiki/res/smw/../images/warning.png\"]'),('ext.uls.displaysettings','vector|en','[\"extensions/UniversalLanguageSelector/resources/images/display.png\",\"extensions/UniversalLanguageSelector/resources/images/display.svg\",\"extensions/UniversalLanguageSelector/resources/css/ext.uls.displaysettings.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('ext.uls.inputsettings','vector|en','[\"extensions/UniversalLanguageSelector/resources/images/cog.png\",\"extensions/UniversalLanguageSelector/resources/images/cog.svg\",\"extensions/UniversalLanguageSelector/resources/images/help.png\",\"extensions/UniversalLanguageSelector/resources/images/help.svg\",\"extensions/UniversalLanguageSelector/resources/images/input.png\",\"extensions/UniversalLanguageSelector/resources/images/input.svg\",\"extensions/UniversalLanguageSelector/resources/images/remove-input.png\",\"extensions/UniversalLanguageSelector/resources/images/remove-input.svg\",\"extensions/UniversalLanguageSelector/resources/css/ext.uls.inputsettings.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('ext.uls.pt','apioutput|en','[\"extensions/UniversalLanguageSelector/resources/../lib/jquery.uls/images/icon-language.png\",\"extensions/UniversalLanguageSelector/resources/../lib/jquery.uls/images/icon-language.svg\",\"extensions/UniversalLanguageSelector/resources/css/ext.uls.pt.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('ext.uls.pt','vector|en','[\"extensions/UniversalLanguageSelector/resources/../lib/jquery.uls/images/icon-language.png\",\"extensions/UniversalLanguageSelector/resources/../lib/jquery.uls/images/icon-language.svg\",\"extensions/UniversalLanguageSelector/resources/css/ext.uls.pt.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('ext.visualEditor.core','vector|en','[\"extensions/VisualEditor/lib/ve/src/ce/styles/../../ui/styles/images/resize-ne-sw.svg\",\"extensions/VisualEditor/lib/ve/src/ce/styles/../../ui/styles/images/resize-nw-se.svg\",\"extensions/VisualEditor/lib/ve/src/ui/styles/images/icons/table-move-column-ltr.svg\",\"extensions/VisualEditor/lib/ve/src/ui/styles/images/icons/table-move-column-rtl.svg\",\"extensions/VisualEditor/lib/ve/src/ui/styles/images/icons/table-move-row-after.svg\",\"extensions/VisualEditor/lib/ve/src/ui/styles/images/icons/table-move-row-before.svg\"]'),('ext.visualEditor.icons','vector|en','[\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/alienextension.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/image-frame.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/image-frameless.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/image-none.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/image-thumbnail.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-disambiguation-ltr.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-disambiguation-rtl.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-existing-ltr.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-existing-rtl.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-not-found-he-yi.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-not-found-ltr.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-not-found-rtl.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-redirect-ltr.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/page-redirect-rtl.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/parameter-ltr.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/parameter-set-ltr.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/profile.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/public-domain.svg\",\"extensions/VisualEditor/modules/ve-mw/ui/styles/images/icons/template.svg\"]'),('ext.visualEditor.mwcore','vector|en','[\"extensions/VisualEditor/modules/ve-mw/ui/styles/dialogs/images/welcomeSplash-ltr.png\"]'),('ext.visualEditor.mwimage','vector|en','[\"extensions/VisualEditor/modules/ve-mw/ui/styles/widgets/images/broken-image.png\"]'),('ext.visualEditor.mwlink','vector|en','[\"extensions/VisualEditor/modules/ve-mw/ui/styles/tools/images/link-ltr.png\"]'),('ext.wikiEditor','vector|en','[\"extensions/WikiEditor/modules/ext.wikiEditor.less\"]'),('ext.wikiEditor.toolbar.styles','vector|en','[\"extensions/WikiEditor/modules/ext.wikiEditor.toolbar.styles.less\"]'),('jquery.ime','vector|en','[\"extensions/UniversalLanguageSelector/lib/jquery.ime/images/ime-active.png\",\"extensions/UniversalLanguageSelector/lib/jquery.ime/images/ime-active.svg\",\"extensions/UniversalLanguageSelector/lib/jquery.ime/images/tick.png\",\"extensions/UniversalLanguageSelector/lib/jquery.ime/images/tick.svg\"]'),('jquery.ui.button','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_ffffff_256x240.png\"]'),('jquery.ui.core','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_100_000000_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_15_cd0a0a_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_flat_70_000000_40x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-hard_100_f2f5f7_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-hard_80_d7ebf9_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_100_e4f1fb_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_100_ffffff_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_highlight-soft_25_ffef8f_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-bg_inset-hard_100_f0f0f0_1x100.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_2694e8_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_2e83ff_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_3d80b3_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_666666_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_72a7cf_256x240.png\",\"skins/Vector/skinStyles/jquery.ui/images/ui-icons_ffffff_256x240.png\"]'),('jquery.ui.core.styles','vector|en','[\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_flat_0_aaaaaa_40x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_flat_75_ffffff_40x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_55_fbf9ee_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_65_ffffff_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_75_dadada_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_75_e6e6e6_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_glass_95_fef1ec_1x400.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-bg_highlight-soft_75_cccccc_1x100.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_222222_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_2e83ff_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_454545_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_888888_256x240.png\",\"resources/lib/jquery.ui/themes/smoothness/images/ui-icons_cd0a0a_256x240.png\"]'),('jquery.ui.dialog','vector|en','[\"skins/Vector/skinStyles/jquery.ui/images/close.png\",\"skins/Vector/skinStyles/jquery.ui/images/titlebar-fade.png\"]'),('jquery.uls','vector|en','[\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/clear.png\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/clear.svg\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/close.png\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/close.svg\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/icon-language.png\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/icon-language.svg\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/search.png\",\"extensions/UniversalLanguageSelector/lib/jquery.uls/images/search.svg\"]'),('jquery.wikiEditor','vector|en','[\"extensions/WikiEditor/modules/images/toolbar/loading.gif\",\"extensions/WikiEditor/modules/jquery.wikiEditor.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('jquery.wikiEditor.dialogs','vector|en','[\"extensions/WikiEditor/modules/jquery.wikiEditor.dialogs.less\"]'),('jquery.wikiEditor.dialogs.config','vector|en','[\"extensions/WikiEditor/modules/images/dialogs/insert-disambiguation.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-exists.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-external.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-invalid.png\",\"extensions/WikiEditor/modules/images/dialogs/insert-link-notexists.png\",\"extensions/WikiEditor/modules/jquery.wikiEditor.dialogs.config.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('jquery.wikiEditor.preview','vector|en','[\"extensions/WikiEditor/modules/jquery.wikiEditor.preview.less\"]'),('jquery.wikiEditor.toolbar','vector|en','[\"extensions/WikiEditor/modules/images/toolbar/arrow-down.png\",\"extensions/WikiEditor/modules/images/toolbar/arrow-down.svg\",\"extensions/WikiEditor/modules/images/toolbar/arrow-ltr.png\",\"extensions/WikiEditor/modules/images/toolbar/arrow-ltr.svg\",\"extensions/WikiEditor/modules/images/toolbar/base.png\",\"extensions/WikiEditor/modules/images/toolbar/button-sprite.png\",\"extensions/WikiEditor/modules/images/toolbar/button-sprite.svg\",\"extensions/WikiEditor/modules/jquery.wikiEditor.toolbar.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\"]'),('mediawiki.ForeignStructuredUpload.BookletLayout','vector|en','[\"resources/src/mediawiki/mediawiki.ForeignStructuredUpload.BookletLayout.less\"]'),('mediawiki.action.view.filepage','vector|en','[\"resources/src/mediawiki.action/images/checker.png\"]'),('mediawiki.action.view.postEdit','apioutput|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.postEdit','vector|en','[\"resources/src/mediawiki.action/images/green-checkmark.png\"]'),('mediawiki.action.view.redirectPage','vector|en','[\"resources/src/mediawiki.action/images/nextredirect-ltr.png\",\"resources/src/mediawiki.action/images/nextredirect-ltr.svg\",\"resources/src/mediawiki.action/images/nextredirect-rtl.png\",\"resources/src/mediawiki.action/images/nextredirect-rtl.svg\",\"resources/src/mediawiki.action/images/redirect-ltr.png\",\"resources/src/mediawiki.action/images/redirect-ltr.svg\",\"resources/src/mediawiki.action/images/redirect-rtl.png\",\"resources/src/mediawiki.action/images/redirect-rtl.svg\"]'),('mediawiki.htmlform.styles','vector|en','[\"resources/src/mediawiki/images/question.png\",\"resources/src/mediawiki/images/question.svg\"]'),('mediawiki.icon','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.png\",\"resources/src/mediawiki/images/arrow-collapsed-ltr.svg\",\"resources/src/mediawiki/images/arrow-expanded.png\",\"resources/src/mediawiki/images/arrow-expanded.svg\",\"resources/src/mediawiki/mediawiki.icon.less\"]'),('mediawiki.legacy.shared','apioutput|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.legacy.shared','vector|en','[\"resources/src/mediawiki.legacy/images/ajax-loader.gif\",\"resources/src/mediawiki.legacy/images/help-question-hover.gif\",\"resources/src/mediawiki.legacy/images/help-question.gif\",\"resources/src/mediawiki.legacy/images/spinner.gif\"]'),('mediawiki.skinning.content.parsoid','vector|en','[\"resources/src/mediawiki.skinning/content.parsoid.less\"]'),('mediawiki.skinning.interface','apioutput|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.skinning.interface','vector|en','[\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-ltr.svg\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.png\",\"resources/src/mediawiki.skinning/images/magnify-clip-rtl.svg\"]'),('mediawiki.special.userlogin.common.styles','vector|en','[\"resources/src/mediawiki.special/images/icon-lock.png\"]'),('mediawiki.special.userlogin.login.styles','vector|en','[\"resources/src/mediawiki.special/images/glyph-people-large.png\"]'),('mediawiki.toolbar','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.toolbar/images/ar/button_bold.png\",\"resources/src/mediawiki.toolbar/images/ar/button_headline.png\",\"resources/src/mediawiki.toolbar/images/ar/button_italic.png\",\"resources/src/mediawiki.toolbar/images/ar/button_link.png\",\"resources/src/mediawiki.toolbar/images/ar/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/be-tarask/button_bold.png\",\"resources/src/mediawiki.toolbar/images/be-tarask/button_italic.png\",\"resources/src/mediawiki.toolbar/images/be-tarask/button_link.png\",\"resources/src/mediawiki.toolbar/images/de/button_bold.png\",\"resources/src/mediawiki.toolbar/images/de/button_italic.png\",\"resources/src/mediawiki.toolbar/images/en/button_bold.png\",\"resources/src/mediawiki.toolbar/images/en/button_extlink.png\",\"resources/src/mediawiki.toolbar/images/en/button_headline.png\",\"resources/src/mediawiki.toolbar/images/en/button_hr.png\",\"resources/src/mediawiki.toolbar/images/en/button_image.png\",\"resources/src/mediawiki.toolbar/images/en/button_italic.png\",\"resources/src/mediawiki.toolbar/images/en/button_link.png\",\"resources/src/mediawiki.toolbar/images/en/button_media.png\",\"resources/src/mediawiki.toolbar/images/en/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/en/button_sig.png\",\"resources/src/mediawiki.toolbar/images/fa/button_bold.png\",\"resources/src/mediawiki.toolbar/images/fa/button_headline.png\",\"resources/src/mediawiki.toolbar/images/fa/button_italic.png\",\"resources/src/mediawiki.toolbar/images/fa/button_link.png\",\"resources/src/mediawiki.toolbar/images/fa/button_nowiki.png\",\"resources/src/mediawiki.toolbar/images/ksh/button_italic.png\",\"resources/src/mediawiki.toolbar/images/ru/button_bold.png\",\"resources/src/mediawiki.toolbar/images/ru/button_italic.png\",\"resources/src/mediawiki.toolbar/images/ru/button_link.png\",\"resources/src/mediawiki.toolbar/toolbar.less\"]'),('mediawiki.ui','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/forms.less\",\"resources/src/mediawiki.ui/components/utilities.less\",\"resources/src/mediawiki.ui/default.less\"]'),('mediawiki.ui.button','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/buttons.less\"]'),('mediawiki.ui.checkbox','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/checkbox.less\",\"resources/src/mediawiki.ui/components/images/checked.png\",\"resources/src/mediawiki.ui/components/images/checked.svg\",\"resources/src/mediawiki.ui/components/images/checked_disabled.png\",\"resources/src/mediawiki.ui/components/images/checked_disabled.svg\"]'),('mediawiki.ui.input','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/inputs.less\"]'),('mediawiki.ui.radio','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.ui/variables.less\",\"resources/src/mediawiki.ui/components/images/radio_checked.png\",\"resources/src/mediawiki.ui/components/images/radio_checked.svg\",\"resources/src/mediawiki.ui/components/images/radio_disabled.png\",\"resources/src/mediawiki.ui/components/images/radio_disabled.svg\",\"resources/src/mediawiki.ui/components/radio.less\"]'),('mediawiki.widgets','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.TitleWidget.less\"]'),('mediawiki.widgets.DateInputWidget','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.CalendarWidget.less\",\"resources/src/mediawiki.widgets/mw.widgets.DateInputWidget.less\"]'),('mediawiki.widgets.StashedFileWidget','vector|en','[\"resources/src/mediawiki.widgets/mw.widgets.StashedFileWidget.less\"]'),('oojs-ui-core.styles','vector|en','[\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-constructive-deprecated.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-constructive-deprecated.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-invert.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check-invert.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-constructive-deprecated.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-constructive-deprecated.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-invert.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/circle-invert.svg\",\"resources/lib/oojs-ui/themes/mediawiki/images/textures/pending.gif\",\"skins/Vector/skinStyles/ooui.less\"]'),('oojs-ui-toolbars','vector|en','[\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check.png\",\"resources/lib/oojs-ui/themes/mediawiki/images/icons/check.svg\"]'),('oojs-ui-widgets','vector|en','[\"resources/lib/oojs-ui/images/grab.cur\",\"resources/lib/oojs-ui/images/grabbing.cur\"]'),('skins.vector.styles','vector|en','[\"resources/src/mediawiki.less/mediawiki.mixins.animation.less\",\"resources/src/mediawiki.less/mediawiki.mixins.less\",\"resources/src/mediawiki.less/mediawiki.mixins.rotation.less\",\"skins/Vector/components/common.less\",\"skins/Vector/components/externalLinks.less\",\"skins/Vector/components/footer.less\",\"skins/Vector/components/navigation.less\",\"skins/Vector/components/personalMenu.less\",\"skins/Vector/components/search.less\",\"skins/Vector/components/tabs.less\",\"skins/Vector/components/watchstar.less\",\"skins/Vector/images/arrow-down-focus-icon.png\",\"skins/Vector/images/arrow-down-focus-icon.svg\",\"skins/Vector/images/arrow-down-icon.png\",\"skins/Vector/images/arrow-down-icon.svg\",\"skins/Vector/images/bullet-icon.png\",\"skins/Vector/images/bullet-icon.svg\",\"skins/Vector/images/external-link-ltr-icon.png\",\"skins/Vector/images/external-link-ltr-icon.svg\",\"skins/Vector/images/page-fade.png\",\"skins/Vector/images/portal-break.png\",\"skins/Vector/images/search-fade.png\",\"skins/Vector/images/search-ltr.png\",\"skins/Vector/images/search-ltr.svg\",\"skins/Vector/images/tab-break.png\",\"skins/Vector/images/tab-current-fade.png\",\"skins/Vector/images/tab-normal-fade.png\",\"skins/Vector/images/unwatch-icon-hl.png\",\"skins/Vector/images/unwatch-icon-hl.svg\",\"skins/Vector/images/unwatch-icon.png\",\"skins/Vector/images/unwatch-icon.svg\",\"skins/Vector/images/user-icon.png\",\"skins/Vector/images/user-icon.svg\",\"skins/Vector/images/watch-icon-hl.png\",\"skins/Vector/images/watch-icon-hl.svg\",\"skins/Vector/images/watch-icon-loading.png\",\"skins/Vector/images/watch-icon-loading.svg\",\"skins/Vector/images/watch-icon.png\",\"skins/Vector/images/watch-icon.svg\",\"skins/Vector/screen-hd.less\",\"skins/Vector/screen.less\",\"skins/Vector/variables.less\"]');
/*!40000 ALTER TABLE `module_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objectcache`
--

DROP TABLE IF EXISTS `objectcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objectcache` (
  `keyname` varbinary(255) NOT NULL DEFAULT '',
  `value` mediumblob,
  `exptime` datetime DEFAULT NULL,
  PRIMARY KEY (`keyname`),
  KEY `exptime` (`exptime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objectcache`
--

LOCK TABLES `objectcache` WRITE;
/*!40000 ALTER TABLE `objectcache` DISABLE KEYS */;
INSERT INTO `objectcache` VALUES ('wiki_demo:echo-notification-count-alert:1:1.7','Ë´2´\0','2017-03-09 11:51:00'),('wiki_demo:echo-notification-count-message:1:1.7','Ë´2°\0','2017-03-09 11:51:00'),('wiki_demo:echo-notification-count:1:1.7','Ë´2´\0','2017-03-09 11:51:00'),('wiki_demo:echo-notification-timestamp-alert:1:1.7','+¶24±R2204706°044540P²\0','2017-03-09 11:51:00'),('wiki_demo:echo-notification-timestamp-message:1:1.7','Ë´Ò5´\0','2017-03-09 11:51:00'),('wiki_demo:echo-notification-timestamp:1:1.7','+¶24±R2204706°044540P²\0','2017-03-09 11:51:00');
/*!40000 ALTER TABLE `objectcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oldimage`
--

DROP TABLE IF EXISTS `oldimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oldimage` (
  `oi_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `oi_archive_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `oi_size` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_width` int(11) NOT NULL DEFAULT '0',
  `oi_height` int(11) NOT NULL DEFAULT '0',
  `oi_bits` int(11) NOT NULL DEFAULT '0',
  `oi_description` varbinary(767) NOT NULL,
  `oi_user` int(10) unsigned NOT NULL DEFAULT '0',
  `oi_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `oi_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `oi_metadata` mediumblob NOT NULL,
  `oi_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `oi_major_mime` enum('unknown','application','audio','image','text','video','message','model','multipart','chemical') DEFAULT NULL,
  `oi_minor_mime` varbinary(100) NOT NULL DEFAULT 'unknown',
  `oi_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `oi_sha1` varbinary(32) NOT NULL DEFAULT '',
  KEY `oi_usertext_timestamp` (`oi_user_text`,`oi_timestamp`),
  KEY `oi_name_timestamp` (`oi_name`,`oi_timestamp`),
  KEY `oi_name_archive_name` (`oi_name`,`oi_archive_name`(14)),
  KEY `oi_sha1` (`oi_sha1`(10))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oldimage`
--

LOCK TABLES `oldimage` WRITE;
/*!40000 ALTER TABLE `oldimage` DISABLE KEYS */;
/*!40000 ALTER TABLE `oldimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_namespace` int(11) NOT NULL,
  `page_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `page_restrictions` tinyblob NOT NULL,
  `page_is_redirect` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_is_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `page_random` double unsigned NOT NULL,
  `page_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `page_links_updated` varbinary(14) DEFAULT NULL,
  `page_latest` int(10) unsigned NOT NULL,
  `page_len` int(10) unsigned NOT NULL,
  `page_content_model` varbinary(32) DEFAULT NULL,
  `page_lang` varbinary(35) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `name_title` (`page_namespace`,`page_title`),
  KEY `page_random` (`page_random`),
  KEY `page_len` (`page_len`),
  KEY `page_redirect_namespace_len` (`page_is_redirect`,`page_namespace`,`page_len`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,10,'Meeting','',0,1,0.805900096255,'20141211142049','20170308050932',1,2994,'wikitext',NULL),(2,10,'Meeting_minutes','',0,1,0.053204093309,'20141211141827','20170308050932',2,2436,'wikitext',NULL),(3,10,'Topic_from_meeting','',0,1,0.290306241793,'20141126155635','20170308050932',3,984,'wikitext',NULL),(4,10,'Meeting_Minutes_Block','',0,1,0.045146389021,'20140630233717','20170308050933',4,1702,'wikitext',NULL),(5,10,'Meeting_Minutes_Block_info_for_table_row','',0,1,0.037064183714,'20141126161556','20170308050933',5,684,'wikitext',NULL),(6,10,'Meeting_Minutes_Block_info_for_table_row_highlighted','',0,1,0.675178348342,'20141126161729','20170308050933',6,710,'wikitext',NULL),(7,10,'Meeting_references_row','',0,1,0.488113761134,'20141209171819','20170308050933',7,463,'wikitext',NULL),(8,10,'File_link','',0,1,0.543498435449,'20141209182423','20170308050941',8,2636,'wikitext',NULL),(9,10,'Meeting_Minutes/Files','',0,1,0.048244287379,'20141209173140','20170308050940',9,76,'wikitext',NULL),(10,10,'Collapsible','',0,1,0.916574815163,'20141211141621','20170308050943',10,3181,'wikitext',NULL),(11,106,'Meeting','',0,1,0.501959671725,'20170308050938','20170308050933',11,1496,'wikitext',NULL),(12,106,'Meeting_Minutes','',0,1,0.577547539236,'20170308050938','20170308050933',12,4664,'wikitext',NULL),(13,14,'Meeting','',0,1,0.652204094067,'20170308050939','20170308050933',13,58,'wikitext',NULL),(14,14,'Meeting_Minutes','',0,1,0.065977080026,'20170308050939','20170308050934',14,66,'wikitext',NULL),(15,102,'Call_in_number','',0,1,0.291491665473,'20170308050939','20170308050934',15,48,'wikitext',NULL),(16,102,'Call_in_password','',0,1,0.016405366156,'20170308050939','20170308050934',16,48,'wikitext',NULL),(17,102,'Managed_by_cadre','',0,1,0.181784811538,'20170308050939','20170308050934',17,46,'wikitext',NULL),(18,102,'Standard_day','',0,1,0.965345363961,'20170308050939','20170308050934',18,288,'wikitext',NULL),(19,102,'Standard_time','',0,1,0.627660754967,'20170308050939','20170308050934',19,48,'wikitext',NULL),(20,102,'Meeting_date','',0,1,0.809591779892,'20170308050939','20170308050934',20,46,'wikitext',NULL),(21,102,'Meeting_type','',0,1,0.568606115835,'20170308050939','20170308050934',21,113,'wikitext',NULL),(22,102,'Notes_taken_by','',0,1,0.772348816158,'20170308050940','20170308050934',22,112,'wikitext',NULL),(23,102,'Start_time','',0,1,0.143513930633,'20170308050940','20170308050934',23,48,'wikitext',NULL),(24,102,'From_page','',0,1,0.294014577755,'20170308050940','20170308050934',24,381,'wikitext',NULL),(25,102,'Has_date','',0,1,0.99369173358,'20170308050940','20170308050935',25,317,'wikitext',NULL),(26,102,'Has_topic_title','',0,1,0.411427236132,'20170308050940','20170308050935',26,48,'wikitext',NULL),(27,102,'Index','',0,1,0.524368905215,'20170308050940','20170308050935',27,131,'wikitext',NULL),(28,102,'Related_article','',0,1,0.383516970586,'20170308050940','20170308050935',28,46,'wikitext',NULL),(29,102,'Synopsis','',0,1,0.307590240458,'20170308050940','20170308050935',29,46,'wikitext',NULL),(30,102,'Building','',0,1,0.857065689875,'20170308050940','20170308050935',30,46,'wikitext',NULL),(31,102,'Notable_attendee','',0,1,0.307111191514,'20170308050940','20170308050935',31,46,'wikitext',NULL),(32,102,'Overview','',0,1,0.575778924774,'20170308050940','20170308050935',32,46,'wikitext',NULL),(33,102,'Room','',0,1,0.134844901192,'20170308050940','20170308050935',33,46,'wikitext',NULL),(34,8,'Hf-nsfooter-','',0,1,0.321802728046,'20141209171645','20170308050935',34,389,'wikitext',NULL),(35,0,'Main_Page','',0,1,0.205693645401,'20170308114937','20170308114926',35,154,'wikitext',NULL),(36,0,'Test_Page','',0,0,0.160975917886,'20170308115254','20170308114938',38,302,'wikitext',NULL),(37,6,'Test_image.png','',0,1,0.291026314211,'20170308115100',NULL,37,32,'wikitext',NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_props`
--

DROP TABLE IF EXISTS `page_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_props` (
  `pp_page` int(11) NOT NULL,
  `pp_propname` varbinary(60) NOT NULL,
  `pp_value` blob NOT NULL,
  `pp_sortkey` float DEFAULT NULL,
  UNIQUE KEY `pp_page_propname` (`pp_page`,`pp_propname`),
  UNIQUE KEY `pp_propname_page` (`pp_propname`,`pp_page`),
  UNIQUE KEY `pp_propname_sortkey_page` (`pp_propname`,`pp_sortkey`,`pp_page`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_props`
--

LOCK TABLES `page_props` WRITE;
/*!40000 ALTER TABLE `page_props` DISABLE KEYS */;
INSERT INTO `page_props` VALUES (1,'smw-semanticdata-status','',0),(2,'smw-semanticdata-status','',0),(3,'smw-semanticdata-status','',0),(4,'notoc','',NULL),(4,'smw-semanticdata-status','1',1),(5,'smw-semanticdata-status','',0),(6,'smw-semanticdata-status','',0),(7,'smw-semanticdata-status','',0),(8,'smw-semanticdata-status','1',1),(9,'smw-semanticdata-status','',0),(10,'smw-semanticdata-status','',0),(11,'smw-semanticdata-status','',0),(12,'smw-semanticdata-status','',0),(13,'smw-semanticdata-status','1',1),(14,'smw-semanticdata-status','1',1),(15,'smw-semanticdata-status','1',1),(16,'smw-semanticdata-status','1',1),(17,'smw-semanticdata-status','1',1),(18,'smw-semanticdata-status','1',1),(19,'smw-semanticdata-status','1',1),(20,'smw-semanticdata-status','1',1),(21,'smw-semanticdata-status','1',1),(22,'smw-semanticdata-status','1',1),(23,'smw-semanticdata-status','1',1),(24,'smw-semanticdata-status','1',1),(25,'smw-semanticdata-status','1',1),(26,'smw-semanticdata-status','1',1),(27,'smw-semanticdata-status','1',1),(28,'smw-semanticdata-status','1',1),(29,'smw-semanticdata-status','1',1),(30,'smw-semanticdata-status','1',1),(31,'smw-semanticdata-status','1',1),(32,'smw-semanticdata-status','1',1),(33,'smw-semanticdata-status','1',1),(34,'smw-semanticdata-status','1',1),(35,'smw-semanticdata-status','',0),(36,'smw-semanticdata-status','',0);
/*!40000 ALTER TABLE `page_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_restrictions`
--

DROP TABLE IF EXISTS `page_restrictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_restrictions` (
  `pr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pr_page` int(11) NOT NULL,
  `pr_type` varbinary(60) NOT NULL,
  `pr_level` varbinary(60) NOT NULL,
  `pr_cascade` tinyint(4) NOT NULL,
  `pr_user` int(11) DEFAULT NULL,
  `pr_expiry` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`pr_id`),
  UNIQUE KEY `pr_pagetype` (`pr_page`,`pr_type`),
  KEY `pr_typelevel` (`pr_type`,`pr_level`),
  KEY `pr_level` (`pr_level`),
  KEY `pr_cascade` (`pr_cascade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_restrictions`
--

LOCK TABLES `page_restrictions` WRITE;
/*!40000 ALTER TABLE `page_restrictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `page_restrictions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagelinks`
--

DROP TABLE IF EXISTS `pagelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagelinks` (
  `pl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `pl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_namespace` int(11) NOT NULL DEFAULT '0',
  `pl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  UNIQUE KEY `pl_from` (`pl_from`,`pl_namespace`,`pl_title`),
  UNIQUE KEY `pl_namespace` (`pl_namespace`,`pl_title`,`pl_from`),
  KEY `pl_backlinks_namespace` (`pl_from_namespace`,`pl_namespace`,`pl_title`,`pl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagelinks`
--

LOCK TABLES `pagelinks` WRITE;
/*!40000 ALTER TABLE `pagelinks` DISABLE KEYS */;
INSERT INTO `pagelinks` VALUES (35,0,0,'Test_Page'),(4,10,0,'Meeting_Minutes'),(8,10,6,'International_Space_Station.pdf'),(8,10,6,'My_Fictitious_File.doc'),(8,10,12,'Linking_to_files'),(2,10,106,'Meeting_Minutes'),(3,10,106,'Meeting_Minutes'),(13,14,106,'Meeting'),(14,14,106,'Meeting_Minutes'),(25,102,10,'Crew_involved_with_subject'),(25,102,10,'Person_involved_with_subject'),(25,102,10,'Subject_significant_to_subject'),(21,102,106,'Meeting'),(22,102,106,'Person');
/*!40000 ALTER TABLE `pagelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `protected_titles`
--

DROP TABLE IF EXISTS `protected_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `protected_titles` (
  `pt_namespace` int(11) NOT NULL,
  `pt_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `pt_user` int(10) unsigned NOT NULL,
  `pt_reason` varbinary(767) DEFAULT NULL,
  `pt_timestamp` binary(14) NOT NULL,
  `pt_expiry` varbinary(14) NOT NULL DEFAULT '',
  `pt_create_perm` varbinary(60) NOT NULL,
  UNIQUE KEY `pt_namespace_title` (`pt_namespace`,`pt_title`),
  KEY `pt_timestamp` (`pt_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `protected_titles`
--

LOCK TABLES `protected_titles` WRITE;
/*!40000 ALTER TABLE `protected_titles` DISABLE KEYS */;
/*!40000 ALTER TABLE `protected_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache`
--

DROP TABLE IF EXISTS `querycache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache` (
  `qc_type` varbinary(32) NOT NULL,
  `qc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qc_namespace` int(11) NOT NULL DEFAULT '0',
  `qc_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  KEY `qc_type` (`qc_type`,`qc_value`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache`
--

LOCK TABLES `querycache` WRITE;
/*!40000 ALTER TABLE `querycache` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycache_info`
--

DROP TABLE IF EXISTS `querycache_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycache_info` (
  `qci_type` varbinary(32) NOT NULL DEFAULT '',
  `qci_timestamp` binary(14) NOT NULL DEFAULT '19700101000000',
  UNIQUE KEY `qci_type` (`qci_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycache_info`
--

LOCK TABLES `querycache_info` WRITE;
/*!40000 ALTER TABLE `querycache_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycache_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `querycachetwo`
--

DROP TABLE IF EXISTS `querycachetwo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `querycachetwo` (
  `qcc_type` varbinary(32) NOT NULL,
  `qcc_value` int(10) unsigned NOT NULL DEFAULT '0',
  `qcc_namespace` int(11) NOT NULL DEFAULT '0',
  `qcc_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `qcc_namespacetwo` int(11) NOT NULL DEFAULT '0',
  `qcc_titletwo` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  KEY `qcc_type` (`qcc_type`,`qcc_value`),
  KEY `qcc_title` (`qcc_type`,`qcc_namespace`,`qcc_title`),
  KEY `qcc_titletwo` (`qcc_type`,`qcc_namespacetwo`,`qcc_titletwo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `querycachetwo`
--

LOCK TABLES `querycachetwo` WRITE;
/*!40000 ALTER TABLE `querycachetwo` DISABLE KEYS */;
/*!40000 ALTER TABLE `querycachetwo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recentchanges`
--

DROP TABLE IF EXISTS `recentchanges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recentchanges` (
  `rc_id` int(11) NOT NULL AUTO_INCREMENT,
  `rc_timestamp` varbinary(14) NOT NULL DEFAULT '',
  `rc_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `rc_namespace` int(11) NOT NULL DEFAULT '0',
  `rc_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rc_comment` varbinary(767) NOT NULL DEFAULT '',
  `rc_minor` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_bot` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_new` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_cur_id` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_this_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_last_oldid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_type` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_source` varchar(16) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rc_patrolled` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_ip` varbinary(40) NOT NULL DEFAULT '',
  `rc_old_len` int(11) DEFAULT NULL,
  `rc_new_len` int(11) DEFAULT NULL,
  `rc_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rc_logid` int(10) unsigned NOT NULL DEFAULT '0',
  `rc_log_type` varbinary(255) DEFAULT NULL,
  `rc_log_action` varbinary(255) DEFAULT NULL,
  `rc_params` blob,
  PRIMARY KEY (`rc_id`),
  KEY `rc_timestamp` (`rc_timestamp`),
  KEY `rc_namespace_title` (`rc_namespace`,`rc_title`),
  KEY `rc_cur_id` (`rc_cur_id`),
  KEY `new_name_timestamp` (`rc_new`,`rc_namespace`,`rc_timestamp`),
  KEY `rc_ip` (`rc_ip`),
  KEY `rc_ns_usertext` (`rc_namespace`,`rc_user_text`),
  KEY `rc_user_text` (`rc_user_text`,`rc_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recentchanges`
--

LOCK TABLES `recentchanges` WRITE;
/*!40000 ALTER TABLE `recentchanges` DISABLE KEYS */;
INSERT INTO `recentchanges` VALUES (1,'20170308114923',0,'127.0.0.1',0,'Main_Page','initial',0,0,1,35,35,0,1,'mw.new',0,'127.0.0.1',0,154,0,0,NULL,'',''),(2,'20170308114937',0,'127.0.0.1',0,'Test_Page','initial',0,0,1,36,36,0,1,'mw.new',0,'127.0.0.1',0,10,0,0,NULL,'',''),(3,'20170308115100',1,'Admin',6,'Test_image.png','',0,0,0,37,37,0,3,'mw.log',0,'127.0.0.1',NULL,NULL,0,1,'upload','upload','a:2:{s:8:\"img_sha1\";s:31:\"ev4wslmcte1886dx763my2n1b9c3tep\";s:13:\"img_timestamp\";s:14:\"20170308115100\";}'),(4,'20170308115254',1,'Admin',0,'Test_Page','Added a table and a picture.',0,0,0,36,38,36,0,'mw.edit',0,'127.0.0.1',10,302,0,0,NULL,'','');
/*!40000 ALTER TABLE `recentchanges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rd_from` int(10) unsigned NOT NULL DEFAULT '0',
  `rd_namespace` int(11) NOT NULL DEFAULT '0',
  `rd_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rd_interwiki` varchar(32) DEFAULT NULL,
  `rd_fragment` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`rd_from`),
  KEY `rd_ns_title` (`rd_namespace`,`rd_title`,`rd_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `redirect`
--

LOCK TABLES `redirect` WRITE;
/*!40000 ALTER TABLE `redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revision`
--

DROP TABLE IF EXISTS `revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revision` (
  `rev_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rev_page` int(10) unsigned NOT NULL,
  `rev_text_id` int(10) unsigned NOT NULL,
  `rev_comment` varbinary(767) NOT NULL,
  `rev_user` int(10) unsigned NOT NULL DEFAULT '0',
  `rev_user_text` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `rev_timestamp` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `rev_minor_edit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_deleted` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rev_len` int(10) unsigned DEFAULT NULL,
  `rev_parent_id` int(10) unsigned DEFAULT NULL,
  `rev_sha1` varbinary(32) NOT NULL DEFAULT '',
  `rev_content_model` varbinary(32) DEFAULT NULL,
  `rev_content_format` varbinary(64) DEFAULT NULL,
  PRIMARY KEY (`rev_id`),
  UNIQUE KEY `rev_page_id` (`rev_page`,`rev_id`),
  KEY `rev_timestamp` (`rev_timestamp`),
  KEY `page_timestamp` (`rev_page`,`rev_timestamp`),
  KEY `user_timestamp` (`rev_user`,`rev_timestamp`),
  KEY `usertext_timestamp` (`rev_user_text`,`rev_timestamp`),
  KEY `page_user_timestamp` (`rev_page`,`rev_user`,`rev_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 MAX_ROWS=10000000 AVG_ROW_LENGTH=1024;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revision`
--

LOCK TABLES `revision` WRITE;
/*!40000 ALTER TABLE `revision` DISABLE KEYS */;
INSERT INTO `revision` VALUES (1,1,1,'',0,'Ejmontal','20141211142049',0,0,2994,0,'ibaq9o2w9shbp9lvmiauh3el8mxozgg',NULL,NULL),(2,2,2,'',0,'Ejmontal','20141211141827',0,0,2436,0,'rgum81qvygmcw23g012km1umuwj4ljx',NULL,NULL),(3,3,3,'new version of Ext:MM',0,'Ejmontal','20141126155635',0,0,984,0,'syx8c6wrndmkw6g2hecz9avp3ydmcy6',NULL,NULL),(4,4,4,'',0,'Lwelsh','20140630233717',0,0,1702,0,'erjtn7tb759gqxso5mbuffae5oo3b6o',NULL,NULL),(5,5,5,'',0,'Ejmontal','20141126161556',0,0,684,0,'8rd1o4o025sxmqjxiwd6fjxz8b0m5hq',NULL,NULL),(6,6,6,'new Ext:MM',0,'Ejmontal','20141126161729',0,0,710,0,'pvlkuw065w8rd995tfceupybrrootji',NULL,NULL),(7,7,7,'Created page with \"<noinclude> <pre> {{{1|}}} = From page (the name of the EVA page, like STS-132/ULF-4 EVA 2) {{{2|}}} = Has date (the date of the EVA) {{{3|}}} = Has topic title {{{4|}}} = Syn...\"',0,'Ejmontal','20141209171819',0,0,463,0,'h4tk4izkdv44pqtc0vo9k1z1r5bz28r',NULL,NULL),(8,8,8,'',0,'Ejmontal','20141209182423',0,0,2636,0,'s1or1ey290ounjnmxqjz0b0q2kmne94',NULL,NULL),(9,9,9,'Created page with \"* {{File link | file={{{File or URL|}}} | alt={{{Alternate name|}}} }}<br />\"',0,'Ejmontal','20141209173140',0,0,76,0,'qldu4s71mefr0flysuf24yw648ikl8t',NULL,NULL),(10,10,10,'',0,'Ejmontal','20141211141621',0,0,3181,0,'a6p19wczl21ntjcovx6xw6ao8qu92xe',NULL,NULL),(11,11,11,'',0,'Ejmontal','20141209164345',0,0,1496,0,'nxninsoaouwkv23p7tjsjrf0q9uxggj',NULL,NULL),(12,12,12,'',0,'Ejmontal','20141211141437',0,0,4664,0,'rp260gs4l9czatk03dkenbtkbx5uet3',NULL,NULL),(13,13,13,'',0,'Ejmontal','20120523141605',0,0,58,0,'aqsajlxyegug7c0dpk5ukqov5fuuj3s',NULL,NULL),(14,14,14,'',0,'Ejmontal','20120523141821',0,0,66,0,'s30i80w2e4gqzoowzhiny8youv0o0tt',NULL,NULL),(15,15,15,'',0,'Ejmontal','20120523141505',0,0,48,0,'4qq6cuutoa3imisl8utrduwz15crhq4',NULL,NULL),(16,16,16,'',0,'Ejmontal','20120523141508',0,0,48,0,'4qq6cuutoa3imisl8utrduwz15crhq4',NULL,NULL),(17,17,17,'',0,'Ejmontal','20120523141518',0,0,46,0,'jk9aupditbfg4coza27xh6berm5n0sp',NULL,NULL),(18,18,18,'',0,'Ejmontal','20120523141438',0,0,288,0,'lsu1fykl95gepuo3hzm9o3a81szypcc',NULL,NULL),(19,19,19,'',0,'Ejmontal','20120523141439',0,0,48,0,'4qq6cuutoa3imisl8utrduwz15crhq4',NULL,NULL),(20,20,20,'',0,'Ejmontal','20120523141629',0,0,46,0,'9mgrgetkvo2j5ek3mccsi459e034o4e',NULL,NULL),(21,21,21,'',0,'Ejmontal','20120523142202',0,0,113,0,'8v1yjipk0z3r6qurlk2rxx0l5lwuehf',NULL,NULL),(22,22,22,'',0,'Ejmontal','20120523142341',0,0,112,0,'5dwo62r063ebf5wyf881pya04zn1rvf',NULL,NULL),(23,23,23,'',0,'Ejmontal','20120523141647',0,0,48,0,'4qq6cuutoa3imisl8utrduwz15crhq4',NULL,NULL),(24,24,24,'Created page with \"This is a property of type [[Has type::Page]]. It is used by calls to the [http://www.mediawiki.org/wiki/Extension:Semantic_Internal_Objects Semantic Internal Objects] parser fun...\"',0,'Ejmontal','20120525175405',0,0,381,0,'b8ourbo9mbs31ruyus1t1flgc1uw30k',NULL,NULL),(25,25,25,'',0,'Ejmontal','20120611235551',0,0,317,0,'m30mfejf30np5pb5eybzwx1ee2s9g1g',NULL,NULL),(26,26,26,'Created page with \"This is a property of type [[Has type::String]].\"',0,'Ejmontal','20120612164738',0,0,48,0,'4qq6cuutoa3imisl8utrduwz15crhq4',NULL,NULL),(27,27,27,'Created page with \"This property has type [[Has type::Number]] and is intended to be used to state the intended order of a Multiple Instance Template.\"',0,'Ejmontal','20130219131127',0,0,131,0,'1m9lw03lsrb86ga5yl9eei85w90cmgd',NULL,NULL),(28,28,28,'Created page with \"This is a property of type [[Has type::Page]].\"',0,'Ejmontal','20120523144616',0,0,46,0,'jk9aupditbfg4coza27xh6berm5n0sp',NULL,NULL),(29,29,29,'',0,'Ejmontal','20140630230852',0,0,46,0,'e9l4lxsaidmyd6062gydncspht400ia',NULL,NULL),(30,30,30,'Created page with \"This is a property of type [[Has type::Page]].\"',0,'Ejmontal','20141209162941',0,0,46,0,'jk9aupditbfg4coza27xh6berm5n0sp',NULL,NULL),(31,31,31,'Created page with \"This is a property of type [[Has type::Page]].\"',0,'Ejmontal','20141209162942',0,0,46,0,'jk9aupditbfg4coza27xh6berm5n0sp',NULL,NULL),(32,32,32,'Created page with \"This is a property of type [[Has type::Text]].\"',0,'Ejmontal','20141209162943',0,0,46,0,'e9l4lxsaidmyd6062gydncspht400ia',NULL,NULL),(33,33,33,'Created page with \"This is a property of type [[Has type::Text]].\"',0,'Ejmontal','20141209162944',0,0,46,0,'e9l4lxsaidmyd6062gydncspht400ia',NULL,NULL),(34,34,34,'Created page with \"{{#ask: [[Has topic title::+]][[Related article::{{PAGENAME}}]] |mainlabel=- |? From page |? Has date |? Has topic title |? Synopsis |? Related article |link = none |format =...\"',0,'Ejmontal','20141209171645',0,0,389,0,'7gcw60fx08v0xqssq6ha5js96i2ybx7',NULL,NULL),(35,35,35,'initial',0,'127.0.0.1','20170308114923',0,0,154,0,'5f9fhemkl0on29w70kkunjng6brp5zo',NULL,NULL),(36,36,36,'initial',0,'127.0.0.1','20170308114937',0,0,10,0,'r31o2dmsiadk4kl4549v6jdkop0zv3k',NULL,NULL),(37,37,37,'',1,'Admin','20170308115100',0,0,32,0,'aora3b61xypifh39lo5syomj0huctko',NULL,NULL),(38,36,38,'Added a table and a picture.',1,'Admin','20170308115254',0,0,302,36,'4wbebcr3snwdkig7av3fjypk08gpsdf',NULL,NULL);
/*!40000 ALTER TABLE `revision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `si_page` int(10) unsigned NOT NULL,
  `si_title` varchar(255) NOT NULL DEFAULT '',
  `si_text` mediumtext NOT NULL,
  UNIQUE KEY `si_page` (`si_page`),
  FULLTEXT KEY `si_title` (`si_title`),
  FULLTEXT KEY `si_text` (`si_text`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_identifiers`
--

DROP TABLE IF EXISTS `site_identifiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_identifiers` (
  `si_site` int(10) unsigned NOT NULL,
  `si_type` varbinary(32) NOT NULL,
  `si_key` varbinary(32) NOT NULL,
  UNIQUE KEY `site_ids_type` (`si_type`,`si_key`),
  KEY `site_ids_site` (`si_site`),
  KEY `site_ids_key` (`si_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_identifiers`
--

LOCK TABLES `site_identifiers` WRITE;
/*!40000 ALTER TABLE `site_identifiers` DISABLE KEYS */;
/*!40000 ALTER TABLE `site_identifiers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_stats`
--

DROP TABLE IF EXISTS `site_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `site_stats` (
  `ss_row_id` int(10) unsigned NOT NULL,
  `ss_total_edits` bigint(20) unsigned DEFAULT '0',
  `ss_good_articles` bigint(20) unsigned DEFAULT '0',
  `ss_total_pages` bigint(20) DEFAULT '-1',
  `ss_users` bigint(20) DEFAULT '-1',
  `ss_active_users` bigint(20) DEFAULT '-1',
  `ss_images` int(11) DEFAULT '0',
  UNIQUE KEY `ss_row_id` (`ss_row_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_stats`
--

LOCK TABLES `site_stats` WRITE;
/*!40000 ALTER TABLE `site_stats` DISABLE KEYS */;
INSERT INTO `site_stats` VALUES (1,38,1,37,1,0,1);
/*!40000 ALTER TABLE `site_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `site_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_global_key` varbinary(32) NOT NULL,
  `site_type` varbinary(32) NOT NULL,
  `site_group` varbinary(32) NOT NULL,
  `site_source` varbinary(32) NOT NULL,
  `site_language` varbinary(32) NOT NULL,
  `site_protocol` varbinary(32) NOT NULL,
  `site_domain` varchar(255) NOT NULL,
  `site_data` blob NOT NULL,
  `site_forward` tinyint(1) NOT NULL,
  `site_config` blob NOT NULL,
  PRIMARY KEY (`site_id`),
  UNIQUE KEY `sites_global_key` (`site_global_key`),
  KEY `sites_type` (`site_type`),
  KEY `sites_group` (`site_group`),
  KEY `sites_source` (`site_source`),
  KEY `sites_language` (`site_language`),
  KEY `sites_protocol` (`site_protocol`),
  KEY `sites_domain` (`site_domain`),
  KEY `sites_forward` (`site_forward`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_concept_cache`
--

DROP TABLE IF EXISTS `smw_concept_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_concept_cache` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_concept_cache`
--

LOCK TABLES `smw_concept_cache` WRITE;
/*!40000 ALTER TABLE `smw_concept_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_concept_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_blob`
--

DROP TABLE IF EXISTS `smw_di_blob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_blob` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_blob`
--

LOCK TABLES `smw_di_blob` WRITE;
/*!40000 ALTER TABLE `smw_di_blob` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_blob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_bool`
--

DROP TABLE IF EXISTS `smw_di_bool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_bool` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_value` tinyint(1) DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_value`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_bool`
--

LOCK TABLES `smw_di_bool` WRITE;
/*!40000 ALTER TABLE `smw_di_bool` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_bool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_coords`
--

DROP TABLE IF EXISTS `smw_di_coords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_coords` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_lat` double DEFAULT NULL,
  `o_lon` double DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_serialized`),
  KEY `o_lat` (`o_lat`,`o_lon`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_coords`
--

LOCK TABLES `smw_di_coords` WRITE;
/*!40000 ALTER TABLE `smw_di_coords` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_coords` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_number`
--

DROP TABLE IF EXISTS `smw_di_number`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_number` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_number`
--

LOCK TABLES `smw_di_number` WRITE;
/*!40000 ALTER TABLE `smw_di_number` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_number` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_time`
--

DROP TABLE IF EXISTS `smw_di_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_time` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_time`
--

LOCK TABLES `smw_di_time` WRITE;
/*!40000 ALTER TABLE `smw_di_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_uri`
--

DROP TABLE IF EXISTS `smw_di_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_uri` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_serialized`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_uri`
--

LOCK TABLES `smw_di_uri` WRITE;
/*!40000 ALTER TABLE `smw_di_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_di_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_di_wikipage`
--

DROP TABLE IF EXISTS `smw_di_wikipage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_di_wikipage` (
  `s_id` int(8) unsigned NOT NULL,
  `p_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`,`p_id`),
  KEY `p_id` (`p_id`,`o_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_di_wikipage`
--

LOCK TABLES `smw_di_wikipage` WRITE;
/*!40000 ALTER TABLE `smw_di_wikipage` DISABLE KEYS */;
INSERT INTO `smw_di_wikipage` VALUES (51,52,53),(54,52,55),(62,52,53),(63,52,64);
/*!40000 ALTER TABLE `smw_di_wikipage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_ask`
--

DROP TABLE IF EXISTS `smw_fpt_ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_ask` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_ask`
--

LOCK TABLES `smw_fpt_ask` WRITE;
/*!40000 ALTER TABLE `smw_fpt_ask` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askde`
--

DROP TABLE IF EXISTS `smw_fpt_askde`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askde` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askde`
--

LOCK TABLES `smw_fpt_askde` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askde` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askde` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askdu`
--

DROP TABLE IF EXISTS `smw_fpt_askdu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askdu` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askdu`
--

LOCK TABLES `smw_fpt_askdu` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askdu` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askdu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askfo`
--

DROP TABLE IF EXISTS `smw_fpt_askfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askfo` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askfo`
--

LOCK TABLES `smw_fpt_askfo` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_asksi`
--

DROP TABLE IF EXISTS `smw_fpt_asksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_asksi` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_asksi`
--

LOCK TABLES `smw_fpt_asksi` WRITE;
/*!40000 ALTER TABLE `smw_fpt_asksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_asksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_askst`
--

DROP TABLE IF EXISTS `smw_fpt_askst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_askst` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_askst`
--

LOCK TABLES `smw_fpt_askst` WRITE;
/*!40000 ALTER TABLE `smw_fpt_askst` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_askst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_conc`
--

DROP TABLE IF EXISTS `smw_fpt_conc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_conc` (
  `s_id` int(8) unsigned NOT NULL,
  `concept_txt` mediumblob,
  `concept_docu` mediumblob,
  `concept_features` int(11) DEFAULT NULL,
  `concept_size` int(11) DEFAULT NULL,
  `concept_depth` int(11) DEFAULT NULL,
  `cache_date` int(8) unsigned DEFAULT NULL,
  `cache_count` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_conc`
--

LOCK TABLES `smw_fpt_conc` WRITE;
/*!40000 ALTER TABLE `smw_fpt_conc` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_conc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_conv`
--

DROP TABLE IF EXISTS `smw_fpt_conv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_conv` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_conv`
--

LOCK TABLES `smw_fpt_conv` WRITE;
/*!40000 ALTER TABLE `smw_fpt_conv` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_conv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_dtitle`
--

DROP TABLE IF EXISTS `smw_fpt_dtitle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_dtitle` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_dtitle`
--

LOCK TABLES `smw_fpt_dtitle` WRITE;
/*!40000 ALTER TABLE `smw_fpt_dtitle` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_dtitle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_impo`
--

DROP TABLE IF EXISTS `smw_fpt_impo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_impo` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_impo`
--

LOCK TABLES `smw_fpt_impo` WRITE;
/*!40000 ALTER TABLE `smw_fpt_impo` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_impo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_inst`
--

DROP TABLE IF EXISTS `smw_fpt_inst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_inst` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_inst`
--

LOCK TABLES `smw_fpt_inst` WRITE;
/*!40000 ALTER TABLE `smw_fpt_inst` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_inst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_lcode`
--

DROP TABLE IF EXISTS `smw_fpt_lcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_lcode` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_lcode`
--

LOCK TABLES `smw_fpt_lcode` WRITE;
/*!40000 ALTER TABLE `smw_fpt_lcode` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_lcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_list`
--

DROP TABLE IF EXISTS `smw_fpt_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_list` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_list`
--

LOCK TABLES `smw_fpt_list` WRITE;
/*!40000 ALTER TABLE `smw_fpt_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_mdat`
--

DROP TABLE IF EXISTS `smw_fpt_mdat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_mdat` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_mdat`
--

LOCK TABLES `smw_fpt_mdat` WRITE;
/*!40000 ALTER TABLE `smw_fpt_mdat` DISABLE KEYS */;
INSERT INTO `smw_fpt_mdat` VALUES (51,'1/2012/5/23/14/16/5/0',2456071.0945023),(54,'1/2012/5/23/14/18/21/0',2456071.0960764),(56,'1/2012/5/23/14/15/5/0',2456071.0938079),(57,'1/2012/5/23/14/15/8/0',2456071.0938426),(58,'1/2012/5/23/14/15/18/0',2456071.0939583),(59,'1/2012/5/23/14/14/38/0',2456071.0934954),(60,'1/2012/5/23/14/14/39/0',2456071.0935069),(61,'1/2012/5/23/14/16/29/0',2456071.0947801),(62,'1/2012/5/23/14/22/2/0',2456071.0986343),(63,'1/2012/5/23/14/23/41/0',2456071.0997801),(65,'1/2012/5/23/14/16/47/0',2456071.0949884),(66,'1/2012/5/25/17/54/5/0',2456073.2458912),(67,'1/2012/6/11/23/55/51/0',2456090.4971181),(68,'1/2012/6/12/16/47/38/0',2456091.1997454),(69,'1/2013/2/19/13/11/27/0',2456343.0496181),(70,'1/2012/5/23/14/46/16/0',2456071.115463),(71,'1/2014/6/30/23/8/52/0',2456839.4644907),(72,'1/2014/12/9/16/29/41/0',2457001.1872801),(73,'1/2014/12/9/16/29/42/0',2457001.1872917),(74,'1/2014/12/9/16/29/43/0',2457001.1873032),(75,'1/2014/12/9/16/29/44/0',2457001.1873148),(76,'1/2017/3/8/11/49/23/0',2457820.9926273),(78,'1/2017/3/8/11/51/0/0',2457820.99375),(77,'1/2017/3/8/11/52/54/0',2457820.9950694);
/*!40000 ALTER TABLE `smw_fpt_mdat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_prec`
--

DROP TABLE IF EXISTS `smw_fpt_prec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_prec` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  `o_sortkey` double DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_sortkey` (`o_sortkey`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_prec`
--

LOCK TABLES `smw_fpt_prec` WRITE;
/*!40000 ALTER TABLE `smw_fpt_prec` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_prec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_pval`
--

DROP TABLE IF EXISTS `smw_fpt_pval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_pval` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_pval`
--

LOCK TABLES `smw_fpt_pval` WRITE;
/*!40000 ALTER TABLE `smw_fpt_pval` DISABLE KEYS */;
INSERT INTO `smw_fpt_pval` VALUES (59,NULL,'Monday'),(59,NULL,'Tuesday'),(59,NULL,'Wednesday'),(59,NULL,'Thursday'),(59,NULL,'Friday'),(59,NULL,'Saturday'),(59,NULL,'Sunday');
/*!40000 ALTER TABLE `smw_fpt_pval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_redi`
--

DROP TABLE IF EXISTS `smw_fpt_redi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_redi` (
  `s_title` varbinary(255) NOT NULL,
  `s_namespace` int(11) NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_title` (`s_title`,`s_namespace`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_redi`
--

LOCK TABLES `smw_fpt_redi` WRITE;
/*!40000 ALTER TABLE `smw_fpt_redi` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_redi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_serv`
--

DROP TABLE IF EXISTS `smw_fpt_serv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_serv` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_serv`
--

LOCK TABLES `smw_fpt_serv` WRITE;
/*!40000 ALTER TABLE `smw_fpt_serv` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_serv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_sobj`
--

DROP TABLE IF EXISTS `smw_fpt_sobj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_sobj` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_sobj`
--

LOCK TABLES `smw_fpt_sobj` WRITE;
/*!40000 ALTER TABLE `smw_fpt_sobj` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_sobj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_subc`
--

DROP TABLE IF EXISTS `smw_fpt_subc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_subc` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_subc`
--

LOCK TABLES `smw_fpt_subc` WRITE;
/*!40000 ALTER TABLE `smw_fpt_subc` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_subc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_subp`
--

DROP TABLE IF EXISTS `smw_fpt_subp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_subp` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_subp`
--

LOCK TABLES `smw_fpt_subp` WRITE;
/*!40000 ALTER TABLE `smw_fpt_subp` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_subp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_text`
--

DROP TABLE IF EXISTS `smw_fpt_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_text` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_text`
--

LOCK TABLES `smw_fpt_text` WRITE;
/*!40000 ALTER TABLE `smw_fpt_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_type`
--

DROP TABLE IF EXISTS `smw_fpt_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_type` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_serialized` (`o_serialized`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_type`
--

LOCK TABLES `smw_fpt_type` WRITE;
/*!40000 ALTER TABLE `smw_fpt_type` DISABLE KEYS */;
INSERT INTO `smw_fpt_type` VALUES (56,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(57,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(58,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(59,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(60,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(61,'http://semantic-mediawiki.org/swivt/1.0#_dat'),(62,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(63,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(65,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(66,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(67,'http://semantic-mediawiki.org/swivt/1.0#_dat'),(68,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(69,'http://semantic-mediawiki.org/swivt/1.0#_num'),(70,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(71,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(72,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(73,'http://semantic-mediawiki.org/swivt/1.0#_wpg'),(74,'http://semantic-mediawiki.org/swivt/1.0#_txt'),(75,'http://semantic-mediawiki.org/swivt/1.0#_txt');
/*!40000 ALTER TABLE `smw_fpt_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_unit`
--

DROP TABLE IF EXISTS `smw_fpt_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_unit` (
  `s_id` int(8) unsigned NOT NULL,
  `o_blob` mediumblob,
  `o_hash` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_hash` (`o_hash`),
  KEY `s_id_2` (`s_id`,`o_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_unit`
--

LOCK TABLES `smw_fpt_unit` WRITE;
/*!40000 ALTER TABLE `smw_fpt_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_fpt_uri`
--

DROP TABLE IF EXISTS `smw_fpt_uri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_fpt_uri` (
  `s_id` int(8) unsigned NOT NULL,
  `o_serialized` varbinary(255) DEFAULT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_serialized` (`o_serialized`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_fpt_uri`
--

LOCK TABLES `smw_fpt_uri` WRITE;
/*!40000 ALTER TABLE `smw_fpt_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_fpt_uri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_object_ids`
--

DROP TABLE IF EXISTS `smw_object_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_object_ids` (
  `smw_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `smw_namespace` int(11) NOT NULL,
  `smw_title` varbinary(255) NOT NULL,
  `smw_iw` varbinary(32) NOT NULL,
  `smw_subobject` varbinary(255) NOT NULL,
  `smw_sortkey` varbinary(255) NOT NULL,
  `smw_proptable_hash` mediumblob,
  PRIMARY KEY (`smw_id`),
  KEY `smw_id` (`smw_id`,`smw_sortkey`),
  KEY `smw_iw` (`smw_iw`),
  KEY `smw_title` (`smw_title`,`smw_namespace`,`smw_iw`,`smw_subobject`),
  KEY `smw_sortkey` (`smw_sortkey`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_object_ids`
--

LOCK TABLES `smw_object_ids` WRITE;
/*!40000 ALTER TABLE `smw_object_ids` DISABLE KEYS */;
INSERT INTO `smw_object_ids` VALUES (1,102,'_TYPE','','','Has type',NULL),(2,102,'_URI','','','Equivalent URI',NULL),(4,102,'_INST',':smw-intprop','','',NULL),(7,102,'_UNIT','','','Display units',NULL),(8,102,'_IMPO','','','Imported from',NULL),(10,102,'_PDESC','','','Has property description',NULL),(11,102,'_PREC','','','Display precision of',NULL),(12,102,'_CONV','','','Corresponds to',NULL),(13,102,'_SERV','','','Provides service',NULL),(14,102,'_PVAL','','','Allows value',NULL),(15,102,'_REDI',':smw-intprop','','',NULL),(16,102,'_DTITLE','','','Display title of',NULL),(17,102,'_SUBP','','','Subproperty of',NULL),(18,102,'_SUBC','','','Subcategory of',NULL),(19,102,'_CONC',':smw-intprop','','',NULL),(22,102,'_ERRP','','','Has improper value for',NULL),(28,102,'_LIST','','','Has fields',NULL),(29,102,'_MDAT','','','Modification date',NULL),(30,102,'_CDAT','','','Creation date',NULL),(31,102,'_NEWP','','','Is a new page',NULL),(32,102,'_LEDT','','','Last editor is',NULL),(33,102,'_ASK','','','Has query',NULL),(34,102,'_ASKST','','','Query string',NULL),(35,102,'_ASKFO','','','Query format',NULL),(36,102,'_ASKSI','','','Query size',NULL),(37,102,'_ASKDE','','','Query depth',NULL),(40,102,'_LCODE','','','Language code',NULL),(41,102,'_TEXT','','','Text',NULL),(50,0,'',':smw-border','','',NULL),(51,14,'Meeting','','','Meeting','a:2:{s:15:\"smw_di_wikipage\";s:32:\"ffb42ef74fbb31ca616a0b00aee41558\";s:12:\"smw_fpt_mdat\";s:32:\"0df0d2fe24818a8d40b59678dd0308e2\";}'),(52,102,'_SF_DF','','','Has default form',NULL),(53,106,'Meeting','','','Meeting',NULL),(54,14,'Meeting_Minutes','','','Meeting Minutes','a:2:{s:15:\"smw_di_wikipage\";s:32:\"a3adcf9ed90490704bdef807a6b109c7\";s:12:\"smw_fpt_mdat\";s:32:\"065c46e6bce5023c7afc7c8d85bef1df\";}'),(55,106,'Meeting_Minutes','','','Meeting Minutes',NULL),(56,102,'Call_in_number','','','Call in number','a:2:{s:12:\"smw_fpt_type\";s:32:\"c319e660ab7c3a8c375be891ae617134\";s:12:\"smw_fpt_mdat\";s:32:\"a940e65e78fba41fe282e98e4f678232\";}'),(57,102,'Call_in_password','','','Call in password','a:2:{s:12:\"smw_fpt_type\";s:32:\"dcd88a2b1d7e90aa6df0aa43b4714fda\";s:12:\"smw_fpt_mdat\";s:32:\"dd3ebc8f0c2d14510ce1432f27d9e939\";}'),(58,102,'Managed_by_cadre','','','Managed by cadre','a:2:{s:12:\"smw_fpt_type\";s:32:\"a37f1bfd8d53777584d411ece5cc1047\";s:12:\"smw_fpt_mdat\";s:32:\"ed3b33e44bced748c5596ed9f70750e8\";}'),(59,102,'Standard_day','','','Standard day','a:3:{s:12:\"smw_fpt_type\";s:32:\"1a339de6dffd1a585372685ad4be2619\";s:12:\"smw_fpt_pval\";s:32:\"571c507773ee8e8d8281b7f99b8ce80f\";s:12:\"smw_fpt_mdat\";s:32:\"3d4438d0268bbaa637da8aae43a2d33c\";}'),(60,102,'Standard_time','','','Standard time','a:2:{s:12:\"smw_fpt_type\";s:32:\"28655e719bda68f74b8f3b3aae14d486\";s:12:\"smw_fpt_mdat\";s:32:\"7b315d54927e29952e40db815df75448\";}'),(61,102,'Meeting_date','','','Meeting date','a:2:{s:12:\"smw_fpt_type\";s:32:\"078776a4900d0fc38b5a680cc33dda2b\";s:12:\"smw_fpt_mdat\";s:32:\"3724581e32495a405ea4f2e064000d80\";}'),(62,102,'Meeting_type','','','Meeting type','a:3:{s:15:\"smw_di_wikipage\";s:32:\"32b1109487fdcc7122d878a0c2302aab\";s:12:\"smw_fpt_type\";s:32:\"f8ede8a2abbe11f14b2cd309ec5d6145\";s:12:\"smw_fpt_mdat\";s:32:\"3e95ea8b53568519b189ae93052c2939\";}'),(63,102,'Notes_taken_by','','','Notes taken by','a:3:{s:15:\"smw_di_wikipage\";s:32:\"df4225c432343c6010eec28ab3d275f9\";s:12:\"smw_fpt_type\";s:32:\"2f7313770d9f7d772af51730135f73e4\";s:12:\"smw_fpt_mdat\";s:32:\"e68fc825166ac2a7f81d8c9aff7445b0\";}'),(64,106,'Person','','','Person',NULL),(65,102,'Start_time','','','Start time','a:2:{s:12:\"smw_fpt_type\";s:32:\"75c39e0b544a50609d52dbe1f354764b\";s:12:\"smw_fpt_mdat\";s:32:\"37802cc771f2d4f4a437ff10f654e884\";}'),(66,102,'From_page','','','From page','a:2:{s:12:\"smw_fpt_type\";s:32:\"97c644822db2633eb252d7c3ab3000a7\";s:12:\"smw_fpt_mdat\";s:32:\"3fccbcf8b3530844f13d7ae96470837c\";}'),(67,102,'Has_date','','','Has date','a:2:{s:12:\"smw_fpt_type\";s:32:\"3c12f164d8f6b945c25975760a686c1c\";s:12:\"smw_fpt_mdat\";s:32:\"32c5d03ff403ec901478d49171111eb5\";}'),(68,102,'Has_topic_title','','','Has topic title','a:2:{s:12:\"smw_fpt_type\";s:32:\"1ba8d8c8eaa857a5ff2365d4077fc384\";s:12:\"smw_fpt_mdat\";s:32:\"c4e661b491a93b1e83e060bffe86c01a\";}'),(69,102,'Index','','','Index','a:2:{s:12:\"smw_fpt_type\";s:32:\"5318945ec26852a9b331a73019155d1a\";s:12:\"smw_fpt_mdat\";s:32:\"7751f3df4525d273ddce767b7a2cdf7f\";}'),(70,102,'Related_article','','','Related article','a:2:{s:12:\"smw_fpt_type\";s:32:\"e0e74105310ef2e04ce45bb669ab3d8c\";s:12:\"smw_fpt_mdat\";s:32:\"c285e64aabd9e73e371ff493d1b4c64e\";}'),(71,102,'Synopsis','','','Synopsis','a:2:{s:12:\"smw_fpt_type\";s:32:\"59f822f4be62bf3e953d9356ab3f0b3d\";s:12:\"smw_fpt_mdat\";s:32:\"b7341a27bab9cd23af27b36506274171\";}'),(72,102,'Building','','','Building','a:2:{s:12:\"smw_fpt_type\";s:32:\"c7d30e7043f4b04a3e1b27a89c2d081d\";s:12:\"smw_fpt_mdat\";s:32:\"27413888d982cf58eebaa5bb65c333f7\";}'),(73,102,'Notable_attendee','','','Notable attendee','a:2:{s:12:\"smw_fpt_type\";s:32:\"057fe8141c8c1fb3f995d59ad70e9eb1\";s:12:\"smw_fpt_mdat\";s:32:\"b440eb7f6143aeb9b95b827c8772c52e\";}'),(74,102,'Overview','','','Overview','a:2:{s:12:\"smw_fpt_type\";s:32:\"9a40638bf0e4cb2903af36fbad0bb3c4\";s:12:\"smw_fpt_mdat\";s:32:\"2c70f75593d031292cff3c9ffc649d5f\";}'),(75,102,'Room','','','Room','a:2:{s:12:\"smw_fpt_type\";s:32:\"079805f52fb65d77959bf2704a240d6d\";s:12:\"smw_fpt_mdat\";s:32:\"2267a885833806180b2b71ddac76182e\";}'),(76,0,'Main_Page','','','Main Page','a:1:{s:12:\"smw_fpt_mdat\";s:32:\"ea9e1322af77a3e8b4650551ed8a5d12\";}'),(77,0,'Test_Page','','','Test Page','a:1:{s:12:\"smw_fpt_mdat\";s:32:\"e075cb9677d3e3de37d0144ae5dfcfe4\";}'),(78,6,'Test_image.png','','','Test image.png','a:1:{s:12:\"smw_fpt_mdat\";s:32:\"d81818891d608ff2fb940eef0da0a951\";}');
/*!40000 ALTER TABLE `smw_object_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_prop_stats`
--

DROP TABLE IF EXISTS `smw_prop_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_prop_stats` (
  `p_id` int(8) unsigned DEFAULT NULL,
  `usage_count` int(8) unsigned DEFAULT NULL,
  UNIQUE KEY `p_id` (`p_id`),
  KEY `usage_count` (`usage_count`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_prop_stats`
--

LOCK TABLES `smw_prop_stats` WRITE;
/*!40000 ALTER TABLE `smw_prop_stats` DISABLE KEYS */;
INSERT INTO `smw_prop_stats` VALUES (52,4),(56,0),(57,0),(58,0),(59,0),(60,0),(61,0),(62,0),(63,0),(65,0),(66,0),(67,0),(68,0),(69,0),(70,0),(71,0),(72,0),(73,0),(74,0),(75,0);
/*!40000 ALTER TABLE `smw_prop_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smw_query_links`
--

DROP TABLE IF EXISTS `smw_query_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smw_query_links` (
  `s_id` int(8) unsigned NOT NULL,
  `o_id` int(8) unsigned NOT NULL,
  KEY `s_id` (`s_id`),
  KEY `o_id` (`o_id`),
  KEY `s_id_2` (`s_id`,`o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smw_query_links`
--

LOCK TABLES `smw_query_links` WRITE;
/*!40000 ALTER TABLE `smw_query_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `smw_query_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_summary`
--

DROP TABLE IF EXISTS `tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag_summary` (
  `ts_rc_id` int(11) DEFAULT NULL,
  `ts_log_id` int(11) DEFAULT NULL,
  `ts_rev_id` int(11) DEFAULT NULL,
  `ts_tags` blob NOT NULL,
  UNIQUE KEY `tag_summary_rc_id` (`ts_rc_id`),
  UNIQUE KEY `tag_summary_log_id` (`ts_log_id`),
  UNIQUE KEY `tag_summary_rev_id` (`ts_rev_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_summary`
--

LOCK TABLES `tag_summary` WRITE;
/*!40000 ALTER TABLE `tag_summary` DISABLE KEYS */;
INSERT INTO `tag_summary` VALUES (1,NULL,35,'visualeditor'),(4,NULL,38,'visualeditor');
/*!40000 ALTER TABLE `tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templatelinks`
--

DROP TABLE IF EXISTS `templatelinks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatelinks` (
  `tl_from` int(10) unsigned NOT NULL DEFAULT '0',
  `tl_from_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_namespace` int(11) NOT NULL DEFAULT '0',
  `tl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  UNIQUE KEY `tl_from` (`tl_from`,`tl_namespace`,`tl_title`),
  UNIQUE KEY `tl_namespace` (`tl_namespace`,`tl_title`,`tl_from`),
  KEY `tl_backlinks_namespace` (`tl_from_namespace`,`tl_namespace`,`tl_title`,`tl_from`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templatelinks`
--

LOCK TABLES `templatelinks` WRITE;
/*!40000 ALTER TABLE `templatelinks` DISABLE KEYS */;
INSERT INTO `templatelinks` VALUES (10,10,10,'Collapsible'),(8,10,10,'File_link'),(9,10,10,'File_link');
/*!40000 ALTER TABLE `templatelinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `text`
--

DROP TABLE IF EXISTS `text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `text` (
  `old_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `old_text` mediumblob NOT NULL,
  `old_flags` tinyblob NOT NULL,
  PRIMARY KEY (`old_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1 MAX_ROWS=10000000 AVG_ROW_LENGTH=10240;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `text`
--

LOCK TABLES `text` WRITE;
/*!40000 ALTER TABLE `text` DISABLE KEYS */;
INSERT INTO `text` VALUES (1,'<includeonly><!--\n# Template:Meeting\n#   (1) Setup JS/CSS and category\n#   (2) Add category\n#   (3) Create wrapper div around infobox and table of contents\n#   (4) Create infobox\n#   (5) Close out wrapper div\n#   (6) Show overview of meeting\n#   (7) #ask query for recent meetings\n#   (8) Show link to form\n#   (9) Template documentation (noinclude)\n\n\n\n#\n# (1) Call the #meetingminutestemplate parser function in order to add\n#     the required javascript and CSS to the meeting template (uses same\n#     parser function as Template:Meeting minutes.\n#\n-->{{#meetingminutestemplate:}}<!--\n\n\n#\n# (2) Add Category:Meeting Minutes.\n#\n-->[[Category:Meeting]]<!--\n\n\n#\n# (3) Add wrapper <div> which will go around infobox and table of contents.\n#     This allows the infobox and TOC to both be positioned on the left and\n#     be approximately the same size. FIXME: make them exactly the same size\n#\n--><div id=\"ext-meeting-minutes-toc-wrapper\"><!--\n\n\n#\n# (4) Create infobox\n#\n-->\n{| class=\"meeting-minutes-infobox\"\n! style=\"text-align: center; background-color:#ccccff;\" colspan=\"2\" |<big>{{PAGENAME}}</big>\n|-\n! Standard day\n| {{#if: {{{Standard day|}}} | [[Standard day::{{{Standard day|}}}]] | }}\n|-\n! Standard time\n| {{#if: {{{Standard time|}}} | [[Standard time::{{{Standard time|}}}]] | }}\n|-\n! Building\n| {{#if: {{{Building|}}} | [[Building::{{{Building|}}}]] | }}\n|-\n! Room\n| {{#if: {{{Room|}}} | [[Room::{{{Room|}}}]] | }}\n|-\n! Call-in number\n| {{#if: {{{Call-in number|}}} | [[Call in number::{{{Call-in number|}}}]] | }}\n|-\n! Call-in password\n| {{#if: {{{Call-in password|}}} | [[Call in password::{{{Call-in password|}}}]] | }}\n|-\n! Managed by cadre(s)\n| {{#arraymap:{{{Managed by cadre(s)|}}}|,|x|[[Managed by cadre::x]]}}\n|-\n! Notable attendee(s)\n| {{#arraymap:{{{Notable attendee(s)|}}}|,|x|[[Notable attendee::User:x]]}}\n|}\n<!--\n\n#\n# Note: no TOC in Template:Meeting at this time. could add __TOC__ here if desired.\n#\n\n\n\n#\n# (5) Close out <div> wrapper around infobox and TOC\n#\n--></div><!--\n\n\n\n#\n# (6) Show overview of meeting\n#\n-->{{#if: {{{Overview|}}} | {{{Overview}}}{{#set: Overview ={{{Overview}}} }} | <!-- else do nothing --> }}<!--\n\n\n#\n# (7) Perform #ask query to show recent meetings\n#\n--><h2>Recent Meetings</h2>\n{{#ask: [[Category:Meeting Minutes]] [[Meeting type::{{PAGENAME}}]]\n| ?Meeting date = Date\n| ?Notes taken by\n| sort = Meeting date\n| order = desc\n| limit = 10\n| default = No meetings of this type have been added\n}}\n\n<!-- leave blank lines above\n\n\n#\n# (8) Add link to meeting minutes form\n#\n-->[[Special:FormEdit/Meeting Minutes|Add Meeting Minutes]]<!--\n\n\n\n#\n# (9) Template definition complete. Template documentation below (within noinclude).\n#\n--></includeonly><noinclude>\nThis is the \"Meeting\" template.\nIt should be called in the following format:\n<pre>\n{{Meeting\n|Standard day=\n|Standard time=\n|Building=\n|Room=\n|Call-in number=\n|Call-in password=\n|Managed by cadre(s)=\n|Notable attendee(s)=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude>','utf-8'),(2,'<includeonly><!--\n#\n# Template:Meeting minutes\n#   (1) Setup JS/CSS and category\n#   (2) Add category\n#   (3) Create wrapper div around infobox and table of contents\n#   (4) Create infobox\n#   (5) Specify Table of Contents\n#   (6) Close out wrapper div\n#   (7) Insert topics (using Template:Topic from Meeting)\n#   (8) Template documentation (noinclude)\n\n\n\n#\n# (1) Call the #meetingminutestemplate parser function in order to add\n#     the required javascript and CSS to the meeting minutes template.\n#\n-->{{#meetingminutestemplate:}}<!--\n\n\n#\n# (2) Add Category:Meeting Minutes.\n#\n-->[[Category:Meeting Minutes]]<!--\n\n\n\n#\n# (3) Add wrapper <div> which will go around infobox and table of contents.\n#     This allows the infobox and TOC to both be positioned on the left and\n#     be approximately the same size. FIXME: make them exactly the same size\n#\n--><div id=\"ext-meeting-minutes-toc-wrapper\"><!--\n\n\n#\n# (4) Create the infobox\n#\n-->\n{| class=\"meeting-minutes-infobox\"\n! style=\"text-align: center; background-color:#ccccff;\" colspan=\"2\" |<big>Meeting Minutes</big>\n|-\n! Meeting type\n| [[Meeting type::{{{Meeting type|}}}]]\n|-\n! Meeting date\n| [[Meeting date::{{{Meeting date|}}}]] {{#vardefine:meetingDate|{{{Meeting date|}}} }}\n|-\n! Start time\n| [[Start time::{{{Start time hour|}}}:{{{Start time minute|}}}]]\n|-\n! Notes taken by\n| {{#arraymap:{{{Notes taken by|}}}|,|x|[[Notes taken by::User:x]]}}\n|-\n! style=\"text-align: center; background-color:#ccccff;\" colspan=\"2\" |<big>Meeting Documents</big>\n|-\n| colspan=\"2\" | {{#if: {{{Meeting files|}}} | {{{Meeting files|}}} | No documents }}\n|}\n<!--\n\n\n\n#\n# (5) Specify the location of the Table of Contents\n#\n-->__TOC__\n\n<!-- leave some blank lines above\n\n\n\n#\n# (6) Close out <div> wrapper around infobox and TOC\n#\n--></div><!--\n\n\n#\n# (7) Insert all of the meeting topics. Note: these topics are handled by\n#     Template:Topic from Meeting\n#\n-->{{{Topics|}}}<!--\n\n\n#\n# (8) Template definition complete. Template documentation below (within noinclude).\n#\n--></includeonly><noinclude>\nThis is the \"Meeting minutes\" template. It should be generated using [[Form:Meeting Minutes]].\n\nIf edited manually, it should be called in the following format:\n<pre>\n{{Meeting minutes\n|Meeting type=\n|Meeting date=\n|Start time hour=\n|Start time minute=\n|Notes taken by=\n|Topics= <insert instances of [[Template:Topic from Meeting]] here>\n}}\n</pre>\n\nEdit the page to see the template text.\n</noinclude>','utf-8'),(3,'<includeonly><!--\n\n\n#\n# (1) Create subobject of meeting topic data\n#\n-->{{#subobject:\n|From page={{FULLPAGENAME}}\n|Has date={{#var:meetingDate}}\n|Has topic title={{{Has topic title|}}}\n|Synopsis={{#synopsize: {{{Full text|}}} | 500 | 1 }}\n|Related article={{{Related article|}}}|+sep=,\n}}<!--\n\n\n#\n# Display topic info: header, related articles, and full text\n#\n--><h2>{{{Has topic title|}}}</h2>\n<small>\'\'\'Related Article(s):\'\'\' {{#arraymap:{{{Related article|}}}|,|x|[[x]]}}</small>\n\n{{{Full text|}}}\n\n\n<!-- leave space after full text\n\n\n\n#\n# (3) Template definition complete. Show template documentation. \n#\n--></includeonly><noinclude>\nThis is the \"Topic from meeting\" template. It should be created using the [[Form:Meeting Minutes]].\n\nIf edited manually, it should be called in the following format:\n<pre>\n{{Topic from meeting\n|From page=\n|Has date=\n|Full text=\n|Related article(s)=\n|Uploaded files=\n|External links=\n}}\n</pre>\nEdit the page to see the template text.\n</noinclude>','utf-8'),(4,'<!--\n\n         Meetings after today (future ... in the year 2000)\n\n-->__NOTOC__<table class=\"main-page-meeting-minutes-box main-page-meeting-minutes-box-yellow\" style=\"width:100%;\"><tr><th style=\"padding-top:10px; padding-bottom: 10px;\">Meeting Minutes</th></tr><tr><td><table><tr><td style=\"width:100%;margin:5px 0px 0px 0px;\">[[Special:FormEdit/Meeting Minutes|+ Add minutes]]</td></tr>\n{{#ask: [[Category:Meeting Minutes]] [[Meeting date::>> {{#time: d F Y }} ]] [[Meeting date::< {{#time: d F Y | +370 days}} ]]\n| ?Meeting type = Type\n| ?Meeting date = Date\n| sort = Meeting date, Start time\n| order = desc\n| limit = 30\n| link = none\n| default = \n| intro = \n| outro = \n| format = template\n| template = Meeting Minutes Block info for table row\n| searchlabel = \n}}<!--\n\n         Meetings today (present)\n\n-->{{#ask: [[Category:Meeting Minutes]] [[Meeting date:: {{#time: d F Y }} ]]\n| ?Meeting type = Type\n| ?Meeting date = Date\n| sort = Meeting date, Start time\n| order = desc\n| limit = 30\n| link = none\n| default = \n| intro = \n| outro = \n| format = template\n| template = Meeting Minutes Block info for table row highlighted\n| searchlabel = \n}}<!--\n\n         Meetings before today (past)\n\n-->{{#ask: [[Category:Meeting Minutes]] [[Meeting date::> {{#time: d F Y | -7 days}} ]] [[Meeting date::<< {{#time: d F Y }} ]]\n| ?Meeting type = Type\n| ?Meeting date = Date\n| sort = Meeting date, Start time\n| order = desc\n| limit = 30\n| link = none\n| default = \n| intro = \n| outro = \n| format = template\n| template = Meeting Minutes Block info for table row\n| searchlabel = \n}}<tr><td style=\"width:100%;margin:5px 0px 0px 0px;\">[[Meeting Minutes |... more meeting minutes]]</td></tr></table></td></tr></table>','utf-8'),(5,'<noinclude>\n<pre>\n{{{1|}}} = Meeting page title (i.e. {{PAGENAME}} for meeting)\n{{{2|}}} = Meeting type (Tools Panel, FIAR Call, etc...not full name of page like \"EVA Tools Panel - 23 August 2012\")\n{{{3|}}} = Meeting date\n</pre>\n</noinclude><includeonly><tr><td><table class=\"main-page-meeting-minutes-row\" style=\"width:100%;padding:5px;border:1px solid #cccccc;margin:10px 0px 0px 0px;\"><tr><th>\'\'\'[[{{{1|}}}|{{{2|}}}]]\'\'\' ({{{3|}}})</th></tr>\n<tr><td>{{#ask: [[Has topic title::+]][[From page::{{{1|}}}]]\n|mainlabel=-\n|? Has topic title\n|? Synopsis\n|? From page\n|link=none\n|format = template\n|template = Meeting topic and synopsis bullet\n}}</td></tr></table></td></tr></includeonly>','utf-8'),(6,'<noinclude>\n<pre>\n{{{1|}}} = Meeting page title (i.e. {{PAGENAME}} for meeting)\n{{{2|}}} = Meeting type (Tools Panel, FIAR Call, etc...not full name of page like \"EVA Tools Panel - 23 August 2012\")\n{{{3|}}} = Meeting date\n</pre>\n</noinclude><includeonly><tr><td><table class=\"main-page-meeting-minutes-row highlighted-row-light-yellow\" style=\"width:100%;padding:5px;border:1px solid #cccccc;margin:10px 0px 0px 0px;\"><tr><th>\'\'\'[[{{{1|}}}|{{{2|}}}]]\'\'\' (Today)</th></tr>\n<tr><td>{{#ask: [[Has topic title::+]][[From page::{{{1|}}}]]\n|mainlabel=-\n|? Has topic title\n|? Synopsis\n|? From page\n|link=none\n|format = template\n|template = Meeting topic and synopsis bullet\n}}</td></tr></table></td></tr></includeonly>','utf-8'),(7,'<noinclude>\n<pre>\n{{{1|}}} = From page (the name of the EVA page, like STS-132/ULF-4 EVA 2)\n{{{2|}}} = Has date (the date of the EVA)\n{{{3|}}} = Has topic title\n{{{4|}}} = Synopsis\n{{{5|}}} = Related article\n</pre>\n</noinclude><includeonly>\n<h2>[[{{{1|}}}#{{{3|}}}|{{{3|}}}]]</h2>\n{{{4|}}}\n\n<small>\'\'\'Date:\'\'\' {{{2|}}}<br />\n\'\'\'Meeting:\'\'\' {{#show: {{{1|}}} | ?Meeting type | link=none}}<br />\n\'\'\'Related articles:\'\'\' {{#arraymap: {{{5|}}}|,|VAR|[[VAR]]}}</small>','utf-8'),(8,'<noinclude>\'\'\'Template:File link\'\'\' is an alternate method of linking to files in this wiki. It allows all file linking, both to local wiki files and external files, to be performed with one method. See \'\'\'[[Help:Linking to files]]\'\'\' for a tutorial.\n\n== Local Files ==\nFor local files use the format below. Note that the \"alt\" parameter is optional.\n<pre>\n{{File link | file=File:International Space Station.pdf | alt=ISS Presentation }} (note, this file has to exist for it to display properly)\n</pre>\n\nThe above wikitext displays as {{File link | file=File:International Space Station.pdf | alt=ISS Presentation }}. Note the \"file info\" link. There has been confusion with some wiki users who click on file links which bring them to another wiki page instead of directly to the file. Using this method, the major link will bring them directly to the file, whereas the \"file info\" link will bring them to the page where they can see the file upload history and upload new versions of the file.\n\nIf the local file does not exist, the output will look like {{File link | file=File:My Fictitious File.doc | alt=Alt name won\'t show }} \n\n== External Files ==\nFor external files use the format below. Make sure to include <nowiki>http://</nowiki> or <nowiki>https://</nowiki> at the beginning of the URL. Again the \"alt\" parameter is optional, but it will look ugly without it in this case.\n<pre>\n{{File link | file=http://example.com/somefile.pdf | alt=My File }}\n</pre>\n\nThe above wikitext displays as {{File link | file=http://example.com/somefile.pdf | alt=My File }}. Note that there is no \"file info\" link, since the EVA Wiki has no such info for external files.\n\n</noinclude><includeonly><!-- \n\n    #\n    #  DETERMINES if the filename is a local file or an external file\n    #    #pos returns 0 if \"File:\" is found at the beginning of the string\n    #    returns nothing if \"File:\" is not found in the string, or a number other than zero if found later in the string\n    #\n-->{{#ifeq: 0 \n    | {{#pos:{{{file}}}|File:}} | <!-- \n \n\n    #\n    #  if filename starts with \"File:\"\n    #  \n--><span style=\"white-space:nowrap;\">{{#ifexist:{{{file}}}<!--\n\n        -->|[[Media:{{#replace:{{{file}}}|File:}}|{{#if: {{{alt|}}} | {{{alt}}} | {{#replace:{{{file}}}|File:}} }}]]<sup> <nowiki>[</nowiki>[[:{{{file}}}|file info]]<nowiki>]</nowiki></sup>|<!--\n\n        -->[[{{{file}}}]]}}</span>|<!-- \n\n\n    #\n    #  If does not start with \"File:\"\n    #  NOTE: the #if statement trims whitespace off of the URL...stupid hack\n    #  \n-->[{{#if:{{{file|}}}|{{{file|}}} }} {{{alt|}}}]<!--\n\n\n    #\n    #  Close out ifeq function\n    #\n-->}}</includeonly>','utf-8'),(9,'* {{File link | file={{{File or URL|}}} | alt={{{Alternate name|}}} }}<br />','utf-8'),(10,'<noinclude>This template creates a content field which can be shown/hidden by the click of a button.\n\n== Use the following form  ==\n<pre>\n{{Collapsible\n  | Content = \n  | Collapse text = (default = Collapse)\n  | Expand text = (default = Expand)\n  | Start hidden = (true or false, default = false)\n  | Class = (class applied to the outermost <div>)\n  | Before trigger = (text, html, wiki syntax to go before trigger; default = blank)\n  | After trigger = (text, html, wiki syntax to go after trigger but before content; default = blank)\n}}\n</pre>\n\n\n== Example 1 ==\n=== Code ===\n<pre>\n{{Collapsible\n  | Content = \n* Line one\n* Line 2\n* Line C\n* Line IV\n  | Collapse text = Collapse This\n  | Expand text = \n  | Start hidden = true\n  | Class = \n  | Before trigger = Click here to:&amp;nbsp;\n  | After trigger = !\n}}\n</pre>\n=== Result ===\n{{Collapsible\n  | Content = \n* Line one\n* Line 2\n* Line C\n* Line IV\n  | Collapse text = Collapse This\n  | Expand text = \n  | Start hidden = true\n  | Class = \n  | Before trigger = Click here to:&nbsp;\n  | After trigger = !\n}}\n\nNote: If you want a space between the colon in \"Click here to:\" and the expand/collapse button, you need to add a special character. Just typing a regular space (hitting the space bar) will not work, as MediaWiki will ignore this white space. Instead you need to add a [http://en.wikipedia.org/wiki/Non-breaking_space Non-breaking space], by typing <code>&amp;nbsp;</code> after the colon.\n\n== Example 2 ==\n=== Code ===\n<pre>\n{{Collapsible\n  | Content = \n* Line one\n* Line 2\n* Line C\n* Line IV\n  | Collapse text = Hide\n  | Expand text = Show\n  | Start hidden = \n  | Class = \n  | Before trigger =  \n  | After trigger = \n}}\n</pre>\n=== Result ===\n{{Collapsible\n  | Content = \n* Line one\n* Line 2\n* Line C\n* Line IV\n  | Collapse text = Hide\n  | Expand text = Show\n  | Start hidden = \n  | Class = \n  | Before trigger =  \n  | After trigger = \n}}\n</noinclude><includeonly><!--\n\n\n    Create the initial \"wrapper\" <div>\n        * Add optional Class\n        * If content should initially be hidden add the smm-collapsed class\n        * Add the text that should be used for the expand and collapse triggers\n\n--><div class=\"smm-collapsible {{{Class|}}} {{#ifeq: {{{Start hidden}}} | true | smm-collapsed | }}\" data-collapsetext=\"{{#if: {{{Collapse text|}}} | {{{Collapse text|}}} | Collapse}}\" data-expandtext=\"{{#if: {{{Expand text|}}} | {{{Expand text|}}} | Expand}}\"><!--\n\n\n    Optionally create elements that will go before and after the trigger\n        * Trigger = the \"link\" which will expand/collapse the content\n        * The trigger will be added via javascript in common.js\n        * Wrap Before trigger and After trigger in <span> tags for common.js and common.css to access them\n\n-->{{#if: {{{Before trigger|}}} | <span class=\"pre-trigger\">{{{Before trigger|}}}</span> | }}{{#if: {{{After trigger|}}} | <span class=\"post-trigger\">{{{After trigger|}}}</span> | }}<!--\n\n\n    Create content element and close out \"wrapper\" <div>\n        * If no \"Content\" parameter, use first parameter\n\n--><div class=\"smm-collapsible-content\">{{#if: {{{Content|}}} |&nbsp;\n{{{Content|}}} |&nbsp;\n{{{1}}} }}</div></div><!--\n\n--></includeonly>','utf-8'),(11,'<noinclude>\nThis is the \"Meeting\" form.\nTo create a page with this form, enter the page name below;\nif a page with that name already exists, you will be sent to a form to edit that page.\n\n\n{{#forminput:form=Meeting}}\n\n</noinclude><includeonly>{{{info|page name=<Meeting[Meeting title]>}}}\n<div id=\"wikiPreview\" style=\"display: none; padding-bottom: 25px; margin-bottom: 25px; border-bottom: 1px solid #AAAAAA;\"></div>\n{{{for template|Meeting}}}\n{| class=\"formtable\"\n! Meeting Title:\n| {{{field|Meeting title|mandatory|input type=text}}}\n|-\n! Standard day:\n| {{{field|Standard day}}}\n|-\n! Standard time:\n| {{{field|Standard time|input type=text}}} (format = 09:00, 24-hour time, please)\n|-\n! Building:\n| {{{field|Building|input type=text}}}\n|-\n! Room:\n| {{{field|Room|input type=text}}}\n|-\n! Call-in number:\n| {{{field|Call-in number|input type=text}}}\n|-\n! Call-in password:\n| {{{field|Call-in password|input type=text}}}\n|-\n! Managed by cadre(s):\n| {{{field|Managed by cadre(s)|input type=text}}}\n|-\n! Notable attendee(s):\n| {{{field|Notable attendee(s)|input type=textarea with autocomplete|values from namespace=User}}}\n|}\n\'\'\'Overview:\'\'\' {{{field|Overview|autogrow|input type=textarea}}}\n{{{end template}}}\n\n\'\'\'Free text:\'\'\'\n\n{{{standard input|free text|autogrow|rows=10}}}\n\n\n{{{standard input|summary}}}\n\n{{{standard input|minor edit}}} {{{standard input|watch}}}\n\n{{{standard input|save}}} {{{standard input|preview}}} {{{standard input|changes}}} {{{standard input|cancel}}}\n</includeonly>','utf-8'),(12,'<includeonly>{{#meetingminutesform:}}__NOTOC__{{{info|page name=<Meeting minutes[Meeting type]> - <Meeting minutes[Meeting date]>}}}\n<div id=\"wikiPreview\" style=\"display: none; padding-bottom: 25px; margin-bottom: 25px; border-bottom: 1px solid #AAAAAA;\"></div>\n{{{for template|Meeting minutes}}}<!--\n\n\nMain Form Definition\n\n-->\n<div class=\"meeting-minutes-save-often\">\n<h3>Remember...</h3>\n\'\'\'[[Help:Save Often|Save often]]\'\'\' or \'\'\'[[Help:Text Editor|use a text editor]]\'\'\'. Revisions are free. Also, if there is \'\'anything\'\' you don\'t know how to do, see the \'\'\'[[Help:Meeting Minutes|help page]]\'\'\' for more info.\n</div>\n\n<h2>Meeting Details</h2>\n<div class=\"meeting-minutes-edit-section multipleTemplateInstance\">\n{| class=\"formtable meeting-minutes-formtable\"\n! Meeting name\n| {{{field|Meeting type|input type=combobox|values from category=Meeting|mandatory}}}\n|-\n! Meeting date\n| {{{field|Meeting date|mandatory}}}\n|-\n! Start time\n| {{{field|Start time hour|maxlength=2|input type=text|size=2|mandatory}}} : {{{field|Start time minute|maxlength=2|input type=text|size=2|mandatory}}} (24-hour time, please)\n|-\n! Notes taken by\n| {{{field|Notes taken by|input type=text with autocomplete|values from namespace=User|mandatory|class=meeting-minutes-author-field}}}\n|}\n</div>\n\n<h2>Meeting Files</h2>\n{{{field|Meeting files|holds template}}}<!-- \n\n\n\n\n\n\n--><h1 style=\"margin-top:30px;\">Meeting Topics</h1>\n\n{{{field|Topics|holds template}}}\n\n{{{end template}}}<!--\n\n\n\n\n\n\n\n\n\n\n\n\n\n    Topics\n\n-->{{{for template|Topic from meeting|multiple|embed in field=Meeting minutes[Topics]|add button text=Add Topic}}}<div class=\"instance-wrapper\">\n{{{field|Has topic title|class=full-width no-links-allowed title-input-field|placeholder=Topic Title}}}\n\n{{{field|Related article|list|class=full-width no-links-allowed|input type=text with autocomplete|values from namespace=Main|placeholder=Related articles}}}\n\n{{{field|Full text|input type=textarea|autogrow|class=full-width shrink-on-blur emphasize meeting-topic-full-text|cols=75}}}\n</div>{{{end template}}}<!--\n\n\n\n    Meeting Files (uploads and external files)\n\n-->{{{for template|Meeting Minutes/Files|multiple|embed in field=Meeting minutes[Meeting files]|add button text=Add File}}}\n<div class=\"mti-help-box mti-hide-on-blur\">\nLocal files must be uploaded first. See [[Help:Meeting Minutes|the help page]] for more info.\n</div>\n{| class=\"formtable meeting-minutes-formtable\"\n! Local File Name or URL\n| {{{field|File or URL|class=full-width no-links-allowed|placeholder=Enter filename starting with File: or URL starting with http}}}\n|-\n! Alternate name\n| {{{field|Alternate name|class=full-width no-links-allowed}}}\n|}\n{{{end template}}}<!--\n\n-->\n== Free text ==\n{{Collapsible\n  | Content =\n* \'\'\'Use this field \'\'very\'\' sparingly\'\'\'\n* Nothing in this field will be distributed to related pages\n* Info in this field will be added to the end of the meeting minutes page\n{{{standard input|free text|rows=10}}}\n  | Collapse text = Hide Free Text\n  | Expand text = Show Free Text Entry\n  | Start hidden = true\n}}\n\n== Save Page ==\n{{Collapsible\n  | Content =\n* \'\'\'Summary:\'\'\' Not required, but recommended if making a revision to a page. The summary will be included emails sent to people watching this page.\n* \'\'\'Minor edit checkbox:\'\'\' Not required\n* \'\'\'Watch this page checkbox:\'\'\' Check this box. If you are editing this page, in all likelihood you care about the content. Watch the page to have greater visibility into future changes. You can make it so the box is automatically checked by editing your preferences (top right of the screen). For more info see [[Help:Watching Pages]].\n* \'\'\'Save page:\'\'\' Click this when you\'re done to save the page.\n* \'\'\'Show preview:\'\'\' Click this to see what your wiki-markup will look like when formatted. Very handy for learning how to use the wiki.\n* \'\'\'Show changes:\'\'\' Shows all changes you\'ve made, compared to the previous revision (doesn\'t do much when creating a brand new page).\n* \'\'\'Cancel:\'\'\' Don\'t click this unless you want to lose what you\'ve been working on.\n  | Collapse text = Hide Help\n  | Expand text = Show Help\n  | Start hidden = true\n}}\n\n{{{standard input|summary}}}\n\n{{{standard input|minor edit}}} {{{standard input|watch}}}\n\n{{{standard input|save}}} {{{standard input|preview}}} {{{standard input|changes}}} {{{standard input|cancel}}}\n</includeonly><!--\n\n\n\n  Below is content only shown on the Form:Meeting Minutes page\n\n--><noinclude>\nThis is the \"Meeting Minutes\" form. Click edit to make changes to the structure of the form itself. Or [[Special:FormEdit/Meeting_Minutes|create new meeting minutes]].<!--{{#forminput:form=Meeting Minutes}}--></noinclude>','utf-8'),(13,'This category uses the form [[Has default form::Meeting]].','utf-8'),(14,'This category uses the form [[Has default form::Meeting Minutes]].','utf-8'),(15,'This is a property of type [[Has type::String]].','utf-8'),(16,'This is a property of type [[Has type::String]].','utf-8'),(17,'This is a property of type [[Has type::Page]].','utf-8'),(18,'This is a property of type [[Has type::String]].\n\nThe allowed values for this property are:\n* [[Allows value::Monday]]\n* [[Allows value::Tuesday]]\n* [[Allows value::Wednesday]]\n* [[Allows value::Thursday]]\n* [[Allows value::Friday]]\n* [[Allows value::Saturday]]\n* [[Allows value::Sunday]]','utf-8'),(19,'This is a property of type [[Has type::String]].','utf-8'),(20,'This is a property of type [[Has type::Date]].','utf-8'),(21,'This is a property of type [[Has type::Page]]. It links to pages that use the form [[Has default form::Meeting]].','utf-8'),(22,'This is a property of type [[Has type::Page]]. It links to pages that use the form [[Has default form::Person]].','utf-8'),(23,'This is a property of type [[Has type::String]].','utf-8'),(24,'This is a property of type [[Has type::Page]]. It is used by calls to the [http://www.mediawiki.org/wiki/Extension:Semantic_Internal_Objects Semantic Internal Objects] parser function #set_internal to point back to the page on which the #set_internal call was made. There may be a built-in method to do this, but it is not as clear as explicitly calling out a \"From page\" property.','utf-8'),(25,'This property is of type [[Has type::Date]]. It is used by the [http://www.mediawiki.org/wiki/Extension:Semantic_Internal_Objects Semantic Internal Object] defined by [[Template:Subject significant to subject]]. It is also used by [[Template:Crew involved with subject]] and [[Template:Person involved with subject]].','utf-8'),(26,'This is a property of type [[Has type::String]].','utf-8'),(27,'This property has type [[Has type::Number]] and is intended to be used to state the intended order of a Multiple Instance Template.','utf-8'),(28,'This is a property of type [[Has type::Page]].','utf-8'),(29,'This is a property of type [[Has type::Text]].','utf-8'),(30,'This is a property of type [[Has type::Page]].','utf-8'),(31,'This is a property of type [[Has type::Page]].','utf-8'),(32,'This is a property of type [[Has type::Text]].','utf-8'),(33,'This is a property of type [[Has type::Text]].','utf-8'),(34,'{{#ask: [[Has topic title::+]][[Related article::{{PAGENAME}}]]\n|mainlabel=-\n|? From page\n|? Has date\n|? Has topic title\n|? Synopsis\n|? Related article\n|link = none\n|format = template\n|template = Meeting references row\n|intro = <h1>Meeting References</h1>\n|offset = 0\n|limit = 10\n|sort = Has date\n|order = desc\n|searchlabel = <br /><br /><br />Click to browse earlier meeting references\n}}','utf-8'),(35,'This is the main page for a demonstration wiki for the purposes of testing. This wiki has the following pages:\n* [[Main Page]] (this page)\n* [[Test Page]]','utf-8'),(36,'First edit','utf-8'),(37,'This image is for test purposes.','utf-8'),(38,'[[File:Test image.png|thumb|216x216px|A caption for the image]]\nThis is another test page on this test wiki. It has an image on it. Also a table.\n{| class=\"wikitable\"\n!Header 1\n!Header 2\n!Header 3\n!Header 4\n|-\n|Row 1\n|Row 1\n|Row 1\n|Row 1\n|-\n|Col 1\n|Col 2\n|Col 3\n|Col 4\n|-\n|Row 3\n|Row 3\n|Row 3\n|Row 4\n|}','utf-8');
/*!40000 ALTER TABLE `text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transcache`
--

DROP TABLE IF EXISTS `transcache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transcache` (
  `tc_url` varbinary(255) NOT NULL,
  `tc_contents` text,
  `tc_time` binary(14) DEFAULT NULL,
  UNIQUE KEY `tc_url_idx` (`tc_url`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transcache`
--

LOCK TABLES `transcache` WRITE;
/*!40000 ALTER TABLE `transcache` DISABLE KEYS */;
/*!40000 ALTER TABLE `transcache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updatelog`
--

DROP TABLE IF EXISTS `updatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `updatelog` (
  `ul_key` varchar(255) NOT NULL,
  `ul_value` blob,
  PRIMARY KEY (`ul_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updatelog`
--

LOCK TABLES `updatelog` WRITE;
/*!40000 ALTER TABLE `updatelog` DISABLE KEYS */;
INSERT INTO `updatelog` VALUES ('cl_fields_update',NULL),('convert transcache field',NULL),('DeleteDefaultMessages',NULL),('echo_event-event_agent_ip-/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_agent_ip-size.sql',NULL),('echo_event-event_extra-/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_extra-size.sql',NULL),('echo_event-event_variant-/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_variant_nullability.sql',NULL),('filearchive-fa_major_mime-patch-fa_major_mime-chemical.sql',NULL),('fix protocol-relative URLs in externallinks',NULL),('FixDefaultJsonContentPages',NULL),('image-img_major_mime-patch-img_major_mime-chemical.sql',NULL),('mime_minor_length',NULL),('oldimage-oi_major_mime-patch-oi_major_mime-chemical.sql',NULL),('populate *_from_namespace',NULL),('populate category',NULL),('populate fa_sha1',NULL),('populate img_sha1',NULL),('populate log_search',NULL),('populate log_usertext',NULL),('populate rev_len and ar_len',NULL),('populate rev_parent_id',NULL),('populate rev_sha1',NULL),('recentchanges-rc_comment-patch-editsummary-length.sql',NULL),('updatelist-1.27.1-14889497710','a:219:{i:0;a:1:{i:0;s:26:\"disableContentHandlerUseDB\";}i:1;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:6:\"ipb_id\";i:3;s:18:\"patch-ipblocks.sql\";}i:2;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:10:\"ipb_expiry\";i:3;s:20:\"patch-ipb_expiry.sql\";}i:3;a:1:{i:0;s:17:\"doInterwikiUpdate\";}i:4;a:1:{i:0;s:13:\"doIndexUpdate\";}i:5;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:7:\"rc_type\";i:3;s:17:\"patch-rc_type.sql\";}i:6;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:18:\"new_name_timestamp\";i:3;s:21:\"patch-rc-newindex.sql\";}i:7;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_real_name\";i:3;s:23:\"patch-user-realname.sql\";}i:8;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"querycache\";i:2;s:20:\"patch-querycache.sql\";}i:9;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"objectcache\";i:2;s:21:\"patch-objectcache.sql\";}i:10;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"categorylinks\";i:2;s:23:\"patch-categorylinks.sql\";}i:11;a:1:{i:0;s:16:\"doOldLinksUpdate\";}i:12;a:1:{i:0;s:22:\"doFixAncientImagelinks\";}i:13;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_ip\";i:3;s:15:\"patch-rc_ip.sql\";}i:14;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:7:\"PRIMARY\";i:3;s:28:\"patch-image_name_primary.sql\";}i:15;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_id\";i:3;s:15:\"patch-rc_id.sql\";}i:16;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_patrolled\";i:3;s:19:\"patch-rc-patrol.sql\";}i:17;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"logging\";i:2;s:17:\"patch-logging.sql\";}i:18;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:10:\"user_token\";i:3;s:20:\"patch-user_token.sql\";}i:19;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:24:\"wl_notificationtimestamp\";i:3;s:28:\"patch-email-notification.sql\";}i:20;a:1:{i:0;s:17:\"doWatchlistUpdate\";}i:21;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:33:\"user_emailauthenticationtimestamp\";i:3;s:30:\"patch-email-authentication.sql\";}i:22;a:1:{i:0;s:21:\"doSchemaRestructuring\";}i:23;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:10:\"log_params\";i:3;s:20:\"patch-log_params.sql\";}i:24;a:4:{i:0;s:8:\"checkBin\";i:1;s:7:\"logging\";i:2;s:9:\"log_title\";i:3;s:23:\"patch-logging-title.sql\";}i:25;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:9:\"ar_rev_id\";i:3;s:24:\"patch-archive-rev_id.sql\";}i:26;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:8:\"page_len\";i:3;s:18:\"patch-page_len.sql\";}i:27;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"revision\";i:2;s:17:\"inverse_timestamp\";i:3;s:27:\"patch-inverse_timestamp.sql\";}i:28;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_text_id\";i:3;s:21:\"patch-rev_text_id.sql\";}i:29;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_deleted\";i:3;s:21:\"patch-rev_deleted.sql\";}i:30;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:9:\"img_width\";i:3;s:19:\"patch-img_width.sql\";}i:31;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:12:\"img_metadata\";i:3;s:22:\"patch-img_metadata.sql\";}i:32;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:16:\"user_email_token\";i:3;s:26:\"patch-user_email_token.sql\";}i:33;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_text_id\";i:3;s:25:\"patch-archive-text_id.sql\";}i:34;a:1:{i:0;s:15:\"doNamespaceSize\";}i:35;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:14:\"img_media_type\";i:3;s:24:\"patch-img_media_type.sql\";}i:36;a:1:{i:0;s:17:\"doPagelinksUpdate\";}i:37;a:4:{i:0;s:9:\"dropField\";i:1;s:5:\"image\";i:2;s:8:\"img_type\";i:3;s:23:\"patch-drop_img_type.sql\";}i:38;a:1:{i:0;s:18:\"doUserUniqueUpdate\";}i:39;a:1:{i:0;s:18:\"doUserGroupsUpdate\";}i:40;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_pages\";i:3;s:27:\"patch-ss_total_articles.sql\";}i:41;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"user_newtalk\";i:2;s:22:\"patch-usernewtalk2.sql\";}i:42;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"transcache\";i:2;s:20:\"patch-transcache.sql\";}i:43;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:8:\"iw_trans\";i:3;s:25:\"patch-interwiki-trans.sql\";}i:44;a:1:{i:0;s:15:\"doWatchlistNull\";}i:45;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:5:\"times\";i:3;s:29:\"patch-logging-times-index.sql\";}i:46;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_range_start\";i:3;s:25:\"patch-ipb_range_start.sql\";}i:47;a:1:{i:0;s:18:\"doPageRandomUpdate\";}i:48;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_registration\";i:3;s:27:\"patch-user_registration.sql\";}i:49;a:1:{i:0;s:21:\"doTemplatelinksUpdate\";}i:50;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"externallinks\";i:2;s:23:\"patch-externallinks.sql\";}i:51;a:3:{i:0;s:8:\"addTable\";i:1;s:3:\"job\";i:2;s:13:\"patch-job.sql\";}i:52;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_images\";i:3;s:19:\"patch-ss_images.sql\";}i:53;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"langlinks\";i:2;s:19:\"patch-langlinks.sql\";}i:54;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"querycache_info\";i:2;s:24:\"patch-querycacheinfo.sql\";}i:55;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"filearchive\";i:2;s:21:\"patch-filearchive.sql\";}i:56;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:13:\"ipb_anon_only\";i:3;s:23:\"patch-ipb_anon_only.sql\";}i:57;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:14:\"rc_ns_usertext\";i:3;s:31:\"patch-recentchanges-utindex.sql\";}i:58;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_user_text\";i:3;s:28:\"patch-rc_user_text-index.sql\";}i:59;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_newpass_time\";i:3;s:27:\"patch-user_newpass_time.sql\";}i:60;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"redirect\";i:2;s:18:\"patch-redirect.sql\";}i:61;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"querycachetwo\";i:2;s:23:\"patch-querycachetwo.sql\";}i:62;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:20:\"ipb_enable_autoblock\";i:3;s:32:\"patch-ipb_optional_autoblock.sql\";}i:63;a:1:{i:0;s:26:\"doBacklinkingIndicesUpdate\";}i:64;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_old_len\";i:3;s:16:\"patch-rc_len.sql\";}i:65;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_editcount\";i:3;s:24:\"patch-user_editcount.sql\";}i:66;a:1:{i:0;s:20:\"doRestrictionsUpdate\";}i:67;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:6:\"log_id\";i:3;s:16:\"patch-log_id.sql\";}i:68;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:13:\"rev_parent_id\";i:3;s:23:\"patch-rev_parent_id.sql\";}i:69;a:4:{i:0;s:8:\"addField\";i:1;s:17:\"page_restrictions\";i:2;s:5:\"pr_id\";i:3;s:35:\"patch-page_restrictions_sortkey.sql\";}i:70;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:7:\"rev_len\";i:3;s:17:\"patch-rev_len.sql\";}i:71;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_deleted\";i:3;s:20:\"patch-rc_deleted.sql\";}i:72;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:11:\"log_deleted\";i:3;s:21:\"patch-log_deleted.sql\";}i:73;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_deleted\";i:3;s:20:\"patch-ar_deleted.sql\";}i:74;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_deleted\";i:3;s:21:\"patch-ipb_deleted.sql\";}i:75;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:10:\"fa_deleted\";i:3;s:20:\"patch-fa_deleted.sql\";}i:76;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:6:\"ar_len\";i:3;s:16:\"patch-ar_len.sql\";}i:77;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_block_email\";i:3;s:22:\"patch-ipb_emailban.sql\";}i:78;a:1:{i:0;s:28:\"doCategorylinksIndicesUpdate\";}i:79;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"oldimage\";i:2;s:11:\"oi_metadata\";i:3;s:21:\"patch-oi_metadata.sql\";}i:80;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:18:\"usertext_timestamp\";i:3;s:28:\"patch-archive-user-index.sql\";}i:81;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:22:\"img_usertext_timestamp\";i:3;s:26:\"patch-image-user-index.sql\";}i:82;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"oldimage\";i:2;s:21:\"oi_usertext_timestamp\";i:3;s:29:\"patch-oldimage-user-index.sql\";}i:83;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_page_id\";i:3;s:25:\"patch-archive-page_id.sql\";}i:84;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:8:\"img_sha1\";i:3;s:18:\"patch-img_sha1.sql\";}i:85;a:3:{i:0;s:8:\"addTable\";i:1;s:16:\"protected_titles\";i:2;s:26:\"patch-protected_titles.sql\";}i:86;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_by_text\";i:3;s:21:\"patch-ipb_by_text.sql\";}i:87;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"page_props\";i:2;s:20:\"patch-page_props.sql\";}i:88;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"updatelog\";i:2;s:19:\"patch-updatelog.sql\";}i:89;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"category\";i:2;s:18:\"patch-category.sql\";}i:90;a:1:{i:0;s:20:\"doCategoryPopulation\";}i:91;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:12:\"ar_parent_id\";i:3;s:22:\"patch-ar_parent_id.sql\";}i:92;a:4:{i:0;s:8:\"addField\";i:1;s:12:\"user_newtalk\";i:2;s:19:\"user_last_timestamp\";i:3;s:29:\"patch-user_last_timestamp.sql\";}i:93;a:1:{i:0;s:18:\"doPopulateParentId\";}i:94;a:4:{i:0;s:8:\"checkBin\";i:1;s:16:\"protected_titles\";i:2;s:8:\"pt_title\";i:3;s:27:\"patch-pt_title-encoding.sql\";}i:95;a:1:{i:0;s:28:\"doMaybeProfilingMemoryUpdate\";}i:96;a:1:{i:0;s:26:\"doFilearchiveIndicesUpdate\";}i:97;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:15:\"ss_active_users\";i:3;s:25:\"patch-ss_active_users.sql\";}i:98;a:1:{i:0;s:17:\"doActiveUsersInit\";}i:99;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:18:\"ipb_allow_usertalk\";i:3;s:28:\"patch-ipb_allow_usertalk.sql\";}i:100;a:1:{i:0;s:14:\"doUniquePlTlIl\";}i:101;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"change_tag\";i:2;s:20:\"patch-change_tag.sql\";}i:102;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"tag_summary\";i:2;s:21:\"patch-tag_summary.sql\";}i:103;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"valid_tag\";i:2;s:19:\"patch-valid_tag.sql\";}i:104;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"user_properties\";i:2;s:25:\"patch-user_properties.sql\";}i:105;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"log_search\";i:2;s:20:\"patch-log_search.sql\";}i:106;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:13:\"log_user_text\";i:3;s:23:\"patch-log_user_text.sql\";}i:107;a:1:{i:0;s:23:\"doLogUsertextPopulation\";}i:108;a:1:{i:0;s:21:\"doLogSearchPopulation\";}i:109;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"l10n_cache\";i:2;s:20:\"patch-l10n_cache.sql\";}i:110;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"log_search\";i:2;s:12:\"ls_field_val\";i:3;s:33:\"patch-log_search-rename-index.sql\";}i:111;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"change_tag\";i:2;s:17:\"change_tag_rc_tag\";i:3;s:28:\"patch-change_tag-indexes.sql\";}i:112;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"redirect\";i:2;s:12:\"rd_interwiki\";i:3;s:22:\"patch-rd_interwiki.sql\";}i:113;a:1:{i:0;s:23:\"doUpdateTranscacheField\";}i:114;a:1:{i:0;s:22:\"doUpdateMimeMinorField\";}i:115;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"iwlinks\";i:2;s:17:\"patch-iwlinks.sql\";}i:116;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_title_from\";i:3;s:27:\"patch-rename-iwl_prefix.sql\";}i:117;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"updatelog\";i:2;s:8:\"ul_value\";i:3;s:18:\"patch-ul_value.sql\";}i:118;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:6:\"iw_api\";i:3;s:27:\"patch-iw_api_and_wikiid.sql\";}i:119;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"iwlinks\";i:2;s:10:\"iwl_prefix\";i:3;s:25:\"patch-kill-iwl_prefix.sql\";}i:120;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:40:\"patch-categorylinks-better-collation.sql\";}i:121;a:1:{i:0;s:16:\"doClFieldsUpdate\";}i:122;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"module_deps\";i:2;s:21:\"patch-module_deps.sql\";}i:123;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"archive\";i:2;s:13:\"ar_page_revid\";i:3;s:36:\"patch-archive_kill_ar_page_revid.sql\";}i:124;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:8:\"ar_revid\";i:3;s:26:\"patch-archive_ar_revid.sql\";}i:125;a:1:{i:0;s:23:\"doLangLinksLengthUpdate\";}i:126;a:1:{i:0;s:29:\"doUserNewTalkTimestampNotNull\";}i:127;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"user\";i:2;s:10:\"user_email\";i:3;s:26:\"patch-user_email_index.sql\";}i:128;a:4:{i:0;s:11:\"modifyField\";i:1;s:15:\"user_properties\";i:2;s:11:\"up_property\";i:3;s:21:\"patch-up_property.sql\";}i:129;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"uploadstash\";i:2;s:21:\"patch-uploadstash.sql\";}i:130;a:3:{i:0;s:8:\"addTable\";i:1;s:18:\"user_former_groups\";i:2;s:28:\"patch-user_former_groups.sql\";}i:131;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:11:\"type_action\";i:3;s:35:\"patch-logging-type-action-index.sql\";}i:132;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:8:\"rev_sha1\";i:3;s:18:\"patch-rev_sha1.sql\";}i:133;a:1:{i:0;s:20:\"doMigrateUserOptions\";}i:134;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:12:\"user_options\";i:3;s:27:\"patch-drop-user_options.sql\";}i:135;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:7:\"ar_sha1\";i:3;s:17:\"patch-ar_sha1.sql\";}i:136;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"page\";i:2;s:27:\"page_redirect_namespace_len\";i:3;s:37:\"patch-page_redirect_namespace_len.sql\";}i:137;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:12:\"us_chunk_inx\";i:3;s:27:\"patch-uploadstash_chunk.sql\";}i:138;a:4:{i:0;s:8:\"addfield\";i:1;s:3:\"job\";i:2;s:13:\"job_timestamp\";i:3;s:28:\"patch-jobs-add-timestamp.sql\";}i:139;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"revision\";i:2;s:19:\"page_user_timestamp\";i:3;s:34:\"patch-revision-user-page-index.sql\";}i:140;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:29:\"patch-ipb-parent-block-id.sql\";}i:141;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:35:\"patch-ipb-parent-block-id-index.sql\";}i:142;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"category\";i:2;s:10:\"cat_hidden\";i:3;s:20:\"patch-cat_hidden.sql\";}i:143;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:18:\"rev_content_format\";i:3;s:37:\"patch-revision-rev_content_format.sql\";}i:144;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:17:\"rev_content_model\";i:3;s:36:\"patch-revision-rev_content_model.sql\";}i:145;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:17:\"ar_content_format\";i:3;s:35:\"patch-archive-ar_content_format.sql\";}i:146;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:16:\"ar_content_model\";i:3;s:34:\"patch-archive-ar_content_model.sql\";}i:147;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_content_model\";i:3;s:33:\"patch-page-page_content_model.sql\";}i:148;a:1:{i:0;s:25:\"enableContentHandlerUseDB\";}i:149;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_admins\";i:3;s:24:\"patch-drop-ss_admins.sql\";}i:150;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:17:\"rc_moved_to_title\";i:3;s:18:\"patch-rc_moved.sql\";}i:151;a:3:{i:0;s:8:\"addTable\";i:1;s:5:\"sites\";i:2;s:15:\"patch-sites.sql\";}i:152;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:7:\"fa_sha1\";i:3;s:17:\"patch-fa_sha1.sql\";}i:153;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:9:\"job_token\";i:3;s:19:\"patch-job_token.sql\";}i:154;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:12:\"job_attempts\";i:3;s:22:\"patch-job_attempts.sql\";}i:155;a:1:{i:0;s:17:\"doEnableProfiling\";}i:156;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:8:\"us_props\";i:3;s:30:\"patch-uploadstash-us_props.sql\";}i:157;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"user_groups\";i:2;s:8:\"ug_group\";i:3;s:38:\"patch-ug_group-length-increase-255.sql\";}i:158;a:4:{i:0;s:11:\"modifyField\";i:1;s:18:\"user_former_groups\";i:2;s:9:\"ufg_group\";i:3;s:39:\"patch-ufg_group-length-increase-255.sql\";}i:159;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"page_props\";i:2;s:16:\"pp_propname_page\";i:3;s:40:\"patch-page_props-propname-page-index.sql\";}i:160;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:14:\"img_media_mime\";i:3;s:30:\"patch-img_media_mime-index.sql\";}i:161;a:1:{i:0;s:23:\"doIwlinksIndexNonUnique\";}i:162;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_from_title\";i:3;s:34:\"patch-iwlinks-from-title-index.sql\";}i:163;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:5:\"ar_id\";i:3;s:23:\"patch-archive-ar_id.sql\";}i:164;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"externallinks\";i:2;s:5:\"el_id\";i:3;s:29:\"patch-externallinks-el_id.sql\";}i:165;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:9:\"rc_source\";i:3;s:19:\"patch-rc_source.sql\";}i:166;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:23:\"log_user_text_type_time\";i:3;s:43:\"patch-logging_user_text_type_time_index.sql\";}i:167;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:18:\"log_user_text_time\";i:3;s:38:\"patch-logging_user_text_time_index.sql\";}i:168;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_links_updated\";i:3;s:28:\"patch-page_links_updated.sql\";}i:169;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:21:\"user_password_expires\";i:3;s:30:\"patch-user_password_expire.sql\";}i:170;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"page_props\";i:2;s:10:\"pp_sortkey\";i:3;s:20:\"patch-pp_sortkey.sql\";}i:171;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:11:\"rc_cur_time\";i:3;s:26:\"patch-drop-rc_cur_time.sql\";}i:172;a:4:{i:0;s:8:\"addIndex\";i:1;s:9:\"watchlist\";i:2;s:29:\"wl_user_notificationtimestamp\";i:3;s:52:\"patch-watchlist-user-notificationtimestamp-index.sql\";}i:173;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:9:\"page_lang\";i:3;s:19:\"patch-page_lang.sql\";}i:174;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"pagelinks\";i:2;s:17:\"pl_from_namespace\";i:3;s:27:\"patch-pl_from_namespace.sql\";}i:175;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"templatelinks\";i:2;s:17:\"tl_from_namespace\";i:3;s:27:\"patch-tl_from_namespace.sql\";}i:176;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"imagelinks\";i:2;s:17:\"il_from_namespace\";i:3;s:27:\"patch-il_from_namespace.sql\";}i:177;a:4:{i:0;s:11:\"modifyField\";i:1;s:5:\"image\";i:2;s:14:\"img_major_mime\";i:3;s:33:\"patch-img_major_mime-chemical.sql\";}i:178;a:4:{i:0;s:11:\"modifyField\";i:1;s:8:\"oldimage\";i:2;s:13:\"oi_major_mime\";i:3;s:32:\"patch-oi_major_mime-chemical.sql\";}i:179;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"filearchive\";i:2;s:13:\"fa_major_mime\";i:3;s:32:\"patch-fa_major_mime-chemical.sql\";}i:180;a:1:{i:0;s:27:\"doUserNewTalkUseridUnsigned\";}i:181;a:4:{i:0;s:11:\"modifyField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_comment\";i:3;s:28:\"patch-editsummary-length.sql\";}i:182;a:2:{i:0;s:9:\"dropTable\";i:1;s:10:\"hitcounter\";}i:183;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_views\";i:3;s:29:\"patch-drop-ss_total_views.sql\";}i:184;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"page\";i:2;s:12:\"page_counter\";i:3;s:27:\"patch-drop-page_counter.sql\";}i:185;a:2:{i:0;s:9:\"dropTable\";i:1;s:18:\"msg_resource_links\";}i:186;a:2:{i:0;s:9:\"dropTable\";i:1;s:12:\"msg_resource\";}i:187;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"bot_passwords\";i:2;s:23:\"patch-bot_passwords.sql\";}i:188;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:5:\"wl_id\";i:3;s:25:\"patch-watchlist-wl_id.sql\";}i:189;a:4:{i:0;s:9:\"dropIndex\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:33:\"patch-kill-cl_collation_index.sql\";}i:190;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"categorylinks\";i:2;s:16:\"cl_collation_ext\";i:3;s:36:\"patch-add-cl_collation_ext_index.sql\";}i:191;a:1:{i:0;s:17:\"doCollationUpdate\";}i:192;a:4:{i:0;s:8:\"addTable\";i:1;s:13:\"approved_revs\";i:2;s:80:\"/opt/meza/htdocs/mediawiki/extensions/ApprovedRevs//maintenance/ApprovedRevs.sql\";i:3;b:1;}i:193;a:4:{i:0;s:8:\"addTable\";i:1;s:19:\"approved_revs_files\";i:2;s:86:\"/opt/meza/htdocs/mediawiki/extensions/ApprovedRevs//maintenance/ApprovedRevs_Files.sql\";i:3;b:1;}i:194;a:4:{i:0;s:8:\"addTable\";i:1;s:10:\"echo_event\";i:2;s:51:\"/opt/meza/htdocs/mediawiki/extensions/Echo/echo.sql\";i:3;b:1;}i:195;a:4:{i:0;s:8:\"addTable\";i:1;s:16:\"echo_email_batch\";i:2;s:74:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/echo_email_batch.sql\";i:3;b:1;}i:196;a:4:{i:0;s:8:\"addTable\";i:1;s:16:\"echo_target_page\";i:2;s:74:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/echo_target_page.sql\";i:3;b:1;}i:197;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:11:\"event_agent\";i:3;s:81:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_agent-split.sql\";i:4;b:1;}i:198;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:13:\"event_variant\";i:3;s:89:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_variant_nullability.sql\";i:4;b:1;}i:199;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:11:\"event_extra\";i:3;s:80:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_extra-size.sql\";i:4;b:1;}i:200;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:14:\"event_agent_ip\";i:3;s:83:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_agent_ip-size.sql\";i:4;b:1;}i:201;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"echo_target_page\";i:2;s:6:\"etp_id\";i:3;s:85:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-multiple_target_pages.sql\";i:4;b:1;}i:202;a:5:{i:0;s:8:\"addField\";i:1;s:17:\"echo_notification\";i:2;s:24:\"notification_bundle_base\";i:3;s:91:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-notification-bundling-field.sql\";i:4;b:1;}i:203;a:5:{i:0;s:9:\"dropField\";i:1;s:10:\"echo_event\";i:2;s:15:\"event_timestamp\";i:3;s:95:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-drop-echo_event-event_timestamp.sql\";i:4;b:1;}i:204;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"echo_email_batch\";i:2;s:14:\"eeb_event_hash\";i:3;s:85:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-email_batch-new-field.sql\";i:4;b:1;}i:205;a:5:{i:0;s:8:\"addField\";i:1;s:10:\"echo_event\";i:2;s:13:\"event_page_id\";i:3;s:92:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-add-echo_event-event_page_id.sql\";i:4;b:1;}i:206;a:5:{i:0;s:8:\"addIndex\";i:1;s:10:\"echo_event\";i:2;s:15:\"echo_event_type\";i:3;s:86:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-alter-event_type-index.sql\";i:4;b:1;}i:207;a:5:{i:0;s:8:\"addIndex\";i:1;s:17:\"echo_notification\";i:2;s:19:\"echo_user_timestamp\";i:3;s:90:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-alter-user_timestamp-index.sql\";i:4;b:1;}i:208;a:4:{i:0;s:8:\"addTable\";i:1;s:12:\"uw_campaigns\";i:2;s:67:\"/opt/meza/htdocs/mediawiki/extensions/UploadWizard/UploadWizard.sql\";i:3;b:1;}i:209;a:5:{i:0;s:8:\"addIndex\";i:1;s:12:\"uw_campaigns\";i:2;s:17:\"uw_campaigns_name\";i:3;s:80:\"/opt/meza/htdocs/mediawiki/extensions/UploadWizard/sql/UW_IndexCampaignsName.sql\";i:4;b:1;}i:210;a:5:{i:0;s:8:\"addIndex\";i:1;s:12:\"uw_campaigns\";i:2;s:20:\"uw_campaigns_enabled\";i:3;s:83:\"/opt/meza/htdocs/mediawiki/extensions/UploadWizard/sql/UW_IndexCampaignsEnabled.sql\";i:4;b:1;}i:211;a:4:{i:0;s:8:\"addTable\";i:1;s:4:\"math\";i:2;s:60:\"/opt/meza/htdocs/mediawiki/extensions/Math/db/math.mysql.sql\";i:3;b:1;}i:212;a:4:{i:0;s:8:\"addTable\";i:1;s:7:\"mathoid\";i:2;s:63:\"/opt/meza/htdocs/mediawiki/extensions/Math/db/mathoid.mysql.sql\";i:3;b:1;}i:213;a:4:{i:0;s:8:\"addTable\";i:1;s:7:\"wiretap\";i:2;s:64:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/Wiretap.sql\";i:3;b:1;}i:214;a:5:{i:0;s:8:\"addField\";i:1;s:7:\"wiretap\";i:2;s:13:\"response_time\";i:3;s:78:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/patch-1-response-time.sql\";i:4;b:1;}i:215;a:4:{i:0;s:8:\"addTable\";i:1;s:22:\"wiretap_counter_period\";i:2;s:77:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/patch-2-page-counter.sql\";i:3;b:1;}i:216;a:4:{i:0;s:8:\"addTable\";i:1;s:14:\"wiretap_legacy\";i:2;s:79:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/patch-3-legacy-counter.sql\";i:3;b:1;}i:217;a:4:{i:0;s:8:\"addTable\";i:1;s:19:\"watch_tracking_user\";i:2;s:78:\"/opt/meza/htdocs/mediawiki/extensions/WatchAnalytics/schema/WatchAnalytics.sql\";i:3;b:1;}i:218;a:1:{i:0;s:20:\"SMWStore::setupStore\";}}'),('updatelist-1.27.1-14889497960','a:219:{i:0;a:1:{i:0;s:26:\"disableContentHandlerUseDB\";}i:1;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:6:\"ipb_id\";i:3;s:18:\"patch-ipblocks.sql\";}i:2;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:10:\"ipb_expiry\";i:3;s:20:\"patch-ipb_expiry.sql\";}i:3;a:1:{i:0;s:17:\"doInterwikiUpdate\";}i:4;a:1:{i:0;s:13:\"doIndexUpdate\";}i:5;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:7:\"rc_type\";i:3;s:17:\"patch-rc_type.sql\";}i:6;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:18:\"new_name_timestamp\";i:3;s:21:\"patch-rc-newindex.sql\";}i:7;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_real_name\";i:3;s:23:\"patch-user-realname.sql\";}i:8;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"querycache\";i:2;s:20:\"patch-querycache.sql\";}i:9;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"objectcache\";i:2;s:21:\"patch-objectcache.sql\";}i:10;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"categorylinks\";i:2;s:23:\"patch-categorylinks.sql\";}i:11;a:1:{i:0;s:16:\"doOldLinksUpdate\";}i:12;a:1:{i:0;s:22:\"doFixAncientImagelinks\";}i:13;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_ip\";i:3;s:15:\"patch-rc_ip.sql\";}i:14;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:7:\"PRIMARY\";i:3;s:28:\"patch-image_name_primary.sql\";}i:15;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:5:\"rc_id\";i:3;s:15:\"patch-rc_id.sql\";}i:16;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_patrolled\";i:3;s:19:\"patch-rc-patrol.sql\";}i:17;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"logging\";i:2;s:17:\"patch-logging.sql\";}i:18;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:10:\"user_token\";i:3;s:20:\"patch-user_token.sql\";}i:19;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:24:\"wl_notificationtimestamp\";i:3;s:28:\"patch-email-notification.sql\";}i:20;a:1:{i:0;s:17:\"doWatchlistUpdate\";}i:21;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:33:\"user_emailauthenticationtimestamp\";i:3;s:30:\"patch-email-authentication.sql\";}i:22;a:1:{i:0;s:21:\"doSchemaRestructuring\";}i:23;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:10:\"log_params\";i:3;s:20:\"patch-log_params.sql\";}i:24;a:4:{i:0;s:8:\"checkBin\";i:1;s:7:\"logging\";i:2;s:9:\"log_title\";i:3;s:23:\"patch-logging-title.sql\";}i:25;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:9:\"ar_rev_id\";i:3;s:24:\"patch-archive-rev_id.sql\";}i:26;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:8:\"page_len\";i:3;s:18:\"patch-page_len.sql\";}i:27;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"revision\";i:2;s:17:\"inverse_timestamp\";i:3;s:27:\"patch-inverse_timestamp.sql\";}i:28;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_text_id\";i:3;s:21:\"patch-rev_text_id.sql\";}i:29;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:11:\"rev_deleted\";i:3;s:21:\"patch-rev_deleted.sql\";}i:30;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:9:\"img_width\";i:3;s:19:\"patch-img_width.sql\";}i:31;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:12:\"img_metadata\";i:3;s:22:\"patch-img_metadata.sql\";}i:32;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:16:\"user_email_token\";i:3;s:26:\"patch-user_email_token.sql\";}i:33;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_text_id\";i:3;s:25:\"patch-archive-text_id.sql\";}i:34;a:1:{i:0;s:15:\"doNamespaceSize\";}i:35;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:14:\"img_media_type\";i:3;s:24:\"patch-img_media_type.sql\";}i:36;a:1:{i:0;s:17:\"doPagelinksUpdate\";}i:37;a:4:{i:0;s:9:\"dropField\";i:1;s:5:\"image\";i:2;s:8:\"img_type\";i:3;s:23:\"patch-drop_img_type.sql\";}i:38;a:1:{i:0;s:18:\"doUserUniqueUpdate\";}i:39;a:1:{i:0;s:18:\"doUserGroupsUpdate\";}i:40;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_pages\";i:3;s:27:\"patch-ss_total_articles.sql\";}i:41;a:3:{i:0;s:8:\"addTable\";i:1;s:12:\"user_newtalk\";i:2;s:22:\"patch-usernewtalk2.sql\";}i:42;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"transcache\";i:2;s:20:\"patch-transcache.sql\";}i:43;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:8:\"iw_trans\";i:3;s:25:\"patch-interwiki-trans.sql\";}i:44;a:1:{i:0;s:15:\"doWatchlistNull\";}i:45;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:5:\"times\";i:3;s:29:\"patch-logging-times-index.sql\";}i:46;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_range_start\";i:3;s:25:\"patch-ipb_range_start.sql\";}i:47;a:1:{i:0;s:18:\"doPageRandomUpdate\";}i:48;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_registration\";i:3;s:27:\"patch-user_registration.sql\";}i:49;a:1:{i:0;s:21:\"doTemplatelinksUpdate\";}i:50;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"externallinks\";i:2;s:23:\"patch-externallinks.sql\";}i:51;a:3:{i:0;s:8:\"addTable\";i:1;s:3:\"job\";i:2;s:13:\"patch-job.sql\";}i:52;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_images\";i:3;s:19:\"patch-ss_images.sql\";}i:53;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"langlinks\";i:2;s:19:\"patch-langlinks.sql\";}i:54;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"querycache_info\";i:2;s:24:\"patch-querycacheinfo.sql\";}i:55;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"filearchive\";i:2;s:21:\"patch-filearchive.sql\";}i:56;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:13:\"ipb_anon_only\";i:3;s:23:\"patch-ipb_anon_only.sql\";}i:57;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:14:\"rc_ns_usertext\";i:3;s:31:\"patch-recentchanges-utindex.sql\";}i:58;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"recentchanges\";i:2;s:12:\"rc_user_text\";i:3;s:28:\"patch-rc_user_text-index.sql\";}i:59;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:17:\"user_newpass_time\";i:3;s:27:\"patch-user_newpass_time.sql\";}i:60;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"redirect\";i:2;s:18:\"patch-redirect.sql\";}i:61;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"querycachetwo\";i:2;s:23:\"patch-querycachetwo.sql\";}i:62;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:20:\"ipb_enable_autoblock\";i:3;s:32:\"patch-ipb_optional_autoblock.sql\";}i:63;a:1:{i:0;s:26:\"doBacklinkingIndicesUpdate\";}i:64;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_old_len\";i:3;s:16:\"patch-rc_len.sql\";}i:65;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:14:\"user_editcount\";i:3;s:24:\"patch-user_editcount.sql\";}i:66;a:1:{i:0;s:20:\"doRestrictionsUpdate\";}i:67;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:6:\"log_id\";i:3;s:16:\"patch-log_id.sql\";}i:68;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:13:\"rev_parent_id\";i:3;s:23:\"patch-rev_parent_id.sql\";}i:69;a:4:{i:0;s:8:\"addField\";i:1;s:17:\"page_restrictions\";i:2;s:5:\"pr_id\";i:3;s:35:\"patch-page_restrictions_sortkey.sql\";}i:70;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:7:\"rev_len\";i:3;s:17:\"patch-rev_len.sql\";}i:71;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_deleted\";i:3;s:20:\"patch-rc_deleted.sql\";}i:72;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:11:\"log_deleted\";i:3;s:21:\"patch-log_deleted.sql\";}i:73;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_deleted\";i:3;s:20:\"patch-ar_deleted.sql\";}i:74;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_deleted\";i:3;s:21:\"patch-ipb_deleted.sql\";}i:75;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:10:\"fa_deleted\";i:3;s:20:\"patch-fa_deleted.sql\";}i:76;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:6:\"ar_len\";i:3;s:16:\"patch-ar_len.sql\";}i:77;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:15:\"ipb_block_email\";i:3;s:22:\"patch-ipb_emailban.sql\";}i:78;a:1:{i:0;s:28:\"doCategorylinksIndicesUpdate\";}i:79;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"oldimage\";i:2;s:11:\"oi_metadata\";i:3;s:21:\"patch-oi_metadata.sql\";}i:80;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:18:\"usertext_timestamp\";i:3;s:28:\"patch-archive-user-index.sql\";}i:81;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:22:\"img_usertext_timestamp\";i:3;s:26:\"patch-image-user-index.sql\";}i:82;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"oldimage\";i:2;s:21:\"oi_usertext_timestamp\";i:3;s:29:\"patch-oldimage-user-index.sql\";}i:83;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:10:\"ar_page_id\";i:3;s:25:\"patch-archive-page_id.sql\";}i:84;a:4:{i:0;s:8:\"addField\";i:1;s:5:\"image\";i:2;s:8:\"img_sha1\";i:3;s:18:\"patch-img_sha1.sql\";}i:85;a:3:{i:0;s:8:\"addTable\";i:1;s:16:\"protected_titles\";i:2;s:26:\"patch-protected_titles.sql\";}i:86;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:11:\"ipb_by_text\";i:3;s:21:\"patch-ipb_by_text.sql\";}i:87;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"page_props\";i:2;s:20:\"patch-page_props.sql\";}i:88;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"updatelog\";i:2;s:19:\"patch-updatelog.sql\";}i:89;a:3:{i:0;s:8:\"addTable\";i:1;s:8:\"category\";i:2;s:18:\"patch-category.sql\";}i:90;a:1:{i:0;s:20:\"doCategoryPopulation\";}i:91;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:12:\"ar_parent_id\";i:3;s:22:\"patch-ar_parent_id.sql\";}i:92;a:4:{i:0;s:8:\"addField\";i:1;s:12:\"user_newtalk\";i:2;s:19:\"user_last_timestamp\";i:3;s:29:\"patch-user_last_timestamp.sql\";}i:93;a:1:{i:0;s:18:\"doPopulateParentId\";}i:94;a:4:{i:0;s:8:\"checkBin\";i:1;s:16:\"protected_titles\";i:2;s:8:\"pt_title\";i:3;s:27:\"patch-pt_title-encoding.sql\";}i:95;a:1:{i:0;s:28:\"doMaybeProfilingMemoryUpdate\";}i:96;a:1:{i:0;s:26:\"doFilearchiveIndicesUpdate\";}i:97;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"site_stats\";i:2;s:15:\"ss_active_users\";i:3;s:25:\"patch-ss_active_users.sql\";}i:98;a:1:{i:0;s:17:\"doActiveUsersInit\";}i:99;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:18:\"ipb_allow_usertalk\";i:3;s:28:\"patch-ipb_allow_usertalk.sql\";}i:100;a:1:{i:0;s:14:\"doUniquePlTlIl\";}i:101;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"change_tag\";i:2;s:20:\"patch-change_tag.sql\";}i:102;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"tag_summary\";i:2;s:21:\"patch-tag_summary.sql\";}i:103;a:3:{i:0;s:8:\"addTable\";i:1;s:9:\"valid_tag\";i:2;s:19:\"patch-valid_tag.sql\";}i:104;a:3:{i:0;s:8:\"addTable\";i:1;s:15:\"user_properties\";i:2;s:25:\"patch-user_properties.sql\";}i:105;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"log_search\";i:2;s:20:\"patch-log_search.sql\";}i:106;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"logging\";i:2;s:13:\"log_user_text\";i:3;s:23:\"patch-log_user_text.sql\";}i:107;a:1:{i:0;s:23:\"doLogUsertextPopulation\";}i:108;a:1:{i:0;s:21:\"doLogSearchPopulation\";}i:109;a:3:{i:0;s:8:\"addTable\";i:1;s:10:\"l10n_cache\";i:2;s:20:\"patch-l10n_cache.sql\";}i:110;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"log_search\";i:2;s:12:\"ls_field_val\";i:3;s:33:\"patch-log_search-rename-index.sql\";}i:111;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"change_tag\";i:2;s:17:\"change_tag_rc_tag\";i:3;s:28:\"patch-change_tag-indexes.sql\";}i:112;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"redirect\";i:2;s:12:\"rd_interwiki\";i:3;s:22:\"patch-rd_interwiki.sql\";}i:113;a:1:{i:0;s:23:\"doUpdateTranscacheField\";}i:114;a:1:{i:0;s:22:\"doUpdateMimeMinorField\";}i:115;a:3:{i:0;s:8:\"addTable\";i:1;s:7:\"iwlinks\";i:2;s:17:\"patch-iwlinks.sql\";}i:116;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_title_from\";i:3;s:27:\"patch-rename-iwl_prefix.sql\";}i:117;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"updatelog\";i:2;s:8:\"ul_value\";i:3;s:18:\"patch-ul_value.sql\";}i:118;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"interwiki\";i:2;s:6:\"iw_api\";i:3;s:27:\"patch-iw_api_and_wikiid.sql\";}i:119;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"iwlinks\";i:2;s:10:\"iwl_prefix\";i:3;s:25:\"patch-kill-iwl_prefix.sql\";}i:120;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:40:\"patch-categorylinks-better-collation.sql\";}i:121;a:1:{i:0;s:16:\"doClFieldsUpdate\";}i:122;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"module_deps\";i:2;s:21:\"patch-module_deps.sql\";}i:123;a:4:{i:0;s:9:\"dropIndex\";i:1;s:7:\"archive\";i:2;s:13:\"ar_page_revid\";i:3;s:36:\"patch-archive_kill_ar_page_revid.sql\";}i:124;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"archive\";i:2;s:8:\"ar_revid\";i:3;s:26:\"patch-archive_ar_revid.sql\";}i:125;a:1:{i:0;s:23:\"doLangLinksLengthUpdate\";}i:126;a:1:{i:0;s:29:\"doUserNewTalkTimestampNotNull\";}i:127;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"user\";i:2;s:10:\"user_email\";i:3;s:26:\"patch-user_email_index.sql\";}i:128;a:4:{i:0;s:11:\"modifyField\";i:1;s:15:\"user_properties\";i:2;s:11:\"up_property\";i:3;s:21:\"patch-up_property.sql\";}i:129;a:3:{i:0;s:8:\"addTable\";i:1;s:11:\"uploadstash\";i:2;s:21:\"patch-uploadstash.sql\";}i:130;a:3:{i:0;s:8:\"addTable\";i:1;s:18:\"user_former_groups\";i:2;s:28:\"patch-user_former_groups.sql\";}i:131;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:11:\"type_action\";i:3;s:35:\"patch-logging-type-action-index.sql\";}i:132;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:8:\"rev_sha1\";i:3;s:18:\"patch-rev_sha1.sql\";}i:133;a:1:{i:0;s:20:\"doMigrateUserOptions\";}i:134;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"user\";i:2;s:12:\"user_options\";i:3;s:27:\"patch-drop-user_options.sql\";}i:135;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:7:\"ar_sha1\";i:3;s:17:\"patch-ar_sha1.sql\";}i:136;a:4:{i:0;s:8:\"addIndex\";i:1;s:4:\"page\";i:2;s:27:\"page_redirect_namespace_len\";i:3;s:37:\"patch-page_redirect_namespace_len.sql\";}i:137;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:12:\"us_chunk_inx\";i:3;s:27:\"patch-uploadstash_chunk.sql\";}i:138;a:4:{i:0;s:8:\"addfield\";i:1;s:3:\"job\";i:2;s:13:\"job_timestamp\";i:3;s:28:\"patch-jobs-add-timestamp.sql\";}i:139;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"revision\";i:2;s:19:\"page_user_timestamp\";i:3;s:34:\"patch-revision-user-page-index.sql\";}i:140;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:29:\"patch-ipb-parent-block-id.sql\";}i:141;a:4:{i:0;s:8:\"addIndex\";i:1;s:8:\"ipblocks\";i:2;s:19:\"ipb_parent_block_id\";i:3;s:35:\"patch-ipb-parent-block-id-index.sql\";}i:142;a:4:{i:0;s:9:\"dropField\";i:1;s:8:\"category\";i:2;s:10:\"cat_hidden\";i:3;s:20:\"patch-cat_hidden.sql\";}i:143;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:18:\"rev_content_format\";i:3;s:37:\"patch-revision-rev_content_format.sql\";}i:144;a:4:{i:0;s:8:\"addField\";i:1;s:8:\"revision\";i:2;s:17:\"rev_content_model\";i:3;s:36:\"patch-revision-rev_content_model.sql\";}i:145;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:17:\"ar_content_format\";i:3;s:35:\"patch-archive-ar_content_format.sql\";}i:146;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:16:\"ar_content_model\";i:3;s:34:\"patch-archive-ar_content_model.sql\";}i:147;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_content_model\";i:3;s:33:\"patch-page-page_content_model.sql\";}i:148;a:1:{i:0;s:25:\"enableContentHandlerUseDB\";}i:149;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:9:\"ss_admins\";i:3;s:24:\"patch-drop-ss_admins.sql\";}i:150;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:17:\"rc_moved_to_title\";i:3;s:18:\"patch-rc_moved.sql\";}i:151;a:3:{i:0;s:8:\"addTable\";i:1;s:5:\"sites\";i:2;s:15:\"patch-sites.sql\";}i:152;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"filearchive\";i:2;s:7:\"fa_sha1\";i:3;s:17:\"patch-fa_sha1.sql\";}i:153;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:9:\"job_token\";i:3;s:19:\"patch-job_token.sql\";}i:154;a:4:{i:0;s:8:\"addField\";i:1;s:3:\"job\";i:2;s:12:\"job_attempts\";i:3;s:22:\"patch-job_attempts.sql\";}i:155;a:1:{i:0;s:17:\"doEnableProfiling\";}i:156;a:4:{i:0;s:8:\"addField\";i:1;s:11:\"uploadstash\";i:2;s:8:\"us_props\";i:3;s:30:\"patch-uploadstash-us_props.sql\";}i:157;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"user_groups\";i:2;s:8:\"ug_group\";i:3;s:38:\"patch-ug_group-length-increase-255.sql\";}i:158;a:4:{i:0;s:11:\"modifyField\";i:1;s:18:\"user_former_groups\";i:2;s:9:\"ufg_group\";i:3;s:39:\"patch-ufg_group-length-increase-255.sql\";}i:159;a:4:{i:0;s:8:\"addIndex\";i:1;s:10:\"page_props\";i:2;s:16:\"pp_propname_page\";i:3;s:40:\"patch-page_props-propname-page-index.sql\";}i:160;a:4:{i:0;s:8:\"addIndex\";i:1;s:5:\"image\";i:2;s:14:\"img_media_mime\";i:3;s:30:\"patch-img_media_mime-index.sql\";}i:161;a:1:{i:0;s:23:\"doIwlinksIndexNonUnique\";}i:162;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"iwlinks\";i:2;s:21:\"iwl_prefix_from_title\";i:3;s:34:\"patch-iwlinks-from-title-index.sql\";}i:163;a:4:{i:0;s:8:\"addField\";i:1;s:7:\"archive\";i:2;s:5:\"ar_id\";i:3;s:23:\"patch-archive-ar_id.sql\";}i:164;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"externallinks\";i:2;s:5:\"el_id\";i:3;s:29:\"patch-externallinks-el_id.sql\";}i:165;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"recentchanges\";i:2;s:9:\"rc_source\";i:3;s:19:\"patch-rc_source.sql\";}i:166;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:23:\"log_user_text_type_time\";i:3;s:43:\"patch-logging_user_text_type_time_index.sql\";}i:167;a:4:{i:0;s:8:\"addIndex\";i:1;s:7:\"logging\";i:2;s:18:\"log_user_text_time\";i:3;s:38:\"patch-logging_user_text_time_index.sql\";}i:168;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:18:\"page_links_updated\";i:3;s:28:\"patch-page_links_updated.sql\";}i:169;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"user\";i:2;s:21:\"user_password_expires\";i:3;s:30:\"patch-user_password_expire.sql\";}i:170;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"page_props\";i:2;s:10:\"pp_sortkey\";i:3;s:20:\"patch-pp_sortkey.sql\";}i:171;a:4:{i:0;s:9:\"dropField\";i:1;s:13:\"recentchanges\";i:2;s:11:\"rc_cur_time\";i:3;s:26:\"patch-drop-rc_cur_time.sql\";}i:172;a:4:{i:0;s:8:\"addIndex\";i:1;s:9:\"watchlist\";i:2;s:29:\"wl_user_notificationtimestamp\";i:3;s:52:\"patch-watchlist-user-notificationtimestamp-index.sql\";}i:173;a:4:{i:0;s:8:\"addField\";i:1;s:4:\"page\";i:2;s:9:\"page_lang\";i:3;s:19:\"patch-page_lang.sql\";}i:174;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"pagelinks\";i:2;s:17:\"pl_from_namespace\";i:3;s:27:\"patch-pl_from_namespace.sql\";}i:175;a:4:{i:0;s:8:\"addField\";i:1;s:13:\"templatelinks\";i:2;s:17:\"tl_from_namespace\";i:3;s:27:\"patch-tl_from_namespace.sql\";}i:176;a:4:{i:0;s:8:\"addField\";i:1;s:10:\"imagelinks\";i:2;s:17:\"il_from_namespace\";i:3;s:27:\"patch-il_from_namespace.sql\";}i:177;a:4:{i:0;s:11:\"modifyField\";i:1;s:5:\"image\";i:2;s:14:\"img_major_mime\";i:3;s:33:\"patch-img_major_mime-chemical.sql\";}i:178;a:4:{i:0;s:11:\"modifyField\";i:1;s:8:\"oldimage\";i:2;s:13:\"oi_major_mime\";i:3;s:32:\"patch-oi_major_mime-chemical.sql\";}i:179;a:4:{i:0;s:11:\"modifyField\";i:1;s:11:\"filearchive\";i:2;s:13:\"fa_major_mime\";i:3;s:32:\"patch-fa_major_mime-chemical.sql\";}i:180;a:1:{i:0;s:27:\"doUserNewTalkUseridUnsigned\";}i:181;a:4:{i:0;s:11:\"modifyField\";i:1;s:13:\"recentchanges\";i:2;s:10:\"rc_comment\";i:3;s:28:\"patch-editsummary-length.sql\";}i:182;a:2:{i:0;s:9:\"dropTable\";i:1;s:10:\"hitcounter\";}i:183;a:4:{i:0;s:9:\"dropField\";i:1;s:10:\"site_stats\";i:2;s:14:\"ss_total_views\";i:3;s:29:\"patch-drop-ss_total_views.sql\";}i:184;a:4:{i:0;s:9:\"dropField\";i:1;s:4:\"page\";i:2;s:12:\"page_counter\";i:3;s:27:\"patch-drop-page_counter.sql\";}i:185;a:2:{i:0;s:9:\"dropTable\";i:1;s:18:\"msg_resource_links\";}i:186;a:2:{i:0;s:9:\"dropTable\";i:1;s:12:\"msg_resource\";}i:187;a:3:{i:0;s:8:\"addTable\";i:1;s:13:\"bot_passwords\";i:2;s:23:\"patch-bot_passwords.sql\";}i:188;a:4:{i:0;s:8:\"addField\";i:1;s:9:\"watchlist\";i:2;s:5:\"wl_id\";i:3;s:25:\"patch-watchlist-wl_id.sql\";}i:189;a:4:{i:0;s:9:\"dropIndex\";i:1;s:13:\"categorylinks\";i:2;s:12:\"cl_collation\";i:3;s:33:\"patch-kill-cl_collation_index.sql\";}i:190;a:4:{i:0;s:8:\"addIndex\";i:1;s:13:\"categorylinks\";i:2;s:16:\"cl_collation_ext\";i:3;s:36:\"patch-add-cl_collation_ext_index.sql\";}i:191;a:1:{i:0;s:17:\"doCollationUpdate\";}i:192;a:4:{i:0;s:8:\"addTable\";i:1;s:13:\"approved_revs\";i:2;s:80:\"/opt/meza/htdocs/mediawiki/extensions/ApprovedRevs//maintenance/ApprovedRevs.sql\";i:3;b:1;}i:193;a:4:{i:0;s:8:\"addTable\";i:1;s:19:\"approved_revs_files\";i:2;s:86:\"/opt/meza/htdocs/mediawiki/extensions/ApprovedRevs//maintenance/ApprovedRevs_Files.sql\";i:3;b:1;}i:194;a:4:{i:0;s:8:\"addTable\";i:1;s:10:\"echo_event\";i:2;s:51:\"/opt/meza/htdocs/mediawiki/extensions/Echo/echo.sql\";i:3;b:1;}i:195;a:4:{i:0;s:8:\"addTable\";i:1;s:16:\"echo_email_batch\";i:2;s:74:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/echo_email_batch.sql\";i:3;b:1;}i:196;a:4:{i:0;s:8:\"addTable\";i:1;s:16:\"echo_target_page\";i:2;s:74:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/echo_target_page.sql\";i:3;b:1;}i:197;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:11:\"event_agent\";i:3;s:81:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_agent-split.sql\";i:4;b:1;}i:198;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:13:\"event_variant\";i:3;s:89:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_variant_nullability.sql\";i:4;b:1;}i:199;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:11:\"event_extra\";i:3;s:80:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_extra-size.sql\";i:4;b:1;}i:200;a:5:{i:0;s:11:\"modifyField\";i:1;s:10:\"echo_event\";i:2;s:14:\"event_agent_ip\";i:3;s:83:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-event_agent_ip-size.sql\";i:4;b:1;}i:201;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"echo_target_page\";i:2;s:6:\"etp_id\";i:3;s:85:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-multiple_target_pages.sql\";i:4;b:1;}i:202;a:5:{i:0;s:8:\"addField\";i:1;s:17:\"echo_notification\";i:2;s:24:\"notification_bundle_base\";i:3;s:91:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-notification-bundling-field.sql\";i:4;b:1;}i:203;a:5:{i:0;s:9:\"dropField\";i:1;s:10:\"echo_event\";i:2;s:15:\"event_timestamp\";i:3;s:95:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-drop-echo_event-event_timestamp.sql\";i:4;b:1;}i:204;a:5:{i:0;s:8:\"addField\";i:1;s:16:\"echo_email_batch\";i:2;s:14:\"eeb_event_hash\";i:3;s:85:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-email_batch-new-field.sql\";i:4;b:1;}i:205;a:5:{i:0;s:8:\"addField\";i:1;s:10:\"echo_event\";i:2;s:13:\"event_page_id\";i:3;s:92:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-add-echo_event-event_page_id.sql\";i:4;b:1;}i:206;a:5:{i:0;s:8:\"addIndex\";i:1;s:10:\"echo_event\";i:2;s:15:\"echo_event_type\";i:3;s:86:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-alter-event_type-index.sql\";i:4;b:1;}i:207;a:5:{i:0;s:8:\"addIndex\";i:1;s:17:\"echo_notification\";i:2;s:19:\"echo_user_timestamp\";i:3;s:90:\"/opt/meza/htdocs/mediawiki/extensions/Echo/db_patches/patch-alter-user_timestamp-index.sql\";i:4;b:1;}i:208;a:4:{i:0;s:8:\"addTable\";i:1;s:12:\"uw_campaigns\";i:2;s:67:\"/opt/meza/htdocs/mediawiki/extensions/UploadWizard/UploadWizard.sql\";i:3;b:1;}i:209;a:5:{i:0;s:8:\"addIndex\";i:1;s:12:\"uw_campaigns\";i:2;s:17:\"uw_campaigns_name\";i:3;s:80:\"/opt/meza/htdocs/mediawiki/extensions/UploadWizard/sql/UW_IndexCampaignsName.sql\";i:4;b:1;}i:210;a:5:{i:0;s:8:\"addIndex\";i:1;s:12:\"uw_campaigns\";i:2;s:20:\"uw_campaigns_enabled\";i:3;s:83:\"/opt/meza/htdocs/mediawiki/extensions/UploadWizard/sql/UW_IndexCampaignsEnabled.sql\";i:4;b:1;}i:211;a:4:{i:0;s:8:\"addTable\";i:1;s:4:\"math\";i:2;s:60:\"/opt/meza/htdocs/mediawiki/extensions/Math/db/math.mysql.sql\";i:3;b:1;}i:212;a:4:{i:0;s:8:\"addTable\";i:1;s:7:\"mathoid\";i:2;s:63:\"/opt/meza/htdocs/mediawiki/extensions/Math/db/mathoid.mysql.sql\";i:3;b:1;}i:213;a:4:{i:0;s:8:\"addTable\";i:1;s:7:\"wiretap\";i:2;s:64:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/Wiretap.sql\";i:3;b:1;}i:214;a:5:{i:0;s:8:\"addField\";i:1;s:7:\"wiretap\";i:2;s:13:\"response_time\";i:3;s:78:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/patch-1-response-time.sql\";i:4;b:1;}i:215;a:4:{i:0;s:8:\"addTable\";i:1;s:22:\"wiretap_counter_period\";i:2;s:77:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/patch-2-page-counter.sql\";i:3;b:1;}i:216;a:4:{i:0;s:8:\"addTable\";i:1;s:14:\"wiretap_legacy\";i:2;s:79:\"/opt/meza/htdocs/mediawiki/extensions/Wiretap/schema/patch-3-legacy-counter.sql\";i:3;b:1;}i:217;a:4:{i:0;s:8:\"addTable\";i:1;s:19:\"watch_tracking_user\";i:2;s:78:\"/opt/meza/htdocs/mediawiki/extensions/WatchAnalytics/schema/WatchAnalytics.sql\";i:3;b:1;}i:218;a:1:{i:0;s:20:\"SMWStore::setupStore\";}}'),('user_former_groups-ufg_group-patch-ufg_group-length-increase-255.sql',NULL),('user_groups-ug_group-patch-ug_group-length-increase-255.sql',NULL),('user_properties-up_property-patch-up_property.sql',NULL);
/*!40000 ALTER TABLE `updatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploadstash`
--

DROP TABLE IF EXISTS `uploadstash`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uploadstash` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `us_user` int(10) unsigned NOT NULL,
  `us_key` varchar(255) NOT NULL,
  `us_orig_path` varchar(255) NOT NULL,
  `us_path` varchar(255) NOT NULL,
  `us_source_type` varchar(50) DEFAULT NULL,
  `us_timestamp` varbinary(14) NOT NULL,
  `us_status` varchar(50) NOT NULL,
  `us_chunk_inx` int(10) unsigned DEFAULT NULL,
  `us_props` blob,
  `us_size` int(10) unsigned NOT NULL,
  `us_sha1` varchar(31) NOT NULL,
  `us_mime` varchar(255) DEFAULT NULL,
  `us_media_type` enum('UNKNOWN','BITMAP','DRAWING','AUDIO','VIDEO','MULTIMEDIA','OFFICE','TEXT','EXECUTABLE','ARCHIVE') DEFAULT NULL,
  `us_image_width` int(10) unsigned DEFAULT NULL,
  `us_image_height` int(10) unsigned DEFAULT NULL,
  `us_image_bits` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`us_id`),
  UNIQUE KEY `us_key` (`us_key`),
  KEY `us_user` (`us_user`),
  KEY `us_timestamp` (`us_timestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploadstash`
--

LOCK TABLES `uploadstash` WRITE;
/*!40000 ALTER TABLE `uploadstash` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploadstash` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_real_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `user_password` tinyblob NOT NULL,
  `user_newpassword` tinyblob NOT NULL,
  `user_newpass_time` binary(14) DEFAULT NULL,
  `user_email` tinytext NOT NULL,
  `user_touched` binary(14) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_token` binary(32) NOT NULL DEFAULT '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',
  `user_email_authenticated` binary(14) DEFAULT NULL,
  `user_email_token` binary(32) DEFAULT NULL,
  `user_email_token_expires` binary(14) DEFAULT NULL,
  `user_registration` binary(14) DEFAULT NULL,
  `user_editcount` int(11) DEFAULT NULL,
  `user_password_expires` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  KEY `user_email_token` (`user_email_token`),
  KEY `user_email` (`user_email`(50))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Admin','',':pbkdf2:sha256:10000:128:7zuZEON9vDuMj96d8mQDrA==:L4yCYecee2kPnA0+m6rD8d6nbAlSQhcGAjtlUtyGel3vvdQBBDh+gjPpPNe9PdjkCXqXBX5a+jADHORHfai3tQYMzC53JGM8HMXV7SBxC1f0ZcBb3N+oI3mx5C3T1qwLqeIggQp7OXVpm+ktviU2n2M3Pq9d5N0hOVAiMJOBNjU=','',NULL,'','20170308115022','1311791d8a703068a3ecaa3c23792e56',NULL,'\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,'20170308050936',2,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_former_groups`
--

DROP TABLE IF EXISTS `user_former_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_former_groups` (
  `ufg_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ufg_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ufg_user_group` (`ufg_user`,`ufg_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_former_groups`
--

LOCK TABLES `user_former_groups` WRITE;
/*!40000 ALTER TABLE `user_former_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_former_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `ug_user` int(10) unsigned NOT NULL DEFAULT '0',
  `ug_group` varbinary(255) NOT NULL DEFAULT '',
  UNIQUE KEY `ug_user_group` (`ug_user`,`ug_group`),
  KEY `ug_group` (`ug_group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_newtalk`
--

DROP TABLE IF EXISTS `user_newtalk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_newtalk` (
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `user_ip` varbinary(40) NOT NULL DEFAULT '',
  `user_last_timestamp` varbinary(14) DEFAULT NULL,
  KEY `un_user_id` (`user_id`),
  KEY `un_user_ip` (`user_ip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_newtalk`
--

LOCK TABLES `user_newtalk` WRITE;
/*!40000 ALTER TABLE `user_newtalk` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_newtalk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_properties`
--

DROP TABLE IF EXISTS `user_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_properties` (
  `up_user` int(11) NOT NULL,
  `up_property` varbinary(255) DEFAULT NULL,
  `up_value` blob,
  UNIQUE KEY `user_properties_user_property` (`up_user`,`up_property`),
  KEY `user_properties_property` (`up_property`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_properties`
--

LOCK TABLES `user_properties` WRITE;
/*!40000 ALTER TABLE `user_properties` DISABLE KEYS */;
INSERT INTO `user_properties` VALUES (1,'visualeditor-editor','visualeditor'),(1,'visualeditor-hidebetawelcome','1'),(1,'uls-preferences','{\"ime\":{\"language\":\"en\",\"previousLanguages\":[\"en\"],\"previousInputMethods\":[],\"imes\":{\"en\":\"system\"}}}');
/*!40000 ALTER TABLE `user_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uw_campaigns`
--

DROP TABLE IF EXISTS `uw_campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uw_campaigns` (
  `campaign_id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_name` varbinary(255) NOT NULL,
  `campaign_enabled` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`campaign_id`),
  UNIQUE KEY `uw_campaigns_name` (`campaign_name`),
  KEY `uw_campaigns_enabled` (`campaign_enabled`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uw_campaigns`
--

LOCK TABLES `uw_campaigns` WRITE;
/*!40000 ALTER TABLE `uw_campaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `uw_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valid_tag`
--

DROP TABLE IF EXISTS `valid_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valid_tag` (
  `vt_tag` varchar(255) NOT NULL,
  PRIMARY KEY (`vt_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valid_tag`
--

LOCK TABLES `valid_tag` WRITE;
/*!40000 ALTER TABLE `valid_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `valid_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_tracking_page`
--

DROP TABLE IF EXISTS `watch_tracking_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_tracking_page` (
  `tracking_timestamp` varbinary(14) NOT NULL,
  `page_id` int(10) NOT NULL,
  `num_watches` int(10) NOT NULL,
  `num_reviewed` int(10) NOT NULL,
  `event_notes` varbinary(63) DEFAULT NULL,
  UNIQUE KEY `watch_tracking_page_datapoint` (`tracking_timestamp`,`page_id`),
  KEY `watch_tracking_page_page` (`page_id`),
  KEY `watch_tracking_page_timestamp` (`tracking_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_tracking_page`
--

LOCK TABLES `watch_tracking_page` WRITE;
/*!40000 ALTER TABLE `watch_tracking_page` DISABLE KEYS */;
INSERT INTO `watch_tracking_page` VALUES ('20170308054923',35,0,0,NULL),('20170308054937',36,0,0,NULL),('20170308055100',37,1,1,NULL),('20170308055254',36,0,0,NULL);
/*!40000 ALTER TABLE `watch_tracking_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_tracking_user`
--

DROP TABLE IF EXISTS `watch_tracking_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_tracking_user` (
  `tracking_timestamp` varbinary(14) NOT NULL,
  `user_id` int(10) NOT NULL,
  `num_watches` int(10) NOT NULL,
  `num_pending` int(10) NOT NULL,
  `event_notes` varbinary(63) DEFAULT NULL,
  KEY `watch_tracking_user_datapoint` (`tracking_timestamp`,`user_id`),
  KEY `watch_tracking_user_user` (`user_id`),
  KEY `watch_tracking_user_timestamp` (`tracking_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_tracking_user`
--

LOCK TABLES `watch_tracking_user` WRITE;
/*!40000 ALTER TABLE `watch_tracking_user` DISABLE KEYS */;
INSERT INTO `watch_tracking_user` VALUES ('',0,0,0,NULL),('',0,0,0,NULL),('20170308055100',1,2,0,NULL),('',0,0,0,NULL);
/*!40000 ALTER TABLE `watch_tracking_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watch_tracking_wiki`
--

DROP TABLE IF EXISTS `watch_tracking_wiki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watch_tracking_wiki` (
  `tracking_timestamp` varbinary(14) NOT NULL,
  `num_pages` int(10) NOT NULL,
  `num_watches` int(10) NOT NULL,
  `num_pending` int(10) NOT NULL,
  `max_pending_minutes` int(10) NOT NULL,
  `avg_pending_minutes` int(10) NOT NULL,
  `num_unwatched` int(10) NOT NULL,
  `num_one_watched` int(10) NOT NULL,
  `num_unreviewed` int(10) NOT NULL,
  `num_one_reviewed` int(10) NOT NULL,
  `content_num_pages` int(10) NOT NULL,
  `content_num_watches` int(10) NOT NULL,
  `content_num_pending` int(10) NOT NULL,
  `content_max_pending_minutes` int(10) NOT NULL,
  `content_avg_pending_minutes` int(10) NOT NULL,
  `content_num_unwatched` int(10) NOT NULL,
  `content_num_one_watched` int(10) NOT NULL,
  `content_num_unreviewed` int(10) NOT NULL,
  `content_num_one_reviewed` int(10) NOT NULL,
  `event_notes` varbinary(63) DEFAULT NULL,
  UNIQUE KEY `watch_tracking_wiki_datapoint` (`tracking_timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watch_tracking_wiki`
--

LOCK TABLES `watch_tracking_wiki` WRITE;
/*!40000 ALTER TABLE `watch_tracking_wiki` DISABLE KEYS */;
/*!40000 ALTER TABLE `watch_tracking_wiki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchlist` (
  `wl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `wl_user` int(10) unsigned NOT NULL,
  `wl_namespace` int(11) NOT NULL DEFAULT '0',
  `wl_title` varchar(255) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL DEFAULT '',
  `wl_notificationtimestamp` varbinary(14) DEFAULT NULL,
  PRIMARY KEY (`wl_id`),
  UNIQUE KEY `wl_user` (`wl_user`,`wl_namespace`,`wl_title`),
  KEY `namespace_title` (`wl_namespace`,`wl_title`),
  KEY `wl_user_notificationtimestamp` (`wl_user`,`wl_notificationtimestamp`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
INSERT INTO `watchlist` VALUES (1,1,6,'Test_image.png',NULL),(2,1,7,'Test_image.png',NULL),(3,1,0,'Test_Page',NULL),(4,1,1,'Test_Page',NULL);
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiretap`
--

DROP TABLE IF EXISTS `wiretap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiretap` (
  `page_id` int(8) unsigned NOT NULL,
  `page_name` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `hit_timestamp` char(14) DEFAULT NULL,
  `hit_year` char(4) DEFAULT NULL,
  `hit_month` char(2) DEFAULT NULL,
  `hit_day` char(2) DEFAULT NULL,
  `hit_hour` char(2) DEFAULT NULL,
  `hit_weekday` tinyint(4) DEFAULT NULL,
  `page_action` varchar(255) DEFAULT NULL,
  `oldid` int(10) unsigned DEFAULT NULL,
  `diff` varchar(10) DEFAULT NULL,
  `referer_url` text,
  `referer_title` varchar(255) DEFAULT NULL,
  `response_time` int(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiretap`
--

LOCK TABLES `wiretap` WRITE;
/*!40000 ALTER TABLE `wiretap` DISABLE KEYS */;
INSERT INTO `wiretap` VALUES (0,'Main Page','127.0.0.1','20170308114755','2017','03','08','05',3,NULL,NULL,NULL,'https://192.168.56.80/','',535),(35,'Main Page','127.0.0.1','20170308114923','2017','03','08','05',3,NULL,NULL,NULL,'https://192.168.56.80/demo/index.php/Main_Page?veaction=edit','',147),(0,'Test Page','127.0.0.1','20170308114925','2017','03','08','05',3,'edit',NULL,NULL,'https://192.168.56.80/demo/index.php/Main_Page?venotify=created','',175),(36,'Test Page','127.0.0.1','20170308114937','2017','03','08','05',3,NULL,NULL,NULL,'https://192.168.56.80/demo/index.php?title=Test_Page&action=edit&redlink=1','Test_Page',123),(0,'Special:UserLogin','127.0.0.1','20170308114940','2017','03','08','05',3,NULL,NULL,NULL,'https://192.168.56.80/demo/index.php/Test_Page','',141),(36,'Test Page','Admin','20170308114944','2017','03','08','05',3,NULL,NULL,NULL,'https://192.168.56.80/demo/index.php?title=Special:UserLogin&returnto=Test+Page','Special:UserLogin',174),(37,'File:Test image.png','Admin','20170308115306','2017','03','08','05',3,NULL,NULL,NULL,'https://192.168.56.80/demo/index.php/Test_Page','',671);
/*!40000 ALTER TABLE `wiretap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiretap_counter_alltime`
--

DROP TABLE IF EXISTS `wiretap_counter_alltime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiretap_counter_alltime` (
  `page_id` int(8) unsigned NOT NULL,
  `count` int(8) unsigned NOT NULL DEFAULT '0',
  `count_unique` int(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `wiretap_counter_alltime_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiretap_counter_alltime`
--

LOCK TABLES `wiretap_counter_alltime` WRITE;
/*!40000 ALTER TABLE `wiretap_counter_alltime` DISABLE KEYS */;
INSERT INTO `wiretap_counter_alltime` VALUES (0,3,1),(35,1,1),(36,2,1),(37,1,1);
/*!40000 ALTER TABLE `wiretap_counter_alltime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiretap_counter_period`
--

DROP TABLE IF EXISTS `wiretap_counter_period`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiretap_counter_period` (
  `page_id` int(8) unsigned NOT NULL,
  `count` int(8) unsigned NOT NULL DEFAULT '0',
  `count_unique` int(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `wiretap_counter_period_page_id` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiretap_counter_period`
--

LOCK TABLES `wiretap_counter_period` WRITE;
/*!40000 ALTER TABLE `wiretap_counter_period` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiretap_counter_period` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wiretap_legacy`
--

DROP TABLE IF EXISTS `wiretap_legacy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wiretap_legacy` (
  `legacy_id` int(8) unsigned NOT NULL,
  `legacy_counter` int(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `wiretap_counter_legacy_page_id` (`legacy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=binary;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wiretap_legacy`
--

LOCK TABLES `wiretap_legacy` WRITE;
/*!40000 ALTER TABLE `wiretap_legacy` DISABLE KEYS */;
/*!40000 ALTER TABLE `wiretap_legacy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-08  7:11:29
