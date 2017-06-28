#### Effect sizes####

source("dataprep.R")

library(plyr);library(dplyr);library(purrr);library(purrrlyr)
library(data.table);library(lubridate)

library(visreg)

load("distmods.Rdata")

library(effsize)

# distmod 1
fams.expand.sub$predict = predict(distmod, 
                    newdata = fams.expand.sub, allow.new.levels = T, type = "response")

a = cohen.d(fams.expand.sub$predict, fams.expand.sub$famsize, na.rm = T,
            conf.level=0.95)
