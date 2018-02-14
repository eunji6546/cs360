SELECT COUNT(*) 
FROM (
	SELECT DISTINCT User.UserID
	FROM User, Item, Bid 
	WHERE User.UserID = Item.SellerID and Item.SellerID = Bid.BidderID
); 
