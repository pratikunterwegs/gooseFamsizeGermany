#### Prepare data for analysis####

#libs
library(lubridate);library(plyr);library(dplyr)

####Load cleaned goose flock data####
geese = read.csv("data.goose.clean.csv",row.names = 1)
geese$time = as.Date(geese$time)
#'assign month
geese$month = month(geese$time)
#'make percentages proportions
geese$propjuv = geese$propjuv/100

#'assign wintermonth
#geese$winter_month =  c(c(1:8), geese$month)[match(geese$month, c(c(9:12,1:4), geese$month))]

#'source days since
#source("days_since.r")

#'assign days since the start of winter
#geese$days = days_since(geese$time)

####source omega squared metric####
source("mixed_mods_rsquared.r")

####Load flock level family data####
fams = read.csv("data.fams.coords.csv", row.names = 1)

fams$time = as.Date(fams$time)
#'assign days since winter's start
#fams$days = days_since(fams$time)

####Load families expanded (untabled)####
fams.expand = read.csv("fams.expand.coords.csv", row.names = 1)
fams.expand$time = as.Date(fams.expand$time)
#fams.expand$days = days_since(fams.expand$time)

####Load geese.org data###
geeseorg = read.csv("data.geeseorg.csv", row.names = 1)
geeseorg$date = as.Date(geeseorg$date)
#geeseorg$days = days_since(geeseorg$date)

####Load lemming data####
lemming = read.csv("lemmings.csv", row.names = 1)
lemming$year = as.numeric(lemming$year)

####Load lemming data from nolet et al 2013####
lnolet = read.csv("lemming_nolet.csv", row.names = 1)
lnolet = plyr::rename(lnolet, replace = c("p.index" = "pinnolet"))

####Load migration data####
migration = read.csv("migration_data.csv", row.names = 1)
migration$Date = as.Date(migration$Date)
migration$spring = as.Date(migration$spring)
migration$autumn = as.Date(migration$autumn)
mig.red = migration[,c("Date","Count_effort.min.","NumberperHour","t_since_in","t_to_out","durwinter")]

####Prepare geese####
geese = merge(geese, lemming[,-4], by.x = "Breeding_year", by.y = "year")
#geese = merge(geese, lnolet[,c("year","pinnolet")], by.x = "Breeding_year", by.y = "year", all.x = T)

geese = merge(geese, mig.red, by.x = "time", by.y = "Date", all.x = T)

#'remove fam data
geese = geese[,-c(grep("Fam", colnames(geese)))]

####Prepare fams####
#'add predation + lemming data
fams = merge(fams, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x = T)
#'add migration intensity
fams = merge(fams, mig.red, by.x = "time", by.y = "Date", all.x = T)

####Prepare fams.expand####
#'add lemmings
fams.expand = merge(fams.expand, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x = T)
#'add migration intensity
fams.expand = merge(fams.expand, mig.red, by.x = "time", by.y = "Date", all.x = T)
#'make breeding year a factor
fams.expand$Breeding_year = as.factor(fams.expand$Breeding_year)

####Prep geeseorg####
#'add lemmings
geeseorg = merge(geeseorg, lemming[,-4], by.x = "breedyr", by.y = "year", all.x = T)
#'add migration intensity
geeseorg = merge(geeseorg, mig.red, by.x = "date", by.y = "Date", all.x = T)
geeseorg$breedyr = as.factor(geeseorg$breedyr)

####Remove supporting data####
rm(migration);rm(lemming)


#### Dist to Kolguyev and Pyasina delta ####
#'coordinates for kolguyev and taimyr
kol = c(49, 69)
pya = c(86, 74)


library(geosphere)

#'add distance to kolguyev to flock counts
geese$distkol = distVincentyEllipsoid(p1 = geese[,c("lon","lat")], p2 = kol)/1000

#'make breeding year factor
geese$Breeding_year = as.factor(geese$Breeding_year)
fams$Breeding_year = as.factor(fams$Breeding_year)

#'add dist kolguyev to families data
fams.expand$distkol = distVincentyEllipsoid(p1 = fams.expand[,c("lon","lat")], p2 = kol)/1000
fams$distkol = distVincentyEllipsoid(p1 = fams[,c("lon","lat")], p2 = kol)/1000

#'add dist kolguyev to geese.org data
geeseorg$distkol = distVincentyEllipsoid(p1 = geeseorg[,c("lon","lat")], p2 = kol)/1000


####Subset families ####
#'use only half the families from the lower Rhine zone

#'remove records where flocksize is wrongly entered 0
fams.expand = fams.expand %>% filter(flocksize > 0)

#'select only Rhine data
fams.expand.sub = fams.expand %>% filter(zone !=  "Rhinelands")
#'now subsample only half
fams.rhine = fams.expand %>% filter(zone == "Rhinelands")
n.rhine = dim(fams.rhine)[1]
fams.rhine = fams.rhine[runif(n.rhine/2, 1, n.rhine),]

#'reattach to the main data
fams.expand.sub = rbind(fams.expand.sub, fams.rhine)