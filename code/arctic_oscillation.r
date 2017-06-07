library(plyr);library(dplyr);library(lubridate)
library(readODS)
#'read data
ao = read.delim("monthly.ao.index.b50.current.ascii.txt", sep = "",
                col.names = c("year","month","ao"))

#'get summer AO values
ao_summer = ao %>% filter(year %in% 2000:2016, month %in% 5:7) %>% 
  group_by(year) %>% summarise(aos = mean(ao))

plot(ao_summer$aos ~ ao_summer$year, type = "l")

#'read lemming data
#'
#'read in the file
lindex = read_ods("~/git/thesis/arcticbirds_lemming_abundance.ods", sheet = 1)
