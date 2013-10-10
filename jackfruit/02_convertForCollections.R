setwd("/home/josh/artocarpus/october/")
jack <- read.csv("sample_results_2013_10_04_16_40_11.csv")

names(jack)
#ok, so i'm going to tear this dataframe asunder. part of it will be hacked up
# to fit into the Collections table and the other half into a jackfruit leftovers
# table, where I will use Xataface to merge them back together. I know, right?

#fields to use in collections: sample, village, district, gpslat/lon, accuracy(m),
#project, family, genus, species, authority, determinedby, Country, notes

attach(jack) # i still don't like attach(), but it's useful

#things to fix: date, the N and E in the latlong

coll <- data.frame(Sample, Family, Genus, Species, Authority, determinedBy, Date, District, Country, notes, GPSLat, GPSLong, AccuracyMeter)