CREATE TABLE IF NOT EXISTS `organizer_section` (
  id int NOT NULL AUTO_INCREMENT,
  section_name VARCHAR(255),
  section_icon VARCHAR(100),
  PRIMARY KEY (`id`)
);


CREATE TABLE IF NOT EXISTS `organizer_info` (
  id int NOT NULL AUTO_INCREMENT,
  service_name varchar(200),
  description varchar(400),
  address char(100),
  avr_time char(50),
  image varchar(150),
  section_id int(11),
  time_start time,
  time_finish time,
  lat double default 0,
  lng double default 0,
  start_date date,
  finish_date date,
  PRIMARY KEY (`id`), 
  FOREIGN KEY (`section_id`) REFERENCES `organizer_section` (`id`)
);