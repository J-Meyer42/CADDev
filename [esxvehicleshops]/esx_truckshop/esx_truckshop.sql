INSERT INTO `addon_account` (name, label, shared) VALUES
  ('society_truckdealer','Truck Dealer',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
  ('society_truckdealer','Truck Dealer',1)
;

INSERT INTO `jobs` (name, label) VALUES
  ('truckdealer','Truck Dealer')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('truckdealer',0,'recruit','Truck Dealership Recruit',10,'{}','{}'),
  ('truckdealer',1,'novice','Truck Dealer',25,'{}','{}'),
  ('truckdealer',2,'experienced','Truck Dealership Manager',40,'{}','{}'),
  ('truckdealer',3,'boss','Truck Dealership Owner',0,'{}','{}')
;

CREATE TABLE `truckdealer_trucks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `owned_trucks` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `rented_trucks` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(10) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(255) NOT NULL,

  PRIMARY KEY (`id`)
);

CREATE TABLE `truck_categories` (

  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,

  PRIMARY KEY (`id`)
);

INSERT INTO `truck_categories` (name, label) VALUES
  ('commercial','Commercial Trucks'),
  ('trailer','Commercial Trailers')
;

CREATE TABLE `trucks` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
);

INSERT INTO `trucks` (name, model, price, category) VALUES
  ('MTL Pounder','pounder',70000,'commercial'),
  ('Vapid Benson','benson',75000,'commercial'),
  ('Hvy Hauler','hauler',82000,'commercial'),
  ('Jobuilt Rubble','rubble',85000,'commercial'),
  ('MTL Packer','packer',110000,'commercial'),
  ('Jobuilt Phantom','phantom',150000,'commercial'),
  ('Tanker','tanker2',75000,'trailer'),
  ('Dry Van','trailers',55000,'trailer'),
  ('Shipping Container','docktrailer',60000,'trailer'),
  ('Flatbed','trflat',50000,'trailer')
;
