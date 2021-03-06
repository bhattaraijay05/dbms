create database may24;
use may24;
CREATE TABLE TABLE1(A VARCHAR(30), B INT, C VARCHAR(30) PRIMARY KEY, D INT, E VARCHAR(30), F INT);
CREATE TABLE TABLE2(G VARCHAR(30), HF INT PRIMARY KEY, HC VARCHAR(30), K INT);
CREATE TABLE TABLE3(L VARCHAR(30), KF INT, HC VARCHAR(30), KK INT PRIMARY KEY);
ALTER TABLE TABLE1 ADD CONSTRAINT T12FKEY FOREIGN KEY (F) REFERENCES TABLE2 (HF);
ALTER TABLE TABLE2 ADD CONSTRAINT T21FKEY FOREIGN KEY (HC) REFERENCES TABLE1 (C);
ALTER TABLE TABLE2 ADD CONSTRAINT T23FKEY FOREIGN KEY (K) REFERENCES TABLE3 (KK);
ALTER TABLE TABLE3 ADD CONSTRAINT T32FKEY FOREIGN KEY (KF) REFERENCES TABLE2 (HF);


-- 2) INSERT INTO EMP VALUES(&EMPNO,"&ENAME","&DESIGNATIN","&SALARY") 
CREATE TABLE EMP(EMPNO INT, ENAME VARCHAR(30), DESIGNATION VARCHAR(30), SALARY  VARCHAR(30));
-- INSERT INTO EMP VALUES(&EMPNO,'&ENAME','&DESIGNATIN','&SALARY');
SELECT * FROM EMP;

DROP TABLE EMP;

-- 3> PRODUCT TABLE
CREATE TABLE PRODUCTTABLE(PRODUCTID INT PRIMARY KEY, NAME VARCHAR(20), DESCRIPTION VARCHAR(100), PRICE INT, COLOUR INT);
INSERT INTO PRODUCTTABLE VALUES(100000, "Printer", "Inkjet 300 colour Printer", 120, 80);
INSERT INTO PRODUCTTABLE VALUES(100001, "Printer", "1220XI Inkjet Printer", 200, 130);
INSERT INTO PRODUCTTABLE VALUES(100002, "Printer", "Photo 890 Inkjet Printer", 250, 200);
INSERT INTO PRODUCTTABLE VALUES(100003, "Printer", "Inkjet 300 colour Printer", 300, 270);

SELECT PRICE FROM PRODUCTTABLE;
SELECT AVG(PRICE) FROM PRODUCTTABLE;
SELECT MAX(PRICE) FROM PRODUCTTABLE;

-- 4>EMPLOYEE TABLE AND DEPARTMENT TABLE
CREATE TABLE EMPLOYEE(EMPNO INT PRIMARY KEY, ENAME VARCHAR(20), JOB VARCHAR(10), DEPTNO INT, SALARY INT);
CREATE TABLE DEPARTMENT(DEPTNO INT PRIMARY KEY, DNAME VARCHAR(30), LOCATION VARCHAR(30));
ALTER TABLE EMPLOYEE ADD CONSTRAINT FKEY FOREIGN KEY (DEPTNO) REFERENCES DEPARTMENT (DEPTNO);

INSERT INTO EMPLOYEE VALUES(1, "Mathi", "AP", 1, 30000); 
INSERT INTO EMPLOYEE VALUES(2, "Arjun", "ASP", 2, 32000); 
INSERT INTO EMPLOYEE VALUES(3, "Gugan", "ASP", 2, 40000); 
INSERT INTO EMPLOYEE VALUES(4, "Karthik", "AP", 1, 35000); 

INSERT INTO DEPARTMENT VALUES(1, "ACCOUNTING", "NEW YORK");
INSERT INTO DEPARTMENT VALUES(2, "RESEARCH", "DALLAS");
INSERT INTO DEPARTMENT VALUES(30, "SALES", "CHICAGO");
INSERT INTO DEPARTMENT VALUES(40, "OPERATIONS", "BOSTON");


DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;

-- 1> Write a query to extract empno, ename, salary, dname and location from employee and department table where empno and deptno are matching.
SELECT * FROM EMPLOYEE, DEPARTMENT WHERE EMPLOYEE.EMPNO = DEPARTMENT.DEPTNO;

-- 2> Write a query to extract ename, salary and location from employee and department table where deptno is 2,30, 40.
SELECT ENAME, SALARY, LOCATION FROM EMPLOYEE E, DEPARTMENT D WHERE D.DEPTNO NOT IN (SELECT DEPTNO FROM DEPARTMENT WHERE DEPARTMENT.DEPTNO = 1);

-- 3> Write a query to count the number of types of jobs.
SELECT COUNT(DISTINCT JOB) FROM EMPLOYEE;

-- 4> Write a query to extract names of employees earning salary greater than karthik???s salary.
SELECT ENAME FROM EMPLOYEE WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMPLOYEE.ENAME="Karthik") ;  

-- 5> Write a query to display all the deptno where number of employee is less than 3.
SELECT DEPTNO from EMPLOYEE GROUP BY DEPTNO HAVING COUNT(*) < 3;

-- 6> Write a query to display the name of the person working in department where number of employee is less than 3.
SELECT DEPTNO, ENAME from EMPLOYEE GROUP BY DEPTNO HAVING COUNT(*) < 3;

-- 7> Write a query to display the highest salary deptno wise.
SELECT MAX(SALARY), DEPTNO FROM EMPLOYEE GROUP BY DEPTNO;

-- 8> Write a query to display the highest salary deptno wise and the name of the employee taking highest salary.
SELECT MAX(SALARY), DEPTNO, ENAME FROM EMPLOYEE GROUP BY DEPTNO;

-- COMMIT
SELECT * FROM EMPLOYEE WHERE EMPNO = 1;
COMMIT;

START TRANSACTION;

-- ROLLBACK
rollback;

SELECT * FROM EMPLOYEE;



