#### Prepare data for analysis####

#libs
source("libs.R")

####Load cleaned goose flock data####
geese = read_csv("generated_data/data.goose.clean.csv")
geese = geese %>% 
  mutate(time = as.Date(time), month = month(time), propjuv = propjuv/100)

#'assign wintermonth
#geese$winter_month =  c(c(1:8), geese$month)[match(geese$month, c(c(9:12,1:4), geese$month))]

#'source days since
#source("days_since.r")

#'assign days since the start of winter
#geese$days = days_since(geese$time)

####Load flock level family data####
fams = read_csv("generated_data/data.fams.coords.csv") %>% 
  mutate(time = as.Date(time))

#'assign days since winter's start
#fams$days = days_since(fams$time)

####Load families expanded (untabled)####
fams.expand = read_csv("generated_data/fams.expand.coords.csv") %>% 
  mutate(time = as.Date(time))
#fams.expand$days = days_since(fams.expand$time)

####Load geese.org data###
geeseorg = read.csv("generated_data/data.geeseorg.csv") %>% 
  mutate(date = as.Date(date))

####Load lemming data####
lemming = read.csv("generated_data/lemmings.csv") %>% 
  mutate(year = as.numeric(year))

####Load migration data####
migration = read_csv("migration_data.csv") %>% 
  mutate(date = as.Date(Date), spring = as.Date(spring), autumn = as.Date(autumn)) %>% 
  select(date, count.effort = `Count_effort(min)`, NumberperHour, t_since_in, t_to_out, durwinter)

####Prepare geese####
geese = geese %>% 
  left_join(migration, by = c("time" = "date")) %>% 
  select(-starts_with("Fam")) %>% 
  mutate(Breeding_year = as.factor(Breeding_year))

####Prepare fams####
#'add migration intensity
fams = fams %>% 
  left_join(migration, by = c("time" = "date")) %>% 
  mutate(Breeding_year = as.factor(Breeding_year))

####Prepare fams.expand####
#'add migration intensity
fams.expand = fams.expand %>% 
  left_join(migration, by = c("time" = "date")) %>% 
  mutate(Breeding_year = as.factor(Breeding_year))

####Prep geeseorg####

#'add migration intensity
geeseorg = geeseorg %>% 
  left_join(migration, by = c("date" = "date")) %>% 
  mutate(breedyr = as.factor(breedyr))

####Remove supporting data####
rm(migration);rm(lemming)


#### Dist to Kolguyev and Pyasina delta ####
#'coordinates for kolguyev and taimyr
kol = c(49, 69)
pya = c(86, 74)


library(geosphere)

#'add distance to kolguyev to flock counts
geese$distkol = distVincentyEllipsoid(p1 = geese[,c("lon","lat")], p2 = kol)/1000

#'add dist kolguyev to families data
fams.expand$distkol = distVincentyEllipsoid(p1 = fams.expand[,c("lon","lat")], p2 = kol)/1000
fams$distkol = distVincentyEllipsoid(p1 = fams[,c("lon","lat")], p2 = kol)/1000

#'add dist kolguyev to geese.org data
geeseorg$distkol = distVincentyEllipsoid(p1 = geeseorg[,c("lon","lat")], p2 = kol)/1000


####Subset families ####
#'use only half the families from the lower Rhine zone

#'remove records where flocksize is wrongly entered 0
fams.expand = fams.expand %>% filter(flocksize > 0)
