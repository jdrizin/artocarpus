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

/* start building the tables for excel files for josh */
CREATE TABLE basicsample ( siteCode VARCHAR(10), accessionPrefix VARCHAR(10),
            accessionNumber VARCHAR(15), DRdupAtHilo VARCHAR(30),
            NTBGGarden VARCHAR(30), GRIDLocation VARCHAR(30), 
            NTBGSourceTree VARCHAR(30), comments VARCHAR(200),
            scientificName VARCHAR(100), accessionName VARCHAR(100),
            city VARCHAR(25), state VARCHAR(25), collector VARCHAR(100),
            collectorID VARCHAR(50), regionWhereCollected VARCHAR(50),
            islandWhereCollected VARCHAR(50), siteWhereCollected VARCHAR(50),
            datePlanted VARCHAR(15), datePlantedFixed VARCHAR(15),
            SSRSamplesCollected VARCHAR(10), genemapperID VARCHAR(10),
            microplateWellNum VARCHAR(5), plateNumSample VARCHAR(5), 
            collectedDate VARCHAR(15), DNAExtractionDate VARCHAR(15),
            ratio260280 VARCHAR(10), DNAConcugml VARCHAR(10),
            ploidy INT(4), seeds VARCHAR(10),
            seasonalityGroup INT(3), fruitNutrientAnalysis INT(1),
            isozyme VARCHAR( FIXME ), AFLPAJBdata INT(1),
            systematicBotany INT(1)
        )
        ENGINE=Innodb;

CREATE TABLE addldata ( species VARCHAR(25), NTBGAcc VARCHAR(25),
            mainGrd VARCHAR(25), altGrd VARCHAR(50)
        )
        ENGINE=Innodb;

CREATE TABLE microsatlist ( taxon VARCHAR(100), ID VARCHAR(5),
            ploidy INT(3), microsat VARCHAR(15), value VARCHAR(50) )
        ENGINE=Innodb;