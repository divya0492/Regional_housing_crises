drop table if exists Rents;
drop table if exists Rental_Unit;
drop table if exists Property;
drop table if exists Builder;
drop table if exists Person;
drop table if exists City;
drop table if exists Province;

go

create table Province (
    Province_ID INT PRIMARY KEY,
    Total_Population INT
);

go

create table City (
    City_ID INT PRIMARY KEY,
    Population_Density INT,
    Province_ID INT FOREIGN KEY REFERENCES Province(Province_ID)
);

go

create table Property (
    Property_ID INT PRIMARY KEY,
    Address VARCHAR(255),
    Postal_Code VARCHAR(20),
    Year_Built INT,
    City_ID INT FOREIGN KEY REFERENCES City(City_ID)
);

go

create table Builder (
    Builder_ID INT PRIMARY KEY,
    No_of_Projects INT,
    Address VARCHAR(255),
    Property_ID INT FOREIGN KEY REFERENCES Property(Property_ID)
);

go

create table Rental_Unit (
    RentalUnit_ID INT PRIMARY KEY,
    Floor INT,
    Room INT,
    Property_ID INT FOREIGN KEY REFERENCES Property(Property_ID)
);

go

create table Person (
    Person_ID INT PRIMARY KEY,
    Age_Group VARCHAR(50),
    Income_Level VARCHAR(50)
);

go

create table Rents (
    Rent DECIMAL(10,2),
    StartDate DATE,
    EndDate DATE,
    RentalUnit_ID INT FOREIGN KEY REFERENCES Rental_Unit(RentalUnit_ID),
    Person_ID INT FOREIGN KEY REFERENCES Person(Person_ID),
    PRIMARY KEY (RentalUnit_ID, Person_ID, StartDate)
);

go