
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

load("fams2016.full.rdata")
load("oldfams.full.rdata")

f1 = append(fams2014.5, fams2016.4)

f1[["Wo"]] = f1[["Wo"]][1:4]

f1 = lapply(f1, function(x){lapply(x, function(y){
  y %>% dplyr::select(-t) %>% filter(lat<54.2, lat>50, lon < 10)
})})


#'make all geese spatial
#'
f2 = lapply(f1, function(x){lapply(x, function(y)
  {y = SpatialPointsDataFrame(coords = y[,c("lon","lat")], data = y)})})


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
writeLinesShape(fam.lines, "fam_lines1")

f3 = unlist(f2)

b = as.vector(unlist(lapply(f1, function(x){lapply(x, function(y){
  unique(as.character(y$fam))
})})))

a = as.vector(unlist(lapply(f1, function(x){lapply(x, function(y){
  unique(as.character(y$id))
})})))

gooselines = spLines(f3[[1]], f3[[2]], f3[[3]],
                     f3[[4]], f3[[5]], f3[[6]],
                     f3[[7]], f3[[8]], f3[[9]],
                     f3[[10]], 
                     f3[[11]], f3[[12]], f3[[13]], 
                     f3[[14]], f3[[15]], f3[[16]], 
                     f3[[17]], f3[[18]], f3[[19]], 
                     f3[[20]], 
                     f3[[21]], f3[[22]], f3[[23]], 
                     f3[[24]], f3[[25]], f3[[26]], 
                     f3[[27]], f3[[28]], f3[[29]], 
                     f3[[30]],
                     f3[[31]], f3[[32]], f3[[33]],
                     f3[[34]], f3[[35]], f3[[36]],
                     f3[[37]], f3[[38]], f3[[39]],
                     f3[[40]],
                     f3[[41]], f3[[42]], f3[[43]],
                     f3[[44]], f3[[45]], f3[[46]],
                     f3[[47]], f3[[48]], f3[[49]],
                     f3[[50]],
                     f3[[51]], f3[[52]], f3[[53]],
                     f3[[54]], f3[[55]], f3[[56]],
                     f3[[57]], f3[[58]], f3[[59]],
                     f3[[60]],
                     f3[[61]], f3[[62]], f3[[63]],
                     attr = data.frame(fam = b, id = a))



writeLinesShape(gooselines, "gooselines")


#'load fsizecoords.rdata
#'
#'
png(file = "~/git/thesis/texts/fam.splits.png", width = 800, height = 800,
    res = 300)
ggplot()+
  geom_spatial(nl)+
  geom_path(data = famstats, 
            aes(x = mlon, y = mlat, group = fam, alpha = p,
                                  size = fsize, col = tflights))+
  scale_color_gradient(low = "yellow", 
                       high = "purple")+
  theme_bw()+labs(list(x = NULL, y= NULL))+
  guides(col = F, alpha = F, size = F)+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(), 
        axis.text.y = element_blank(), axis.text.x = element_blank(),
        axis.ticks.y = element_blank(), axis.ticks.x = element_blank())
dev.off()