#### Data cleaning ####

####Flock count data####

#'load knitr
library(knitr);library(plyr);library(dplyr)

#'suppress all code output but run code
opts_chunk$set(eval = FALSE)
opts_knit$set(root.dir = "~/git/thesis/code")

#'load libs
library(readxl)
library(RColorBrewer)

#'import data
data.raw.goose = read_excel("~/git/thesis/Age-ratiodata-GWfG-toPratik.xlsx", 
                            sheet = "Plain_table", col_types = c("text", 
                                                                 "numeric", "numeric", "numeric", 
                                                                 "numeric", "text", "text", "text", 
                                                                 "text", "numeric", "text", "text", 
                                                                 "numeric", "numeric", "numeric", 
                                                                 "numeric", "numeric", "numeric", 
                                                                 "numeric", "numeric", "numeric", 
                                                                 "numeric", "numeric", "numeric", 
                                                                 "numeric", "numeric", "numeric", 
                                                                 "numeric", "numeric", "text", "text", 
                                                                 "text"))

#### Temporal extent ####
#'all records in the netherlands or nrw after 2000 only

#'first keep only nl or nrw after 2000
goose.clean = data.raw.goose #%>% filter(Country %in% c("NL","NRW"))

goose.clean = goose.clean %>% filter(Breeding_year >= 2000)

goose.old = goose.clean %>% filter(Breeding_year < 2000)

#'fix missing days, if days are missing, assign the 15th of the month
goose.clean$Day = ifelse(is.na(goose.clean$Day),
                         15, goose.clean$Day)

#'collect the contents of the year, month and day columns as a single column of the posixct class. this may need to be modified to date class later since it also assigns a time, which causes problems when the timezone shifts due to DST
goose.clean$time = as.POSIXct(paste(goose.clean$Year,                                    goose.clean$Month,goose.clean$Day),
                              format="%Y %m %d")

#'remove records after may 2017
goose.clean = goose.clean[goose.clean$time < "2017-05-01",]

####Flock size####

#'fix flock size:
#'if flock size in the field total_flock is not recorded, substitute the field n_sampled. this is based on the assumption that all goose.clean were whitefronts
#'if n_sampled is NA, assign the sum of juveniles and adults as the flock size. same assumption as above holds.
#'finally, if flock size is recorded, leave it as it is.
goose.clean$Total_flock = ifelse(is.na(goose.clean$Total_flock),
                                 ifelse(is.na(goose.clean$N_sampled),
                                        goose.clean$N_Adult+goose.clean$N_Juvenile,
                                        goose.clean$N_sampled),
                                 goose.clean$Total_flock)

#'fix juvenile percentage: if the field perc-jv is NA, calculate the juvenile percentage as number of juveniles*100 divided by the field total_flock
#'this is changed now. the juvenile percentage is calculated on whitefronts ONLY!!!
goose.clean$`Perc-JV` = ifelse(is.na(goose.clean$`Perc-JV`),
                               (goose.clean$N_Juvenile/goose.clean$Total_flock)*100,
                               goose.clean$`Perc-JV`)

#'check for NAs
apply(goose.clean, 2, function(x){sum(is.na(x))})


####Assign zones and identify family counts####
#'duplicate goose.clean

#'assign zones: if in DU, KLE, RG, WES, WG, assign to Rhinelands, if itn LER, DR, GR, assign to East Frisia, if in FR, FL, NH, assign to IJsselmeer, and if in ZL, ZH assign to Southwest, assing all else to other.
goose.clean$zone = ifelse(goose.clean$Region %in% c("DU","KLE","RG","WES","WG","LI"),
                          "Rhinelands",
                          ifelse(goose.clean$Region %in% c("LER","DR","GR"),
                                 "East Frisia",
                                 ifelse(goose.clean$Region %in% c("FR","FL","NH"),
                                        "IJsselmeer",
                                        ifelse(goose.clean$Region %in% c("ZL","ZH"),
                                               "Southwest", "Other"))))

#'rename columns to make typing easier

goose.clean = plyr::rename(goose.clean, replace = c("Perc-JV" = "propjuv",
                                                    "N_Juvenile" = "juvs",
                                                    "Total_flock" = "flocksize",
                                                    "Mean_Fam" = "meanfam",
                                                    "N_Adult" = "adults"))

#'keep a reduced number of columns
goose.clean = goose.clean[,c("Breeding_year","Region","Site_name",
                             "flocksize", "adults", "juvs", "N_sampled",
                             "propjuv", "Fam1", "Fam2", "Fam3",
                             "Fam4", "Fam5", "Fam6", "Fam7",
                             "Fam8", "Fam9", "Fam10", "meanfam",
                             "time", "zone", "Observer","Food_type")]

#'sum and count the number of families
goose.clean$fams = apply(goose.clean[,c(9:18)], 1, function(x){sum(x, na.rm = T)})

#'subset for family size data
fams = goose.clean[goose.clean$fams > 0,]


####Geocoding####
#'use the geocoded site from the ODS file provided. the googlemaps api is unable to geocode Androp, Rees, and Sondel correctly. Androp and Rees represent around 900 flocks.

#'import sites from new data
#sites = read_excel("~/git/thesis/Age-ratiodata-GWfG-toPratik.xlsx", sheet = 5)

#'get unique site names
#geocode.sites =  sites %>% filter(Country %in% c("NL","NRW")) %>% group_by(Site_name) %>% summarise(country = first(Country), region = first(Region), site = first(Site_name), lookup = first(Lookup_site))

#'geocode unique lookup names
#library(ggmap)
#'unique lookups
#lookups = as.character(na.omit(unique(geocode.sites$lookup)))
#'get coords
#site.coords = geocode(lookups)

#'bind
#site.coords.names = cbind(site.coords, lookups)

#'merge with sites and lookup info
#geocode.sites = merge(geocode.sites, site.coords.names, by.x = "lookup", by.y = "lookups", all.x = T)

#' how many sites without coords?
#apply(geocode.sites, 2, function(x) sum(is.na(x)))

#'where are the NAs?
#geocode.sites %>% filter(is.na(lookup))

#'export sites to csv
#write.csv(geocode.sites, "geocode.sites.csv")

####Add coordinates to sites####

#'merge the dataframe fams which has detailed family count data with geocoded sites, and with geocoded zones
#'get coords

geocode.sites = read.csv("geocode.sites.csv", row.names = 1)

#'merge coordinates with goose.clean
goose.clean = merge(goose.clean, geocode.sites[,c("lookup","Site_name","lon","lat")], by = "Site_name")


#'merge the same for families, creating a new object called fams.coords
fams.coords = merge(fams, geocode.sites[,c("lookup","Site_name","lon","lat")], by = "Site_name")

#'remove sites where no coordinates were found
fams.coords = fams.coords[complete.cases(fams.coords[,c("lon","lat")]),]

#'set spatial extent for both
fams.coords = fams.coords %>% filter(lon > 0 & lon < 10, lat >=50 & lat <= 54)

####Export data####

#'remove oofb points
goose.clean = goose.clean %>% filter(lon > 0, lon < 10, lat >=50 & lat <=54)

#'write to csv as data.goose.clean
write.csv(goose.clean, "data.goose.clean.csv")

#'write the full family data to csv
write.csv(fams, "fams.csv")

#'write geocoded family data to csv
write.csv(fams.coords, "data.fams.coords.csv")

#set all fams from NA to 0
fams[,c(9:18,22)][is.na(fams[,c(9:18,22)])] = 0

library(reshape)

#'get expanded fams data, zone, time, etc
fams.expand = untable(fams[,c(1:8,19:dim(fams)[2])], num=fams$fams)

#'get the families as a list
famrep = apply(fams[,c(9:18)], 1, function(x){rep(c(1:10), x)})
#'unlist it for a fam sequence
famrep = unlist(famrep)

#'bind with fams.expand
fams.expand$famsize = as.numeric(famrep)

#'make expanded data spatial
fams.expand.coords = merge(fams.expand, geocode.sites, by = "Site_name", all.x = T)

#'if NA remove
fams.expand.coords = fams.expand.coords %>% filter(complete.cases(lon,lat))

#'filter
fams.expand.coords = fams.expand.coords %>% filter(lon > 0 & lon < 10, lat >=50 & lat <=54)

#'write to csv
write.csv(fams.expand.coords, "fams.expand.coords.csv")
