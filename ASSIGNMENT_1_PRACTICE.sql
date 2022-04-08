/********************************************** ASSIGNMENT 1 ***********************************************/

/********************************************** QUESTION 1 ***********************************************/

-- CREATE TABLE WITH APPROPRIATE DATATYPE --

CREATE TABLE EMP_DETAILS
(
EMP_ID            INT,
FIRST_NAME        VARCHAR(50),
DEPARTMENT_ID     VARCHAR(20),
EMAIL_ID          VARCHAR(100),
SALARY            NUMBER,
HIRE_DATE         DATE
);

DESC  EMP_DETAILS;

SELECT * FROM EMP_DETAILS;

INSERT INTO EMP_DETAILS
VALUES (101,'Abigail','10_Prod','Abigail_Abraham@priory.com','99446','24-June-1997');

INSERT INTO EMP_DETAILS
VALUES (102,'Alexandra','10_Prod','Alexandra_Allan@priory.com','35106','25-June-1995');

INSERT INTO EMP_DETAILS
VALUES (103,'Alison','10_Prod','Alison_Alsop@priory.com','60137','26-June-1995');

INSERT INTO EMP_DETAILS
VALUES (104,'Amanda','10_Prod','Amanda_Anderson@priory.com','34888','27-June-1995');

INSERT INTO EMP_DETAILS
VALUES (105,'Amelia','10_Prod','Amelia_Arnold@priory.com','22362','28-June-1995');

INSERT INTO EMP_DETAILS
VALUES (106,'Amy','20_RD','Amy_Avery@priory.com','46237','29-June-1995');

INSERT INTO EMP_DETAILS
VALUES (107,'Andrea','20_RD','Andrea_Bailey@priory.com','9347','30-June-1995');

INSERT INTO EMP_DETAILS
VALUES (108,'Angela','20_RD','Angela_Baker@priory.com','27937','1-Jul-1999');

INSERT INTO EMP_DETAILS
VALUES (109,'Anna','20_RD','Anna_Ball@priory.com','63958','2-Jul-1995');

INSERT INTO EMP_DETAILS
VALUES (110,'Anne','20_RD','Anne_Bell@priory.com',' ','3-Jul-1995');

INSERT INTO EMP_DETAILS
VALUES (111,'Audrey','20_RD','Audrey_Berry@priory.com','24070','4-Jul-1995');

INSERT INTO EMP_DETAILS
VALUES (112,'Ava','20_RD','Ava_Black@priory.com','58388','5-Jul-1995');

INSERT INTO EMP_DETAILS
VALUES (113,'Bella','20_RD','Bella_Blake@priory.com','81680','6-Jul-2000');

INSERT INTO EMP_DETAILS
VALUES (114,'Bernadette','20_RD','Bernadette_Bond@priory.com','68857','7-Jul-2000');

INSERT INTO EMP_DETAILS
VALUES (115,'Carol','null','Carol_Bower@priory.com','35346','8-Jul-2000');

INSERT INTO EMP_DETAILS
VALUES (116,'Caroline','null','Caroline_Brown@priory.com','80291','9-Jul-2000');

INSERT INTO EMP_DETAILS(EMP_ID,FIRST_NAME,EMAIL_ID,SALARY,HIRE_DATE)
VALUES (114,'Bernadette','Bernadette_Bond@priory.com','68857','7-Jul-2000');

/********************************************** QUESTION 2 ***********************************************/

-- EMP DETAILS WHOSE SALARY IS HIGHER THAN 55900--

SELECT * FROM EMP_DETAILS WHERE SALARY > 55900;

/********************************************** QUESTION 3 ***********************************************/

-- EMP DETAILS WHOSE SALARY BETWEEN 55900 AND 85000 --

SELECT * FROM EMP_DETAILS WHERE SALARY BETWEEN 55900 AND 85000;

SELECT * FROM EMP_DETAILS WHERE SALARY >=55900 AND SALARY <= 85000;

/********************************************** QUESTION 4 ***********************************************/

-- EMP DETAILS WHOSE FIRST NAME START WITH 'A' --

SELECT * FROM EMP_DETAILS WHERE FIRST_NAME LIKE 'A%';

/********************************************** QUESTION 11 ***********************************************/

-- MERGE STATEMENT --

MERGE INTO TARGET T1
USING SOURCE_TABLE S1
ON (S1.EMP_ID= T1.EMP_ID)
WHEN MATCHED THEN
UPDATE SET T1.CITY = S1.CITY, T1.NAME=S1.NAME
WHEN NOT MATCHED BY TARGET THEN 
INSERT(T1.EMP_ID,T1.NAME,T1.CITY)
VALUES(S1.EMP_ID,S1.NAME,S1.CITY)
WHEN NOT MATCHED SOURCE_TABLE THEN
DELETE FROM TARGET;

/********************************************** QUESTION 13 ***********************************************/

-- DISPLAY CURRENT DATE AND TIME 

SELECT SYSTIMESTAMP FROM DUAL;

SELECT CURRENT_TIMESTAMP FROM DUAL;

-- IF ONLY DATE --

SELECT SYSDATE FROM DUAL;

/********************************************** QUESTION 14 ***********************************************/

-- EMP DETAILS WHOSE DEPARTMENT ID IS NOT 20_RD --

SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID <> '20_RD';

SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID NOT IN ('20_RD');

SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID != '20_RD';

/********************************************** QUESTION 15 ***********************************************/

-- DISPLAY EMP DETAILS WHOSE DEPARTMENT ID IS NULL --

SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID IS NULL;

/********************************************** QUESTION 16 ***********************************************/

-- EMP DETAILS WHOSE DEPT IS 20_RD AND FIRST NAME START WITH 'A' --

SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID ='20_RD' AND FIRST_NAME LIKE 'A%';

--OR--

SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID IN('20_RD') AND FIRST_NAME LIKE 'A%';

/********************************************** QUESTION 17 ***********************************************/ 

-- CREATE TABLE WITH ALL RECORDS FROM EMP_DETAILS --

CREATE TABLE EMP_DTL AS SELECT * FROM EMP_DETAILS;

/********************************************** QUESTION 18 ***********************************************/

-- CREATE NEW TABLE FROM EMP_DETAILS WHERE DEPARTMENT ID IS 20_RD --

CREATE TABLE EMP_DETAILS_20RD AS SELECT * FROM EMP_DETAILS WHERE DEPARTMENT_ID = '20_RD';

/********************************************** QUESTION 19 ***********************************************/

-- INSERT ALL RECORD IN EMP_DETAILS_20RD FROM EMP_DETAILS --

INSERT INTO EMP_DETAILS_20RD SELECT * FROM EMP_DETAILS;

-- IF WANT TO INSERT ONLY PARTICULAR COLUMN THEN --

INSERT INTO EMP_DETAILS_20RD(EMP_ID,FIRST_NAME) SELECT EMP_ID,FIRST_NAME FROM EMP_DETAILS;

/********************************************** QUESTION 20 ***********************************************/

-- DISPLAY EMP DETAILS WHOSE SALARY BETWEEN 25000 AND 50000 AND DEPARTMENT_ID IS 20_RD --

SELECT * FROM EMP_DETAILS WHERE (SALARY BETWEEN 25000 AND 50000) AND DEPARTMENT_ID = '20_RD';

/********************************************** QUESTION 21 ***********************************************/

--DISPLAY EMP DETAILS WHOSE SALARY IS NULL --

SELECT * FROM EMP_DETAILS WHERE SALARY IS NULL;

/********************************************** QUESTION 22 ***********************************************/

-- EMP DETAILS WHOSE EMP_ID IS 106 OR 111 --

SELECT * FROM EMP_DETAILS WHERE EMP_ID = 106 OR EMP_ID = 111;

-- USE IN CLAUSE --

SELECT * FROM EMP_DETAILS WHERE EMP_ID IN (106,111);

-- USE ANY OPERATOR --

SELECT * FROM EMP_DETAILS WHERE EMP_ID = ANY(106,111);

-- LIKE OPERATOR --

SELECT * FROM EMP_DETAILS WHERE EMP_ID LIKE '106' OR EMP_ID LIKE '111';

-- USING SOME --

SELECT * FROM EMP_DETAILS WHERE EMP_ID = SOME(106,111);

/********************************************** QUESTION 23 ***********************************************/

-- RENAME TABLE --

RENAME EMP_DTL_20 TO EMP_DTLS_20RD;

-- OR --

ALTER TABLE EMP_DTLS_20RD RENAME TO EMP_DTL_20;

/********************************************** QUESTION 24 ***********************************************/

-- ADD GENDER COLUMN IN EMP_DETAILS --

ALTER TABLE EMP_DETAILS ADD  GENDER VARCHAR2(10);

/********************************************** QUESTION 25 ***********************************************/

-- DROP GENDER COLUMN --

ALTER TABLE EMP_DETAILS DROP COLUMN GENDER;

/********************************************** QUESTION 26 ***********************************************/

-- UPDATE EMP_DETAILS WHERE EMP_ID IS 108 --

UPDATE EMP_DETAILS 
SET FIRST_NAME = 'JOHNNY' , EMAIL_ID = 'johnny1223@gamil.com'
WHERE EMP_ID = 108;

/********************************************** QUESTION 27 ***********************************************/

-- DELETE RECORDS WHERE SALARY HIGHER THAN 50000 OR FIRST_NAME START WITH 'C' --

DELETE FROM EMP_DETAILS WHERE SALARY > 50000 OR FIRST_NAME LIKE 'C%';

/********************************************** QUESTION 29 ***********************************************/

-- DELETE ALL RECORDS FROM EMP_DTLS_20RD --

DELETE FROM EMP_DTLS_20RD;

-- OR --

TRUNCATE TABLE EMP_DTLS_20RD:

/********************************************** QUESTION 30 ***********************************************/

-- CREATE NEW USER INFA WITH PASSWORD INFA --

CREATE USER INFA IDENTIFIED BY INFA;

/********************************************** QUESTION 31 ***********************************************/

-- GIVE PERMISSIONS TO INFA USER --

GRANT DBA TO INFA:

/********************************************** QUESTION 37 ***********************************************/

-- CHANGE COLUMN NAME FIRST_NAME TO F_NAME --

ALTER TABLE EMP_DETAILS 
RENAME COLUMN FIRST_NAME TO F_NAME;

/**********************************************************************************************************/