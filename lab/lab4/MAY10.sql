SHOW DATABASES;
CREATE DATABASE MAYTENLAB;
USE MAYTENLAB; 

/* 
#Create tables for the following schema:
#SAILOR (sid: integer, sname: string, rating: integer, age: real)
#BOAT (bid: integer, bname:string, color:string)
#RESERVES (sid: integer, bid: integer, day: date)
#Mandatory Queries:
#1) Add the required constraints on the created tables.
#2) Populate the relations with at least 5 tuples each.
#3) Select names and ages of all sailors. Rename sname as ‘Sailor Name’
#4) Find all sailors with a rating above 7?
#5) Find the sid of sailors who have reserved a red boat?
#6) Find the colors of boats reserved by ‘Shyam’?
#7) Delete all boats which have never been reserved.
*/

-- #1) Add the required constraints on the created tables.
CREATE TABLE SAILOR(SID INT, SNAME VARCHAR(50), RATING INT,AGE REAL, CONSTRAINT PKSAILOR PRIMARY KEY(SID));
CREATE TABLE BOAT(BID INT, BNAME VARCHAR(50), COLOR VARCHAR(20), CONSTRAINT PKBOAT PRIMARY KEY(BID));
CREATE TABLE RESERVES(SID INT, BID INT, DAY DATE, CONSTRAINT RESKEY PRIMARY KEY(SID,BID), FOREIGN KEY(SID) REFERENCES SAILOR(SID), FOREIGN KEY(BID) REFERENCES BOAT(BID));

-- #2) Populate the relations with at least 5 tuples each.
INSERT INTO SAILOR VALUES(1, "SHYAM", 7, 25);
INSERT INTO SAILOR VALUES(2, "RAM", 5, 28);
INSERT INTO SAILOR VALUES(3, "HARI", 8, 35);
INSERT INTO SAILOR VALUES(4, "TAYLOR", 9, 20);
INSERT INTO SAILOR VALUES(5, "JOHN", 10, 22);

INSERT INTO BOAT VALUES(101, "BOAT 1", "RED");
INSERT INTO BOAT VALUES(102, "BOAT 2", "GREEN");
INSERT INTO BOAT VALUES(103, "BOAT 3", "BLACK");
INSERT INTO BOAT VALUES(104, "BOAT 4", "WHITE");
INSERT INTO BOAT VALUES(105, "BOAT 5", "RED");

INSERT INTO RESERVES VALUES(1, 101, 20200504);
INSERT INTO RESERVES VALUES(2, 102, 20200504);
INSERT INTO RESERVES VALUES(3, 103, 20200408);
INSERT INTO RESERVES VALUES(5, 105, 20201107);


-- #3) Select names and ages of all sailors. Rename sname as ‘Sailor Name’
SELECT SNAME,AGE FROM SAILOR;
ALTER TABLE SAILOR RENAME COLUMN SNAME TO SAILORNAME; 
SELECT * FROM SAILOR;

-- #4) Find all sailors with a rating above 7?
SELECT * FROM SAILOR WHERE RATING>7;

-- #5) Find the sid of sailors who have reserved a red boat?
SELECT S.SID FROM SAILOR S, RESERVES R, BOAT B WHERE S.SID = R.SID AND R.BID = B.BID AND B.COLOR="RED";	 

-- #6) Find the colors of boats reserved by ‘Shyam’?
SELECT COLOR FROM RESERVES,BOAT,SAILOR WHERE SAILOR.SID=RESERVES.SID AND RESERVES.BID=BOAT.BID AND SAILOR.SAILORNAME='SHYAM';

-- #7) Delete all boats which have never been reserved.
DELETE FROM BOAT RESERVES WHERE BID NOT IN (SELECT BID FROM RESERVES);



