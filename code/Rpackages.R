# Always install in R #

####Colours and plotting####
library(RColorBrewer)
library(ggplot2)
library(GGally)
library(car)
library(lattice)

####Output###
library(knitr)
library(rmarkdown)
library(formatR)
library(tufte)

####Dealing with data####
library(readr)
library(readxl)
library(readODS)
library(broom)

library(lubridate)
library(plyr)
library(dplyr)
library(data.table)

library(fields)
library(reshape)
library(reshape2)
library(stringi)

####Functions for analysis###
library(vegan)
library(MASS)

####Spatial packages####
library(rgeos)
library(ks) #installs shiny, needs rgl install via sudo, r-cran-rgl
require(raster)
library(rasterVis)
#basic spatial
library(proj4)
library(rgdal) #'sudo apt-get install libgdal-dev libproj-dev
#'tcl-devel
library(sp)
library(maptools)

#adehabitat family
library(adehabitat)
library(adehabitatHR)
library(adehabitatHS)
library(adehabitatLT)
library(adehabitatMA)
library(ade4)

#mapping tools
library(OpenStreetMap)
library(maps)
library(tmap); library(tmaptools) #sudo apt-get install libv8-3.14-dev
library(mapdata)
library(rworldmap)
 #apt-get install r-cran-rjava
library(ggmap)
library(RgoogleMaps)

#spatial statistics
library(spatstat)
library(gstat)
library(geoR)
library(GSIF)

#install with above
#‘checkmate’, ‘survival’, ‘Formula’, ‘acepack’, ‘htmlTable’, ‘intervals’, ‘RandomFieldsUtils’, ‘Hmisc’, ‘plotrix’, ‘pixmap’, ‘colorRamps’, ‘abind’, ‘tensor’, ‘polyclip’, ‘goftest’, ‘spacetime’, ‘FNN’, ‘splancs’, ‘RandomFields’, ‘RSAGA’, ‘dismo’, ‘aqp’, ‘plotKML’


#movement ecology tools
library(move) #'move package
library(circular)
library(CircStats)
library(ctmm) #'installed till here
library(TwoStepCLogit)
library(scales)
library(pbs)
library(RStoolbox)

library(cluster)
library(RCurl)
library(bitops)
library(plotKML)

library(traj)
library(geosphere)

library(randomForest)
library(bcpa)
library(moveHMM)
library(fdrtool)

#### from local files ####
library(mrw)
library(waddle)
library(recurse)

#### from R forge ####
install.packages("tlocoh", dependencies=TRUE, repos=c("http://R-Forge.R-project.org", "http://cran.cnr.berkeley.edu"), type="source")
require(tlocoh)

####Other packages####
library(devtools)
library(corrgram)
library(gplots)
library(timevis)
library(plotly)
library(htmlwidgets)
library(ggfortify)
library(ggdendro)
library(biomod2)

####Timeseries####
library(changepoint)
library(breakpoint)
library(BreakoutDetection) #from twitter repo on github #devtools::install_github("twitter/BreakoutDetection")
library(forecast)
library(zoo)
library(stlplus) #allows for NAs in the timeseries

####Dashboard####
library(flexdashboard)
library(d3heatmap)
library(leaflet)

####Modelling ecosystems####
library(plot3D)
library(ncdf4)
library(ncdf.tools) #'sudo apt-get install r-cran-rnetcdf netcdf-doc
library(foreign)
library(nlstools)


####models####
library(lme4)
library(nlme)
library(gamm4)
library(mgcv)
library(itsadug)
library(ncf)

####Spatial autocorrelation####
library(ncf)
library(spdep)
library(pgirmess)
