drop table if exists Item;
drop table if exists User;
drop table if exists Bids;
drop table if exists Category;
drop table if exists CurrentTime;

create table Item(
  	ItemID INTEGER PRIMARY KEY,
  	Name TEXT,
  	Currently REAL,
  	Buy_Price REAL,
  	First_Bid REAL,
  	Number_of_Bids INTEGER,
  	Started DATETIME,
  	Ends DATETIME,
    SellerID TEXT,
	  Description TEXT,
      CHECK(Ends>Started),
	  FOREIGN KEY(SellerID) REFERENCES User(UserID)
);

create table User(
    UserID TEXT PRIMARY KEY,
    Location TEXT,
    Country TEXT,
    Rating INTEGER
);

create table Bids(
    ItemID INTEGER,
    BidderID TEXT,
    Amount REAL,
    Time DATETIME,
    FOREIGN KEY(BidderID) REFERENCES User(UserID),
    FOREIGN KEY(ItemID) REFERENCES Item(ItemID),
    PRIMARY KEY(ItemID, Time), 
    UNIQUE( ItemID, BidderID, Amount)
);

create table Category(
    ItemID INTEGER,
	  Category TEXT,
    FOREIGN KEY(ItemID) REFERENCES Item(ItemID),
    PRIMARY KEY(ItemID, Category)
);

create table CurrentTime(
    Time DATETIME NOT NULL
);

INSERT into CurrentTime values('2001-12-20 00:00:01');
SELECT * FROM CurrentTime;