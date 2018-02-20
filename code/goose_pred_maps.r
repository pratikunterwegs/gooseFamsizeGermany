#### load the netherlands ####

nl = cbind(x = 2:8, y = 48:54)

nl = SpatialPoints(nl)

library(sf)
grid = grid.topo = GridTopology(cellcentre.offset = bbox(nl)[,1]+c(0.1,0.1)/2, cellsize = c(0.1,0.1), cells.dim = ceiling(diff(t(bbox(nl)))/c(0.1,0.1)))
p4s = "+proj=longlat +datum=WGS84 +no_defs"
kol = c(49, 69)

points = as(SpatialGrid(grid.topo, proj4string = p4s), "SpatialPoints")

points$dists = distVincentyEllipsoid(p1 = points, p2 = kol)/1000

library(ggspatial)

library(tmap)
