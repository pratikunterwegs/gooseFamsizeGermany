#'load libs
#'
setwd("~/git/thesis/code")
library(readxl);library(plyr);library(dplyr);library(lubridate)

#'read in data
#'
k = read_excel("~/git/thesis/kolguyev.xlsx", sheet = 1)

k = k %>% filter(n.par %in% 1:2, species == "wfg")


#'read in data from geeseorg and geese
#'

####Load migration data####
migration = read.csv("migration_data.csv", row.names = 1)
migration$Date = as.Date(migration$Date)
migration$spring = as.Date(migration$spring)
migration$autumn = as.Date(migration$autumn)
mig.red = migration[,c("Date","Count_effort.min.","NumberperHour","t_since_in","t_to_out","durwinter")]

####Load lemmings####
lemming = read.csv("lemmings.csv", row.names = 1)
lemming$year = as.numeric(lemming$year)

####Load fams expanded####
fams.expand = read.csv("fams.expand.coords.csv", row.names = 1)
fams.expand$time = as.Date(fams.expand$time)

fams.expand = merge(fams.expand, lemming[,-4], by.x = "Breeding_year", by.y = "year", all.x = T)
fams.expand = merge(fams.expand, mig.red, by.x = "time", by.y = "Date", all.x = T)
fams.expand$Breeding_year = as.factor(fams.expand$Breeding_year)

####Load geese.org data###
geeseorg = read.csv("data.geeseorg.csv", row.names = 1)
geeseorg$date = as.Date(geeseorg$date)
geeseorg = merge(geeseorg, mig.red, by.x = "date", by.y = "Date", all.x = T)
geeseorg$breedyr = as.factor(geeseorg$breedyr)
geeseorg = merge(geeseorg, lemming[,-4], by.x = "breedyr", by.y = "year", all.x = T)


#'subset for 2016-17
#'
kwint = fams.expand %>% filter(Breeding_year == 2016, t_since_in < 60)
kwint2 = geeseorg %>% filter(breedyr == 2016, t_since_in <60)

#'compare fam sizes
#'
#'merge data
#'
k$site = "kolguyev"
kwint$site = "nl"
kwint2$site = "nl2"
#'assign new variable name
k$famsize = k$n.juv

#'bind rows
a = rbind(as.data.frame(k[,c("famsize","site")]), 
          as.data.frame(kwint[,c("famsize","site")]),
          as.data.frame(kwint2[,c("famsize","site")]))

a$site = as.factor(a$site)

#'run glm
#'
mod1 = glm(famsize ~ site, data = a, family = poisson)

#'check mod
#'

summary(mod1)

#'visualise
#'
library(visreg)
b = visreg(mod1, scale = "response", plot = F)

b1 = b$fit

#'plot
#'
#'
pdf(file = "~/git/thesis/texts/kolguyev.pdf", width = 8, height = 6)
ggplot()+
  geom_errorbar(data = b1, aes(x = site,  ymin = visregLwr,
                               ymax = visregUpr), width = 0.1)+
  geom_point(data = b1, aes(x = site, y = visregFit))+
  labs(list(x = "Condition", y = "Family size"))+
  scale_x_discrete(labels=c("Pre-migration", "Post-migration A", 
                            "Post-migration B"))+
  geom_text(aes(x = c(1.1,2.1,3.1), y = b1$visregFit), 
            label = c("Kolguyev","In flocks","Marked birds"),
            hjust = "left")+
  theme_bw()
dev.off()

#### Are fam sizes in years when p.index is higher than median as
#### small as those on Kolguyev?

k$predation = "kol"

fams.expand$predation = ifelse(fams.expand$p.index < median(fams.expand$p.index, na.rm = T),
                               "zlow","zhigh")
fams.expand$site = "nl"
geeseorg$predation = ifelse(geeseorg$p.index < median(geeseorg$p.index, na.rm = T),
                               "zlow","zhigh")
geeseorg$site = "nl2"
#'merge data

a2 = rbind(k %>% dplyr::select(famsize, site, predation),
           fams.expand %>% filter(t_since_in < 60) %>% dplyr::select(famsize, site, predation),
           geeseorg %>% filter(t_since_in < 60) %>% dplyr::select(famsize, site, predation))

#'compare
#'
mod2 = glm(famsize ~ predation, data = a2, family = "poisson")

summary(mod2)
