rm -rf *.dat;
rm -rf ./web/*.dat;

python 20140633.py ./ebay_data/items-*.json

sqlite3 test.db < create.sql

sqlite3 test.db < load.txt


sqlite3 test.db < trigger1_add.sql
sqlite3 test.db < trigger9_add.sql
sqlite3 test.db < trigger11_add.sql
sqlite3 test.db < trigger13_add.sql
sqlite3 test.db < trigger14_add.sql
sqlite3 test.db < trigger15_add.sql
sqlite3 test.db < trigger16_add.sql


mv ./user_table.dat ./web
mv ./item_table.dat ./web
mv ./category_table.dat ./web
mv ./currenttime_table.dat ./web
mv ./bids_table.dat ./web

