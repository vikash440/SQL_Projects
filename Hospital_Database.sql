create databASE Hospital_DB;

create table doctors
(
id int primary key,
name varchar(50) not null,
speciality varchar(100),
hospital varchar(50),
city varchar(50),
consultation_fee int
);


insert into doctors values
(1, 'Dr. Adeeb', 'Cosmetologist', 'Apollo Hospital', 'Bangalore', 1500),
(2, 'Dr. Ghani', 'gynecologist', 'Fortis Hospital', 'Bangalore', 2300),
(3, 'Dr. Usman', 'Homeopathy', 'KMC Hospital', 'Manipal', 1050),
(4, 'Dr. Javed', 'Dermatology', 'KMC Hospital', 'Manipal', 1600),
(5, 'Dr. Lateef', 'Physician', 'Apollo Hospital', 'Bangalore', 1900),
(6, 'Dr. Majid', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1300),
(7, 'Dr. Deepak', 'Cosmetologist', 'Apollo Hospital', 'Bangalore', 1500),
(8, 'Dr. Gohar', 'gynecologist', 'Fortis Hospital', 'Bangalore', 2300),
(9, 'Dr. Laraib', 'Homeopathy', 'Apollo Hospital', 'Manipal', 1050),
(10, 'Dr. Naveen', 'Dermatology', 'KMC Hospital', 'Manipal', 1600),
(11, 'Dr. Farjad', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1900),
(12, 'Dr. Majid', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1300),
(13, 'Dr. Deepak', 'Cosmetologist', 'Apollo Hospital', 'Bangalore', 1500),
(14, 'Dr. Gohar', 'gynecologist', 'Fortis Hospital', 'Bangalore', 2300),
(15, 'Dr. Umer', 'Homeopathy', 'KMC Hospital', 'Manipal', 1050),
(16, 'Dr. Maaz', 'Dermatology', 'Apollo Hospital', 'Manipal', 1600),
(17, 'Dr. Zafar', 'Physician', 'Gleneagles Hospital', 'Bangalore', 1900),
(18, 'Dr. Sandeep', 'Physician', 'Apollo Hospital', 'Bangalore', 1300),
(19, 'Dr. Deepak', 'Cosmetologist', 'Apollo Hospital', 'Bangalore', 1500),
(20, 'Dr. Gohar', 'gynecologist', 'Fortis Hospital', 'Bangalore', 2300);




create table Hospital_info  
(Hospital_id int, Hospital_name varchar(50), total_staff int, Address varchar(255) );

alter table Hospital_info alter column Hospital_id int ;

select * from Hospital_info;

insert into Hospital_info values 
(1, 'Apollo Hospital', 1200, 'West Street,Lakhpat Highway Banglore'),
(2, 'KMC Hospital', 250, '15th street Garden Town, Manipal'),
(3, 'Gleneagles Hospital', 220, 'Saddar street, Banglore West'),
(4, 'Fortis Hospital', 430, 'Eden street, Banglore');


/* delete all duplicate records  */

     select * from 
     (select e.*,
     row_number() over (partition by name order by id) as rn
     from doctors e ) x where x.rn =1 order by id;

/* Name of doctor who has cheapest consultation fees in a hospital with less then 1000 staff members */

    select top(1) name, speciality, hospital, total_staff, consultation_fee
    from doctors inner join Hospital_info on 
    doctors.hospital = Hospital_info.Hospital_name 
    where Hospital_info.total_staff <1000 order by consultation_fee Asc;


/*  Third highest consultation fees in physician speciality */

  select max(consultation_fee) as Third_Highest from doctors 
  where speciality = 'physician' and consultation_fee < (select max(consultation_fee) from 
  doctors where speciality = 'physician' and consultation_fee < (select max(consultation_fee) from doctors));





