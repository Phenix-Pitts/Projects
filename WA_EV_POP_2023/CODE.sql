WA_EV_Population 2023

--What is the total number of vehickes under each make?

SELECT 
	make AS 'Vehicle Make',
    COUNT(make) AS 'Vehicle Count'
FROM 
	ev_population_wa
GROUP BY
	make;

# Vehicle Make, Vehicle Count
'BMW', '4656'
'TESLA', '49941'
'NISSAN', '12848'
'FORD', '5658'
'CHEVROLET', '10065'
'VOLKSWAGEN', '2375'
'SMART', '273'
'TOYOTA', '4336'
'FIAT', '822'
'CHRYSLER', '1783'
'KIA', '4375'
'VOLVO', '2440'
'HYUNDAI', '1289'
'MERCEDES-BENZ', '458'
'PORSCHE', '807'
'RIVIAN', '717'
'AUDI', '2298'
'MINI', '613'
'SUBARU', '58'
'HONDA', '794'
'JEEP', '1105'
'MITSUBISHI', '588'
'POLESTAR', '533'
'LINCOLN', '155'
'JAGUAR', '222'
'CADILLAC', '108'
'LAND ROVER', '38'
'LEXUS', '31'
'GENESIS', '13'
'FISKER', '20'
'TH!NK', '3'
'LUCID MOTORS', '48'
'BENTLEY', '3'
'AZURE DYNAMICS', '7'


--How many different makes of EVs are registered in WA?

SELECT 
	COUNT(DISTINCT make) AS 'Vehicle Make Count'
FROM	
	ev_population_wa;

# Vehicle Make Count
'34'

--Which vehicle make is most popular in WA?
SELECT 
    make AS 'Vehicle_Make', COUNT(make) AS 'Vehicle_Count'
FROM
    ev_population_wa
GROUP BY MAKE
ORDER BY Vehicle_Count DESC
LIMIT 1;

--How many EVs are registared and reside in WA?

SELECT 
    state, COUNT(make)
FROM
    ev_population_wa
GROUP BY state
ORDER BY COUNT(MAKE) DESC
LIMIT 1

--How many vehicles are registared in WA, but reside in other states?

SELECT 
    state, COUNT(state) AS 'count'
FROM
    ev_population_wa
WHERE
    state NOT LIKE 'WA'
GROUP BY state


--Which PHEV has the longest range?

SELECT DISTINCT
    CONCAT(model_year, ' ', make, ' ', model) AS 'Model',
    ev_type,
    ev_range
FROM
    ev_population_wa
WHERE
    ev_type LIKE '%PHEV%'
ORDER BY ev_range DESC
LIMIT 1


Show the max range of a BEV

SELECT DISTINCT
    CONCAT(model_year, ' ', make, ' ', model) AS 'Model',
    ev_type,
    ev_range
FROM
    ev_population_wa
WHERE
    ev_type LIKE '%BEV%'
ORDER BY ev_range DESC
LIMIT 1

--How many EV's are projected to be serviced by each utility comapny in the state of WA?

SELECT
    CASE
        WHEN Electric_Utility LIKE 'Bonneville%' THEN 'Bonneville Power Administration'
        WHEN Electric_Utility LIKE 'PUD%' THEN 'PUD'
        WHEN Electric_Utility LIKE 'Puget Sound%' THEN 'Puget Sound Energy INC'
        WHEN Electric_Utility LIKE 'City of Sea%' THEN 'City of Seattle'
        WHEN Electric_Utility LIKE 'PACIFICORP%' THEN 'Pacificorp'
        WHEN Electric_Utility LIKE 'Avista%' THEN 'Avista Corp'
        WHEN Electric_Utility LIKE 'Modern%' THEN 'Modern Electric Water Company'
        WHEN Electric_Utility LIKE 'OKANOGAN%' THEN 'OKANOGAN COUNTY ELEC COOP, INC'
        WHEN Electric_Utility LIKE 'CITY OF CHENEY%' THEN 'CITY OF CHENEY'
        WHEN Electric_Utility LIKE 'CITY OF TACOMA%' THEN 'CITY OF TACOMA'
        WHEN Electric_Utility LIKE 'CITY OF CHEWELAH' THEN 'CITY OF CHEWELAH'
    END AS 'Power_Companies',
    COUNT(electric_utility) AS 'Reported_Vehicles'
FROM
    ev_population_wa
WHERE
    state LIKE 'WA'
GROUP BY 
    CASE
        WHEN Electric_Utility LIKE 'Bonneville%' THEN 'Bonneville Power Administration'
        WHEN Electric_Utility LIKE 'PUD%' THEN 'PUD'
        WHEN Electric_Utility LIKE 'Puget Sound%' THEN 'Puget Sound Energy INC'
        WHEN Electric_Utility LIKE 'City of Sea%' THEN 'City of Seattle'
        WHEN Electric_Utility LIKE 'PACIFICORP%' THEN 'Pacificorp'
        WHEN Electric_Utility LIKE 'Avista%' THEN 'Avista Corp'
        WHEN Electric_Utility LIKE 'Modern%' THEN 'Modern Electric Water Company'
        WHEN Electric_Utility LIKE 'OKANOGAN%' THEN 'OKANOGAN COUNTY ELEC COOP, INC'
        WHEN Electric_Utility LIKE 'CITY OF CHENEY%' THEN 'CITY OF CHENEY'
        WHEN Electric_Utility LIKE 'CITY OF TACOMA%' THEN 'CITY OF TACOMA'
        WHEN Electric_Utility LIKE 'CITY OF CHEWELAH' THEN 'CITY OF CHEWELAH'
    END
ORDER BY Reported_vehicles;

--Show the amount of vehicles registared in each zipcode within WA.
SELECT 
    DISTINCT City,
    COUNT(*) AS 'Reported_Vehicles'
FROM
    ev_population_wa
WHERE
    state LIKE 'WA'
GROUP BY city
ORDER BY Reported_Vehicles
