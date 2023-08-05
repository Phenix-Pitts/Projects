## What is the total number of vehicles under each make?

```
SELECT 
	make AS 'Vehicle Make',
    COUNT(make) AS 'Vehicle Count'
FROM 
	ev_population_wa
GROUP BY
	make;
```
