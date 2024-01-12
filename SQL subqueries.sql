-- INSERT INTO Doctors VALUES (1,'Dr.Harsh','Dietician','Monday','9876543210',5),
-- (2,'Dr.Simran','Cardiologist','Tuesday','995671866',6),
-- (3,'Dr.Abhishek','Gynecologist','Monday','8756128765',4),
-- (4,'Dr.Tanuja','Dietician','Tuesday','9875617286',2),
-- (1,'Dr.Vedant','Cardiologist','Monday','678195278',10),
-- (5,'Dr.Sanika','Gynecologist','Monday','9876524516',2),
-- (6,'Dr.Nitish','Neurologist','Saturday','7651862542',4),
-- (7,'Dr.Sanskriti','Dietician','Tuesday','9876545678',5),
-- (8,'Dr.Pranali','Gynecologist','Monday','7689018765',6),
-- (9,'Dr.Paavana','Dietician','Sunday','6789156278',10),
-- (10,'Dr.Devang','Cardiologist','Monday','18976254187',10),
-- (11,'Dr.Rutuja','Dietician','Wednesday','18726578976',5),
-- (12,'Dr.Gayatri','Neurologist','Sunday','98735678176',6),
-- (13,'Dr.Amar','Dietician','Thursday','7890876543',5),
-- (14,'Dr.Aditya','Cardiologist','Friday','6789098765',4),
-- (15,'Dr.Salil','Dietician','Tuesday','9872456789',2),
-- (16,'Dr.Prajwal','Gynecologist','Saturday','9865435671',6),
-- (17,'Dr.Sami','Cardiologist','Friday','9876543245',5),
-- (18,'Dr.Sakshi','Neurologist','Wednesday','9876547892',5),
-- (19,'Dr.Aadinath','Gynecologist','Thursday','9875672897',10);

-- INSERT INTO Patients VALUES(1,'shruti','Dr.Simran','01-02-22',1,'Good',200),
-- (2,'rahul','Dr.Simran','01-02-22',1,'Good',200),
-- (3,'rohit','Dr.Abhishek','01-02-22',2,'Intermediate',400),
-- (4,'raj','Dr.Tanuja','01-02-22',3,'Good',200),
-- (5,'roshan','Dr.Simran','01-02-22',1,'Intermediate',200),
-- (6,'nupur','Dr.Harsh','02-02-22',1,'Bad',100),
-- (7,'sahil','Dr.Abhishek','02-02-22',2,'Better',600),
-- (8,'shreya','Dr.Vedant','02-02-22',5,'Good',200),
-- (9,'tanvi','Dr.Tanuja','03-02-22',3,'Bad',500),
-- (10,'dipti','Dr.Simran','03-02-22',1,'Intermediate',400),
-- (11,'snehal','Dr.Abhishek','03-02-22',2,'Better',100),
-- (12,'abhijit','Dr.Simran','04-02-22',1,'Good',200),
-- (13,'anam','Dr.Vedant','04-02-22',5,'Bad',500),
-- (14,'sanyukta','Dr.Simran','04-02-22',1,'Intermediate',500),
-- (15,'smruti','Dr.Simran','01-03-22',1,'Good',600),
-- (16,'siddhesh','Dr.Abhishek','01-03-22',2,'Good',200),
-- (17,'krutik', 'Dr.Vedant','01-03-22',5,'Bad',500),
-- (18,'jay','Dr.Tanuja','02-03-22',3,'Good',500),
-- (19,'jayant','Dr.Simran','02-03-22',1,'Intermediate',200),
-- (20,'vineet','Dr.Vedant','01-04-22',5,'Better',400),
-- (21,'riddhi','Dr.Abhishek','01-04-22',2,'Bad',200),
-- (22,'vishaka','Dr.Harsh','02-05-22',4,'Good',100),
-- (23,'sarthak','Dr.Simran','02-05-22',1,'Good',400),
-- (24,'yash','Dr.Vedant','02-04-22',5,'Better',500),
-- (25,'suraj','Dr.Sanika','04-05-22',6,'Good',200);

-- INSERT INTO Ward VALUES(1,1,10,3),
-- (2,1,12,4),
-- (3,1,13,3),
-- (4,1,10,3),
-- (5,2,9,2),
-- (6,2,8,3),
-- (7,2,10,4),
-- (8,2,9,3),
-- (9,3,13,2),
-- (10,3,10,3),
-- (11,3,13,2),
-- (12,4,10,3),
-- (13,4,9,4);

-- INSERT INTO Medicines VALUES('01-02-22','Dr.Simran',1,20,40),
-- ('01-02-22','Dr.Harsh',4,30,50),
-- ('01-02-22','Dr.Vedant',5,10,30),
-- ('02-02-22','Dr.Abhishek',2,20,40),
-- ('02-02-22','Dr.Tanuja',3,40,60),
-- ('02-02-22','Dr.Sanika',6,10,35),
-- ('02-02-22','Dr.Rutuja',7,34,67),
-- ('03-02-22','Dr.Simran',1,20,40),
-- ('03-02-22','Dr.Harsh',4,15,43),
-- ('03-02-22','Dr.Simran',1,20,40),
-- ('01-03-22','Dr.Vedant',5,12,24),
-- ('01-03-22','Dr.Simran',1,23,34),
-- ('01-03-22','Dr.Abhishek',2,33,45),
-- ('02-03-22','Dr.Harsh',4,22,43),
-- ('02-03-22','Dr.Simran',1,20,40),
-- ('01-04-22','Dr.Vedant',5,20,40),
-- ('01-04-22','Dr.Tanuja',3,22,45);


-- Q1.  Display patient names recommending Dr.Simran.
select Patient_name from patients 
where Doctor_name = 'Dr.Simran';

-- Q2. Display number of patients treated by the same doctor and in the same ward.
select Doctor_name, Ward_no,count(Patient_name) 'Patient Treated' from patients
group by Doctor_name,ward_no
order by ward_no;



-- Q3. Display the average fees taken by each Doctor.
select Doctor_name, avg(Fees) 'Average charge'from patients
group by Doctor_name;

-- Q4. Which specialist has used the maximum number of injections on date ‘01-02-22’?
select m.doctor_name,d.specialty,m.injections from medicines m
inner join doctors d 
on m.Doctor_name = d.doctor_name
where date = '01-02-22'
group by m.doctor_name;

-- Q5. How many nurses were present on Wednesday with Dr.Rutuja? 
select t.doctor_name,w.ward_no,w.nurses from timetable t,ward w
where t.ward_no = w.ward_no and t.day = 'wednesday'
and t.doctor_name in (select doctor_name from timetable where doctor_name = 'dr.rutuja');

-- Q6. At what time is Dr.Rutuja available on Wednesday?
select Day,doctor_name,time from timetable where doctor_name ='Dr.rutuja' and day = 'wednesday';

-- Q7. Count of patients with good condition treated by each doctor?
select Doctor_name, count(condi_tion) 'number of good condition patients ' from patients where condi_tion ='good' group by doctor_name;

-- Q8. Wards on which floor has used the minimum number of medicines on date ‘02-02-22’?
select w.ward_no,w.floor,min(m.medicines) 'minimun number of medicines on 02-02-22' 
from ward w,medicines m
where w.ward_no = m.ward_no and date = '02-02-22';


-- Q9. Display ward no. having minimum number of beds.
select ward_no,min(beds) 'Minimun number of beds' from ward;

-- Q10. Display total experience of doctors with specialty as ‘Cardiologist’.
