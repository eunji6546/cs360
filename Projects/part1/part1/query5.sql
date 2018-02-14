SELECT COUNT(*)
FROM(
SELECT DISTINCT Item.SellerID 
FROM (
	SELECT UserID
	FROM  User 
	WHERE  User.Rating>1000
) as 'high_users', Item 
WHERE high_users.UserID = Item.SellerID
); 
