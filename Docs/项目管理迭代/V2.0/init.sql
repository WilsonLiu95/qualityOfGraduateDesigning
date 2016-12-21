DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`uid` VARCHAR(32) NOT NULL, 
	`openid` CHAR(28) NOT  NULL, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	`grade` CHAR(4) NOT NULL, 
	`institute` INT(11) NOT NULL, 
	`direction` INT(11) NOT NULL, 
	`name` VARCHAR(32) NOT NULL, 
	`student_num` VARCHAR(32) NOT NULL, 
	`phone` CHAR(11) NOT NULL, 
	`qq` VARCHAR(32) NOT NULL, 
	`email` VARCHAR(32) NOT NULL, 
	`intro` VARCHAR(256) NOT NULL, 
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`uid` VARCHAR(32) NOT NULL, 
	`openid` CHAR(28) NOT  NULL, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	`institute` INT(11) NOT NULL, 
	`name` VARCHAR(32) NOT NULL, 
	`teacher_num` VARCHAR(32) NOT NULL, 
	`phone` CHAR(11) NOT NULL, 
	`qq` VARCHAR(32) NOT NULL, 
	`email` VARCHAR(32) NOT NULL, 
	`intro` VARCHAR(256) NOT NULL, 
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
	`institute` INT(11) NOT NULL, 
    `current_grade` CHAR(4) NOT NULL, 
    `history_grade` VARCHAR(256) NOT NULL, 
    `account` VARCHAR(32) NOT NULL, 
    `password` VARCHAR(32) NOT NULL, 
    `system_status` INT(4) NOT NULL, 
    `select_max_num` INT(4) NOT NULL, 
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    `update_time` TIMESTAMP NOT NULL,
    `teacher_uid` VARCHAR(32) NOT NULL, 
    
    `grade` CHAR(4) NOT NULL,
	`institute` INT(11) NOT NULL,  
    `direction` INT(11) NOT NULL, 

    `title` VARCHAR(32) NOT NULL, 
    `status` INT(4) NOT NULL, 
    `need` INT(4) NOT NULL, 
    `details` VARCHAR(512) NOT NULL, 
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    `update_time` TIMESTAMP NOT NULL,
    
	`course_id` INT(11) NOT NULL,  
    `status` INT(4) NOT NULL, 
    `student_id`  VARCHAR(32) NOT NULL,
    
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `institute`;
CREATE TABLE `institute` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    `name` VARCHAR(32) NOT NULL,
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `direction`;
CREATE TABLE `direction` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    `institute` INT(11) NOT NULL,
    `name` VARCHAR(32) NOT NULL,
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
	`id` INT(11) NOT NULL AUTO_INCREMENT, 
	`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    `update_time` TIMESTAMP NOT NULL,

    `event_person_type` INT(4) NOT NULL,
    `event_person_id` VARCHAR(32) NOT NULL, 

    `send_person_type` INT(4) NOT NULL,
    `send_status` INT(4) NOT NULL,

    `send_person_id` VARCHAR(32) NOT NULL, 
    `content` VARCHAR(256) NOT NULL, 
	PRIMARY KEY (
		`id`
	)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;