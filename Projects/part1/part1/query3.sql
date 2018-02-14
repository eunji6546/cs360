SELECT COUNT(*) 
FROM (SELECT ItemID, COUNT(Category) as 'cnt'  FROM Categories GROUP BY ItemID)
WHERE cnt = 4; 
