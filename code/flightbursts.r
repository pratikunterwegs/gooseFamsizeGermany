#### data for split prediction model ####

setwd("~/git/thesis/code/")

library(plyr);library(dplyr)
library(lubridate)
library(zoo)
library(purrr); library(purrrlyr)
library(recurse)

#### getting bursts ####

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

#'time since most recent flight. if a flight occured just after the 
#'half hour, it is considered the nost recent flight, due to the way in
#'which the time difference (calcd as the minimum absolute diff) is
#'found
#'
#'
#'reorder flightends!
#'
flightends = flightends[c(1,5,3,6,2,4)]

for(i in 1:6){
  for(j in 1:dim(fams.splits[[i]])[1]){
    z = as.numeric(difftime(fams.splits[[i]]$time[j],
                            flightends[[i]]$t, units = "mins"))
    z = z[z>0]
    fams.splits[[i]]$t.to.fly[j] = min((z))
  }
}

#'assign family sizes again, as max between each record and the last
#

fams.splits = lapply(fams.splits, function(x)
  {x = x %>% mutate(fsize = rollapply(fsize, seq(dim(x)[1],1), 
                function(x){max(x, na.rm = T)}, align = "left"))})



#'add NA to each element of fam.dist
#'
fam.dist = lapply(fam.dist, function(x){c(NA, x)})

#'keep only 2016 fams

fam.dist = fam.dist[c("Ad","Ch","Ev","Ja","Ti","Wo")]

#'add distances between half hourly positions
#'
for(i in 1:6){
  fams.splits[[i]]$dist = fam.dist[[i]]
}

#'save object, return later
#'
save(fams.splits, file = "famssplitMCMCmodel.rdata")


#### mean flights per day ####
mean(unlist(lapply(flightsperday, function(x){mean(x$n)})))