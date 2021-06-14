show databases;
create database june7;
use june7;

-- DROP DATABASE JUNE7;

-- Create tables for the following schema:
-- SALESMAN (Salesman_id:integer, Name:string, City:string, Commission:integer)
-- CUSTOMER (Customer_id:integer, Cust_Name:string, City:string)
-- ORDERS (Ord_No:integer, Purchase_Amt:real, Ord_Date:date, Customer_id:integer,
-- Salesman_id:integer)

CREATE TABLE SALESMAN(S_ID INT PRIMARY KEY, S_NAME VARCHAR(30), CITY VARCHAR(30), COMMISSION INT);
CREATE TABLE CUSTOMER( C_ID INT PRIMARY KEY, C_NAME VARCHAR(30), C_CITY VARCHAR(30));
CREATE TABLE ORDERS(ORD_NO INT PRIMARY KEY, PURCHASE_AMT REAL, ORD_DATE DATE, C_ID INT, S_ID INT);

-- 1) Add the required constraints on the created tables.
ALTER TABLE ORDERS ADD CONSTRAINT SID FOREIGN KEY (S_ID) REFERENCES SALESMAN(S_ID);
ALTER TABLE ORDERS ADD CONSTRAINT CID FOREIGN KEY (C_ID) REFERENCES CUSTOMER(C_ID);

-- 2) Populate the relations with at least 5 tuples each.

-- iNSERTING IN SALESMAN 
INSERT INTO SALESMAN VALUES( 101, "TAYLOR", "NY", 20000);
INSERT INTO SALESMAN VALUES( 102, "JEAN", "DC", 8000);
INSERT INTO SALESMAN VALUES( 103, "EDDIE", "LA", 14000);
INSERT INTO SALESMAN VALUES( 104, "JOHN", "ID", 9000);
INSERT INTO SALESMAN VALUES( 105, "KATY", "CA", 5000);

-- INSERTING IN CUSTOMER
INSERT INTO CUSTOMER VALUES( 1001, "JIMMY", "NY");
INSERT INTO CUSTOMER VALUES( 1002, "KARL", "DC");
INSERT INTO CUSTOMER VALUES( 1003, "CLAY", "ID");
INSERT INTO CUSTOMER VALUES( 1004, "FELIX", "CA");
INSERT INTO CUSTOMER VALUES( 1005, "DREAM", "LA");

-- INSERTING IN ORDERS
INSERT INTO ORDERS VALUES(100001, 54000, 20200809, 1001, 101);
INSERT INTO ORDERS VALUES(100002, 60000, 20200504, 1002, 102);
INSERT INTO ORDERS VALUES(100003, 74000, 20160206, 1003, 103);
INSERT INTO ORDERS VALUES(100004, 80000, 20170112, 1004, 104);
INSERT INTO ORDERS VALUES(100005, 40000, 20180707, 1005, 105);


-- 3) Select the ID and names of all the customers.
SELECT C_ID, C_NAME FROM CUSTOMER;

-- 4) Select the salesman with the highest commission.
SELECT MAX(COMMISSION) FROM SALESMAN;

-- 5) List all the orders placed in descending order of their purchase amount.
SELECT * FROM ORDERS ORDER BY PURCHASE_AMT DESC;

-- 6) Select customers who have salesmen in their cities.
SELECT C.C_NAME, S.S_NAME FROM CUSTOMER C, SALESMAN S WHERE C.C_CITY = S.CITY;

-- 7) Delete all orders placed before Jan 2018.
SELECT * FROM ORDERS;
DELETE FROM ORDERS WHERE ORD_DATE < 20180101;

-- ADDITIONAL QUERIES
-- 1) Find the names of salesman who have customers.
SELECT S.S_NAME FROM SALESMAN S, ORDERS O, CUSTOMER C WHERE S.S_ID = O.S_ID AND C.C_ID = O.C_ID;

-- 2) Find the names of all salesmen whose commission is greater than 25%. 
SELECT S.S_NAME FROM SALESMAN S, ORDERS O WHERE S.S_ID = O.S_ID AND ((S.COMMISSION / O.PURCHASE_AMT) * 100) > 25;

-- 3) List the names of customers and the order amount placed by them.
SELECT O.PURCHASE_AMT, C.C_NAME FROM ORDERS O, CUSTOMER C WHERE O.C_ID = C.C_ID;

-- 4) Find the name and ID of all salesmen who have earned commission amount more than 10,000
SELECT S_NAME, S_ID FROM SALESMAN WHERE COMMISSION > 10000;

-- 5) Retrieve salesman id of all salesmen from orders table without any repeats.
SELECT DISTINCT S_ID FROM ORDERS;


-- 6) Find the highest purchase amount ordered by the each customer with their ID
SELECT O.PURCHASE_AMT, O.C_ID FROM ORDERS O GROUP BY O.C_ID;

-- 7) Find the highest purchase amount with their customer ID and order date, for only those customers who have the highest purchase amount in a day is more than 2000
-- SELECT O.PURCHASE_AMT

-- 8) Find the name and city of those customers and salesmen who lives in the same city.
SELECT C.C_NAME, S.S_NAME FROM CUSTOMER C, SALESMAN S WHERE C.C_CITY = S.CITY;

-- 9) Display all those orders by the customers not located in the same cities where their sale
SELECT O.O_ID FROM ORDERS;

-- 10) Find all orders attributed to salesmen in Paris.


-- 11) Extract the data from the orders table for the salesman who earned the maximum commission

