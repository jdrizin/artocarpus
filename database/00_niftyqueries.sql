#some nifty queries

#select records where MostRecentGenus/Species doesn't match with Genus/Species
select ID,MostRecentGenus,MostRecentSpecies,Genus,Species
	FROM collectiondata WHERE MostRecentGenus <> Genus 
	OR MostRecentSpecies <> Species;

#or individually, with less output
select ID,MostRecentGenus,Genus FROM collectiondata 
	WHERE MostRecentGenus <> Genus;

select ID,MostRecentSpecies,Species FROM collectiondata 
	WHERE MostRecentSpecies <> Species;

#dump out some data into a CSV with unix line endings.
SELECT ID,Image_location 
        INTO OUTFILE '/home/josh/csvs/imagelocationfix.csv'
        FIELDS TERMINATED BY ','
        ENCLOSED BY '"'
        ESCAPED BY '\\'
        LINES TERMINATED BY '\n'
        FROM collectiondata;

#dump out data for nyree to fix
#dump genus/species errata

select ID,MostRecentGenus,Genus 
	FROM collectiondata 
   WHERE MostRecentGenus <> Genus
   INTO OUTFILE '/home/josh/csvs/genusmismatch.csv'
   FIELDS TERMINATED BY ',' 
   ENCLOSED BY '"' 
   ESCAPED BY '\\'
   LINES TERMINATED BY '\n'
   ;

select ID,MostRecentSpecies,Species 
   FROM collectiondata    
   WHERE MostRecentSpecies <> Species
   INTO OUTFILE '/home/josh/csvs/speciesmismatch.csv'
   FIELDS TERMINATED BY ','     
   ENCLOSED BY '"'     
   ESCAPED BY '\\'
   LINES TERMINATED BY '\n'
   ;

select ID,MostRecentGenus,MostRecentSpecies,MostRecentAltID
   FROM collectiondata
   WHERE MostRecentAltID <> ''
   INTO OUTFILE '/home/josh/csvs/altIDmismatch.csv'
   FIELDS TERMINATED BY ','
   ENCLOSED BY '"'
   ESCAPED BY '\\'
   LINES TERMINATED BY '\n'
   ;

