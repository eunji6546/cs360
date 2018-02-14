Select ItemID as 'ItemID' From Price as 'P'  Where P.Currently = (Select Max(Currently) as maximum From Price);

