/* this file will create the db for the breadfruit morpho and gene data
the exact format is currently unclear, but that should be refined */

CREATE DATABASE breadfruit;
grant ALL on breadfruit.* to breadadmin IDENTIFIED BY 'PASSWORD';

CREATE TABLE fruitMeasurements (
        accession VARCHAR(25), grid VARCHAR(10),
        variety VARCHAR(500), fruitReplicate INT(4),
        fruitWeight INT(10), fruitLength DECIMAL(6,2),
        fruitDiameter DECIMAL(6,2), fruitWidthAtTop DECIMAL(6,2),
        fruitWidthAtBase DECIMAL(6,2), coreLength DECIMAL(6,2),
        coreWidth DECIMAL(6,2)
        )
    ENGINE=Innodb;

CREATE TABLE fruitDescriptors (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        fruitReplicate INT(3), fruitShape INT(3), skinTexture INT(3),
        skinColor INT(3), fleshColor INT(3), numberOfSeeds INT(4)
        )
    ENGINE=Innodb; 

CREATE TABLE flowers (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        flowerReplicate INT(3), flowerLength DECIMAL(6,2),
        flowerDiameter DECIMAL(6,2)
        )
    ENGINE=Innodb;

CREATE TABLE leafMeasurements (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        leafReplicate INT(3), numberOfLobes INT(4),
        leafLength DECIMAL(6,2), leafWidth DECIMAL(6,2),
        widthToLengthRatio DECIMAL(3,2), dissectionRatio DECIMAL(6,2),
        petioleLength DECIMAL(6,2), petioleWidth DECIMAL(6,2)
        )
    ENGINE=Innodb;

CREATE TABLE leafDescriptors (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        leafReplicate INT(3), base INT(3), apexShape INT(3),
        margin INT(3), spacing INT(3), bladeColour INT(3),
        veinColour INT(3), surface INT(3), flexible INT(3), 
        pubescence INT(3), upperHairAmount INT(3),
        upperHairDirection INT(3), upperHairLength INT(3),
        upperHairColor INT(3), lowerHairAmount INT(3),
        lowerHairDirection INT(3), lowerHairLength INT(3), 
        lowerHairColor INT(3)
        )
    ENGINE=Innodb;

CREATE TABLE seedMeasurements (
        accession VARCHAR(25), grid VARCHAR(10), variety VARCHAR(100),
        seedReplicate INT(3), seedLength DECIMAL(6,2),
        seedDiameter DECIMAL(6,2), seedColour INT(3), seedShape INT(3)
        )
    ENGINE=Innodb;

#the csv for the lookup table is "  " delimited, so deal with that in a
#delegate class with explode() and arrays.
CREATE TABLE descriptorLookup (fieldName VARCHAR(100), coding VARCHAR(5000))
    ENGINE=Innodb;

