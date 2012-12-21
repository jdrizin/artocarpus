#this script is an attempt to bust apart some real ugly date data. the idea
# is to break apart the single date field along any punctuation and write
# those into three other values, then I'll have to flip through by hand
# to solve the rest :/

#read in the file. apparently it's tab-delimited
baddate <- read.delim("private/collectiondata.csv", header=TRUE, sep="\t")

colldate <- as.character(baddate$CollectionDate)

#make other delimiters into a . for splitting, then split
colldate <- gsub("[\\.,-/]", ".", colldate)
datelist <- strsplit(colldate,"\\.") #it's a regexp. gotta escape the .

#create a dummy database
dumvec <- rep("zero", 1245)
dumdf  <- data.frame(one=dumvec, two=dumvec, three=dumvec, 
							stringsAsFactors=FALSE)

#begin an ugly loop. 
i<-1
while(i <= length(datelist)){
	tempvec <- unlist(datelist[i])
	if(length(tempvec) < 3){
		tempvec <- c(tempvec, rep(0, (3-length(tempvec))))
	}
	#now tempvec is 3 items long. time to dump it into a new dataframe
	dumdf[i,1] <- as.character(tempvec[1])
	dumdf[i,2] <- as.character(tempvec[2])
	dumdf[i,3] <- as.character(tempvec[3])
	print(i)
	i <- i+1
}

#merge the dfs and dump the dataframe
bigdate <- cbind(baddate, dumdf)
write.csv(bigdate, file="private/bigdate.csv")