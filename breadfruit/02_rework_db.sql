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

