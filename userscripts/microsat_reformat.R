#this script will convert the across-column microsat loc-* to a format more
#useful for our database: (taxon,id,ploidy) (id, locname, locdata), linked by id

bfmicro <- read.csv("userscripts/breadfruit_microsat_testingdata.csv")

grep("loc", names(bfmicro), value=T) #pull out only the loc*