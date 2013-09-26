#so we're merging everything. ok. start by copying from breadfruit
CREATE TABLE bread_basicsample ( basicKEY INT(6) NOT NULL,
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
CREATE TABLE bread_addldata ( addlKEY INT(6) AUTO_INCREMENT NOT NULL, 
            species VARCHAR(25), 
            NTBGAcc VARCHAR(25),
            mainGrd VARCHAR(25), altGrd VARCHAR(50),
            PRIMARY KEY (addlKEY)
        )
        ENGINE=Innodb;


CREATE TABLE bread_fruitMeasurements (
        accession VARCHAR(25), grid VARCHAR(10),
        variety VARCHAR(500), fruitReplicate INT(4),
        fruitWeight INT(10), fruitLength DECIMAL(6,2),
        fruitDiameter DECIMAL(6,2), fruitWidthAtTop DECIMAL(6,2),
        fruitWidthAtBase DECIMAL(6,2), coreLength DECIMAL(6,2),
        coreWidth DECIMAL(6,2), xkey int(6) AUTO_INCREMENT NOT NULL
        )
    ENGINE=Innodb;

CREATE TABLE bread_fruitDescriptors (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        fruitReplicate INT(3), fruitShape INT(3), skinTexture INT(3),
        skinColor INT(3), fleshColor INT(3), numberOfSeeds INT(4), 
        xkey int(6) AUTO_INCREMENT NOT NULL
        )
    ENGINE=Innodb; 

CREATE TABLE bread_flowers (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        flowerReplicate INT(3), flowerLength DECIMAL(6,2),
        flowerDiameter DECIMAL(6,2), xkey int(6) AUTO_INCREMENT NOT NULL
        )
    ENGINE=Innodb;

CREATE TABLE bread_leafMeasurements (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        leafReplicate INT(3), numberOfLobes INT(4),
        leafLength DECIMAL(6,2), leafWidth DECIMAL(6,2),
        widthToLengthRatio DECIMAL(3,2), dissectionRatio DECIMAL(6,2),
        petioleLength DECIMAL(6,2), petioleWidth DECIMAL(6,2), 
        xkey int(6) AUTO_INCREMENT NOT NULL
        )
    ENGINE=Innodb;

CREATE TABLE bread_leafDescriptors (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        leafReplicate INT(3), base INT(3), apexShape INT(3),
        margin INT(3), spacing INT(3), bladeColour INT(3),
        veinColour INT(3), surface INT(3), flexible INT(3), 
        pubescence INT(3), upperHairAmount INT(3),
        upperHairDirection INT(3), upperHairLength INT(3),
        upperHairColor INT(3), lowerHairAmount INT(3),
        lowerHairDirection INT(3), lowerHairLength INT(3), 
        lowerHairColor INT(3), xkey int(6) AUTO_INCREMENT NOT NULL
        )
    ENGINE=Innodb;

CREATE TABLE bread_seedMeasurements (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        seedReplicate INT(3), seedLength DECIMAL(6,2),
        seedDiameter DECIMAL(6,2), seedColour INT(3), seedShape INT(3), 
        xkey int(6) AUTO_INCREMENT NOT NULL
        )
    ENGINE=Innodb;

#the csv for the lookup table is "  " delimited, so deal with that in a
#delegate class with explode() and arrays.
CREATE TABLE bread_descriptorLookup (descriptor VARCHAR(100), DNAME VARCHAR(100),
    DCAT VARCHAR(100), coding VARCHAR(1000), xkey int(6) AUTO_INCREMENT NOT NULL
    )
    ENGINE=Innodb;

CREATE TABLE jack_sample ( 
Sample VARCHAR(12) NOT NULL, PRIMARY KEY(Sample),
SampleNumber INT(5),
TreeTag INT(5),
Date VARCHAR(15),
Village VARCHAR(100),
District VARCHAR(100),
Owner VARCHAR(100),
DBHcm VARCHAR(30), 
YearsFruiting INT(5),
Intention VARCHAR(50),
SeedOrSapling VARCHAR(50),
SeedSource VARCHAR(50),
SaplingSource VARCHAR(50),
NumberFruits INT(5),
FruitSeason VARCHAR(50),
EatOrSell VARCHAR(50),
SoftOrCrispy VARCHAR(30),
Sweet VARCHAR(30),
FruitSize VARCHAR(30),
FruitQuality VARCHAR(30),
AteFruit VARCHAR(30),
RotPresent VARCHAR(30),
GPSLat VARCHAR(30),
GPSLong VARCHAR(30),
AccuracyMeters INT(5),
OtherFruitCharacteristics VARCHAR(500),
OtherTreeCharacteristics VARCHAR(500),
Notes VARCHAR(5000),
Card VARCHAR(30),
Video VARCHAR(30),
SizeClass INT(5),
AgeClass INT(5),
ApproxAge INT(5)
)
Engine=InnoDB;
