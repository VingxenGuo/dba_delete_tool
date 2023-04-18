CREATE DATABASE  IF NOT EXISTS `tool` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `tool`;
-- MySQL dump 10.13  Distrib 8.0.29, for macos12 (x86_64)
--
-- Host: 192.168.185.116    Database: tool
-- ------------------------------------------------------
-- Server version	5.7.41-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `batch_delete`
--

DROP TABLE IF EXISTS `batch_delete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_delete` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `connection_id` int(10) unsigned DEFAULT NULL,
  `exec_table` varchar(64) DEFAULT NULL,
  `where_condition` varchar(256) DEFAULT NULL,
  `chunk_number` int(10) unsigned DEFAULT NULL,
  `delete_rate` float unsigned DEFAULT NULL,
  `total_affected_rows` int(11) DEFAULT NULL,
  `total_delete_rate` float DEFAULT NULL,
  `duration_second` double DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `finished_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_delete`
--

LOCK TABLES `batch_delete` WRITE;
/*!40000 ALTER TABLE `batch_delete` DISABLE KEYS */;
INSERT INTO `batch_delete` VALUES (1,5145,'trend_log._login_per_5min_old','created_at < \'2023-04-17 00:00:00\'',10000,NULL,0,0,0.000007152557373046875,'2023-04-18 10:49:02','2023-04-18 10:49:02','2023-04-18 10:49:02'),(2,5145,'trend_log._login_per_5min_old','created_at < \'2023-04-17 00:00:00\'',10000,NULL,0,0,0.0000069141387939453125,'2023-04-18 11:04:27','2023-04-18 11:04:27','2023-04-18 11:04:27'),(3,5145,'trend_log._login_per_5min_old','created_at < \'2023-04-17 00:00:00\'',10000,NULL,0,0,0.000010967254638671875,'2023-04-18 11:07:12','2023-04-18 11:07:12','2023-04-18 11:07:12');
/*!40000 ALTER TABLE `batch_delete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delete_process_config`
--

DROP TABLE IF EXISTS `delete_process_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delete_process_config` (
  `sn` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_key` varchar(64) DEFAULT NULL,
  `config_value` varchar(64) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delete_process_config`
--

LOCK TABLES `delete_process_config` WRITE;
/*!40000 ALTER TABLE `delete_process_config` DISABLE KEYS */;
INSERT INTO `delete_process_config` VALUES (1,'enable','1','2023-04-10 10:34:08','2023-04-10 10:35:43'),(2,'emergency_stop','0','2023-04-10 13:16:21','2023-04-18 11:07:12');
/*!40000 ALTER TABLE `delete_process_config` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER tool.delete_process_config_insert 
BEFORE INSERT
ON tool.delete_process_config FOR EACH ROW 
BEGIN
	SET NEW.created_at = NOW();
    SET NEW.updated_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER tool.delete_process_config_update 
BEFORE UPDATE
ON tool.delete_process_config FOR EACH ROW 
BEGIN
    SET NEW.updated_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `routine_delete_table`
--

DROP TABLE IF EXISTS `routine_delete_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine_delete_table` (
  `sn` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `exec_database` varchar(64) NOT NULL,
  `exec_table` varchar(128) NOT NULL,
  `routine_type` char(1) NOT NULL COMMENT 'Y: execute at first day of year, M: execute at first day of month, D daily execute',
  `delete_type` varchar(16) NOT NULL COMMENT 'delete_record, drop_table, drop_partition',
  `time_interval` int(10) unsigned NOT NULL,
  `delete_key` varchar(64) DEFAULT NULL COMMENT 'Switch (delete_type) {\n	case ‘delete_record’:\n		#fill the where condition column\n	case ‘drop_table’:\n		#no usage fill null\n	case ‘drop_partition’:\n		#fill the prefix string of partition name\n}',
  `is_enabled` int(10) unsigned NOT NULL,
  `lastest_start_at` datetime DEFAULT NULL,
  `lastest_finish_at` datetime DEFAULT NULL,
  `lastest_duration_second` double DEFAULT NULL,
  `lastest_exec_cmd` varchar(256) DEFAULT NULL,
  `lastest_err_msg` varchar(128) DEFAULT NULL,
  `batch_delete_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sn`),
  KEY `idx-batch_delete_id` (`batch_delete_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_delete_table`
--

LOCK TABLES `routine_delete_table` WRITE;
/*!40000 ALTER TABLE `routine_delete_table` DISABLE KEYS */;
INSERT INTO `routine_delete_table` VALUES (1,'trend_log','_login_per_5min_old','d','delete_record',1,'created_at',1,'2023-04-18 11:07:12','2023-04-18 11:07:12',0.003592967987060547,'DELETE FROM trend_log._login_per_5min_old WHERE created_at < \'2023-04-17 00:00:00\'',NULL,3,'2023-04-10 10:39:36','2023-04-18 11:07:12'),(2,'trend_log','testharlan','m','drop_partition',1,'p_',1,NULL,NULL,NULL,NULL,'skip every month process, because isn\'t first day of month',NULL,'2023-04-12 14:19:28','2023-04-18 11:07:12'),(3,'trend_log','testabc','y','drop_table',1,NULL,1,NULL,NULL,NULL,NULL,'skip every year process, because isn\'t first day of year',NULL,'2023-04-12 14:21:25','2023-04-18 11:07:12');
/*!40000 ALTER TABLE `routine_delete_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER tool.routine_delete_table_insert 
BEFORE INSERT
ON tool.routine_delete_table FOR EACH ROW 
BEGIN
	SET NEW.created_at = NOW();
    SET NEW.updated_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER tool.routine_delete_table_update 
BEFORE UPDATE
ON tool.routine_delete_table FOR EACH ROW 
BEGIN
    SET NEW.updated_at = NOW();
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'tool'
--

--
-- Dumping routines for database 'tool'
--
/*!50003 DROP PROCEDURE IF EXISTS `batch_delete` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `batch_delete`(IN exec_schema VARCHAR(50), IN exec_table VARCHAR(50), IN where_condition VARCHAR(200), IN batch_rows INT, OUT return_last_insert_id INT)
BEGIN
	DECLARE start_ts DOUBLE;
    DECLARE last_execute_ts DOUBLE;
    DECLARE current_ts DOUBLE;
    DECLARE delta_secs DOUBLE;
    DECLARE delete_rate DOUBLE;
    # Affected Rows Set 1 To Start The Loop
    DECLARE affected_rows INT DEFAULT 1;
    DECLARE total_affected_rows INT DEFAULT 0;
    DECLARE total_delete_rate DOUBLE;
    DECLARE last_insert_id INT;
    -- DECLARE estimate_row_number INT;
    
    SET start_ts = UNIX_TIMESTAMP(NOW(6));
    SET last_execute_ts = UNIX_TIMESTAMP(NOW(6));
    
    # Set Default Delete Chunk Size
    IF ISNULL(batch_rows) THEN
		SET batch_rows = 10000;
	END IF;
    
    -- SELECT TABLE_ROWS INTO estimate_row_number FROM information_schema.TABLES WHERE TABLE_SCHEMA = exec_schema AND TABLE_NAME = exec_table;
    INSERT INTO batch_delete (`connection_id`, `exec_table`, `where_condition`, `chunk_number`, `created_at`) VALUES (CONNECTION_ID(), CONCAT(exec_schema, '.', exec_table), where_condition, batch_rows, CURRENT_TIMESTAMP());
    SET last_insert_id = LAST_INSERT_ID();
	SET @sqlstr = CONCAT('DELETE FROM ', exec_schema, '.', exec_table, ' WHERE 1 AND ', where_condition, ' LIMIT ', batch_rows);
    DEL_LOOP: WHILE affected_rows > 0 DO
		PREPARE stmt FROM @sqlstr;
		EXECUTE stmt;
		SET affected_rows = ROW_COUNT();
        
        # If Attected Rows = 0 Then Exit The Loop, Cause Finial Delete Rate Doesn't Make Sense
        IF affected_rows = 0 THEN
			LEAVE DEL_LOOP;
        END IF;
        
        SET current_ts = UNIX_TIMESTAMP(NOW(6));
        SET delta_secs = current_ts - last_execute_ts;
        IF delta_secs = 0 THEN
			SET delta_secs = 1;
		END IF;
		SET delete_rate = affected_rows / delta_secs;
        SET total_affected_rows = total_affected_rows + affected_rows;
		DEALLOCATE PREPARE stmt;
        SET last_execute_ts = current_ts;
        SET total_delete_rate = total_affected_rows / (last_execute_ts - start_ts);
        UPDATE batch_delete SET updated_at = CURRENT_TIMESTAMP(), delete_rate = delete_rate, total_delete_rate = total_delete_rate, total_affected_rows = total_affected_rows WHERE id = last_insert_id;
	END WHILE DEL_LOOP;
    SET total_delete_rate = total_affected_rows / (last_execute_ts - start_ts);
	UPDATE batch_delete SET updated_at = CURRENT_TIMESTAMP(), finished_at = CURRENT_TIMESTAMP(), total_delete_rate = total_delete_rate, total_affected_rows = total_affected_rows, duration_second = (last_execute_ts - start_ts) WHERE id = last_insert_id;
    SET return_last_insert_id = last_insert_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_process` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_process`()
FUNC_BODY:BEGIN
	DECLARE start_time DOUBLE;
    DECLARE end_time DOUBLE;
    DECLARE delta_time DOUBLE;
    DECLARE cursor_done INT DEFAULT 0;
    DECLARE r_sn INT;
    DECLARE r_exec_database VARCHAR(64);
    DECLARE r_exec_table VARCHAR(128);
    DECLARE r_routine_type CHAR(1);
    DECLARE r_delete_type VARCHAR(16);
    DECLARE r_delete_key VARCHAR(64);
    DECLARE r_time_interval INT;
    DECLARE first_day_of_month INT DEFAULT 0;
    DECLARE first_day_of_year INT DEFAULT 0;
    DECLARE string_suffix VARCHAR(16);
    DECLARE where_condition TEXT;
    DECLARE enable_flag VARCHAR(64);
    DECLARE emergency_stop_flag VARCHAR(64);
    DECLARE schema_exists_flag INT DEFAULT 1;
    DECLARE exception_flag INT DEFAULT 0;
    DECLARE lastest_exec_cmd VARCHAR(256);
    DECLARE mysql_err_msg TEXT;
    DECLARE mysql_err_no INT;
    DECLARE batch_delete_id INT;
    DECLARE cursor1 CURSOR FOR SELECT `sn`, `exec_database`, `exec_table`, `routine_type`, `delete_type`, `time_interval`, `delete_key` FROM tool.routine_delete_table WHERE `is_enabled` = 1 ORDER BY `delete_type` DESC;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET cursor_done = 1;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
	BEGIN
		GET DIAGNOSTICS CONDITION 1 mysql_err_no = MYSQL_ERRNO, mysql_err_msg = MESSAGE_TEXT;
        SET exception_flag = 1;
    END;

    # check config enable flag
    SELECT config_value INTO enable_flag FROM tool.delete_process_config WHERE config_key = 'enable';
    IF enable_flag = 0 OR LOWER(enable_flag) = 'off' THEN
		LEAVE FUNC_BODY;
    END IF;
    
    # update all lastest_ prefix column for initail purpose
    UPDATE tool.routine_delete_table SET lastest_start_at = null, lastest_finish_at = null, lastest_duration_second = null, lastest_err_msg = null, lastest_exec_cmd = null WHERE 1;
    # update emergency stop flag for initail purpose
    UPDATE tool.delete_process_config SET config_value = '0' WHERE config_key = 'emergency_stop';
    
    # detect attributes of today
    IF DAY(NOW()) = 1 THEN
		 SET first_day_of_month = 1;
    END IF;
	IF DAYOFYEAR(NOW()) = 1 THEN
		SET first_day_of_year = 1;
    END IF; 
    
    # start delete process
    OPEN cursor1;
    PROCESS_LOOP: LOOP
		SET start_time = UNIX_TIMESTAMP(NOW(6));
        SET schema_exists_flag = 0;
        SET exception_flag = 0;
        SET batch_delete_id = null;
		FETCH cursor1 INTO r_sn, r_exec_database, r_exec_table, r_routine_type, r_delete_type, r_time_interval, r_delete_key;
        
        IF cursor_done = 1 THEN
			LEAVE PROCESS_LOOP;
		END IF;
        
		# check emergency stop flag
		SELECT config_value INTO emergency_stop_flag FROM tool.delete_process_config WHERE config_key = 'emergency_stop';
        IF LOWER(emergency_stop_flag) = 1 OR LOWER(emergency_stop_flag) = 'on' THEN
			UPDATE tool.routine_delete_table SET lastest_err_msg = 'stop by emergency stop flag' WHERE sn = r_sn;
			ITERATE PROCESS_LOOP;
        END IF;
        
        # check the process execute time correctly
        IF LOWER(r_routine_type) = 'm' AND first_day_of_month != 1 THEN
			UPDATE tool.routine_delete_table SET lastest_err_msg = 'skip every month process, because isn\'t first day of month' WHERE sn = r_sn;
			ITERATE PROCESS_LOOP;
        END IF;
        IF LOWER(r_routine_type) = 'y' AND first_day_of_year != 1 THEN
			UPDATE tool.routine_delete_table SET lastest_err_msg = 'skip every year process, because isn\'t first day of year' WHERE sn = r_sn;
			ITERATE PROCESS_LOOP;
        END IF;
        
        # prepare suffix string for drop table or drop partition, prepare where_condition for delete_record
        IF LOWER(r_routine_type) = 'd' THEN
			SET string_suffix = DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL r_time_interval DAY), '%Y%m%d');
            SET where_condition = CONCAT(r_delete_key, ' < \'', DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL r_time_interval DAY), '%Y-%m-%d 00:00:00'), '\'');
		ELSEIF LOWER(r_routine_type) = 'm' THEN
			SET string_suffix = DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL r_time_interval MONTH), '%Y%m');
			SET where_condition = CONCAT(r_delete_key, ' < \'', DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL r_time_interval MONTH), '%Y-%m-%d 00:00:00'), '\'');
		ELSEIF LOWER(r_routine_type) = 'y' THEN
			SET string_suffix = DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL r_time_interval YEAR), '%Y');
            SET where_condition = CONCAT(r_delete_key, ' < \'', DATE_FORMAT(DATE_SUB(DATE(NOW()), INTERVAL r_time_interval YEAR), '%Y-%m-%d 00:00:00'), '\'');
		ELSE
			# routine_type not in (y,m,d)
            SET string_suffix = '';
            SET where_condition = '';
			UPDATE tool.routine_delete_table SET lastest_err_msg = 'routine_type invalid' WHERE sn = r_sn;
            ITERATE PROCESS_LOOP;
		END IF;
        
        # begin delete
        IF LOWER(r_delete_type) = 'drop_partition' THEN
			# check partition exists
            SELECT count(*) INTO schema_exists_flag FROM information_schema.PARTITIONS WHERE TABLE_SCHEMA = r_exec_database AND TABLE_NAME = r_exec_table AND PARTITION_NAME = CONCAT(r_delete_key, string_suffix); 
            IF schema_exists_flag = 0 THEN
				UPDATE tool.routine_delete_table SET lastest_err_msg = CONCAT('partition ', r_delete_key, string_suffix, ' doesn\'t exists') WHERE sn = r_sn;
				ITERATE PROCESS_LOOP;
            END IF;
            
            # delete
			SET @sql_str = CONCAT('ALTER TABLE ', r_exec_database, '.', r_exec_table , ' DROP PARTITION ', r_delete_key, string_suffix);
            SET lastest_exec_cmd = @sql_str;
            PREPARE stmt FROM @sql_str;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
            
            SELECT mysql_err_no, mysql_err_msg, exception_flag;
		ELSEIF  LOWER(r_delete_type) = 'drop_table' THEN
			# check table exists
            SELECT count(*) INTO schema_exists_flag FROM information_schema.TABLES WHERE TABLE_SCHEMA = r_exec_database AND TABLE_NAME = CONCAT(r_exec_table, string_suffix) AND TABLE_TYPE='BASE TABLE';
            IF schema_exists_flag = 0 THEN
				UPDATE tool.routine_delete_table SET lastest_err_msg = CONCAT('table ', r_exec_table, string_suffix, ' doesn\'t exists') WHERE sn = r_sn;
				ITERATE PROCESS_LOOP;
            END IF;
        
			# delete
			SET @sql_str = CONCAT('DROP TABLE ', r_exec_database, '.', r_exec_table, string_suffix, ';');
            SET lastest_exec_cmd = @sql_str;
            PREPARE stmt FROM @sql_str;
            EXECUTE stmt;
            DEALLOCATE PREPARE stmt;
        ELSEIF LOWER(r_delete_type) = 'delete_record' THEN
			#check table column exists
			SELECT COUNT(*) INTO schema_exists_flag FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = r_exec_database AND TABLE_NAME = r_exec_table AND COLUMN_NAME = r_delete_key;
            IF schema_exists_flag = 0 THEN
				IF r_delete_key IS NULL THEN
					SET r_delete_key = 'null';
                END IF;
				UPDATE tool.routine_delete_table SET lastest_err_msg = CONCAT('column ', r_delete_key, ' doesn\'t exists') WHERE sn = r_sn;
				ITERATE PROCESS_LOOP;
            END IF;
            
            #delete
            SET lastest_exec_cmd = CONCAT('DELETE FROM ', r_exec_database, '.', r_exec_table, ' WHERE ', where_condition);
			CALL tool.batch_delete(r_exec_database, r_exec_table, where_condition, null, batch_delete_id);
		ELSE
			UPDATE tool.routine_delete_table SET lastest_err_msg = 'delete_type invalid' WHERE sn = r_sn;
            ITERATE PROCESS_LOOP;
        END IF;
        
        # exception handler catch
        IF exception_flag = 1 THEN
			UPDATE tool.routine_delete_table SET lastest_err_msg = CONCAT(mysql_err_no, ' - ', mysql_err_msg), lastest_exec_cmd = lastest_exec_cmd WHERE sn = r_sn;
            ITERATE PROCESS_LOOP;
        END IF;
        
        SET end_time = UNIX_TIMESTAMP(NOW(6));
		SET delta_time = end_time - start_time;
        
        # update columns that have lastest_ prefix
		UPDATE tool.routine_delete_table SET lastest_start_at = FROM_UNIXTIME(start_time, '%Y-%m-%d %H:%i:%s'), lastest_finish_at = FROM_UNIXTIME(end_time, '%Y-%m-%d %H:%i:%s'), lastest_duration_second = delta_time, lastest_exec_cmd = lastest_exec_cmd, batch_delete_id = batch_delete_id WHERE sn = r_sn;
    
	END LOOP PROCESS_LOOP;
    SELECT 'Finish';
END FUNC_BODY ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-18 11:09:07
