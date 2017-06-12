#'load fams data
load("fsize_coords.rdata")

#'get dists from fam.move
famdist = lapply(fam.move2, function(x){
  data.frame(lon = coordinates(x)[,1], lat = coordinates(x)[,2],
             time = timestamps(x), dist = c(NA, distance(x)))
})

#'remove old families
famdist = famdist[c("Ad","Ch","Ev", "Ja","Ti","Wo")]

#'filter famdist
#'
famdist = lapply(famdist, function(x){
  x %>% filter(time < "2017-04-01")
})

#'add names to fams
for(i in 1:length(famdist)){
  famdist[[i]]$name = names(famdist)[i]
}


#### load goose inter fix distances ####
#load("goosedists.Rdata")

#### transform into UTM ####
utmfam = lapply(famdist, function(x){as.matrix(data.frame(x) %>% 
                                                 dplyr::select(lon, lat))})

library(sp)

utmfam = lapply(utmfam, function(x){SpatialPoints(x, 
                                                  proj4string = CRS("+proj=longlat +datum=WGS84 +no_defs +ellps=WGS84 +towgs84=0,0,0"))})

utmfam = lapply(utmfam, function(x){spTransform(x,
                                                CRSobj = "+proj=utm +zone=31 +ellps=WGS84 +datum=WGS84 +units=m +no_defs")})

utmfam = lapply(utmfam, coordinates)

#### assign utm coords to goosedist ####

for(i in 1:length(famdist)){
  famdist[[i]][,c("lon","lat")] = utmfam[[i]]
}

####get revisit data####
#'
#'get revisit stats for families
#'
#'
#'
visits = lapply(famdist, function(x){
  getRecursions(data.frame(x[,c("lon","lat","time")]), 2000, "hours")
})

#'save family visits
save(visits, file = "famvisits.Rdata")
