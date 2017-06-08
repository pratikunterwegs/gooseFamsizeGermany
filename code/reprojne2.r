library(sp);library(raster);library(rgdal)
library(maptools)
library(plotKML)
ne1 = raster("~/Documents/Codes/NE1_50M_SR/NE1_50M_SR.tif")

crs(ne2)

ne1.albers = reproject(ne1, CRS("+proj=aea +lat_1=43 +lat_2=62 +lat_0=30 +lon_0=10 +x_0=0 +y_0=0 +ellps=intl +units=m +no_defs"))

writeRaster(ne1.albers, filename = "~/Documents/Codes/ne1.albers.tif")


####kolguyev migration tracks####

kolguyev2016 = kolguyev2016[grep("KOL", kolguyev2016@trackId),]

kolguyev2016 = kolguyev2016[kolguyev2016$timestamp < "2016-10-30",]

kolguyev2016 = kolguyev2016[kolguyev2016$location_error_numerical < 10,]

kolguyev2016 = split(kolguyev2016)

autumn.mig = lapply(kolguyev2016, function(x){coordinates(x)})

autumn.mig = spLines(autumn.mig, attr = data.frame(name = "kolguyev"))

writeLinesShape(autumn.mig, "autumn_migration")