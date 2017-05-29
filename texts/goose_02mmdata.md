
---

# Study species

Whitefronts (*Anser albifrons*) are Arctic breeding grey geese with a circmpolar summer distribution, with the western continental Europe wintering nominate subspecies breeding between the 10°C and 4°C isotherms in the Russian Nenets and Yamal regions, from the Kanin Peninsula (45°E) to the River Yenisei (85°E) [@madsen1999goose]. These birds use the Baltic-North Sea flyway [@philippona1972blessgans] and are presently concentrated in the Lower Rhine Dutch-German border region during winter, a change from their historical wintering grounds between East Frisia and the Elbe [@mooij1991numbers]. Whitefronts show hight site fidelity during winter [@wilson1991winter], but the flyway populations do mix, and western European wintering geese have increased markedly since the 1960s [@Fox2017a], possibly at the cost of more south-easterly ones [@mooij1996panmixia]. The species is variable in its foraging habits, with Eurasian birds found largely on natural or cultivated grass fields [@10.2307/4088245].
Adults form life-long pair bonds, and family bonds are long-lasting. Families regroup successfully after individual release in both wintering [@10.2307/4511184] and breeding areas (*pers.obs*) Juveniles frequently accompany parents on more than one migration [@10.2307/4088245]. The fitness benefits of large families in dominance contests in winter [@Poisbleau20061351][@Black1989199], and in anti-predator defence through nest-attendance [@stroud1982observations] [@ely1979breeding][@IBI:IBI151] in the breeding season might promote their extended maintenance.

---

# Study site

We used a combination of historical and contemporary winter distribution, and the locations of observations of whitefronts reported from north-western continental Europe, to define a spatial extent for our study area. This is bounded by the 0°E and 10°E longitudes and the 50°N and 54°N latitudes. The climate is continental, and snow is common away from the coasts during winter. The topography is largely flat and part of the North European Plain. The major rivers are the Rhine, Meuse, IJssel, Ems and Elbe [@poulsen_east_2017]. The landscape is human dominated, with urban centres surrounded by agricultural land. Freshly planted winter crops and harvest remains serve as dense, high energy food sources for up to 2.5 million individuals of five main species of migratory geese [@Koffijberg2017][@Fox2017b]. Geese have become habituated to wind turbines which might once have made parts of the landscape unavailable [@madsen2008animal].
Whitefronts have stabilised at around 1.4 million individuals from historic lows in the 1960s, following several years of conservation-enabled and crop-feeding boosted exponential growth [@fox2010current][@Fox2017a]. They are the most abundant species of migratory geese, and make up a larger proportion in mixed flocks than before [@fox2010current][@mooij1982niederrhein][@Ballasus2008].

---

# Goose observations

\begin{figure}
\begin{center}
\includegraphics{datamap.pdf}
\caption[Map: Data collection sites]{Three datasets used in the study are represented on a map of the main
wintering grounds of the North Sea population of Whitefronts. Lines
represent coasts (light) and major rivers (dark). Crosses mark sites
(\emph{n} = 64) where family frequencies within flocks (\(n_{flocks}\) =
1,884, \(n_{families}\) = 50,941) were recorded between autumn 2000 and
spring 2017. Triangles mark positions (\emph{n} = 19) from 13 GPS
tracked families of geese (3 in 2013, 4 in 2014, 6 in 2016) where
individuals left the family (see details in text). Sites where geese
with numbered neckbands were observed, and their family sizes counted,
between 2000 and 2017, are bounded by a kernel shaded grey (\(n_{obs}\)
= 10,635, \(n_{sites}\) = 8,416).}

\end{center}
\end{figure}

Geese have long been observed on their wintering grounds within the study area. Individual whitefronts have been fitted with coloured plastic neckbands bearing alphanumeric codes during the course of a number of expeditions to various summer moulting/breeding sites [@kruckenberg2008white]. This mark-resight method is well developed and has been used to study other goose species [@ganter2001examination].
The neckbands are reported and displayed on the purpose-built website `geese.org`.  The number of associated first-winter juveniles if any, the identity of the partner if present, the nearest settlement, habitat type, and the flock size are among the reported attributes. Geographic coordinates of the observation are geocoded and displayed on a map from the name of the nearest settlement, and can be manually edited. Observers are volunteers, and most observations are made *ad hoc*, often as part of flock counts (_see below_). Geese regularly allow observers to approach within a hundred metres, a marked difference from their breeding grounds (*pers. obs.*).

Counts of goose flocks in order to monitor populations have taken place regularly across the study area, more consistently so [@Koffijberg2017]. Observers count flocks at both fixed and _ad-hoc_ sites. Flocks too large to be counted completely in the field are subsampled, care being taken to sample a representative, since flocks are expected have heterogeneous composition  [@black1992foraging].
Counts also determine the flock's percentage of first winter juveniles, a valuable indicator of breeding success, with 30% considered the long term mean [@van1996long]. Some observers (*n* = 19) also record the frequencies of families of different sizes, with families considered to be one or more first winter birds associated with one or more adults.

The timing of goose arrival in autumn, and of departure in spring is representative of the goose winter. Goose flight activity is recorded by ground based observers at Trektellen (*trektellen.org*) sites across the Netherlands. Observers at these sites (*n* spring = 84, *n* autumn = 180, *n* both = 72) count the number of whitefronts seen flying in the different cardinal directions. These data are help quantify when geese arrive and leave on migration, however they do not always differentiate between long distance migratory flights and daily flights between night roosts and foraging areas.

Thirteen families were fitted with GPS position logger/transmitters during the winters of 2013 (*n* = 3), 2014 (*n* = 4), and 2016 (*n* = 6). Position loggers in 2013 and 2014 were backpacks (e-obs GmbH., Grünwald, Germany), and in 2016 were numbered neckband loggers (Theo Gerrits, madebytheo, The Netherlands). Loggers were set to record with a baseline sampling interval of 30 minutes, but the actual fix frequency depended on the mode in which the device were operating. Data from these loggers were uploaded remotely to the animal tracking database Movebank, and were retrieved using either the functions in the _move_ package in _R_ [@move] or manually.

---

# Data filtering

From the observations of marked geese, we removed the following types of records: those in which a goose was seen with neither juveniles nor a social partner, one of the two records in which two birds of a pair had been reported separately when seen together, and those in which the bird was less than two years old at the time of observation, since whitefronts are not expected to breed before their second winter. We also excluded records which lay outside the spatial extent of the study area. We chose to match the temporal extents of the data we acquired so as to make comparisons possible, and filtered these data to exclude records made before 2000. 10,635 records remained, reported from 8,416 unique coordinate pairs.

Prior to filtering the flock count data, we substituted the 6% of flock sizes which were missing with the related (and in 31% of cases, identical) number of geese sampled, or, if that value was also missing (*n* = 28), as the sum of the number of adults and juveniles. In cases where the percentage of first winter birds was missing (*n* = 50), it was calculated from the number of juveniles and the flock size. We then filtered the data temporally, removing records before autumn 2000 (~ 7%). In cases where the day was missing (*n* = 32), we assigned it to the 15th.

Flocks were recorded at 1567 unique sites. These were geocoded using the Google Maps Geocoding API accessed by the function `geocode` from the package `ggmap` [@ggmap] using one of 123 unique look-up names associated with the site names. Exclusion of sites without geocoded coordinates, and from outside the study area left 7149 records of flocks, in 1884 of which family sizes and frequencies were also known. We expanded the flock level family frequency data to family level data (*n* families = 51,037), with all families from the same flock inheriting its attributes. Each record was assigned one of the zones, "East Frisia", "IJsselmeer", "Rhinelands", and "Southwest", based on the province in the Netherlands, or the district in Germany, in which it was made. Zones cover areas in or around the names given. The Rhinelands zone had almost as many records as the other zones combined, and was thinned to a randomly selected half of its records. We used this thinned data (*n* = 38,567) for further analyses.

We filtered *Trektellen* flight activity data to exclude sites that lay close to goose night roosts so as to avoid noise in the data from daily, rather than migratory, movements. Data were further filtered to exclude flights that did not match the direction appropriate to migration in that season. We calculated the first date in each autumn (ending December) and the last date in each spring (ending July) on which the number of geese flying per hour of observation time was at or above the 90th percentile of within-breeding year season-specific activity. This excluded unusually early arrivals and stragglers.
We took these dates to represent the beginning of goose arrival from the autumn migration, and the end of goose departure on the spring migration, respectively, for each breeding year. Whitefronts usually began to arrive between September 26 and October 30, and the last geese left between March 03 and April 01.

Logger data were filtered to remove: fixes outside the spatio-temporal extents of the study area, fixes with a sampling interval under 10 minutes,  and fixes where the logger position error was estimated to be above the 90th percentile. To better account for irregularities, the remaining data were averaged over every half hour.
Using the adult in each family with the greater number of logged positions as a 'reference', we matched the records of the other birds to the reference by the timestamp. Reference - individual distance was calculated using the Vincenty ellipsoid method for geographic coordinates [@vincenty1975direct] implemented by the `geosphere` package [@geosphere]. To account for logger error, the family size per day was obtained as the maximum number of members within 250m over all subsequent days. We did not differentiate cases in which the adult pair of the family split from other types of family size decrease.

|Data type|Records|Unique sites|Spatial extent|Temporal extent|
|---|---|---|---|---|
|Flock count|7,149|123|4.1 - 8.9, 51.2 - 53.4|2000 - 2016|
|Family frequency|1,884|64|4.8 - 7.3, 51.2 - 53.4|"|
|Family size|51,037|64|4.8 - 7.3, 51.2 - 53.4|"|
|GPS telemetry|1013/13|1013|3.9 - 7.4, 51.3 - 53.2|2013, 2014, 2016|
|Flight activity|6,266|118|3.4 - 7.2, 50.8 - 53.5|2000 - 2016|

Table: Overview of filtered goose observation data.

---

# Summer predation

Arctic rodent abundance - primarily of lemmings (*Lemmus spp.*, *Dicrostonyx spp.*) - has a cascade effect on goose numbers, as predators shift to goose eggs and young when lemmings are scarce [@summers1987factors], making estimation of lemming abundance and the level of summer predation an important step in modelling the populations of Arctic breeding birds [@dhondt1987cycles].
We could not asses rodent abundance for the breeding grounds from the literature, which focuses largely on lemming abundance from the Taimyr Peninsula (98°E) [@kokorev2002population]. While lemming cycles may be synchronised over limited spatial scales [@angerbjorn2001geographical][@hansen2013climate] we did not expect lemming cycles in the Nenets and Yamal regions to be synchronised with those of Taimyr. Further, while most breeding whitefronts remain on Kolguyev, birds seen on Taimyr are mostly failed breeders that arrive there from the Nenets area [@kruckenberg2008white]. We decided not not use lemming data from Taimyr to calculate the predation index.

---
