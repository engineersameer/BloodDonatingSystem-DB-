
-- Creating tables in the database
Show tables from blooddonatingsystem;
Create table address
(
addressID int primary key,
City varchar(250),
State varchar(250),
street varchar(250),
HouseNO varchar(250)
);

Create table Doctor
(
doctorID int primary key,
first_Name varchar(250),
last_Name varchar(250),
addressID int,
CONSTRAINT constraint_name FOREIGN KEY (addressID) REFERENCES address(addressID)
);

Create table phoneNo
(
PhoneID int primary key,
phoneNo varchar(20)
);
rename table phoneNo to doctorPhoneNO;
alter table phoneNo 
add doctorID int,
add constraint fk_doctorID foreign key (doctorID) references doctor(doctorID);



create table donor
(
donorID int primary key,
first_Name varchar(100),
last_Name varchar(100),
gender varchar(100),
addressID int,
DOB date,
constraint fk_donorAddress foreign key (addressID) references address(addressID)
);

Create table DonorPhoneNo
(
PhoneID int primary key,
phoneNo varchar(20),
donor_id int,
constraint fk_donorID foreign key (donor_id) references donor(donorID) 
);

create table doctor_donor
(
doctorID int,
donorID int,
constraint fk_doctor foreign key (doctorID) references doctor (doctorID),
constraint fk_donor foreign key (donorID) references donor (donorID)
);

create table bloodBank(
bloodbankID int primary key,
bloodbankName varchar(20),
addressID int,
constraint fk_bloodbank_address foreign key (addressID) references address(addressID)
);

alter table bloodBank 
modify column bloodbankName varchar(250);

create table blood(
bloodID int,
bloodType varchar(10),
donorID int,
bloodbankID int,  
constraint fk_donor_blood foreign key (donorID) references donor(donorID),
constraint fk_bloodBank_blood foreign key (bloodbankID) references bloodbank(bloodbankID)
);

create table hospital_location
(
locationID int primary key,
state varchar(20),
city varchar(20),
locationNo int unique
);

create table patient(
patientID int,
first_name varchar(20),
last_name varchar(20),
addressID int,
hospitalLocation int,
constraint fk_LocationID_patient foreign key (hospitalLocation) references hospital_Location(locationID)
);
alter table patient
add column blood_bankID int,
add constraint fkblood_bankID_patient foreign key (blood_bankID) references bloodBank (bloodbankID);
alter table patient
add constraint pkpatientID primary key (patientID); 




-- inserting data into the tables
-- Insert 5 rows into the 'address' table
INSERT INTO address (addressID, City, State, street, HouseNO)
VALUES
    (1, 'New York', 'NY', '123 Main St', 'Apt 101'),
    (2, 'Los Angeles', 'CA', '456 Elm St', 'Unit 202'),
    (3, 'Chicago', 'IL', '789 Oak St', 'Suite 303'),
    (4, 'Houston', 'TX', '101 Pine St', 'Apt 404'),
    (5, 'Miami', 'FL', '202 Palm St', 'Unit 505');

-- Insert 5 rows into the 'Doctor' table
INSERT INTO Doctor (doctorID, first_Name, last_Name, addressID)
VALUES
    (1, 'John', 'Smith', 1),
    (2, 'Emily', 'Johnson', 2),
    (3, 'Michael', 'Williams', 3),
    (4, 'Sarah', 'Brown', 4),
    (5, 'David', 'Jones', 5);

-- Insert 5 rows into the 'doctorPhoneNO' table (previously 'phoneNo')
INSERT INTO doctorPhoneNO (PhoneID, phoneNo, doctorID)
VALUES
    (1, '123-456-7890', 1),
    (2, '987-654-3210', 2),
    (3, '111-222-3333', 3),
    (4, '444-555-6666', 4),
    (5, '777-888-9999', 5);

-- Insert 5 rows into the 'donor' table
INSERT INTO donor (donorID, first_Name, last_Name, gender, addressID, DOB)
VALUES
    (1, 'Michael', 'Brown', 'Male', 1, '1990-05-15'),
    (2, 'Jessica', 'Miller', 'Female', 2, '1985-10-20'),
    (3, 'David', 'Lee', 'Male', 3, '1988-03-25'),
    (4, 'Sarah', 'Clark', 'Female', 4, '1992-09-12'),
    (5, 'Daniel', 'Wilson', 'Male', 5, '1980-07-08');

-- Insert 5 rows into the 'DonorPhoneNo' table
INSERT INTO DonorPhoneNo (PhoneID, phoneNo, donor_id)
VALUES
    (1, '555-123-4567', 1),
    (2, '555-987-6543', 2),
    (3, '555-111-2222', 3),
    (4, '555-444-5555', 4),
    (5, '555-777-8888', 5);

-- Insert 5 rows into the 'doctor_donor' table
INSERT INTO doctor_donor (doctorID, donorID)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

-- Insert 5 rows into the 'bloodBank' table
INSERT INTO bloodBank (bloodbankID, bloodbankName, addressID)
VALUES
    (1, 'ABC Blood Bank', 1),
    (2, 'XYZ Blood Bank', 2),
    (3, 'Central Blood Bank', 3),
    (4, 'Community Blood Center', 4),
    (5, 'Regional Blood Center', 5);

-- Insert 5 rows into the 'blood' table
INSERT INTO blood (bloodID, bloodType, donorID, bloodbankID)
VALUES
    (1, 'A+', 1, 1),
    (2, 'B-', 2, 2),
    (3, 'O+', 3, 3),
    (4, 'AB-', 4, 4),
    (5, 'A-', 5, 5);

-- Insert 5 rows into the 'hospital_location' table
INSERT INTO hospital_location (locationID, state, city, locationNo)
VALUES
    (1, 'NY', 'New York City', 101),
    (2, 'CA', 'Los Angeles', 202),
    (3, 'IL', 'Chicago', 303),
    (4, 'TX', 'Houston', 404),
    (5, 'FL', 'Miami', 505);

-- Insert 5 rows into the 'patient' table
INSERT INTO patient (patientID, first_name, last_name, addressID, hospitalLocation, blood_bankID)
VALUES
    (1, 'David', 'Lee', 1, 1, 1),
    (2, 'Sarah', 'Clark', 2, 2, 2),
    (3, 'Michael', 'Brown', 3, 3, 3),
    (4, 'Emily', 'Johnson', 4, 4, 4),
    (5, 'John', 'Smith', 5, 5, 5);


show tables from blooddonatingsystem;
-- For the address table
SELECT * FROM address;

-- For the Doctor table
SELECT * FROM Doctor;

-- For the doctorPhoneNO table
SELECT * FROM doctorPhoneNO;

-- For the donor table
SELECT * FROM donor;

-- For the DonorPhoneNo table
SELECT * FROM DonorPhoneNo;

-- For the doctor_donor table
SELECT * FROM doctor_donor;

-- For the bloodBank table
SELECT * FROM bloodBank;

-- For the blood table
SELECT * FROM blood;

-- For the hospital_location table
SELECT * FROM hospital_location;

-- For the patient table
SELECT * FROM patient;

-- 1-  Retrieve the count of donors in each blood type category:
select b.bloodType, count(d.donorID) from donor d left join blood b on d.donorID = b.donorID group by b.bloodType;

select * from address;


-- 2- Find the doctors who are located in a city in which city spelling have letter a
select * from doctor d inner join address a on d.addressID=a.addressID where a.City like '%a%';
