#this script will convert the across-column microsat loc-* to a format more
#useful for our database: (taxon,id,ploidy) (id, locname, locdata), linked by id
#
#this script will take a CSV file of arbitrary length (vertically). you can also
#convert an arbitrary number of locs, as long as they're named *loc*, and turn it
#into the two-row setup.

bfmicro <- read.csv("userscripts/breadfruit_microsat_testingdata.csv")

cols <- grep("loc", names(bfmicro), value=T) #pull out only the loc*

################################################################################
# begin attach(bfmicro). 

attach(bfmicro) #attach is ugly, but it'll do

dfLen <- length(Taxon) #for the blank df inside the loop
colLen<- length(cols)
edf <- NA

for (i in 1:colLen ){
	
	#initialize a dataframe for the internal loop
	idf <- data.frame(microsat=rep("", dfLen), value=rep("", dfLen),
							stringsAsFactors=FALSE)
	
	#for loop to make a dataframe
	for (j in 1:dfLen ){
		idf[j, 1] <- cols[i] 
		idf[j, 2] <- get(cols[i])[j]
	}
	
edf <- rbind(edf, idf) #bind it together. use it outside the loop.
}

