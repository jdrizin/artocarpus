# dump out the annotation table to a csv. i had to do this as root for some
# reason, even if my user should have the right grants.
SELECT * 
	INTO OUTFILE '/home/josh/csvs/annotationfix.csv'
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"'
	ESCAPED BY '\\'
	LINES TERMINATED BY '\n'
	FROM annotations;

#some shell code to split the csv fields
#cat annotationfix.csv | sed 's/\ /\",\"/2' > annotationsplit.csv
#tac annotationsplit.csv|sed 's/\ /\",\"/1' |tac> annotationdone.csv

