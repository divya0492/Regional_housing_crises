-- 1. List all rental units along with their property addresses and city names
SELECT r.RentalUnit_ID, r.Floor, r.Room, p.Address AS Property_Address, c.City_ID
FROM Rental_Unit r
JOIN Property p ON r.Property_ID = p.Property_ID
JOIN City c ON p.City_ID = c.City_ID;

-- 2. Find the total number of rental units per city (Aggregation)
SELECT c.City_ID, COUNT(r.RentalUnit_ID) AS Total_Rental_Units
FROM City c
JOIN Property p ON c.City_ID = p.City_ID
JOIN Rental_Unit r ON p.Property_ID = r.Property_ID
GROUP BY c.City_ID;

-- 3. Retrieve tenants (persons) and their rental details, including rent amount and property location
SELECT per.Person_ID, per.Age_Group, per.Income_Level, r.Rent, p.Address AS Property_Address
FROM Rents r
JOIN Person per ON r.Person_ID = per.Person_ID
JOIN Rental_Unit ru ON r.RentalUnit_ID = ru.RentalUnit_ID
JOIN Property p ON ru.Property_ID = p.Property_ID;

-- 4. Calculate the average rent per city (Derived field and Aggregation)
SELECT c.City_ID, AVG(r.Rent) AS Avg_Rent
FROM Rents r
JOIN Rental_Unit ru ON r.RentalUnit_ID = ru.RentalUnit_ID
JOIN Property p ON ru.Property_ID = p.Property_ID
JOIN City c ON p.City_ID = c.City_ID
GROUP BY c.City_ID;

-- 5. Identify builders and the number of projects they have worked on along with city details
SELECT b.Builder_ID, b.No_of_Projects, p.Address AS Property_Address, c.City_ID, prov.Province_ID
FROM Builder b
JOIN Property p ON b.Property_ID = p.Property_ID
JOIN City c ON p.City_ID = c.City_ID
JOIN Province prov ON c.Province_ID = prov.Province_ID;