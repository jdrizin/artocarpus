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


########## other weirdness ############



########## 'additional data' ############
addl <- read.csv("/home/josh/artocarpus/excelFilesForJosh/additionaldata.csv")
breadgrd <- paste(addl$Grd1, addl$Grd2, addl$Grd3, addl$Grd4) #paste it together
breadgrd <- gsub("[ ]*$", "", breadgrd) #strip trailing whitespace (regex!)
breadgrd <- gsub(" ", "; ", breadgrd) #change spaces to "; " delimitation: mainly to read
addl$Grd <- breadgrd

