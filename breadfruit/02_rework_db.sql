/* so we need to add data to the breadfruit appliction, various tables
including similar schema to the artocarpus database. */

/* we want herbarium fileIDs (other harbium info? can it link to the other site
    in a way that isn't totally fragile?). dna extractions, and "images" */

CREATE TABLE extractions (fk_extractions_collection_ID INT(6),
                        extractionKEY INT(6) AUTO_INCREMENT NOT NULL,
                        extractionMaterial VARCHAR(250),
                        extractionType VARCHAR(100), extractionDate VARCHAR(15),
                        extractorName VARCHAR(100), nanodropQuant VARCHAR(100),
                        gelRun TINYINT, eGelImageName VARCHAR(100),
                        notes VARCHAR(500), 
                        PRIMARY KEY (extractionKEY))
        ENGINE=Innodb;

CREATE TABLE microsats (fk_microsats_extractions_ID INT(6),
                        microsatKEY INT(6) AUTO_INCREMENT NOT NULL,
                        primerPair VARCHAR(50),
                        color VARCHAR(50), PCRDate VARCHAR(15),
                        beckmanDate VARCHAR(15), locus1 VARCHAR(100),
                        locus2 VARCHAR(100), locus3 VARCHAR(100),
                        notes VARCHAR(500),
                        PRIMARY KEY (microsatKEY))
        ENGINE=Innodb;

/* we also want images and herbarium fileIDs. what specifically? */

/* start building the tables for excel files for josh 
don't auto_increment yet, it makes it harder to import*/
CREATE TABLE basicsample ( basicKEY INT(6) NOT NULL,
            siteCode VARCHAR(10), 
            accessionPrefix VARCHAR(10),
            accessionNumber VARCHAR(15), 
            DRdupAtHilo VARCHAR(30),
            NTBGGarden VARCHAR(30), 
            GRIDLocation VARCHAR(30), 
            NTBGSourceTree VARCHAR(30), 
            comments VARCHAR(200),
            scientificName VARCHAR(100), 
            accessionName VARCHAR(100),
            city VARCHAR(25), 
            state VARCHAR(25), 
            collector VARCHAR(100),
            collectorID VARCHAR(50), 
            regionWhereCollected VARCHAR(50),
            islandWhereCollected VARCHAR(50), 
            siteWhereCollected VARCHAR(50),
            datePlanted VARCHAR(15), 
            datePlantedFixed VARCHAR(15),
            SSRSamplesCollected VARCHAR(10), 
            genemapperID VARCHAR(10),
            microplateWellNum VARCHAR(5), 
            plateNum VARCHAR(5), 
            Sample VARCHAR(5),
            collectedDate VARCHAR(15), 
            DNAExtractionDate VARCHAR(15),
            ratio260280 VARCHAR(10), 
            DNAConcugml VARCHAR(10),
            ploidy INT(4), 
            seeds VARCHAR(10),
            seasonalityGroup INT(3), 
            fruitNutrientAnalysis INT(1),
            isozyme VARCHAR(10), 
            AFLPAJBdata INT(1),
            systematicBotany INT(1),
            PRIMARY KEY (basicKEY)
        )
        ENGINE=Innodb;

#added to the db: 2013-02-20
CREATE TABLE addldata ( addlKEY INT(6) AUTO_INCREMENT NOT NULL, 
            species VARCHAR(25), 
            NTBGAcc VARCHAR(25),
            mainGrd VARCHAR(25), altGrd VARCHAR(50),
            PRIMARY KEY (addlKEY)
        )
        ENGINE=Innodb;

#added to the db: 2013-02-20
CREATE TABLE microsatlist ( microsatlistKEY INT(6) AUTO_INCREMENT NOT NULL,
            taxon VARCHAR(100), genemapperID VARCHAR(5),
            ploidy INT(3), microsat VARCHAR(15), value VARCHAR(50),
            PRIMARY KEY (microsatlistKEY)
        )
        ENGINE=Innodb;

# now load in the data
load data local infile '/home/josh/csvs/excelFilesForJosh/additionaldata-strip.csv'
    INTO TABLE addldata
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

# now load in the data
load data local infile '/home/josh/csvs/excelFilesForJosh/basicsampledata-fix-strip.csv'
    INTO TABLE basicsample
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\n';

#fix the auto_increment now
alter table basicsample modify column basicKEY int(6) not null auto_increment;