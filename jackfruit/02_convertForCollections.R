setwd("/home/josh/artocarpus/october/")
jack <- read.csv("sample_results_2013_10_04_16_40_11.csv")

names(jack)
#ok, so i'm going to tear this dataframe asunder. part of it will be hacked up
# to fit into the Collections table and the other half into a jackfruit leftovers
# table, where I will use Xataface to merge them back together. I know, right?

#fields to use in collections: sample, village, district, gpslat/lon, accuracy(m),
#project, family, genus, species, authority, determinedby, Country, notes

attach(jack) # i still don't like attach(), but it's useful

Date <- as.character(strptime(Date, format="%d-%b-%Y")) #reformat dates first

coll <- data.frame(Sample, Family, Genus, Species, Authority, determinedBy, Date, District, Country, notes, GPSLat, GPSLong, AccuracyMeters)

overflow <- subset(jack, select=-c(Family, Genus, Species, Authority, determinedBy, Date, District, Country, notes, GPSLat, GPSLong, AccuracyMeters)) #drop the above, except sample

write.csv(coll, file="jackfruit_collection.csv")
write.csv(overflow, file="jackfruit_overflow.csv")