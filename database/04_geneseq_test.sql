#create a test database for FASTA manipulation

CREATE TABLE genesequences (geneseqID INT(6), SampleType VARCHAR(500),
        Extractor VARCHAR(500),ExtractionCode VARCHAR (500),
        ExtractionDate VARCHAR(500),ExtractionMethod VARCHAR(500),
        locusUsed VARCHAR(500), sequence VARCHAR(10000),
        quality VARCHAR(10000)
        )
        ENGINE=Innodb; 


