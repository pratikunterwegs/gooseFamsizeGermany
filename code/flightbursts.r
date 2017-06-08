#finding flight ends
#'load files
setwd("~/git/thesis/code/")

library(plyr);library(dplyr)
library(lubridate)
library(zoo)
library(purrr); library(purrrlyr)
load("bursts16.rdata")

#'unlist and keep only the reference birds
#'
#'
flights = flights2016
flights = unlist(flights, recursive = F)
#'retain reference birds
ref.flight = flights[c("Ad.X43_AdrieII_M",
                       "Ti.X49_Timo_M","Ev.X52_EvertII_M","Wo.X58_WouterII_M",
                       "Ch.X82_Chris_M","Ja.X71_Jan_M")]


#'keep only records where lag is 2 and speed is above 2m/s
#'
ref.flight = lapply(ref.flight, function(x){x %>% 
    filter(v > 2)})

#'now find lags between flights
#'
ref.flight = lapply(ref.flight, function(x){x %>% 
    mutate(fint = as.numeric(difftime(c(x$t[-1], NA), x$t)))})


#'assign categorical values to flight ends
#'
ref.flight = lapply(ref.flight, function(x){x %>% 
    mutate(event = as.factor(ifelse(fint < 600, "flight","end")),
           day = round_date(t, "day"))})

#'how many ends per day?
#'
flightsperday = lapply(ref.flight, function(x){x %>% 
    group_by(day) %>% filter(event == "end") %>% count(event)})

#'when did the flights end?
#'
flightends = lapply(ref.flight, function(x){x %>% 
    filter(event == "end")})

#'load splits data
load("fsize_coords.rdata")

#'split famcoords into a list by family
#'
fams.splits = split(famcoords, f = famcoords$fam)

#'keep only 2016 birds
#'
fams.splits = fams.splits[c("Ad","Ch", "Ev", "Ja","Ti","Wo")]

#'time since last flight
#'
for(i in 1:6){
 fams.splits[[i]]$t.to.fly = apply(fams.splits[[i]], 1, function(x){
    min(abs(as.numeric(difftime(x["time"], flightends[[i]]$t))))
  })
}

#'add NA to each element of fam.dist
#'
fam.dist = lapply(fam.dist, function(x){c(NA, x)})

#'keep only 2016 fams

fam.dist = fam.dist[c("Ad","Ch","Ev","Ja","Ti","Wo")]

#'add dists to fams.splits
#'
for(i in 1:6){
  fams.splits[[i]]$dist = fam.dist[[i]]
}

#'save object, return later
#'
save(fams.splits, file = "famssplitMCMCmodel.rdata")
