PRAGMA foriegn_keys = ON;
drop trigger if EXISTS trigger1;
create trigger trigger1
after insert ON Bids
for each row
begin
     update Item set Currently = new.Amount where new.ItemID=ItemID;
end;
