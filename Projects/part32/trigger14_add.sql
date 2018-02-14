PRAGMA foreign_keys = ON;
drop trigger if EXISTS trigger14; 
create trigger trigger14
before insert on Bids
for each row when exists ( Select * From Item Where ItemID = new.ItemID and Currently>= new.Amount )
begin 
	Select raise(rollback, "New bid shoud be higher than current max bid amount!");
end;
