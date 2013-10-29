#setwd("/home/josh/artocarpus/october/")

#so bread has nonunique collection numbers. the nonunique data seems to be genetic
#let's just split the genetic junk out into yet another table. what's 1 more 
#when you already have 8?

#read in the datafiles.oh
datapath <- "/home/josh/artocarpus/csvs/breadfruit/"
datafiles <- list.files(datapath, pattern="csv$") #regex: only files ending in csv

basic <- read.csv(paste0(datapath, datafiles[2]))
basic$accessionNumber <- sub(pattern=".000", replacement="", as.character(basic$accessionNumber), fixed=TRUE) #strip the added .000 when R read them in as numbers

addl <- read.csv(paste0(datapath, datafiles[1]))
coding <- read.csv(paste0(datapath, datafiles[3]))
flowers <- read.csv(paste0(datapath, datafiles[4]))
fruitDesc <- read.csv(paste0(datapath, datafiles[5]))
fruitMeas <- read.csv(paste0(datapath, datafiles[6]))
leafDesc <- read.csv(paste0(datapath, datafiles[7]))
leafMeas <- read.csv(paste0(datapath, datafiles[8]))
seedMeas <- read.csv(paste0(datapath, datafiles[9]))

#so really I just need to map a memerge(addl, accessions, by.x=NTBGAcc, by.y=number, all.x=TRUE)rged UID into all the tables. this is based on basic sample data
accessions <- unique(data.frame(prefix=basic$accessionPrefix, number=basic$accessionNumber))
accessions$UID <- paste0(accessions$prefix, accessions$number)
accessions <- data.frame(UID=accessions$UID, number=accessions$number) #drop letters now

#now we need to merge it in with all the other dataframes.
addl <- merge(addl, accessions, by.x="NTBGAcc", by.y="number", all.x=TRUE)
basic <- merge(basic, accessions, by.x="accessionNumber", by.y="number", all.x=TRUE)
flowers <- merge(flowers, accessions, by.x="ACCESSION", by.y="number", all.x=TRUE)
fruitDesc <- merge(fruitDesc, accessions, by.x="ACCESSION", by.y="number", all.x=TRUE)
fruitMeas <- merge(fruitMeas, accessions, by.x="ACCESSION", by.y="number", all.x=TRUE)
leafDesc <- merge(leafDesc, accessions, by.x="ACCESSION", by.y="number", all.x=TRUE)
leafMeas <- merge(leafMeas, accessions, by.x="ACCESSION", by.y="number", all.x=TRUE)
seedMeas <- merge(seedMeas, accessions, by.x="NTBG.accession", by.y="number", all.x=TRUE)

write.csv(addl, file=paste0(datapath, "ntbg/", datafiles[1]), row.names=F)
write.csv(coding, file=paste0(datapath, "ntbg/", datafiles[3]), row.names=F)
write.csv(flowers, file=paste0(datapath, "ntbg/", datafiles[4]), row.names=F)
write.csv(fruitDesc, file=paste0(datapath, "ntbg/", datafiles[5]), row.names=F)
write.csv(fruitMeas, file=paste0(datapath, "ntbg/", datafiles[6]), row.names=F)
write.csv(leafDesc, file=paste0(datapath, "ntbg/", datafiles[7]), row.names=F)
write.csv(leafMeas, file=paste0(datapath, "ntbg/", datafiles[8]), row.names=F)
write.csv(seedMeas, file=paste0(datapath, "ntbg/", datafiles[9]), row.names=F)