# our files have crlf line endings, so lines are termianted by \r\n, not just \n
load data local infile '/home/josh/csvs/geneticproject.txt' into table geneticproject fields terminated by ',' enclosed by '"' lines terminated by '\r\n';

