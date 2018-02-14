#!/bin/bash


rm -rf *.dat;


python 20140633.py ./ebay_data/items-*.json

sort Users.dat | uniq > Users_table.dat 
sort Bids.dat | uniq > Bids_table.dat 
sort Categories.dat | uniq > Categories_table.dat 
sort Prices.dat | uniq > Prices_table.dat 
sort Times.dat | uniq > Times_table.dat 
sort Items.dat | uniq > Items_table.dat

 
sqlite3 test.db < create.sql
sqlite3 test.db < load.txt

sqlite3 test.db < query1.sql
sqlite3 test.db < query2.sql
sqlite3 test.db < query3.sql
sqlite3 test.db < query4.sql
sqlite3 test.db < query5.sql
sqlite3 test.db < query6.sql
sqlite3 test.db < query7.sql
