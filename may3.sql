CREATE DATABASE MAYTHREE;
USE MAYTHREE;
CREATE TABLE STUDENT(USN INT, FIRSTNAME TEXT, LASTNAME TEXT, AGE INT, PRIMARY KEY(USN));
CREATE TABLE LIBRARY(BOOKID INT, ORDERNUMBER INT, USN INT, FOREIGN KEY (USN) REFERENCES STUDENT(USN));
DESC STUDENT;
DESC LIBRARY;
INSERT INTO STUDENT VALUES(101, "TAYLOR", "SWIFT", 30);
SELECT * FROM STUDENT;
INSERT INTO LIBRARY VALUES(1001, 111, 101);
SELECT * FROM LIBRARY;
INSERT INTO STUDENT VALUES(102, "KATY", "PERRY", 31);
INSERT INTO STUDENT VALUES(103, "ED", "SHEERAN", 24);
INSERT INTO LIBRARY VALUES(1002, 222, 102);
INSERT INTO LIBRARY VALUES(1003, 333, 103);
SELECT * FROM LIBRARY;
SELECT AGE FROM STUDENT;  #SELECTING DISTINCT COLUMN(AGE) FROM THE STUDENT
SELECT MAX(AGE) FROM STUDENT; #TO SELECT THE MAXIMUM OF AGE FROM THE STUDENT TABLE
SELECT * FROM STUDENT WHERE AGE = (SELECT MAX(AGE) FROM STUDENT); #SUBQUERY TO SELECT MAXIMUM OF AGE FROM THE STUDENT TABLE 

