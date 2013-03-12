#this file mainly contains lines for the database creation, since i forgot to 
#push some other changes...

CREATE TABLE sample ( 
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

LOAD DATA LOCAL INFILE '/home/josh/csvs/jackfruit/otherdata.csv'
	INTO TABLE sample
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"';

CREATE TABLE microsats (
microsatKEY INT(6) AUTO_INCREMENT NOT NULL, PRIMARY KEY(microsatKEY),
fk_microsats_sample_sample VARCHAR(12),
microsat VARCHAR(12),
value VARCHAR(12)
)
Engine=InnoDB;

ALTER TABLE microsats
	ADD FOREIGN KEY(fk_microsats_sample_sample)
	REFERENCES sample(Sample);

LOAD DATA LOCAL INFILE '/home/josh/csvs/jackfruit/microsat-reformatted.csv'
	INTO TABLE microsats
	FIELDS TERMINATED BY ','
	ENCLOSED BY '"';