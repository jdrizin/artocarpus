#this file contains examples of R scripts to put various data together from the 
#artocarpus databases

#set your working directory. i have picked a directory that is not part of the 
#git repository.
setwd("/home/josh/source/artocarpus_private")

collection <- read.csv("collectiondata_results_2013_01_22_12_05_58.csv")
extractions <- read.csv("collectiondata_results_2013_01_22_12_05_58.csv")
sequences <- read.csv("collectiondata_results_2013_01_22_12_05_58.csv")
