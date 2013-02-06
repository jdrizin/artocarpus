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
edf <- NA #blank df for rbinding
bv <-rep("", dfLen) #blank vector for df init

for (i in 1:colLen ){
	
	#initialize a dataframe for the internal loop
	idf <- data.frame(Taxon=bv, ID.number=bv, Ploidy=bv, microsat=bv, value=bv,
							stringsAsFactors=FALSE)
	
	#for loop to make a dataframe
	for (j in 1:dfLen ){
		idf[j, ] <- c( as.character(Taxon[j]), as.character(ID.number[j]), Ploidy[j], cols[i], get(cols[i])[j] )
	}
	
edf <- rbind(edf, idf) #bind it together. use it outside the loop.
}

edf <- edf[-1,] #first line is an NA, strip it out

detach(bfmicro) #detach, since we'll be sharing names across dataframes

#finished transforming the structure of the matrices.
################################################################################
