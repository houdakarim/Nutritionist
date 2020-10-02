CREATE DATABASE pdemia_student_Nutritionist CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use pdemia_student_Nutritionist;
DROP TABLE IF EXISTS `account_role`;
DROP TABLE IF EXISTS `account`;

CREATE TABLE `account_role` (`id` int unsigned AUTO_INCREMENT PRIMARY KEY) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `account_role` ADD `name` varchar(100) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `account_role` ADD `active` varchar(1) default 1;
INSERT INTO account_role(id,name,active) VALUES("1","SuperAdmin","0");
INSERT INTO account_role(id,name) VALUES("2","Admin");
INSERT INTO account_role(id,name) VALUES("3","Moderator");
INSERT INTO account_role(id,name) VALUES("4","User");

-- for accounts and users
CREATE TABLE `account` (`id` int unsigned AUTO_INCREMENT PRIMARY KEY) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `account` ADD `name` varchar(100) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `account` ADD `email` varchar(100) NOT NULL UNIQUE;
ALTER TABLE `account` ADD `password` varchar(100) NOT NULL;
ALTER TABLE `account` ADD `salt` varchar(100) NOT NULL;
ALTER TABLE `account` ADD `timestamp_create` timestamp DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `account` ADD `active` varchar(1) default '1';
ALTER TABLE `account` ADD `active_enabled` varchar(1) default '1';
ALTER TABLE `account` ADD `active_verified` varchar(1) default '0';
ALTER TABLE `account` ADD `account_role_fk` int unsigned default 4;

CREATE TABLE `meal_type` (`id` int unsigned AUTO_INCREMENT PRIMARY KEY) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `meal_type` ADD `name` varchar(255) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `meal_type` ADD `active` varchar(1) default '1';

CREATE TABLE `meals` (`id` int unsigned AUTO_INCREMENT PRIMARY KEY) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `meals` ADD `name` varchar(255) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `meals` ADD `meal_type_fk` int unsigned;
ALTER TABLE `meals` ADD `image` varchar(255) CHARACTER SET utf8 ;
ALTER TABLE `meals` ADD `calories` int unsigned;
ALTER TABLE `meals` ADD `html_ingredients` TEXT CHARACTER SET utf8 ;
ALTER TABLE `meals` ADD `timestamp_added` timestamp DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE `meals` ADD `active` varchar(1) default '1';

CREATE TABLE `guest_program` (`id` int unsigned AUTO_INCREMENT PRIMARY KEY) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `guest_program` ADD `name` varchar(255) CHARACTER SET utf8 NOT NULL;
ALTER TABLE `guest_program` ADD `account_fk` int unsigned;
ALTER TABLE `guest_program` ADD `min_cal` int unsigned;
ALTER TABLE `guest_program` ADD `max_cal` int unsigned;
ALTER TABLE `guest_program` ADD `date_start` varchar(255);
ALTER TABLE `guest_program` ADD `date_end` varchar(255);
