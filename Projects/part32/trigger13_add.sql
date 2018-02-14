PRAGMA foreign_keys = ON; 
drop trigger if EXISTS trigger13;
create trigger trigger13
after insert on Bids 
for each row 
begin 
	UPDATE Item set Number_of_Bids = Number_of_Bids+1 Where ItemID = new.ItemID; 
end;
