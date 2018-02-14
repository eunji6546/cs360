rm -rf *.dat;

sqlite3 Sample.db < create.sql
sqlite3 Sample.db < load.txt


sqlite3 Sample.db < trigger1_add.sql
sqlite3 Sample.db < trigger9_add.sql
sqlite3 Sample.db < trigger11_add.sql
sqlite3 Sample.db < trigger13_add.sql
sqlite3 Sample.db < trigger14_add.sql
sqlite3 Sample.db < trigger15_add.sql
sqlite3 Sample.db < trigger16_add.sql


