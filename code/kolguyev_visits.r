#finding flight ends
#'load files
setwd("~/git/thesis/code/")

library(plyr);library(dplyr)
library(lubridate)
library(zoo)
library(purrr); library(purrrlyr)
library(recurse)

####when geese arrived 2016####
####load kolguyev birds####

load("kolguyev2016tracks.rdata")

#'get entry times over the 8 degree line
early = kolguyev2016[kolguyev2016$location_long <= 8,]

#'remove bean geese
early = early[grep("KOL", early@trackId),]

#'split into indi tracks
early = split(early)

#'find the first dates
early = lapply(early, function(x){min(timestamps(x))})

#'bind rows and transpose
early = as.data.frame(t(bind_rows(early)))

early$V1 = as.POSIXct(early$V1)

#'median entry date into the netherlands
entry = median(early$V1)

#'remove bean geese from the main data
#'
#'
kolguyev2016 = kolguyev2016[grep("KOL", kolguyev2016@trackId),]

#'convert to list of moves
kolguyev2016 = split(kolguyev2016)

#'retain useful data: coords, time, v, lag
#'
kolguyev2016 = lapply(kolguyev2016, function(x){
  data.frame(lon = coordinates(x)[,1], lat = coordinates(x)[,2],
             time = timestamps(x), lag = c(NA, timeLag(x)))
})

#'remove flights and after 2017
kolguyev2016 = lapply(kolguyev2016, function(x){
  x %>% filter(lag > 2, time < "2017-01-01")
})

#'remove before 1 Nov 2016
kolguyev2016 =  lapply(kolguyev2016, function(x){
  x %>% filter(time > "2016-11-01")
})

#'remove 27M
#'
kolguyev2016["KOL_27_M"] = NULL

#'make move again
#'
kol2 = lapply(kolguyev2016, function(x){
  x = move(x$lon, x$lat, x$time,
           proj = CRS("+proj=longlat +ellps=WGS84"))
})

koldist = lapply(kol2, function(x){
  data.frame(lon = coordinates(x)[,1], lat = coordinates(x)[,2],
             time = timestamps(x), dist = c(NA, distance(x)))
})

koldist = lapply(koldist, function(x){
  x %>% mutate(time = round_date(time, "30 minute")) %>% 
    slice_rows("time") %>% dmap(mean)
})

#'goose distances moved
#'
goosedist = append(koldist, famdist)

#'add names
for(i in 1:length(goosedist)){
  goosedist[[i]]$name = names(goosedist)[i]
}
