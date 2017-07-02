####Data descriptions plots####

source("dataprep.R")

geese$year = year(geese$time)

goose_year_month = data.frame(table(geese %>% dplyr::select(year, month)))

library(reshape2)
goose_year_month = melt(goose_year_month, id.vars = c("year","month"))

pdf(file = "~/git/thesis/texts/data_density.pdf", height = 2, width = 5,
    title = "data_density")
ggplot(data = goose_year_month,
       aes(x=year, y=month, fill=value)) + 
  geom_tile()+ 
  scale_fill_gradient2(low = "#fc8d59", mid = "#ffffbf", 
                       high = "#1a9850",
                       midpoint = 47)+
  labs(list(fill = "Records", y = "Month", x = "Year"))+
  theme_bw()+
  theme(axis.text.x=element_text(angle=45, hjust = 1))
dev.off()

####Data density geese org####
geeseorg$year = year(geeseorg$date)
geeseorg$month = month(geeseorg$date)

gorg_year_month = data.frame(table(geeseorg %>% dplyr::select(year, month)))

library(reshape2)
gorg_year_month = melt(gorg_year_month, id.vars = c("year","month"))

pdf(file = "~/git/thesis/texts/data_density_gorg.pdf", height = 2, width = 5,
    title = "data_density_gorg")
ggplot(data = gorg_year_month,
       aes(x=year, y=month, fill=value)) + 
  geom_tile()+ 
  scale_fill_gradient2(low = "#fc8d59", mid = "#ffffbf", 
                       high = "#1a9850",
                       midpoint = 49)+
  labs(list(fill = "Records", y = "Month", x = "Year"))+
  theme_bw()+
  theme(axis.text.x=element_text(angle=45, hjust = 1))
dev.off()