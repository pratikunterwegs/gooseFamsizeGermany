####Family sizes####

#'libs

source("knitr_options.r")
library(zoo);library(plyr);library(dplyr);library(purrr);library(purrrlyr)
#'suppress all code output but run code
opts_chunk$set(eval = FALSE)
opts_knit$set(root.dir = "~/git/thesis/code")

#'load saved rdata

load("fams2016.nobursts.rdata")
load("fams2014.rdata")
load("fams2015.rdata")

####Order list by reference bird####

#'modify lists to have the reference adult in 1st position

#'fam An
fams2014[["An"]] = rev(fams2014[["An"]])
#'fam Ro
fams2014[["Ro"]] = fams2014[["Ro"]][c(2,3,1,4)]

#'family Ha
fams2015[["Ha"]] = fams2015[["Ha"]][c(3,1,2,4,5)]

#'family Jo
fams2015[["Jo"]] = rev(fams2015[["Jo"]])

#'family Na
fams2015[["Na"]] = fams2015[["Na"]][c(2,3,1,4,5)]

#'family Ad
fams2016.4[["Ad"]] = fams2016.4[["Ad"]][c(3,2,1,4,5)]

#'family Ti
fams2016.4[["Ti"]] = fams2016.4[["Ti"]][c(3,2,1,4)]

#'family Ev
fams2016.4[["Ev"]] = fams2016.4[["Ev"]][c(5,4,1,2,3,6)]

#'family Wo
fams2016.4[["Wo"]] = fams2016.4[["Wo"]][c(4,3,1,2,5)]

####Remove multi-year tracks####

#'remove dates outside the single year
fams2014 = lapply(fams2014, function(x){lapply(x, function(y){y %>% filter(t < "2014-05-01")})})

fams2015 = lapply(fams2015, function(x){lapply(x, function(y){y %>% filter(t < "2015-05-01")})})


####Append lists####

f1 = append(fams2014.5, fams2016.4)

####Add names to each track####
for(i in 1:13){
    for(j in 1:length(f1[[i]])){
        f1[[i]][[j]]$id = names(f1[[i]])[j]
    }
}

####Add age to each track#####
family_tracks$age = ifelse(family_tracks$id %in% c("X43_AdrieII_M","X44_Adriana_F","Anna","Anton","X71_Jan_M","X70_Janika_F", "X52_EvertII_M","X53_Eva_F", "Hannah","HArkady","HeBerend","Hennie","X82_Chris_M", "X81_Christa_F", "Jouri","Jolanda","Mari","Maria","Nanneke","Napoleon","Rolf","Ronja","X48_Tineke_F","X49_Timo_M", "X58_WouterII_M", "X59_Wolka_F"), "ad", "juv")

####Round each timestamp to the half hour#####

f1 = lapply(f1, function(x){lapply(x, function(y){y %>% mutate(t = round_date(t, "30 minute"))})})


#'remove v, fam, and lag
f1 = lapply(f1, function(x){lapply(x, function(y){y %>% select(t, lon, lat)})})
library(data.table)

#'round position to the half hour. another way of doing it.
#f1 = lapply(f1, function(x){lapply(x, function(y){y %>% slice_rows("t") %>% dmap(function(x) mean(x, na.rm = T))})})

####Align family tracks in time#####

library(purrr); library(purrrlyr)
#'a left join here
f2 = lapply(f1, function(x){reduce(x, left_join, by = "t")})

####Distance from reference to family####

library(geosphere)

#'get distances in another list

fdists = vector("list", 13)

for(z in 1:length(f2)){
 for(i in 1:dim(f2[[z]])[1]){
  for(j in seq(1, length(f2[[z]])-2 ,2))
   fdists[[z]] = c(fdists[[z]], distVincentyEllipsoid(p1 = f2[[z]][i,c(2,3)], p2 = f2[[z]][i,c(j+1,j+2)]))
}
}

####Individual distances matrix#####
#'make a duplicate
fdistm = fdists

#'make each numeric column a matrix. this will need a for loop
for(i in 1:length(f2)){
  fdistm[[i]] = matrix(fdistm[[i]], ncol = length(f1[[i]]), byrow = T)
}

#'make dists a df
fdistm = lapply(fdistm, function(x){x = as.data.frame(x)})

#'add names to dfs
names(fdistm) = names(f2)

save(fdistm, f2, file = "famdists02.rdata")

load("famdists02.rdata")

#####Family sizes######

#'get family sizes per half hour
fdistm3 = lapply(fdistm, function(x){x %>% mutate(fsize= apply(x, 1, function(y){sum(y<1000, na.rm = T)}))})

#'add the timestamps to the matrix
for(i in 1:length(f2)){
  fdistm3[[i]] = cbind(fdistm3[[i]], time = (f2[[i]]$t))
}

library(lubridate)

#'round time to the day
#fsize = lapply(fdistm3, function(x){x = x %>% plyr::summarise(time = round_date(time, "day"), fsize)})

library(purrr);library(zoo)
#'get max family size per day
#fsize2 = lapply(fsize, function(x){x = x %>% slice_rows("time") %>% dmap(max)})

#'set famsize to the max famsize in the next n fixes
fsize2 = lapply(fdistm3, function(x){x = x %>% mutate(fsize = rollapply(fsize, seq(dim(x)[1],1), max, align = "left"))})

save(fsize2, file = "fsize.rdata")

load("fsize.rdata")

####Add coordinates to family sizes####

#'for each timestamp, get the coordinates, mean coords when daily

#'get coords
daycoords = lapply(f2, function(x){x %>% select(t, lon.x, lat.x) %>% plyr::summarise(time = round_date(t, "30 minute"), lon = lon.x, lat = lat.x) %>% slice_rows("time") %>% dmap(mean)})

#'merge coords with fsize2 and assign families
for(i in 1:length(daycoords)){
  daycoords[[i]] = merge(daycoords[[i]], fsize2[[i]], by = "time")
  daycoords[[i]]$fam = names(fsize2)[i]
}

#'keep rel cols
famcoords = lapply(daycoords, function(x){x %>% select(time, lon, lat, fam)})
#'rbind the list
famcoords = bind_rows(famcoords)

save(daycoords, file = "fsize_coords.rdata")

#####Identify splits####

#'select rel cols
daycoords = lapply(daycoords, function(x){x %>% select(time, lon, lat, fam, fsize)})
daycoords = bind_rows(daycoords)
#'split by family
splits = split(daycoords, f = daycoords$fam)

#'get attrs at split
splits2 = lapply(splits, function(x){x[which(diff(x$fsize)<0)+1,]})

ends = lapply(splits, function(x){rbind(x[1,], x[dim(x)[1],])})

splits2 = bind_rows(splits2)
splits2$event = "Split"

ends = bind_rows(ends)      
ends$event = rep(c("Start","Exit"), 13)

splits = rbind(splits2, ends)

splits = splits %>% plyr::arrange(fam, time)

#'bind rows
splits2 = bind_rows(splits)

coordinates(splits2) = ~lon+lat

#'convert to spatial lines for tmap
#famlines = split(splits[,c("lon","lat")], f = splits$fam)

#famlines = spLines(lapply(famlines, function(x){as.matrix(x)}))

####Save Rdata####

save(daycoords, splits, splits2, famcoords, fam.move, file = "fsize_coords.rdata")
