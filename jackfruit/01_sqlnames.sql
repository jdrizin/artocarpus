#this file mainly contains lines for the database creation, since i forgot to 
#push some other changes...

CREATE TABLE sample ( 
Sample VARCHAR(12) NOT NULL,
SampleNumber INT(5),
TreeTag INT(4),
Date VARCHAR(15),
Village VARCHAR(100),
District VARCHAR(100),
Owner VARCHAR(100),
DBHcm #this is a decimal
ApproxAge INT(4),
YearsFruiting INT(4),
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
SizeClass
AgeClass
ApproxAge
SeedOrSapling VARCHAR(30)
)
Engine=InnoDB;

