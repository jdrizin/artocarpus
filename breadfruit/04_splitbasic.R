setwd("/home/josh/artocarpus/october/")

bread <- read.csv("basicsample_results_2013_10_16_16_20_20.csv")

attach(bread)

sort(accessionNumber[duplicated(accessionNumber)])

#so bread has nonunique collection numbers. the nonunique data seems to be genetic
#let's just split the genetic junk out into yet another table. what's 1 more 
#when you already have 8?

# data differs on dupes in GRIDlocation, genemapperid, microplatewellnum, 
# collecteddate, dnaextractiondate, ratio260280, dnaconcugml,

bread.collect <- data.frame(accessionNumber, collector, city?state?)
bread.overflow
bread.genes <- data.frame(accessionNumber, SSRSamplesCollected, genemapperID, 
								  microplateWellNum, plateNum, Sample, collectedDate, 
								  DNAExtractionDate, ratio260280, DNAConcugml, ploidy, 
								  )