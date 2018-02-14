
drop table if exists Item; 
drop table if exists Categories; 
drop table if exists Price; 
drop table if exists Time; 
drop table if exists User; 
drop table if exists Bid;
 
create table Item( ItemID int primary key,
		 SellerID varchar,
		 Name varchar,
		 Description text,
		 Num_of_Bids int); 
create table Categories ( ItemID int , Category varchar, foreign key (ItemID ) references Item(ItemID)) ;  
create table Price (ItemID int, First_Bid money, Buy_Price money, Currently money, foreign key (ItemID ) references Item(ItemID));
create table Time( ItemID int, Started time, Ends time, foreign key (ItemID ) references Item(ItemID));
create table User( UserID varchar, Rating int, Location varchar, Country varchar, primary key (UserID, Rating));
create table Bid( ItemID int, BidderID varchar, Time time , Amount money, 
foreign key (ItemID) references Item(ItemID), 
foreign key (BidderID) references User(UserID) ); 
