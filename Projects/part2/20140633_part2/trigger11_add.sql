--11. No auction may have a bid before its start time or after its end time.

PRAGMA foreign_keys = ON;
drop trigger if EXISTS trigger11; 
create trigger trigger11 
before insert on Bids 
for each row when EXISTS ( Select * From Item Where ItemID = new.ItemID and ( new.Time > Ends or new.Time < Started) ) 
begin 
	Select raise(rollback, "Bidding time invalid");
end;
