#this script is mainly figuring out how to deal with the jackfruit data

#i split the data nyree gave me into two files in excel: microsat data and other
jack <- read.csv("/home/josh/artocarpus/jackfruit/otherdata.csv")
micro <-read.csv("/home/josh/artocarpus/jackfruit/microsats.csv")

#so I think X26a through x171b, 37-72, are microsats. we'll want to run this
#through the microsat conversion script, though it'll need to be modified.

#other potential splits:
# # sample+location info / fruit info / tree info
# # sample+location / fruit and tree info
# # sample / location / other

########### reformat the microsats ##########
# code copied and modified from microsat_reformat

cols <- names(micro)[-1] #skip the ID

#### transform dataframe #######################################################
# begin attach(micro). 

attach(micro) #attach is ugly, but it'll do

dfLen <- length(Sample) #for the blank df inside the loop
colLen<- length(cols)
edf <- NA #blank df for rbinding
bv <-rep("", dfLen) #blank vector for df init

for (i in 1:colLen ){
	
	#initialize a dataframe for the internal loop
	idf <- data.frame(Sample=bv, microsat=bv, value=bv, stringsAsFactors=FALSE)
	
	#for loop to make a dataframe
	for (j in 1:dfLen ){
		idf[j, ] <- c( as.character(Sample[j]), cols[i], get(cols[i])[j] )
	}
	
	edf <- rbind(edf, idf) #bind it together. use it outside the loop.
}

edf <- edf[-1,] #first line is an NA, strip it out

detach(micro) #detach, since we'll be sharing names across dataframes

########## write out df ##########
write.csv(edf, file="/home/josh/artocarpus/jackfruit/microsat-reformatted.csv")