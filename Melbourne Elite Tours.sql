Create Database Travel;
Use Travel;
create table Person (
person_id int primary key,
name varchar(255),
sex char(1),
age int);
Desc Person;

create table Address (
address_id int primary key,
zip_code varchar(20),
street varchar(255),
street_number varchar(10),
city varchar(255),
country varchar(255),
province_state varchar(255),
person_id int);
Desc Address;

create table PhoneNumber (
phone_id int primary key,
phone_number varchar(20),
person_id int);
Desc PhoneNumber;

create table EmailAddress (
email_id int primary key,
person_id int,
email_address varchar(255));
Desc EmailAddress;

create table Customer (
customer_id int primary key,
person_id int,
type varchar(20),
tour_id int);
Desc Customer;

create table Tour (
tour_id int primary key,
itinerary text,
status varchar(20));
Desc Tour;

create table TourGuide (
guide_id int primary key,
person_id int,
tour_id int);
Desc TourGuide;

create table Employee (
employee_id int primary key,
person_id int,
tour_id int);
Desc Employee;

create table TourParticipant (
participant_id int primary key,
person_id int,
tour_id int,
amount_paid decimal(10, 2));
Desc TourParticipant;


create table Itinerary (
itinerary_id int primary key,
tour_id int,
tour_date date,
breakfast_location varchar(255),
lunch_location varchar(255),
dinner_location varchar(255),
accommodation_location varchar(255),
room_type varchar(20),
activities text);
Desc Itinerary;


insert into Person (person_id, name, sex, age)
values
    (1, 'Arpit Agrawal', 'M', 21),
    (2, 'Neha Sharma', 'F', 22),
    (3, 'Ashfaq Khan', 'M', 23),
	(4, 'Rohit kumar', 'M', 24),
	(5, 'Akash Sharma', 'F', 25);
Select * from Person;
    
insert into Address (address_id, person_id, country, province_state, city, street, street_number, zip_code)
values
    (1, 1, 'INDIA', 'Rajastha', 'Jaipur', 'MST', '11', '30001'),
    (2, 2, 'INDIA', 'Rajastha', 'Jaipur', 'MST', '12', '30002'),
	(3, 3, 'INDIA', 'Rajastha', 'Jaipur', 'MST', '13', '30003'),
    (4, 4, 'INDIA', 'Rajastha', 'Jaipur', 'MST', '14', '30004'),
    (5, 5, 'INDIA', 'Rajastha', 'Jaipur', 'MST', '15', '30005');
Select * from Address;

insert into PhoneNumber (phone_id, person_id, phone_number)
values
    (1, 1, '999-1234'),
    (2, 2, '999-5678'),
	(3, 3, '999-9012'),
    (4, 4, '999-3456'),
    (5, 5, '999-7890');
Select * from PhoneNumber;

insert into EmailAddress (email_id, person_id, email_address)
values
    (1, 1, 'arpit.ag@example.com'),
    (2, 2, 'neha.sh@example.com'),
	(3, 3, 'ashfaq.kh@example.com'),
    (4, 4, 'rohit.ku@example.com'),
    (5, 5, 'akash.sh@example.com');
Select * from EmailAddress; 
   
insert into Customer (customer_id, person_id, type, tour_id)
values
    (1, 1, 'old', 1),
    (2, 2, 'current', 2),
	(3, 3, 'young', 3),
    (4, 4, 'old', 4),
    (5, 5, 'young', 5);
Select * from Customer;

insert into Tour (tour_id, itinerary, status)
values
     (1, 'Great Ocean Road Adventure', 'in-the-future'),
    (2, 'Yarra Valley Escape', 'in-progress'),
    (3, 'City Exploration Tour', 'completed'),
    (4, 'Wildlife Safari', 'in-the-future'),
    (5, 'Alpine Retreat', 'in-progress');
Select * from Tour;
    
insert into TourGuide (guide_id, person_id, tour_id)
values
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);
Select * from TourGuide; 
    
insert into Employee (employee_id, person_id, tour_id)
values
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3),
    (4, 4, 4),
    (5, 5, 5);
Select * from Employee;

insert into TourParticipant (participant_id, person_id, tour_id, amount_paid)
values
    (1, 2, 1, 1500.00),
    (2, 4, 2, 2000.00),
    (3, 6, 3, 2500.00),
    (4, 8, 4, 3000.00),
    (5, 10,5, 3500.00);
Select * from TourParticipant;

insert into Itinerary (itinerary_id, tour_id, tour_date, breakfast_location, lunch_location, dinner_location, accommodation_location, room_type, activities)
VALUES
    (1, 1, '2024-03-01', 'Café A', 'Bistro F', 'Restaurant K', 'Hotel P', 'Private', 'Sightseeing, Hiking'),
    (2, 2, '2024-04-02', 'Café B', 'Bistro G', 'Restaurant L', 'Hotel Q', 'Private', 'Sightseeing, Hiking'),
    (3, 3, '2024-05-03', 'Café C', 'Bistro H', 'Restaurant M', 'Hotel R', 'Private', 'Sightseeing, Hiking'),
    (4, 4, '2024-06-04', 'Café D', 'Bistro I', 'Restaurant N', 'Hotel S', 'Private', 'Sightseeing, Hiking'),
    (5, 5, '2024-07-05', 'Café E', 'Bistro J', 'Restaurant O', 'Hotel T', 'Private', 'Sightseeing, Hiking');
Select * from Itinerary;


Select * from Customer;

Select p.name as first_name, p.person_id, a.zip_code from Person p
JOIN Address a on p.person_id = a.person_id where a.zip_code in ('3572', '3052');

Select * from Tour where status = 'completed';

Select c.customer_id, p.name as first_name, p.person_id, t.itinerary, t.status from Customer c join Person p on c.person_id = p.person_id join Tour t on c.tour_id = t.tour_id
where t.tour_id = 3;

Select c.customer_id, p.name as first_name, p.person_id, t.itinerary, t.status from Customer c
join Person p on c.person_id = p.person_id
join Tour t on c.tour_id = t.tour_id where t.status = 'in-progress';

SELECT c.customer_id, p.name AS first_name, p.person_id, t.itinerary, t.status, tp.amount_paid FROM Customer c JOIN Person p ON c.person_id = p.person_id
JOIN Tour t ON c.tour_id = t.tour_id JOIN TourParticipant tp ON c.person_id = tp.person_id WHERE tp.amount_paid BETWEEN 2500 AND 3500;




