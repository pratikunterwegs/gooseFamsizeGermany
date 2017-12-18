#### Who split when ####
#### What was the age (ad/juv) of the individual splitting off from a family?
#### 

source("knitr_options.r")
library(zoo);library(plyr);library(dplyr);library(purrr);library(purrrlyr)

#'load fdistm2
#'
load("famdists02.rdata")

#'load splits
#'
load("fsize_coords.rdata")

#'get data on whether geese were within 1km of the reference
#'
#'are indivs within 1km or not?
fdistm2 = lapply(fdistm, function(x) x < 1000)

for(i in 1:13) fdistm2[[i]][is.na(fdistm2[[i]])] = 0

for(i in 1:13) fdistm2[[i]] = rollapply(fdistm2[[i]], seq(dim(fdistm2[[i]])[1],1), max, align = "left")

fdistm2 = lapply(fdistm2, function(x) x = as.data.frame(x))

#'add the timestamps for each 1/2 hour
#'
#'add the timestamps to the matrix
for(i in 1:length(f2)){
  fdistm2[[i]] = cbind(fdistm2[[i]], time = (f2[[i]]$t))
}

#'now join fdistm2 and splits by timestamp
#'
for(i in 1:13) split.id[[i]] = left_join(fams.splits[[i]], fdistm2)