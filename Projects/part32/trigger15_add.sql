PRAGMA foreign_keys = ON;
drop trigger if EXISTS trigger15;
create trigger trigger15
before insert ON Bids
for each row
when exists (SELECT * FROM CurrentTime WHERE Time <> new.Time)
begin
     SELECT raise(rollback, "Not Match between Bids' and Current's time!");
end;


