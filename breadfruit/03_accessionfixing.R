#set the wd to my data location
setwd("/home/josh/artocarpus/csvs/breadfruit/")

#read in all the data files

basic <- read.csv("basicsample.csv")
addl <- read.csv("addldata.csv")
#coding <- read.csv("coding.csv")
flowers <- read.csv("flowers.csv")
fruitDesc <- read.csv("fruitDescriptors.csv")
fruitMeas <- read.csv("fruitMeasurements.csv")
leafDesc <- read.csv("leafDescriptors.csv")
leafMeas <- read.csv("leafMeasurements.csv")
seedMeas <- read.csv("seedMeasurements.csv")

#so the issue is making my unique IDs. the accession number is unique here but maybe not elsewhere
access <- data.frame(prefix=basic$accessionPrefix, number=basic$accessionNumber)
access$number <- gsub(".000", "", access$number) #fix my screwup
access$UID <- paste0(access$prefix, access$number) #here is out new UID
access <- data.frame(number=access$number, UID=access$UID) #drop a column
access <- access[!duplicated(access$UID),] #strip the dupes

basic <- merge(basic, access, by.x="accessionNumber", by.y="number", all.x=TRUE)
addl <- merge(addl, access, by.x="NTBGAcc", by.y="number", all.x=TRUE)
#coding <- merge(coding, access, by.x="accessionNumber", by.y="number")
flowers <- merge(flowers, access, by.x="ACCESSION", by.y="number")
fruitDesc <- merge(fruitDesc, access, by.x="ACCESSION", by.y="number")
fruitMeas <- merge(fruitMeas, access, by.x="ACCESSION", by.y="number")
leafDesc <- merge(leafDesc, access, by.x="ACCESSION", by.y="number")
leafMeas <- merge(leafMeas, access, by.x="ACCESSION", by.y="number")
seedMeas <- merge(seedMeas, access, by.x="NTBG.accession", by.y="number")

#uh oh, issues?
addl$NTBGAcc [!(addl$NTBGAcc %in% access$number) ]
flowers$ACCESSION[!(flowers$ACCESSION %in% access$number) ]
fruitDesc$ACCESSION[!(fruitDesc$ACCESSION %in% access$number) ]
fruitMeas$ACCESSION[!(fruitMeas$ACCESSION %in% access$number) ]
leafDesc$ACCESSION[!(leafDesc$ACCESSION %in% access$number) ]
leafMeas$ACCESSION[!(leafMeas$ACCESSION %in% access$number) ]
seedMeas$NTBG.accession[!(seedMeas$NTBG.accession %in% access$number) ]

basic$accessionNumber[duplicated(basic$accessionNumber)]