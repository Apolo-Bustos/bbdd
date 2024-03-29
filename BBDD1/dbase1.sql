	
	CREATE DATABASE HR;
	
	USE HR;

	CREATE TABLE JOB_HISTORY (
		START_DATE DATE,
		END_DATE DATE
	);
	
	CREATE TABLE EMPLOYEES (
		EMPLOYEE_ID INT(6),
		FIRTS_NAME VARCHAR(20),
		LAST_NAME VARCHAR(25),
		EMAIL VARCHAR(20),
		PHONE_INT VARCHAR(20),
		HIRE_DATE DATE,
		SALARY INT(8.2),
		COMISSION_PCT INT(2.2)
	
	);
	
	CREATE TABLE DEPARTMENTS (
		DEPARTMENT_ID INT(4),
		DEPARTMENT_NAME VARCHAR(30)
	
	);
	
	CREATE TABLE LOCATIONS (
		LOCATION_ID INT(4),
		STREET_ADDRESS VARCHAR(40),
		POSTAL_CODE VARCHAR(12),
		CITY VARCHAR(30),
		STATE_PROVINCE VARCHAR(2)
		
	);

	CREATE TABLE JOBS (
		JOB_ID VARCHAR(10),
		JOB_TITLE VARCHAR(15),
		MIN_SALARY INT(6),
		MAX_SALARY INT(6)
		
	);
	
	CREATE TABLE COUNTRIES (
		COUNTRY_ID VARCHAR(2),
		COUNTRY_NAME VARCHAR(40)
		
	);

	CREATE TABLE REGIONS (
		REGION_ID INT(2),
		REGION_NAME VARCHAR(25)
		
	);

/* PRIMARY */
    
    
	ALTER TABLE JOB_HISTORY 
		ADD EMPLOYEE_ID INT(6) NOT NULL,
		ADD START_DATE DATE PRIMARY KEY ;
		
	ALTER TABLE EMPLOYEES
		ADD EMPLOYEE_ID INT(6) PRIMARY KEY ,
		ADD EMAIL VARCHAR(20)  UNIQUE KEY;
		
	ALTER TABLE DEPARTMENTS
		ADD DEPARTMENT_ID INT(4) PRIMARY KEY ;
		
	ALTER TABLE LOCATIONS
		ADD DEPARTMENT_ID INT(4) PRIMARY KEY;
		
	ALTER TABLE JOBS
		ADD JOB_ID VARCHAR(10) PRIMARY KEY;
		
	ALTER TABLE COUNTRIES
		ADD COUNTRY_ID VARCHAR(2) PRIMARY KEY;
		
	ALTER TABLE REGIONS
		ADD REGION_ID INT(2) PRIMARY KEY;
		
        
/* FOREIGN */

	ALTER TABLE COUNTRIES
		ADD FOREIGN KEY (REGION_ID) REFERENCES REGIONS(REGION_ID);
		
	ALTER TABLE LOCATIONS
		ADD FOREIGN KEY (COUNTRY_ID) REFERENCES COUNTRIES(COUNTRY_ID);
 
	ALTER TABLE DEPARTMENTS
		ADD FOREIGN KEY (LOCATION_ID) REFERENCES LOCATIONS (LOCATION_ID),
		ADD FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMPLOYEE_ID);
 
	ALTER TABLE JOB_HISTORY
		ADD FOREIGN KEY (JOB_ID) REFERENCES JOBS (JOB_ID),
		ADD FOREIGN KEY (DEPARTMENT_ID) REFERENCES DEPARTMENTS (DEPARTMENT_ID);
		/* PRIMARY FOREIGN */

	ALTER TABLE EMPLOYEES
		ADD EMAIL VARCHAR(25) UNIQUE,
		ADD FOREIGN KEY (JOB_ID) REFERENCES JOBS (JOB_ID);
		/* ADD FOREIGN KEY (MANAGER_ID) ; */









    
    
    