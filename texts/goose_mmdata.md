---
title: "Methods: Data"
bibliography: /home/pratik/git/thesis/geese_citations.bib
csl: oikos.csl
fontfamily: gentium
---

# Flock counts

We gained access to four datasets relating to the study species from our region of interest. The first was a set of counts of flock sizes, of the age ratio (percentage of first winter birds), of the numbers of families of each flock, and other associated information (time, habitat type, observer identity), made by volunteers (*n* = 75) across western and central Europe (*n* = 8764). These data only counted successful families, ie, the minimum family size was one (juvenile), and lacked information on the social (paired or not) and breeding status (unsuccessful or immature) of the remainder of the geese in the flock.

Flocks are often larger than can be sampled accurately in the field, leading to mistakes. In 6% of the remaining cases, the flock size was missing, and this was reconstructed as either the related (and in 31% of cases, duplicated) number of geese sampled, or, if that value was also missing, as the sum of the number of adults and juveniles. In cases where the percentage of first winter birds was missing (*n* = 50), it was calculated from the number of juveniles and the flock size.

We filtered these data spatially, including only records from the Netherlands (~ 52%), and from the German state of North-Rhine Westphalia (~ 40%). We then filtered them temporally; though the data contained observations since 1957, the number of records before the breeding year 2000 was low (~ 7%), and these were excluded, as were records mistakenly attributed to years beyond 2017, leaving 7,416 records. In order to facilitate downstream analyses, we checked whether each record had a complete date (year, month, day), and in cases where the day was missing (*n* = 32), we assigned it to the 15th. In all cases hereon, 'year' refers to the goose breeding year that begins in June.

Each record was assigned one of the zones, "Rhinelands", "East Frisia", "IJsselmeer", or "Southwest", based on the province in the Netherlands, or the district in Germany, in which it was made. Zones cover areas in or around the names given. The number of families in each flock was counted, and a subset of the data (*n* = 2014) in which the number of families present in flocks was recorded was set aside for analyses relating to family size.

Nearly all (> 99%) records had associated site names, with flocks recorded at 1567 unique sites. This data was geocoded using the Google Maps Geocoding API accessed by the function `geocode` from the package `ggmap` [@ggmap] using one of 123 unique look-up names associated with the site names. Exclusion of sites without geocoded coordinates, or with coordinates outside the box bounded by 0°E and 10°E, and 50°N and 54°N, left 7076 records of flocks, in 1884 of which family sizes and frequencies were also known. Family level data was then extracted from each flock to get variables for each family (*n* families = 51,037).

# Individual observations

We also obtained data on sightings and positions of individual geese marked with numbered neckbands, and reported using tools available on `geese.org`, an initiative to track marked geese via direct observations [**cite the website? pers. comm?**]. After removing those records in which two birds of a pair had been reported separately when seen together, and those in which the bird was less than two years old at the time of observation, and those which lay outside the bounding box described above, 10,664 records remained.

These data differed from the flock level counts in three important respects. First, the records lacked information on the size of the flock in which each goose was seen, and on other flock attributes, such as habitat type. Second, the family sizes of birds that had not bred successfully were recorded (as zero). Finally, the positions for each observation were nearly unique since observers had to drag-and-drop a locator for the sighting, as part of the functionality of geese.org.


# Flight activity

To determine the approximate dates that bound the stay of geese in their wintering grounds, we accessed goose flight activity data from Trektellen [**cite website? pers. comm?**] sites located across the Netherlands. This data was filtered to exclude sites that lay close to goose roosts so as to avoid noise in the data from daily, rather than migratory, movements. Data were further filtered to exclude flights that did not match the direction of migration appropriate to the season. From these data, we calculated the first date in each autumn (ending December) and the last date in each spring (beginning January) on which goose flight activity, in the form of number of geese flying per hour of observation time, was at or above the 90th percentile of within- breeding year season specific activity. We took these dates to represent the beginning of goose arrival and the end of goose departure, respectively. We added these dates to the flock, family, and individual level data, matching them by breeding year, and then calculated the number of days between each observation and the two extremes of goose migration.

# Summer predation pressure

Prior to estimating the effects of summer predation on our population, we attempted to calculate a predation pressure index for their breeding grounds, which are accepted as lying above the Arctic circle (66.5°N), and between the Kanin Peninsula (45°E) and the River Yenisei (83°E) in Russia [@madsen1999goose]. We used rodent abundance data from the relevant regions - primarily of lemmings (*Lemmus sibiricus* and *Dicrostonyx torquatus*) -  from the website *Arctic Birds* `www.arcticbirds.net` [**cite website?**], an initiative of the International Breeding Conditions Survey on Arctic Birds.

This approach was justified by the lack of systematic lemming abundance data from the region. The major long term study of lemming population dynamics is from the Taimyr Peninsula [@kokorev2002population], which is not thought to host breeding Whitefronts from the North Sea wintering population. While it is suggested that lemming cycles in some regions of Scandinavia [@angerbjorn2001geographical], and in the high Arctic of Svalbard [@hansen2013climate] may be synchronised by climatic fluctuations, those spatial extents are not large compared to that of the breeding grounds of this population of Whitefronts. We thus preferred to use data from the area relevant to us.

Our approach was previously taken by @nolet2013faltering, who also used data from *Arctic Birds* to fill in gaps in the dataset they used. We graded sites within the breeding grounds for which data were available on a 0 - 3 scale, with 0 representing no or very few lemmings, and 3 representing the conditions of a lemming peak. We averaged the lemming index across the sites within the breeding grounds in each year, and then for each year *t*, we calculated a predation index ($P_t$) following @blomqvist2002indirect and @koffijberg2010breeding.

 \begin{equation} P_t = \frac{L_{t-1} - L_t + 3}{2} \end{equation}

The predation index differs from the lemming abundance index in that it is expected to be highest in the year immediately following a 'lemming peak', when predator abundance is high as a consequence of successful breeding the previous year, but when lemming populations have crashed. This modification by @dhondt1987cycles is an accurate simulation of the predicted effects of the alternate prey hypothesis (AHP) as proposed by @summers1987factors, and @nolet2013faltering and @blomqvist2002indirect have found it to be a better predictor of breeding success in both geese and waders than the lemming index.

# Tracked families

The only families for which trends in size and position could be studied with absolute certainty were those which had been fitted with GPS receiving position logger/transmitters during the winters of 2013 (3 families), 2014 (4 families), and 2016 (6 families). Position loggers in 2013 and 2014 were e-obs GmbH backpacks, and in 2016 were numbered neckband loggers supplied by Theo Gerrits (madebytheo). These loggers were set to record a baseline of one position every 30 minutes, though the actual fix frequency depended on the mode in which the remotely programmable tag was then operating.

Data from these loggers were uploaded remotely to the animal tracking database Movebank, from where they were retrieved prior to analysis. Logger data were filtered to fit within the spatial extents of the study area, and data collected after March 31 each following spring were excluded from the analysis. A major component of these data were 'flight bursts', high fix frequency (0.5 or 1 Hz) records triggered by takeoff as measured by on-board accelerometers. These bursts were removed, and only data with the baseline sampling interval retained. The adult in the family with the greater number of logged positions was set to be the 'reference' individual, and the distance between this and all other individuals in the family was calculated using the Vincenty ellipsoid method [@vincenty1975direct] implemented by the `geosphere` package in `R` [@geosphere]. These distances were used to determine the number of family members within a 250m radius of the reference bird, and the family size per day was obtained in this way. In one case, the entire family split with the male and female separating. We did not differentiate this case from other types of family size decrease, which in our data included juvenile independence, juvenile death, and logger malfunction.

---

# References
