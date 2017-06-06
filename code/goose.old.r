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

#'set new name and subset for old data
#'
goose.clean = data.raw.goose #%>% filter(Country %in% c("NL","NRW"))
#'now subset before 2000
goose.old = goose.clean %>% filter(Breeding_year < 2000)

goose.old$time = as.POSIXct(paste(goose.old$Year,
                                  goose.old$Month, goose.old$Day),
                              format="%Y %m %d")

#'add old pindex and lnolet
goose.old =  merge(goose.old, lemming.w, by.x = "Breeding_year",
                   by.y = "year")
#'n = 526 now
#'add days since Oct 1 as a proxy for days in winter
#'
source("days_since.r")

goose.old$days = as.numeric(difftime(goose.old$time,
                ifelse(month(goose.old$time %in% 1:4,
                          as.POSIXctpaste(year(goose.old$time)-1, "10-01"),
                          paste(year(goose.old$time), "10-01")))))
