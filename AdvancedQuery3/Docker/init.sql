DROP DATABASE IF EXISTS library_exercise;
CREATE DATABASE library_exercise;
USE library_exercise;

DROP TABLE IF EXISTS `author`;
CREATE TABLE author (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    nationality varchar(64) NOT NULL
);

DROP TABLE IF EXISTS `book`;
CREATE TABLE book (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    title varchar (255) NOT NULL,
    publisher varchar (255) NOT NULL,
    area varchar (255) NOT NULL
);

DROP TABLE IF EXISTS `author_book`;
CREATE TABLE author_book (
    id_book int NOT NULL,
    id_author int NOT NULL,
    FOREIGN KEY (id_book)
        REFERENCES book(id),
    FOREIGN KEY (id_author)
        REFERENCES author(id)
);

DROP TABLE IF EXISTS `student`;
CREATE TABLE student (
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(255) NOT NULL,
    last_name varchar (255) NOT NULL,
    address varchar(255) NOT NULL,
    career varchar(255) NOT NULL,
    age smallint NOT NULL
);

DROP TABLE IF EXISTS `loan`;
CREATE TABLE loan(
    idStudent int NOT NULL,
    idBook int NOT NULL,
    loan_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    devolution_date DATETIME NOT NULL,
    returned BOOLEAN
);

