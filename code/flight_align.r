library(purrr); library(data.table)
library(plyr);library(dplyr)
library(purrrlyr)
library(lubridate)
#'get fam ad flights
load("bursts16.rdata")

#'set the families in the right order

flights2016[["Ad"]] = flights2016[["Ad"]][c(3,2,1,4,5)]

#'family Ti
flights2016[["Ti"]] = flights2016[["Ti"]][c(3,2,1,4)]

#'family Ev
flights2016[["Ev"]] = flights2016[["Ev"]][c(5,4,1,2,3,6)]

#'family Wo
flights2016[["Wo"]] = flights2016[["Wo"]][c(4,3,1,2,5)]

#'select relevant columns and filter data
flights2016 = lapply(flights2016, function(x){lapply(x, function(x)
  x %>% select(lon, lat, t, v, az) %>% filter(v >=2, lat <54) %>% 
    select(t, az))})

#'left join by time
flights2016 = lapply(flights2016, function(x){
  reduce(x, left_join, by = "t")})

#'remove incomplete cases
flights2016 = lapply(flights2016, function(x){
  x[complete.cases(x),]})

#'create new df list with mean azimuth every 5 minutes.
flightvars = lapply(flights2016, function(x){x %>% group_by(time = floor_date(t, "5 minute")) %>% 
  dmap(mean) %>% select(time, grep("az", names(x), value = T))})

#'get variance in flight azimuth
flightvars = lapply(flightvars, function(x){
  x %>% mutate(flyvar = apply(x[,c(grep("az", names(x), value = T))],
                              1, function(x){sd(x, na.rm = T)})) %>% 
    select(time, flyvar)})

save(flightvars, file = "flightvars.rdata")

#### assign families ####

for(i in 1:6){
  flightvars[[i]]$fam = names(flightvars)[i]
}

#### get split data ####

load("fsize_coords.rdata")

#' row bind the list of flight azimuth variances
#' 
flightvars = bind_rows(flightvars)

for(i in names(flights2016)){
  apply(splits %>% filter(fam == i) %>% select(time), 1,
        function(x){
         z = difftime(fams.splits[[i]]$time[j],
                   flightends[[i]]$t, units = "mins")
        })
}
