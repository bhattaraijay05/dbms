#show databases;
#create database mayten;
#use mayten; 

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


#1) Add the required constraints on the created tables.
CREATE TABLE SAILOR(SID INT, SNAME VARCHAR(50), RATING INT,AGE REAL, CONSTRAINT PKSAILOR PRIMARY KEY(SID));
CREATE TABLE BOAT(BID INT, BNAME VARCHAR(50), COLOR VARCHAR(20), CONSTRAINT PKBOAT PRIMARY KEY(BID));
CREATE TABLE RESERVES(SID INT, BID INT, DAY DATE, CONSTRAINT RESKEY PRIMARY KEY(SID,BID), FOREIGN KEY(SID) REFERENCES SAILOR(SID), FOREIGN KEY(BID) REFERENCES BOAT(BID));

#2) Populate the relations with at least 5 tuples each.
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


#3) Select names and ages of all sailors. Rename sname as ‘Sailor Name’
SELECT SNAME,AGE FROM SAILOR;
ALTER TABLE SAILOR RENAME COLUMN SNAME TO SAILORNAME;

SELECT * FROM SAILOR;

#UPDATE SAILOR SET RATING = 8 WHERE SID = 1; 
#UPDATE SAILOR SET RATING = 4 WHERE SID = 2; 
#UPDATE SAILOR SET RATING = 7 WHERE SID = 3;
#UPDATE SAILOR SET RATING = 9 WHERE SID = 4;
#UPDATE SAILOR SET RATING = 6 WHERE SID = 5; 

#SELECT * FROM SAILOR;  

#UPDATE SAILOR SET SAILORNAME = "SHYAM" WHERE SID = 1; 

#4) Find all sailors with a rating above 7?
SELECT * FROM SAILOR WHERE RATING>7;


#5) Find the sid of sailors who have reserved a red boat?
SELECT S.SID FROM SAILOR S, RESERVES R, BOAT B WHERE S.SID = R.SID AND R.BID = B.BID AND B.COLOR="RED";	 




#6) Find the colors of boats reserved by ‘Shyam’?
SELECT color from boat where bid = (select bid from reserves where sid = (select sid from sailor where SAILORNAME = 'Shyam'));

select color from reserves,boat,sailor where sailor.sid=reserves.sid and reserves.bid=boat.bid and sailor.sailorname='SHYAM';


#7) Delete all boats which have never been reserved.




#Find the names of sailors who have reserved boat number 103?
SELECT SAILORNAME FROM SAILOR, BOAT, RESERVES WHERE SAILOR.SID = RESERVES.SID AND RESERVES.BID = BOAT.BID AND BOAT.BID = 101;

#Find the names of sailors who have reserved a red boat?
SELECT SAILORNAME FROM SAILOR, BOAT, RESERVES WHERE SAILOR.SID = RESERVES.SID AND RESERVES.BID = BOAT.BID AND BOAT.COLOR = "RED";

#Find the names of sailors who have reserved atleast one boat?


#Find the name and age of sailors whose name begins and ends with B and has atleas 3 characters


#Find the name and age of oldest sailor
SELECT SAILORNAME, MAX(AGE) FROM SAILOR;

SELECT * FROM RESERVES;
DELETE FROM RESERVES WHERE SID = 3 AND BID = 102;

SELECT * FROM BOAT;

SELECT BNAME FROM BOAT, RESERVES WHERE BID NOT IN (SELECT BID FROM BOAT, RESERVES WHERE BOAT.BID = RESERVES.BID);

SELECT * FROM RESERVES;

DELETE FROM RESERVES WHERE SID = 5;

Delete from boat where bid not in (select bid from reserves);
select bid from reserves;




