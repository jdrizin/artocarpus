#### cleaning up the ugly data ######
# this script is for cleaning up the breadfruit data
# it'll go in the breadfruit section of the database

########## basic sample data ##########
basic <- read.csv("/home/josh/artocarpus/excelFilesForJosh/basicsampledata.csv")

#things that need cleanup: 
# dates: date.planted (did slight manual edits), collected, dna.extraction
# genemapperID: XXX_ -> iXXX
# seeds: clean up responses? and below?
# seasonality group, fruit nutrient analysis, aflp ajb data, systematic botany

########## fixing dates ##########
# collected and dna extraction are straightforward: US format, MM/DD/YYYY,
# sometimes wrapped in parens. convert these to YYYY-MM-DD

basic$Collected <- gsub("[()]", "", basic$Collected) #strip out parens
basic$DNA.Extraction <- gsub("[()]", "", basic$DNA.Extraction)

#reformat dates with as.Date, which sanely reformats to YYYY-MM-DD by default
basic$Collected <- as.character(as.Date(basic$Collected, format="%m/%d/%Y"))
basic$DNA.Extraction <- as.character(as.Date(basic$DNA.Extraction, format="%m/%d/%Y"))
basic$date.planted.fix <- as.character(as.Date(basic$date.planted.fix, format="%m/%d/%Y"))


########## genemapper id fix ##########

#strip out the _ and prepend with i, like the other IDs.
basic$Genemapper.ID <- paste("i", sub("_", "", basic$Genemapper.ID), sep="")


########## write it out ############
write.csv(basic, file="/home/josh/artocarpus/excelFilesForJosh/basicsampledata-fix.csv")



########## 'additional data' ############
#don't rerun this! 2013-02-13

addl <- read.csv("/home/josh/artocarpus/excelFilesForJosh/additionaldata.csv")
breadgrd <- paste(addl$Grd1, addl$Grd2, addl$Grd3, addl$Grd4) #paste it together
breadgrd <- gsub("[ ]*$", "", breadgrd) #strip trailing whitespace (regex!)
breadgrd <- gsub(" ", "; ", breadgrd) #change spaces to "; " for readability
addl$Grd <- breadgrd
write.csv(addl, file="/home/josh/artocarpus/excelFilesForJosh/additionaldata.csv")

# found something new to fix: NTBG Accession number. it needs a period before the last three characters.
addl <- read.csv("/home/josh/artocarpus/excelFilesForJosh/additionaldata.csv")
attach(addl)
# split and repaste the string with the period delimiter. don't rerun this either.
addl$NTBG.Acc <- paste(substr( NTBG.Acc, 1, nchar(NTBG.Acc)-3 ), 
		substr( NTBG.Acc, nchar(NTBG.Acc)-2, nchar(NTBG.Acc) ),
		sep=".")
detach(addl)
write.csv(addl, file="/home/josh/artocarpus/excelFilesForJosh/additionaldata.csv")
