source("dataprep.R")

#'remove any flocksizes mistakenly assigned 0
fams.expand = fams.expand %>% filter(flocksize > 0)

#'make level of predation a factor. currently being modelled as the numeric value p.index
fams.expand$pred = as.factor(fams.expand$pred)

#'should only complete cases be considered? yes, for the predictors.
fams.expand = fams.expand[complete.cases(fams.expand[,c("lon","lat","flocksize","famsize","Breeding_year","p.index","days","t_to_out","t_since_in","durwinter")]),]

#'set the breeding year to be a factor
fams.expand$Breeding_year = as.factor(as.character(fams.expand$Breeding_year))

geeseorg$breedyr = as.factor(geeseorg$breedyr)


#'how many families from the Rhinelands?
plyr::count(fams.expand, "zone")
#'as many as from the other zones combined, almost

#'subsample to have only half as many. first remove rhinelands data from the frame
fams.expand.sub = fams.expand %>% filter(zone !=  "Rhinelands")
#'now subsample
fams.rhine = fams.expand %>% filter(zone == "Rhinelands")
n.rhine = dim(fams.rhine)[1]
fams.rhine = fams.rhine[runif(n.rhine/2, 1, n.rhine),]

#'reattach to the main data
fams.expand.sub = rbind(fams.expand.sub, fams.rhine)