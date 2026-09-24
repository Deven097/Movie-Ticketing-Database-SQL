CREATE DATABASE MovieTicketDB;
USE MovieTicketDB;

-- 1. MOVIES
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Genre VARCHAR(50),
    Language VARCHAR(30),
    Duration INT,
    ReleaseDate DATE
);

INSERT INTO Movies VALUES
(1,'Avengers Endgame','Action','English',181,'2019-04-26'),
(2,'3 Idiots','Comedy','Hindi',170,'2009-12-25'),
(3,'Dangal','Drama','Hindi',161,'2016-12-23'),
(4,'Inception','Sci-Fi','English',148,'2010-07-16'),
(5,'Interstellar','Sci-Fi','English',169,'2014-11-07'),
(6,'Jawan','Action','Hindi',169,'2023-09-07'),
(7,'Pathaan','Action','Hindi',146,'2023-01-25'),
(8,'RRR','Action','Telugu',187,'2022-03-25'),
(9,'KGF Chapter 2','Action','Kannada',168,'2022-04-14'),
(10,'Drishyam 2','Thriller','Hindi',140,'2022-11-18'),
(11,'Bahubali 2','Action','Telugu',167,'2017-04-28'),
(12,'Zindagi Na Milegi Dobara','Drama','Hindi',155,'2011-07-15'),
(13,'Taare Zameen Par','Drama','Hindi',165,'2007-12-21'),
(14,'The Dark Knight','Action','English',152,'2008-07-18'),
(15,'Titanic','Romance','English',195,'1997-12-19'),
(16,'Pushpa','Action','Telugu',179,'2021-12-17'),
(17,'Kabir Singh','Romance','Hindi',173,'2019-06-21'),
(18,'War','Action','Hindi',154,'2019-10-02'),
(19,'Barfi','Romance','Hindi',151,'2012-09-14'),
(20,'PK','Comedy','Hindi',153,'2014-12-19');


-- 2. THEATERS
CREATE TABLE Theaters (
    TheaterID INT PRIMARY KEY,
    TheaterName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

INSERT INTO Theaters VALUES
(1,'PVR Cinemas','Andheri'),
(2,'INOX','Malad'),
(3,'Cinepolis','Thane'),
(4,'Miraj Cinemas','Borivali'),
(5,'MovieMax','Bhandup'),
(6,'PVR Icon','Lower Parel'),
(7,'INOX Megaplex','Kurla'),
(8,'Cinepolis','Vashi'),
(9,'PVR Cinemas','Ghatkopar'),
(10,'Carnival Cinemas','Mulund'),
(11,'INOX','Worli'),
(12,'PVR Cinemas','Dadar'),
(13,'Miraj Cinemas','Navi Mumbai'),
(14,'Cinepolis','Powai'),
(15,'PVR Cinemas','Juhu'),
(16,'INOX','Borivali'),
(17,'MovieMax','Thane'),
(18,'Carnival Cinemas','Andheri'),
(19,'PVR Cinemas','Kurla'),
(20,'INOX','Goregaon');


-- 3. SCREENS
CREATE TABLE Screens (
    ScreenID INT PRIMARY KEY,
    TheaterID INT,
    ScreenName VARCHAR(50),
    Capacity INT,
    FOREIGN KEY (TheaterID) REFERENCES Theaters(TheaterID)
);

INSERT INTO Screens VALUES
(1,1,'Screen 1',100),
(2,1,'Screen 2',120),
(3,2,'Screen 1',150),
(4,2,'Screen 2',100),
(5,3,'Screen 1',200),
(6,3,'Screen 2',150),
(7,4,'Screen 1',120),
(8,5,'Screen 1',100),
(9,6,'Screen 1',180),
(10,7,'Screen 1',200),
(11,8,'Screen 1',150),
(12,9,'Screen 1',120),
(13,10,'Screen 1',100),
(14,11,'Screen 1',160),
(15,12,'Screen 1',180),
(16,13,'Screen 1',120),
(17,14,'Screen 1',200),
(18,15,'Screen 1',150),
(19,16,'Screen 1',100),
(20,17,'Screen 1',140);


-- 4. SEATS
CREATE TABLE Seats (
    SeatID INT PRIMARY KEY,
    ScreenID INT,
    SeatNumber VARCHAR(10),
    SeatType VARCHAR(30),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);

INSERT INTO Seats VALUES
(1,1,'A1','Regular'),
(2,1,'A2','Regular'),
(3,1,'A3','Regular'),
(4,1,'A4','Premium'),
(5,2,'A1','Regular'),
(6,2,'A2','Regular'),
(7,2,'A3','Premium'),
(8,3,'A1','Regular'),
(9,3,'A2','Premium'),
(10,3,'A3','Premium'),
(11,4,'A1','Regular'),
(12,4,'A2','Regular'),
(13,5,'A1','Premium'),
(14,5,'A2','Premium'),
(15,6,'A1','Regular'),
(16,6,'A2','Premium'),
(17,7,'A1','Regular'),
(18,8,'A1','Regular'),
(19,9,'A1','Premium'),
(20,10,'A1','Premium');


-- 5. CUSTOMERS
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

INSERT INTO Customers VALUES
(1,'Rahul Sharma','rahul@gmail.com','9876543210'),
(2,'Amit Patil','amit@gmail.com','9876543211'),
(3,'Priya Shah','priya@gmail.com','9876543212'),
(4,'Neha Joshi','neha@gmail.com','9876543213'),
(5,'Rohan Mehta','rohan@gmail.com','9876543214'),
(6,'Sneha Desai','sneha@gmail.com','9876543215'),
(7,'Akash More','akash@gmail.com','9876543216'),
(8,'Pooja Kulkarni','pooja@gmail.com','9876543217'),
(9,'Karan Singh','karan@gmail.com','9876543218'),
(10,'Anjali Patil','anjali@gmail.com','9876543219'),
(11,'Vivek Shah','vivek@gmail.com','9876543220'),
(12,'Sakshi Joshi','sakshi@gmail.com','9876543221'),
(13,'Aditya Mehta','aditya@gmail.com','9876543222'),
(14,'Riya Desai','riya@gmail.com','9876543223'),
(15,'Nikhil More','nikhil@gmail.com','9876543224'),
(16,'Isha Kulkarni','isha@gmail.com','9876543225'),
(17,'Manish Singh','manish@gmail.com','9876543226'),
(18,'Kavya Patil','kavya@gmail.com','9876543227'),
(19,'Sahil Shah','sahil@gmail.com','9876543228'),
(20,'Aarav Joshi','aarav@gmail.com','9876543229');


-- 6. SHOWS
CREATE TABLE Shows (
    ShowID INT PRIMARY KEY,
    MovieID INT,
    ScreenID INT,
    ShowDate DATE,
    ShowTime TIME,
    FOREIGN KEY (MovieID) REFERENCES Movies(MovieID),
    FOREIGN KEY (ScreenID) REFERENCES Screens(ScreenID)
);

INSERT INTO Shows VALUES
(1,1,1,'2026-08-15','10:00:00'),
(2,2,2,'2026-08-15','13:00:00'),
(3,3,3,'2026-08-15','16:00:00'),
(4,4,4,'2026-08-15','19:00:00'),
(5,5,5,'2026-08-16','10:30:00'),
(6,6,6,'2026-08-16','13:30:00'),
(7,7,7,'2026-08-16','16:30:00'),
(8,8,8,'2026-08-16','19:30:00'),
(9,9,9,'2026-08-17','10:00:00'),
(10,10,10,'2026-08-17','13:00:00'),
(11,11,11,'2026-08-17','16:00:00'),
(12,12,12,'2026-08-17','19:00:00'),
(13,13,13,'2026-08-18','10:30:00'),
(14,14,14,'2026-08-18','13:30:00'),
(15,15,15,'2026-08-18','16:30:00'),
(16,16,16,'2026-08-18','19:30:00'),
(17,17,17,'2026-08-19','10:00:00'),
(18,18,18,'2026-08-19','13:00:00'),
(19,19,19,'2026-08-19','16:00:00'),
(20,20,20,'2026-08-19','19:00:00');


-- 7. BOOKINGS
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY,
    CustomerID INT,
    ShowID INT,
    BookingDate DATE,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ShowID) REFERENCES Shows(ShowID)
);

INSERT INTO Bookings VALUES
(1,1,1,'2026-08-10',250),
(2,2,2,'2026-08-10',300),
(3,3,3,'2026-08-10',400),
(4,4,4,'2026-08-11',250),
(5,5,5,'2026-08-11',500),
(6,6,6,'2026-08-11',300),
(7,7,7,'2026-08-11',350),
(8,8,8,'2026-08-12',250),
(9,9,9,'2026-08-12',500),
(10,10,10,'2026-08-12',300),
(11,11,11,'2026-08-12',400),
(12,12,12,'2026-08-13',250),
(13,13,13,'2026-08-13',300),
(14,14,14,'2026-08-13',450),
(15,15,15,'2026-08-13',500),
(16,16,16,'2026-08-13',300),
(17,17,17,'2026-08-13',350),
(18,18,18,'2026-08-13',250),
(19,19,19,'2026-08-13',400),
(20,20,20,'2026-08-13',300);


-- 8. BOOKING SEATS
CREATE TABLE BookingSeats (
    BookingID INT,
    SeatID INT,
    Price DECIMAL(10,2),
    PRIMARY KEY (BookingID, SeatID),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID),
    FOREIGN KEY (SeatID) REFERENCES Seats(SeatID)
);

INSERT INTO BookingSeats VALUES
(1,1,250),
(2,5,300),
(3,8,400),
(4,11,250),
(5,13,500),
(6,15,300),
(7,17,350),
(8,18,250),
(9,19,500),
(10,20,300),
(11,14,400),
(12,2,250),
(13,6,300),
(14,9,450),
(15,10,500),
(16,16,300),
(17,12,350),
(18,7,250),
(19,3,400),
(20,4,300);


-- 9. PAYMENTS
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10,2),
    PaymentMethod VARCHAR(30),
    PaymentStatus VARCHAR(30),
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID)
);

INSERT INTO Payments VALUES
(1,1,250,'UPI','Paid'),
(2,2,300,'Credit Card','Paid'),
(3,3,400,'UPI','Paid'),
(4,4,250,'Debit Card','Paid'),
(5,5,500,'UPI','Paid'),
(6,6,300,'Cash','Paid'),
(7,7,350,'Credit Card','Paid'),
(8,8,250,'UPI','Paid'),
(9,9,500,'Debit Card','Paid'),
(10,10,300,'UPI','Paid'),
(11,11,400,'Credit Card','Paid'),
(12,12,250,'UPI','Paid'),
(13,13,300,'Cash','Paid'),
(14,14,450,'Debit Card','Paid'),
(15,15,500,'UPI','Paid'),
(16,16,300,'Credit Card','Paid'),
(17,17,350,'UPI','Paid'),
(18,18,250,'Cash','Paid'),
(19,19,400,'Debit Card','Paid'),
(20,20,300,'UPI','Paid');

show tables;

select * from Bookings;
select * from Movies;
select * from Theaters;
select * from Customers;
select * from Screens;
select * from Shows;
select * from Seats;
select * from Payments;
select * from Bookingseats;

#count of movies 
select count(MovieID) from Movies;

#count movie genre
select Genre, count(Genre) from Movies 
group by Genre;

#duration of movies
select MovieID, Title, Duration 
from Movies;

#average duration of movies
select avg(Duration) from Movies;

#longest movie
select max(Duration) from Movies;

#Shortest Movie
select min(duration) from Movies;

#count of movies by language
select Language, count(Language) from Movies 
group by Language;

#movie name and language 
select Title, Language from Movies;

#price of movies 
select m.MovieID, m.Title, m.Duration, bs.Price
from Movies as m join Shows as s
on m.MovieID = s.MovieID 
join Booking as b 
on s.ShowID = b.ShowID 
join BookingSeats as bs 
on bs.BookingID = s.BookingId ;

#count of theaters
select count(TheaterID) from THeaters;

#count of name of theater
select TheaterName, count(TheaterName) as Number_of_Branches from Theaters
group by TheaterName;

#count of theater as per location 
select Location, count(Location) as Number_of_Branches from Theaters
group by Location;

#theater name and location
select TheaterName, Location from Theaters;

#count of total screens
select count(ScreenID) as Total_Screens from Screens;

#theater with most screens 
select TheaterID, count(*) as Total_Screens from Screens
group by TheaterID ;

#theater capacity
select TheaterId, Capacity from Screens;

#avg capacity of theater
select avg(Capacity) from Screens;

#highest capacity theater
select t.TheaterID, t.TheaterName, sum(s.Capacity) as Total_Capacity
from Theaters t join Screens s
on t.TheaterID = s.TheaterID 
group by t.TheaterID, t.TheaterName 
order by Total_Capacity desc limit 1;

#number of seatIDS 
select count(SeatID) from Seats;

#Theater with their seats capacity
select t.TheaterID, t.TheaterName, sum(se.SeatID) as Total_Seats 
from Theaters t join Screens s 
on t.TheaterID = s.TheaterID 
join Seats se 
on s.ScreenID = se.ScreenID 
group by t.TheaterID, t.TheaterName;

#Theater with most screens 
select t.TheaterID, t.TheaterName, sum(s.ScreenID) as Total_Screens 
from Theaters t join Screens s 
on t.TheaterID = s.TheaterID  
group by t.TheaterID, t.TheaterName;

#screen with seats 
select ScreenID , count(SeatID) as Total_Seats
from Seats 
group by ScreenID;

#type of seats 
select SeatType , count(SeatType) 
from Seats 
group by SeatType;

#show timings distribution 
select ShowID,
case
when ShowTime <= "12:00:00" then "Morning Show"
when ShowTime <= "17:00:00" then "Afternoon Show"
when ShowTime <= "19:00:00" then "Evening Show"
when ShowTime <= "21:00:00" then "Night Show"
end as Show_Type
from Shows;

#Booking Type
select s.ShowID;



#Movie Price distribution
select BookingID,
case
when TotalAmount <= 250 then "Low Price"
when TotalAmount <= "350" then "Medium Price"
when TotalAmount <= "500" then "High Price"
end as Price_Distribution
from Bookings;

#Method of payment
select PaymentMethod, count(PaymentMethod) as Count
from Payments
group by PaymentMethod;

#Movie Duration Distribution 
select Title, Duration, if(Duration > 160, "Long Movie" , "Short Movie") as type
from Movies;

#customer Details 
Create view Customer_Booking_view as
select c.CustomerID, c.Name, t.TheaterID, m.MovieID, m.MovieName, s.ScreenID, ss.SeatID, sh.ShowID, b.BookingID, p.PaymentID
from Customers c join Bookings b
on c.CustomerID = b.CustomerID
join Shows
on b.ShowID = sh.ShowID
join Movies 
on m.movieID = sh.MovieID
join Screens s 
on sh.ScreenID = s.ScreenID 
join Theaters
on s.TheaterID = t.TheaterID;


