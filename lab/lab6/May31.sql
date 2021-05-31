create database May31;
use May31;

-- Create tables for the following schema:
-- SUPPLIER(sid: integer, sname: string, address: string)
-- PART(pid: integer, pname: string, color: string)
-- CATALOG(sid: integer, pid: integer, cost: real)

CREATE TABLE SUPPLIER(SID INT PRIMARY KEY, SNAME VARCHAR(20), ADDRESS VARCHAR(30));
CREATE TABLE PART(PID INT PRIMARY KEY, PNAME VARCHAR(20), COLOR VARCHAR(10));
CREATE TABLE CATALOG(SID INT, PID INT , COST REAL);

-- 1) Add the required constraints on the created tables. 
ALTER TABLE CATALOG ADD CONSTRAINT SSID FOREIGN KEY (SID) REFERENCES SUPPLIER(SID);
ALTER TABLE CATALOG ADD CONSTRAINT PPID FOREIGN KEY (PID) REFERENCES PART(PID);
 
-- 2) Populate the relations with at least 5 tuples each.
-- FOR SUPPIER TABLE
INSERT INTO SUPPLIER VALUES(1, "TAYLOR", "USA");
INSERT INTO SUPPLIER VALUES(2, "EDDIE", "UK");
INSERT INTO SUPPLIER VALUES(3, "JOHN", "USA");
INSERT INTO SUPPLIER VALUES(4, "RITA", "CHINA");
INSERT INTO SUPPLIER VALUES(5, "TAYLOR", "RUSSIA");
-- FOR PART TABLE
INSERT INTO PART VALUES(001, "A", "red");
INSERT INTO PART VALUES(002, "B", "white");
INSERT INTO PART VALUES(003, "C", "black");
INSERT INTO PART VALUES(004, "D", "red");
INSERT INTO PART VALUES(005, "E", "blue");
-- FOR THE CATALOG TABLE
INSERT INTO CATALOG VALUES(1,001,1200);
INSERT INTO CATALOG VALUES(2,002,1500);
INSERT INTO CATALOG VALUES(3,003,1800);
INSERT INTO CATALOG VALUES(4,004,1700);
INSERT INTO CATALOG VALUES(5,005,2200);


-- 3) Select the ID and names of all the suppliers.
SELECT SID, SNAME FROM SUPPLIER;

-- 4) Select the most costly part available in the catalog.
SELECT MAX(COST) FROM CATALOG;

-- 5) Find the pnames of parts for which there is some supplier. 
-- SELECT PNAME FROM PART WHERE PID IN(SELECT PID FROM CATALOG); 
SELECT DISTINCT P.pname FROM Part P, Catalog C WHERE P.pid = C.pid;
-- select pname from PART,CATALOG where PART.pid =CATALOG.pid;

-- 6) Find the sids of suppliers who supply a red part and a green part.
SELECT SID FROM CATALOG, PART WHERE CATALOG.PID = PART.PID AND PART.COLOR IN ('Red', 'Green');

-- 7) Delete all parts of a given ID.
ALTER TABLE CATALOG DROP CONSTRAINT PPID;
DELETE FROM PART WHERE PID = 001;

-- Additional Queries
-- 1) Find the sids of suppliers who supply a red part or a green part.

SELECT SID FROM CATALOG, PART WHERE CATALOG.PID = PART.PID AND PART.COLOR IN ('Red', 'Green');

-- 2) List the suppliers residing in Bangalore.
SELECT * FROM SUPPLIER WHERE ADDRESS = "UK";

-- 3) Find the sids of suppliers who supply red parts.
SELECT SID FROM CATALOG, PART WHERE CATALOG.PID = PART.PID AND PART.COLOR IN ('Red');

-- 4) For every supplier that supplies a green part and a red part, print the name and price of the most expensive part that he/she supplies.

SELECT PNAME, MAX(COST) FROM CATALOG, PART WHERE CATALOG.PID = PART.PID AND PART.COLOR IN ('Red', 'Blue');


