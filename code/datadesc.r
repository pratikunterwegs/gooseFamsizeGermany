####Data descriptions plots####

source("dataprep.R")

geese$year = year(geese$time)

geese$month = substr(months(geese$time), 1, 3)

geese$monthn = month(geese$time)
winter.month = c("Aug", "Sep", "Oct",
                 "Nov","Dec","Jan","Feb",
                 "Mar", "Apr")

geese$month = ordered(geese$month, winter.month)

goose_year_month = data.frame(table(geese %>% dplyr::select(Breeding_year, month)))

library(reshape2)
goose_year_month = melt(goose_year_month, id.vars = c("Breeding_year","month"))

pdf(file = "~/git/thesis/texts/data_density.pdf", height = 2, width = 5,
    title = "data_density")
ggplot(data = goose_year_month,
       aes(x=Breeding_year, y=month, fill=value)) + 
  geom_tile()+ 
  scale_fill_gradient2(low = "#fc8d59", mid = "#ffffbf", 
                       high = "#1a9850",
                       midpoint = 47)+
  labs(list(fill = "Records", y = "Month", x = "Breeding year"))+
  theme_bw()+
  theme(axis.text.x=element_text(angle=45, hjust = 1))
dev.off()

####Data density geese org####
geeseorg$year = year(geeseorg$date)
geeseorg$month = substr(months(geeseorg$date), 1,3)

geeseorg$month = ordered(geeseorg$month, winter.month)

gorg_year_month = data.frame(table(geeseorg %>% dplyr::select(breedyr, month)))

library(reshape2)
gorg_year_month = melt(gorg_year_month, id.vars = c("breedyr","month"))

pdf(file = "~/git/thesis/texts/data_density_gorg.pdf", height = 2, width = 5,
    title = "data_density_gorg")
ggplot(data = gorg_year_month,
       aes(x=breedyr, y=month, fill=value)) + 
  geom_tile()+ 
  scale_fill_gradient2(low = "#fc8d59", mid = "#ffffbf", 
                       high = "#1a9850",
                       midpoint = 49)+
  labs(list(fill = "Records", y = "Month", x = "Breeding year"))+
  theme_bw()+
  theme(axis.text.x=element_text(angle=45, hjust = 1))
dev.off()