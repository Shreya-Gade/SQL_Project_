/*===================================DATABASE====================================*/

Create database Urban_Planning_And_Development_Database;

USE Urban_Planning_And_Development_Database;

/*=====================================TABLES======================================*/

CREATE TABLE Cities(
	City_ID INT PRIMARY KEY,
    City_Name VARCHAR(100),
    Population INT,
    Area DECIMAL(10,2), /*---Area in square kilometers---*/
    Country VARCHAR(100)
);

SELECT * FROM Cities;

CREATE TABLE Districts(
	District_ID INT PRIMARY KEY,
	District_Name VARCHAR(100),
    City_ID INT,
    CONSTRAINT FK_City_ID FOREIGN KEY (City_ID) REFERENCES Cities(City_ID)
);

SELECT * FROM Districts;

CREATE TABLE Buildings(
	Building_ID INT PRIMARY KEY,
    Building_Name VARCHAR(100),
    Address VARCHAR(255),
    Construction_Date DATE,
    Height DECIMAL(10,2),
    District_ID INT,
    CONSTRAINT FK_District_ID FOREIGN KEY (District_ID) REFERENCES Districts(District_ID)
);

SELECT * FROM Buildings;

CREATE TABLE Infrastructure(
	Infrastructure_ID INT PRIMARY KEY,
    Infrastructure_Type VARCHAR(100),
    Description VARCHAR(255),
    City_ID INT,
    CONSTRAINT FK_City_ID_Infra FOREIGN KEY (City_ID) REFERENCES Cities(City_ID)
);

SELECT * FROM Infrastructure;

CREATE TABLE DevelopmentProjects(
	Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(100),
    Start_Date DATE,
    End_Date DATE,
    Description VARCHAR(255),
    City_ID INT,
    CONSTRAINT FK_City_ID_Proj FOREIGN KEY (City_ID) REFERENCES Cities(City_ID)
);

SELECT * FROM Developmentprojects;

CREATE TABLE Permits(
	Premit_ID INT PRIMARY KEY,
    Permit_Type VARCHAR(100),
    Issued_Date DATE,
    Expiry_Date DATE,
    Building_ID INT,
    CONSTRAINT FK_Building_ID FOREIGN KEY (Building_ID) REFERENCES Buildings(Building_ID)
);

SELECT * FROM Permits;

CREATE TABLE Zoning(
	Zone_ID INT PRIMARY KEY,
    Zone_Name VARCHAR(100),
    Description VARCHAR(255),
    District_ID INT,
    CONSTRAINT FK_District_ID_Zone FOREIGN KEY (District_ID) REFERENCES Districts(District_ID)
);

SELECT * FROM Zoning;

/*==============================POPULATING TABLES===================================*/

INSERT INTO Cities (City_ID, City_name, Population, Area, Country) VALUES
(1, 'Mumbai', 12442373, 603.4, 'India'),
(2, 'New York City', 8398748, 783.8, 'USA'),
(3, 'London', 8982000, 1572, 'UK'),
(4, 'Tokyo', 37393000, 2187, 'Japan'),
(5, 'Hyderabad', 10137933, 625, 'India'),
(6, 'Paris', 2148327, 105.4, 'France'),
(7, 'Bangalore', 1247994, 709.5, 'India'),
(8, 'Chennai', 7088000, 426, 'India'),
(9, 'Sydney', 5312163, 1214.8, 'Australia');

SELECT * FROM Cities;

INSERT INTO Districts(District_ID, District_Name, City_ID) VALUES 
(11, 'Dharavi', 1),
(12, 'Queens', 2),
(13, 'Camden', 3),        
(14, 'Shinjuku', 4),     
(15, 'Madhapur', 5),     
(16, 'Montmartre', 6),   
(17, 'Koramangala', 7),  
(18, 'T.Nagar', 8),     
(19, 'Bondi Beach', 9);

SELECT * FROM Districts;
 
INSERT INTO Buildings (Building_ID, Building_Name, Address, Construction_Date, Height, District_ID)
VALUES
(101, 'Chhatrapati Shivaji Maharaj Terminus', 'Chhatrapati Shivaji Maharaj Terminus Area, Fort, Mumbai, Maharashtra, India', '1887-01-01', NULL, 11),  
(102, 'One World Trade Center', '285 Fulton St, New York, NY 10007, USA', '2006-04-27', 541.3, 12),          
(103, 'The Gherkin', '30 St Mary Axe, London EC3A 8EP, UK', '2004-05-28', 180, 13),                          
(104, 'Tokyo Tower', '4 Chome-2-8 Shibakoen, Minato City, Tokyo 105-0011, Japan', '1958-12-23', 333, 14),    
(105, 'Hitech City', 'HITEC City, Hyderabad, Telangana 500081, India', '1998-01-01', NULL, 15),              
(106, 'Louvre Museum', 'Rue de Rivoli, 75001 Paris, France', '1793-08-10', NULL, 16),                        
(107, 'Manyata Embassy Business Park', 'Outer Ring Rd, Manayata Tech Park, Nagavara, Bengaluru, Karnataka 560045, India', '2004-01-01', NULL, 17),  
(108, 'ITC Grand Chola', '63, Mount Rd, Guindy, Chennai, Tamil Nadu 600032, India', '2011-01-01', NULL, 18), 
(109, 'Westfield Bondi Junction', '500 Oxford St, Bondi Junction NSW 2022, Australia', '2004-10-07', NULL, 19);

SELECT * FROM Buildings;

INSERT INTO Infrastructure(Infrastructure_ID, Infrastructure_Type, Description, City_ID) VALUES
(1, 'Bridge', 'Bandra-Worli Sea Link', 1),              
(2, 'Highway', 'Brooklyn Bridge', 2),                    
(3, 'Tube station', 'London Underground', 3),            
(4, 'High-speed rail', 'Shinkansen', 4),                 
(5, 'Airport', 'Rajiv Gandhi International Airport', 5), 
(6, 'Metro', 'Paris Métro', 6),                          
(7, 'Tech Park', 'Manyata Tech Park', 7),                
(8, 'Port', 'Chennai Port', 8),                          
(9, 'Harbor', 'Sydney Harbour', 9);

SELECT * FROM Infrastructure;

INSERT INTO DevelopmentProjects(Project_ID, Project_Name, Start_Date, End_Date, Description, City_ID) Values
(1, 'Mumbai Metro Project', '2006-06-01', '2025-12-31', 'Expansion of Mumbai Metro network', 1),            
(2, 'Hudson Yards', '2012-12-01', '2024-12-31', 'Mixed-use development in Manhattan', 2),                    
(3, 'Crossrail', '2009-05-15', '2022-12-31', 'Railway project connecting London', 3),                         
(4, 'Tokyo Olympics Infrastructure', '2013-09-07', '2021-08-31', 'Infrastructure for Tokyo Olympics', 4),     
(5, 'Hyderabad Metro Rail', '2012-07-05', '2022-12-31', 'Expansion of Hyderabad Metro', 5),                   
(6, 'Grand Paris Express', '2007-07-01', '2030-12-31', 'Expansion of rapid transit system in Paris', 6),       
(7, 'Bangalore Metro Phase 2', '2011-04-04', '2024-12-31', 'Expansion of Bangalore Metro network', 7),         
(8, 'Chennai Smart City Project', '2017-06-25', '2023-12-31', 'Smart city development initiative', 8),           
(9, 'Sydney Metro', '2013-08-01', '2024-12-31', 'Expansion of Sydney Metro network', 9);  

SELECT * FROM Infrastructure;

INSERT INTO Permits(Permit_ID, Permit_Type, Issued_Date, Expiry_Date, Building_ID) Values
(1, 'Construction', '2023-01-15', '2024-12-31', 101),    -- Antilia in Mumbai
(2, 'Renovation', '2022-06-10', '2023-12-31', 102),       -- Empire State Building in New York City
(3, 'Construction', '2021-03-20', '2023-05-31', 103),     -- The Shard in London
(4, 'Construction', '2020-11-01', '2022-07-31', 104),     -- Tokyo Skytree in Tokyo
(5, 'Construction', '2022-09-05', '2024-10-31', 107),     -- UB City in Bangalore
(6, 'Construction', '2019-12-15', '2022-06-30', 108),     -- Ripon Building in Chennai
(7, 'Construction', '2018-10-01', '2023-03-31', 109);     -- Sydney Opera House

SELECT * FROM Permits;

INSERT INTO Zoning(Zone_ID, Zone_name, Description, District_ID) VALUE
(1, 'Residential', 'Residential area zoning', 11),        -- Dharavi in Mumbai
(2, 'Commercial', 'Commercial area zoning', 12),          -- Brooklyn in New York City
(3, 'Historic', 'Historic preservation zoning', 13),      -- Camden in London
(4, 'Mixed-use', 'Mixed-use area zoning', 14),            -- Shinjuku in Tokyo
(5, 'Residential', 'Residential area zoning', 15),        -- Madhapur in Hyderabad
(6, 'Tourism', 'Tourism area zoning', 16),                -- Montmartre in Paris
(7, 'Commercial', 'Commercial area zoning', 17),          -- Koramangala in Bangalore
(8, 'Residential', 'Residential area zoning', 18),        -- T. Nagar in Chennai
(9, 'Mixed-use', 'Mixed-use area zoning', 19);            -- Bondi Beach in Sydney

SELECT * FROM Zoning;

/*=============================END POPULATING TABLES====================================*/

/*======================================= QUERY QUESTIONS===============================*/

/* #1 Retrive the names of all cities in the database along with their populations */

SELECT City_name, Population 
FROM Cities; 

/* #2 Retrieve the names and descriptions of all zoning areas where the zone name contains the word 'Residential' */

SELECT Zone_ID, Zone_name, Description 
FROM Zoning
WHERE Zone_Name LIKE '%Residential%';

/* #3 Display the names and discription of all infrastructure projects in Paris */

SELECT Infrastructure_type, Description
FROM Infrastructure
WHERE City_ID = (
			SELECT City_ID
            FROM Cities 
            WHERE city_name = 'Paris');

/* #4 Show the names and addresses of all buildings in Chennai. */

SELECT Building_ID, Building_name, Address
FROM Buildings 
WHERE District_ID In (
				SELECT District_ID 
                FROM Districts
                WHERE City_ID = (
					SELECT City_ID 
                    FROM Cities
                    WHERE City_name = 'Chennai'));
                    
/* #5 Retrive the names and addresses of all buildings in bangalore with construction dates after 2010 */

SELECT  Building_name, address
FROM Buildings
WHERE District_ID IN (
			SELECT District_ID
            FROM Districts
            WHERE City_ID = (
						SELECT City_ID 
                        FROM Cities 
                        WHERE City_Name = 'Bangalore'))
AND Construction_Date > '2010-01-01';

/* #6 Find all development projects in Mumbai along with their start and end dates */

SELECT dp.Project_name, dp.Start_Date, dp.end_date
FROM Developmentprojects Dp
JOIN Cities c 
 ON Dp.City_ID = c.city_ID
WHERE c.City_name = 'Mumbai';

/* #7 Retrive the names and description of all Infrastructure projects in paris using RIGHT JOIN */

SELECT i.Infrastructure_type, i.Description
FROM Infrastructure i
RIGHT JOIN Cities c 
 ON i.City_ID = c.City_ID
WHERE c.city_name = 'Paris'; 

/* #8 Retrieve the names and descriptions of all zoning areas in Hyderabad, including those without a corresponding city, using LEFT JOIN to find null values. */

SELECT z.Zone_name, z.Description
FROm Zoning z
LEFT JOIN Districts d 
	ON z.District_ID = d.District_ID
LEFT JOIN Cities c
	ON d.city_ID = c.City_ID
WHERE c.city_name = 'Hyderabad' OR c.city_name IS NULL;   

/* #9 Find all development projects in the city with the highest average building height */

SELECT Project_ID, Project_name, Description
FROM DevelopmentProjects
WHERE City_ID = (
	SELECT City_ID 
    FROM (
		SELECT City_ID, AVG(Height) AS AvgHeight 
        FROM Buildings 
        GROUP BY City_ID
        ORDER BY AvgHeight DESC LIMIT 1)
        AS City_With_Max_Avg_Height);
        
/* #10 Find all permits issued for buildings where the expiry date is later than the current date */

SELECT Permit_Type, Expiry_Date
FROM Permits
WHERE Expiry_Date > CURRENT_DATE();