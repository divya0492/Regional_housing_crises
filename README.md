
# REGIONAL HOUSING CRISIS

## Problem Statement
A regional housing crisis signifies a severe imbalance between the demand for and supply of suitable, affordable housing. This imbalance manifests in several critical issues: 

•	Housing Affordability: A significant portion of the population faces housing costs exceeding 30% of their income, leaving them "cost-burdened" and vulnerable to housing instability. 

•	Housing Availability: A shortage of available units across all housing types (rental, ownership) exacerbates competition, driving prices higher and limiting choices for individuals and families.

•	Homelessness: The lack of affordable housing contributes to increased homelessness, impacting individuals and families experiencing poverty, mental health challenges, and other vulnerabilities. 

•	Community Impacts: The crisis can lead to social and economic strain, hindering community growth, attracting and retaining a skilled workforce, and impacting overall quality of life.

## Scope Definition 
This analysis will focus on understanding the multifaceted nature of the regional housing crisis within 
a specific geographic area. The scope will encompass: 

• Identification of Key Stakeholders: This includes homeowners, renters, landlords, 
developers, government agencies (municipal, provincial, federal), non-profit organizations, 
community groups, and businesses. 

• Data Collection and Analysis: Gathering and analysing quantitative and qualitative data on 
housing costs, availability, demographics, economic conditions, and other relevant factors. 

• Development of an Entity-Relationship Diagram (ERD): Visualizing the complex 
interconnections between key entities involved in the housing market. 

• Identification of Potential Solutions: Exploring a range of potential policy interventions, 
community-based initiatives, and private sector solutions to address the housing crisis. 

# Entity diagram:

![Caption](ERmodel.png)

# Relational schema Diagram: 

![Caption](Relationalschemahousingcrisis.png)

# Source Code:

![Create script](create.sql)

![Populate script](populate.sql)

# Sample Queries

## Query 1

List all rental units along with their property addresses and city names

![query.sql](query.sql)

SELECT r.RentalUnit_ID, r.Floor, r.Room, p.Address AS Property_Address, c.City_ID

FROM Rental_Unit r

JOIN Property p ON r.Property_ID = p.Property_ID

JOIN City c ON p.City_ID = c.City_ID;

## Query 2

Find the total number of rental units per city (Aggregation)

SELECT c.City_ID, COUNT(r.RentalUnit_ID) AS Total_Rental_Units

FROM City c

JOIN Property p ON c.City_ID = p.City_ID

JOIN Rental_Unit r ON p.Property_ID = r.Property_ID

GROUP BY c.City_ID;

## Query 3

Retrieve tenants (persons) and their rental details, including rent amount and property location

SELECT per.Person_ID, per.Age_Group, per.Income_Level, r.Rent, p.Address AS Property_Address

FROM Rents r

JOIN Person per ON r.Person_ID = per.Person_ID

JOIN Rental_Unit ru ON r.RentalUnit_ID = ru.RentalUnit_ID

JOIN Property p ON ru.Property_ID = p.Property_ID;

## Query 4

Calculate the average rent per city (Derived field and Aggregation)

SELECT c.City_ID, AVG(r.Rent) AS Avg_Rent

FROM Rents r

JOIN Rental_Unit ru ON r.RentalUnit_ID = ru.RentalUnit_ID

JOIN Property p ON ru.Property_ID = p.Property_ID

JOIN City c ON p.City_ID = c.City_ID

GROUP BY c.City_ID;

## Query 5 

Identify builders and the number of projects they have worked on along with city details

SELECT b.Builder_ID, b.No_of_Projects, p.Address AS Property_Address, c.City_ID, prov.Province_ID

FROM Builder b

JOIN Property p ON b.Property_ID = p.Property_ID

JOIN City c ON p.City_ID = c.City_ID

JOIN Province prov ON c.Province_ID = prov.Province_ID;








