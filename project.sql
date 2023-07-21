show databases;
create database project;
use project;

/* Write a query to create a patients table with the fields such as date, patient id, patient name, age, weight, gender, location, phone number, 
disease, doctor name, and doctor id.*/
create table patients_table(Date varchar(30), pid varchar(30), p_name varchar(50), age int, weight int, gender varchar(30),
location varchar(50),phone_no bigint, disease varchar(50),doctor_name varchar(50), doctor_id int );
desc patients_table;
drop table patients_table;

-- Write a query to insert values into the patients table.
insert into patients_table(Date,pid,p_name,age,weight,gender,location,phone_no,disease,doctor_name,doctor_id) 
values('2014-03-04','AP2021','Sarath',67,76,'Male','Chennai',8975262145,'Cardiac','Mohan',21),
      ('2019-07-18','AP2022','John',62,80,'Male','Banglore',9702354665,'Cancer','Suraj',22),
      ('2016-05-02','AP2023','Henry',43,65,'Male','Kerala',9758624583,'Liver','Mehta',23),
      ('2016-12-24','AP2024','Carl',56,72,'Female','Mumbai',8756954231,'Asthma','Karthik',24),
      ('2013-03-12','AP2025','Shikar',55,71,'Male','Delhi',9725364867,'Cardiac','Mohan',21),
      ('2014-12-06','AP2026','Piyush',47,59,'Male','Haryana',9836475982,'Cancer','Suraj',22),
      ('2017-03-25','AP2027','Stephen',69,55,'Male','Gujarat',7589684215,'Liver','Mehta',23),
      ('2014-02-28','AP2028','Aaron',75,53,'Male','Banglore',9863452175,'Asthma','Karthik',24);
select* from  patients_table;

-- Write a query to display the total number of patients in the table.
select count(*) from patients_table;

-- Write a query to display the patient id, patient name, gender, and disease of the patient whose age is maximum.
select max(age) from patients_table;
select* from patients_table 
where age=(select max(age) from patients_table);

-- Write a query to display patient id and patient name with the current date.
select curdate() Date, pid, p_name from patients_table;

-- Write a query to display the old patient’s name and new patient's name  in  uppercase.
select upper(p_name) as newPatientName 
from  patients_table;

-- Write a query to display the patient’s name along with the length of their name.
 select pid, p_name, length(p_name) as length from patients_table order by length,pid;

-- Write a query to display the patient’s name and the gender of the patient must be mentioned as M or F.
select p_name,
case when gender ='Male' then 'M' when gender = 'Female' then 'F' else 'Other' end 
from patients_table;

-- Write a query to combine the names of the patient and the doctor in a new column. 
 select CONCAT(p_name , '     ' , doctor_name ) as Name
 from patients_table;   

-- Write a query to display the patients’ age along with the logarithmic value (base 10) of their age.

select log10(age) from patients_table;

-- Write a query to extract the year from the given date in a separate column.
 select 
  extract(year from Date) as year 
  from patients_table;
  
-- Write a query to return NULL if the patient’s name and doctor’s name are similar else return the patient’s name.
  select doctor_name
  from patients_table
  group by doctor_name
  having count(*)>1;
      
-- Write a query to return Yes if the patient’s age is greater than 40 else return No.


-- Write a query to display the doctor’s duplicate name from the table.
select doctor_name,count(*) as occurrence from
patients_table group by doctor_name having count(*)>1;








