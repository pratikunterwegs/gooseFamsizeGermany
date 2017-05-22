---
title: Methods
bibliography: /home/pratik/git/thesis/geese_citations.bib
csl: oikos.csl
header-includes:
  - \usepackage{libertine}
---

# Data

## SOVON flock level data

We gained access to four datasets relating to the study species from our region of interest. The first was a set of counts of flock sizes, of the age ratio (percentage of first winter birds), and of the numbers of families of each flock, made by volunteers (*n* = 75) across western and central Europe (*n* = 8764). We filtered this data spatially, including only records from the Netherlands (~ 52%), and from the German state of North-Rhine Westphalia (~ 40%). We then filtered it temporally; though the data contained observations since 1957, the number of records before the breeding year 2000 was few (~ 7%), and these were excluded as were records mistakenly attributed to years beyond 2017, leaving 7,416 records. In order to facilitate downstream analyses, we checked whether each record had a complete date (year, month, day), and in cases where the day was missing (*n* = 32), we assigned it to the 15th.

Flocks are often larger than can be sampled accurately in the field, leading to mistakes. In 6% of the remaining cases, the flock size was missing, and was reconstructed as either the related (and in 31% of cases, duplicated) number of geese sampled, or, if that value was also missing, as the sum of the number of adults and juveniles. In cases where the percentage of first winter birds was missing (*n* = 50), it was calculated using the number of juveniles and the flock size. Each record was one of the zones "Rhinelands", "East Frisia", "IJsselmeer", or "Southwest", based on the province in the Netherlands, or the district in Germany in which it was made. Zones cover areas in or around the names given. The number of families in each flock was counted, and a subset of the data (*n* = 2014) in which the number of families present in flocks was recorded, was set aside for analyses relating to family size.

Nearly all (> 99%) of all records had associated site names, with flocks recorded at 1567 unique sites. This data was geocoded using the Google Maps Geocoding API [**a Google Map with the sites must be made as a requirement of the terms of service of the Google Maps Geocoding API**] accessed by the function `geocode` from the package `ggmap` [@ggmap] using one of 123 unique look-up names associated with the site names. Exclusion of sites without geocoded coordinates, or with coordinates outside the box bounded by 0°E and 10°E, and 50°N and 54°N, left 7076 records of flocks, in 1884 of which family sizes and frequencies were also known. Family level data was then extracted from each flock to get variables for each family (*n* families = 51,037).

## geese.org data

We obtained data on sightings and positions of individual geese marked with numbered neckbands reported using tools available on geese.org, an initiative to track such geese via direct observation [**cite the website? pers. comm?**]. After removing records in which two birds of a pair had been reported separately when together, or in which the bird was less than two years old at the time of observation, or which lay outside the bounding box described above, 10,664 records remained.

## Trektellen data

To determine the approximate dates that bound the stay of geese in their wintering grounds, we accessed goose flight activity data from Trektellen [**cite website? pers. comm?**] sites located across the Netherlands. This data was filtered to exclude sites that lay close to goose roosts so as to avoid noise in the data from daily, rather than migratory, movements. Data was further filtered to exclude flights that did not match the direction of migration appropriate to the season. From this data, we calculated the first date in each autumn (ending December) and the last date in each spring (beginning January) on which goose flight activity, in the form of number of geese flying per hour of observation time, was at the 90th percentile of within- breeding year season specific activity. We took these dates to represent the beginning of goose arrival and the end of goose departure, respectively. We added these dates to the flock, family, and individual level data, matching them by breeding year, and then calculated the number of days between each observation and the two extremes of goose migration.

## Predation index

To determine summer predation pressure on Wadden Sea wintering Whitefronts, we attempted to calculate a predation index for the breeding grounds of our population, which are accepted as lying above the Arctic circle (66.5°N), and between the Kanin Peninsula (45°E) and the River Yenisei (83°E) in Russia [@madsen1999goose]. We used rodent abundance data from the relevant regions - primarily of lemmings (*Lemmus sibiricus* and *Dicrostonyx torquatus*) -  from the website *Arctic Birds* `www.arcticbirds.net` [**cite website?**], an initiative of the International Breeding Conditions Survey on Arctic Birds.

This approach was justified by the lack of systematic lemming abundance data from the region. The major long term study of lemming population dynamics is from the Taimyr peninsula [@kokorev2002population], which is not thought to host breeding Whitefronts from the North Sea wintering population. While it is suggested that lemming cycles in some regions of Scandinavia [@angerbjorn2001geographical], and in the high Arctic of Svalbard [@hansen2013climate] may be synchronised by climatic fluctuations, those spatial extents are not large compared to that of the breeding grounds of our population of Whitefronts. We thus preferred to use data from the area relevant to us.

Our approach was previously taken by @nolet2013faltering, who also used data from *Arctic Birds* to fill in gaps in the dataset they used. Similar to @blomqvist2002indirect, we converted the 0 - 3 lemming index provided to a predation pressure index, as follows: $P = \frac{L_{t-1} - L_t + 3}{2}$. This was expected to be highest in years immediately following a 'lemming peak' year, when predator abundance is high as a consequence of successful breeding the previous year, but when lemming populations have crashed. We expected this to accurately simulate the predicted effects of the alternate prey hypothesis (AHP) [see @dhondt1987cycles's reply to @summers1987factors, or a more recent test in @bety2001goose] on our population.

---

# References
