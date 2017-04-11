library(ggspatial)

#'load coasts
coasts = rgdal::readOGR("vector/ne_10m_land.shp")

library(ggspatial)
ggplot()+
geom_spatial(coasts) +
  coord_map()
