ao = read.delim("monthly.ao.index.b50.current.ascii.txt", sep = "",
                col.names = c("year","month","ao"))

ao_summer = ao %>% filter(year %in% 2000:2016, month %in% 5:8) %>% 
  group_by(year) %>% summarise(aos = mean(ao))

