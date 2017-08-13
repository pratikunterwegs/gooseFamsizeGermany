####Data cleaning geese.org####

#'read in the first sheet
library(readxl)
gorg <- read_excel("~/git/thesis/export-kees-andrea.xls")

#'summary
summary(gorg)

unique(gorg$THIS_EURING_CODE)
#'rename to make things easier
gorg = plyr::rename(gorg, replace = c("THIS_BIRD" = "id",
                                      "DATUM" = "date",
                                      "X" = "lon",
                                      "Y" = "lat",
                                      "THIS_BIRD_RING_TYPE" = "ringtype",
                                      "THIS_BIRD_NECK_RING" = "neckring",
                                      "THIS_YEAR_OF_BIRTH" = "birthyear",
                                      "THIS_AGE_AT_RINGING" = "ringing.age",
                                      "PARTNER_NECK_RING" = "partner.neckring",
                                      "NUMBER_OF_YOUNG" = "famsize",
                                      "PARTNER" = "partner.ringed.status"))

useful = c("id","date","lon","lat","ringtype","neckring","birthyear",
           "ringing.age","partner.neckring","famsize","partner.ringed.status")

#'retain useful columns only
gorg = gorg[,useful]

#'make date posixct
gorg$date = as.POSIXct(gorg$date, format = "%d-%m-%Y")

####Remove paired records####

#'remove records where a pair is seen together and recorded separately beause both birds are neckbanded

#'remove records where the neckring and partner.neckring are the same

#'set partner neckring NAs to none
gorg$partner.neckring[is.na(gorg$partner.neckring)] = "none"
#'filter by partner neckring not identical to neckring
gorg = gorg %>% filter(partner.neckring != neckring)

####Remove juveniles####

#'remove all where ringing.age is juvenile
#'first save all who have a birth year
gorg.byear = gorg %>% filter(!is.na(birthyear))
#'remove all except adults
gorg = gorg %>% filter(ringing.age=="A")

#'keep birds where birthyear - year(date) is 2 or more
gorg.byear = gorg.byear %>% filter(year(date)-birthyear >= 2)

#'bind again
gorg = rbind(gorg, gorg.byear)

####Check family size (N juvs)####

#'how many famsizes
unique(gorg$famsize)

#'create a search string
a = gregexpr("[0-9]+", gorg$famsize)
#'find numbers
unique(unlist(regmatches(gorg$famsize, a)))
unique(substring(gorg$famsize, 1, 2))

#'subset
gorg = gorg %>% filter(as.numeric(substring(famsize, 1, 2)) %in% c(0:12))

#'make numeric
gorg$famsize = as.numeric(gorg$famsize)

unique(gorg$famsize)

####Remove single birds####
#'remove records where the parnter is NA or no partner, and the family size is 0.

#'remove if partner status is NA or no partner, and the family size is 0
gorg = gorg %>% mutate(famsize = ifelse(famsize == 0 & partner.ringed.status %in% c(NA, "Geen partner") & is.na(partner.neckring), NA, famsize))

#'remove NAs
gorg = gorg %>% filter(!is.na(famsize))

####Export data####

#'assign a breeding year
gorg$breedyr = ifelse(month(gorg$date) < 6, year(gorg$date)-1, year(gorg$date))

#'filter by year and coordinates
gorg = gorg %>% filter(breedyr >= 2000, lon < 10, lon > 0, lat>=50, lat<=54)

write.csv(gorg, "data.geeseorg.csv")
