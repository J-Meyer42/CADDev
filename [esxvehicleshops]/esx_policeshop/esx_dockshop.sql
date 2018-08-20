USE `essentialmode`;

INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_dock','Marina',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_dock','Marina',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('dock','Marina')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('dock',0,'recruit','Recrue',10,'{}','{}'),
  ('dock',1,'novice','Novice',25,'{}','{}'),
  ('dock',2,'experienced','Experimente',40,'{}','{}'),
  ('dock',3,'boss','Patron',0,'{}','{}')
;

CREATE TABLE dock_vehicles (
  id int(11) NOT NULL AUTO_INCREMENT,
  vehicle varchar(255) NOT NULL,
  price int(11) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE `owner_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `owned_dock` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `rented_dock` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `dock_categories` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

INSERT INTO `dock_categories` (name, label) VALUES
  ('dock','Bateaux')
;

CREATE TABLE `dock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

INSERT INTO dock (name, model, price, category) VALUES
  ('Intercepter','torris2',1500,'state'),
  ('2016 Charger PPV','charger1',1500,'state'),
  ('2016 Charger PPV Slicktop','charger3',1500,'state'),
  ('RT1200','policeb',1500,'state'),
  ('Riot','policet',1500,'state'),
  ('Marked 2013Charger','charger9',1500,'state'),
  ('slicktop 2013Charger','charger10',1500,'state'),
  ('unmarked cvpi','bcvpi',1500,'state'),
  ('15Tahoe','15tahoe1',1500,'state'),
  ('15Tahoe slick','15tahoeslickstate',1500,'state'),
  ('FPIU','skrubfpiu1',1500,'state'),
  ('FPIU slick','skrubfpiu2',1500,'state'),
  ('2016 Charger PPV','charger2',1500,'sheriff'),
  ('2016 Charger PPV Slicktop','charger4',1500,'sheriff'),
  ('Intercepter','torris1',1500,'sheriff'),
  ('Intercepter2','torris',1500,'sheriff'),
  ('RT1200','policeb',1500,'sheriff'),
  ('2016 Charger PPV METRO','city1',1500,'sheriff'),
  ('2016 Charger PPV Slicktop METRO','city2',1500,'sheriff'),
  ('FPIU METRO','fpiumetro',1500,'sheriff'),
  ('FPIU BCSO','fpiubcso',1500,'sheriff'),
  ('FPIU METRO SLICKTOP','fpiumetroslick',1500,'sheriff'),
  ('FPIU BCSO SLICKTOP','fpiubcsoslick',1500,'sheriff'),
  ('Transport Van','policet',1500,'sheriff'),
  ('Bearcat','riot',1500,'sheriff'),
  ('15Tahoe','15tahoe2',1500,'sheriff'),
  ('15TahoeMetro','15tahoecity1',1500,'sheriff'),
  ('15Tahoe slick','15tahoeslick1',1500,'sheriff'),
  ('15TahoeMetro slick','15tahoecityslick',1500,'sheriff')
;

;
