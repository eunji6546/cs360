--9. A user may not bid on an item he or she is also selling.

PRAGMA foreign_keys = ON; 
drop trigger if EXISTS trigger9;
create trigger trigger9
before insert on Bids
for each row when exists (Select * From Items Where SellerID = new.BidderID and ItemID = new.ItemID) 
begin 
	Select raise(rollback, "You cannot bid on an item you sell!");
end;
