# extraction test table: set up as per evelyn''s email
#create a new table for this data
CREATE TABLE extractions (extractionID INT(6) AUTO_INCREMENT NOT NULL,
                        extractionMaterial VARCHAR(250),
                        extractionType VARCHAR(100), extractionDate VARCHAR(15),
                        extractorName VARCHAR(100), nanodropQuant VARCHAR(100),
                        gelRun TINYINT, eGelImageName VARCHAR(100),
                        notes VARCHAR(500), fk_extractions_collection_ID INT(6),
                        PRIMARY KEY (extractionID))
        ENGINE=Innodb;

CREATE TABLE sequences (sequenceID INT(6) AUTO_INCREMENT NOT NULL, 
                        geneRegion VARCHAR(50),
                        PCRNumber VARCHAR(25), sequencingDate VARCHAR(15),
                        sequencerName VARCHAR(100), notes VARCHAR(500),
                        gelConfirmation TINYINT, sGelImageName VARCHAR(100),
                        cycleSequencingDate VARCHAR(15),
                        submittedPlateName VARCHAR(100),
                        sequenceQuality VARCHAR(15),
                        fk_sequences_extractions_ID INT(6),
                        PRIMARY KEY (sequenceID))
        ENGINE=Innodb;

CREATE TABLE microsats (microsatID INT(6) AUTO_INCREMENT NOT NULL,
                        primerPair VARCHAR(50),
                        color VARCHAR(50), PCRDate VARCHAR(15),
                        beckmanDate VARCHAR(15), locus1 VARCHAR(100),
                        locus2 VARCHAR(100), notes VARCHAR(500),
                        fk_microsats_extractions_ID INT(6),
                        PRIMARY KEY (microsatID))
        ENGINE=Innodb;

#set the foreign keys
ALTER TABLE extractions
ADD FOREIGN KEY (fk_extractions_collection_ID)
REFERENCES collectiondata(ID);

ALTER TABLE sequences
ADD FOREIGN KEY (fk_sequences_extractions_ID)
REFERENCES collectiondata(ID);

ALTER TABLE microsats
ADD FOREIGN KEY (fk_microsats_extractions_ID)
REFERENCES collectiondata(ID);

#so i forgot to add, you know, a sequence field.
ALTER TABLE sequences
ADD COLUMN sequence VARCHAR(5000);

#folks want contigfilename, alignment filename, and rowtraces
ALTER TABLE sequences
ADD COLUMN contigFilename VARCHAR(1000),
ADD COLUMN alignmentFilename VARCHAR(1000),
ADD COLUMN rowTraces VARCHAR(5000);
