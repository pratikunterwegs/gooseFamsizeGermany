library(lubridate)
####Load goose flock data####
geese = read.csv("data.goose.clean.csv",row.names = 1)
geese$time = as.Date(geese$time)
#'assign month
geese$month = month(geese$time)
#'make percentages proportions
geese$propjuv = geese$propjuv/100

#'assign wintermonth
#geese$winter_month =  c(c(1:8), geese$month)[match(geese$month, c(c(9:12,1:4), geese$month))]

#'source days since
source("days_since.r")

#'assign days since the start of winter
geese$days = days_since(geese$time)

#'source omega squared
source("mixed_mods_rsquared.r")

####Load flock level family data####
fams = read.csv("data.fams.coords.csv", row.names = 1)

fams$time = as.Date(fams$time)
#'assign days since winter's start
fams$days = days_since(fams$time)

####Load fams expanded####
fams.expand = read.csv("fams.expand.coords.csv", row.names = 1)
fams.expand$time = as.Date(fams.expand$time)
fams.expand$days = days_since(fams.expand$time)

####Load geese.org data###
geeseorg = read.csv("data.geeseorg.csv", row.names = 1)
geeseorg$date = as.Date(geeseorg$date)
geeseorg$days = days_since(geeseorg$date)

####Load lemming data####
lemming = read.csv("lemmings.csv", row.names = 1)

####Load migration data####
migration = read.csv("migration_data.csv", row.names = 1)
migration$Date = as.Date(migration$Date)
migration$spring = as.Date(migration$spring)
migration$autumn = as.Date(migration$autumn)
mig.red = migration[,c("Date","Count_effort.min.","NumberperHour","t_since_in","t_to_out","durwinter")]

####Load flocks.fams####
flock.fams = read.csv("flock.fams.csv", row.names = 1)
flock.fams$time = as.Date(flock.fams$time)
flock.fams$fsize = as.numeric(flock.fams$fsize)
flock.fams$days = days_since(flock.fams$time)

####Prepare geese####
geese = merge(geese, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x=T)
geese = merge(geese, mig.red, by.x = "time", by.y = "Date", all.x = T)

#'remove fam data
geese = geese[,-c(grep("Fam", colnames(geese)))]

####Prepare fams####
fams = merge(fams, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x = T)
fams = merge(fams, mig.red, by.x = "time", by.y = "Date", all.x = T)

####Prepare fams.expand####
fams.expand = merge(fams.expand, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x = T)
fams.expand = merge(fams.expand, mig.red, by.x = "time", by.y = "Date", all.x = T)

####Prep geeseorg####
geeseorg = merge(geeseorg, lemming[,-4], by.x = "breedyr", by.y = "year", all.x = T)
geeseorg = merge(geeseorg, mig.red, by.x = "date", by.y = "Date", all.x = T)

####Prep flock.fams####
flock.fams = merge(flock.fams, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x = T)
flock.fams = merge(flock.fams, mig.red, by.x = "time", by.y = "Date", all.x = T)

####Remove supporting data####
rm(migration);rm(mig.red);rm(lemming)