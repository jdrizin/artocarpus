#### cleaning up the ugly data ######
# this script is for cleaning up the breadfruit data
# it'll go in the breadfruit section of the database

########## basic sample data ##########
basic <- read.csv("/home/josh/artocarpus/excelFilesForJosh/basicsampledata.csv")

#things that need cleanup: 
# dates: date.planted (needs manual work?), collected, dna.extraction
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
