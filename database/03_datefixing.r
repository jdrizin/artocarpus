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

#begin an ugly loop. apply might be better, but i know how to do it this way.
#for(i in 1:length(datelist)){
i<-1
while(i <= length(datelist)){
	tempvec <- unlist(datelist[i])
	if(length(tempvec) < 3){
		tempvec <- c(tempvec, rep(0, (3-length(tempvec))))
		}
	#now tempvec is 3 items long. time to dump it into a new dataframe
	if(i == 1){
		datedf.new <- data.frame(one=tempvec[1], two=tempvec[2], three=tempvec[3])	
	}
	else{
		tempdf <- data.frame(one=tempvec[1], two=tempvec[2], three=tempvec[3])
		datedf.new <- rbind(datedf.new, tempvec)
	}
	i <- i+1
}