SELECT COUNT(*)
FROM(
SELECT DISTINCT Category 
FROM (
SELECT DISTINCT ItemID 
FROM Bid
WHERE Amount > 100
) as 'T', Categories
WHERE T.ItemID = Categories.ItemID
)
