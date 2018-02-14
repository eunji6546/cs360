PRAGMA foreign_keys= ON;
drop trigger if EXISTS trigger16;
create trigger trigger16
before update ON CurrentTime
for each row
when old.Time > new.Time
begin
     SELECT raise(rollback, "CurrentTime is cannot be updated as backward time!");
end;
