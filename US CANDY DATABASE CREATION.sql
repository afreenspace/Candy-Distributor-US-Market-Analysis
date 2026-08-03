CREATE DATABASE CANDY_DISTRIBUTOR;

USE candy_distributor;

SET GLOBAL local_infile = 1;


CREATE TABLE candy_distributor.sales (
    `Row ID` INT,
    `Order ID` VARCHAR(50),
    `Order Date` DATE,
    `Ship Date` DATE,
    `Ship Mode` VARCHAR(50),
    `Customer ID` INT,
    `Country/Region` VARCHAR(50),
    `City` VARCHAR(100),
    `State/Province` VARCHAR(100),
    `Postal Code` VARCHAR(20),
    `Division` VARCHAR(50),
    `Region` VARCHAR(50),
    `Product ID` VARCHAR(50),
    `Product Name` VARCHAR(150),
    `Sales` DECIMAL(10,2),
    `Units` INT,
    `Gross Profit` DECIMAL(10,2),
    `Cost` DECIMAL(10,2)
);


SET GLOBAL local_infile = 1;


SELECT COUNT(*) FROM candy_distributor.sales;


SELECT * FROM candy_distributor.sales LIMIT 5;


CREATE TABLE candy_distributor.products (
    `Division` VARCHAR(50),
    `Product Name` VARCHAR(150),
    `Factory` VARCHAR(100),
    `Product ID` VARCHAR(50),
    `Unit Price` DECIMAL(10,2),
    `Unit Cost` DECIMAL(10,2)
);


SELECT COUNT(*) FROM candy_distributor.products;


CREATE TABLE candy_distributor.factories (
    `Factory` VARCHAR(100),
    `Latitude` DECIMAL(10,6),
    `Longitude` DECIMAL(10,6)
);

SELECT COUNT(*) FROM candy_distributor.factories;

CREATE TABLE candy_distributor.targets (
    `Division` VARCHAR(50),
    `Target` INT
);

SHOW TABLES FROM candy_distributor;

INSERT INTO candy_distributor.targets (`Division`, `Target`) VALUES
('Chocolate', 27000),
('Sugar', 15000),
('Other', 3000);

SELECT * FROM candy_distributor.targets;


CREATE TABLE candy_distributor.uszips (
    `zip` VARCHAR(10),
    `lat` DECIMAL(10,6),
    `lng` DECIMAL(10,6),
    `city` VARCHAR(100),
    `state_id` VARCHAR(10),
    `state_name` VARCHAR(100),
    `population` INT
);


SELECT COUNT(*) FROM candy_distributor.uszips;

SHOW WARNINGS;
