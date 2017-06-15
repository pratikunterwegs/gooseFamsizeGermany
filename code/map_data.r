
#'get data
#'
source("dataprep.R")

#'mean flock size at each location

geese.spatial = geese %>% group_by(lon, lat) %>% summarise(meanflock = mean(flocksize, na.rm = T))

geese.spatial$n = (geese %>% group_by(lon, lat) %>% count)$n

#'make spatial
#'
coordinates(geese.spatial) = ~lon+lat

#'export
#'
library(maptools)

writePointsShape(geese.spatial, "flocks")


#'get kde for trektellen sites
#'
library(adehabitatHR)

#'remove site name
trektellen$Name_site = NULL

mig.kernel = kernelUD(trektellen, h = "LSCV")

mig.kde = getverticeshr(mig.kernel, percent = 99)

#'reduce mig.kde to nl map limits
#'assign crs first
#'
library(rgeos)
crs(mig.kde) = crs(land)

#mig.kde = gIntersection(mig.kde, land, byid = TRUE)

#'export
#'
writePolyShape(mig.kde, "trektellen_poly")


#'make spatial polygon grid with max breeding year using code033
#'

writeSpatialShape(geeseorg.grid, "geeseorg_grid")


#'map family movement lines
#'
fam.lines = famcoords
#'remove time for export to shapefile
fam.lines$time = NULL

fam.lines = split(fam.lines, f = fam.lines$fam)

#'make spatial
#'
fam.lines = lapply(fam.lines, function(x){
  SpatialPointsDataFrame(x[,c("lon","lat")], data = x)
})

fam.lines = spLines(fam.lines[[1]], fam.lines[[2]],
                    fam.lines[[3]], fam.lines[[4]],
                    fam.lines[[5]], fam.lines[[6]],
                    fam.lines[[7]], fam.lines[[8]],
                    fam.lines[[9]], fam.lines[[10]],
                    fam.lines[[11]], fam.lines[[12]],
                    fam.lines[[13]],
                    attr = data.frame(fam = names(fam.lines)))

#'make spatial lines
#fam.lines = lapply(fam.lines, function(x){
 # spLines(coordinates(x))
#})

#'export spatial lines
#'
library(maptools)
writeLinesShape(fam.lines, "fam_lines")
