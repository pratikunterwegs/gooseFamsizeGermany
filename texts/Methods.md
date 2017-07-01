
# Methods

### Observation data

Flocks of wintering white-fronted geese were censused on their wintering grounds in western Europe by direct counts using field scopes. Observers counted the total number of birds (flock size), and identified first winter juveniles (juveniles) among them from plumage characteristics (dataset *A*). Families were identified by characteristic behaviours, and were defined as pairs with at least one associated juvenile (successful families). The number of juveniles associated with a pair (family size), and the number of families of each size were recorded in a subset of flocks (dataset *B*). Censuses occurred at both fixed points and *ad hoc* sites.
Observers further reported sightings of individual geese marked with numbered plastic neckbands, including their position and social status, online (*geese.org*, dataset *C*). These data included records of geese with no juveniles (unsuccessful families).
To add context, we censused geese on the breeding grounds on Kolguyev Island (ca. 69°N, 49°E) in August 2016, approx. 1 month pre-migration, noting the size and social composition of all groups of geese seen (dataset *D*). Both successful and unsuccessful families were recorded.

Winter data were filtered to exclude records outside the spatial (2 - 10°E, 50 - 54°N) and temporal (autumn 2000 - spring 2017, breeding years 2000 - 2016) limits of our study. Records of unpaired neckbanded geese without juveniles were also removed.
We obtained 7,149 flock counts from 75 observers at 123 geocoded sites [implemented using @ggmap]. Of these, 1,884 flocks counted by 17 observers at 65 sites held 51,037 successful families. A further 10,635 marked geese were observed at 8,416 sites. Observations of marked geese did not include details on habitat type, flock size and observer. We obtained 116 records of families from Kolguyev Island.

### Whole family tracking

We also collected positions of a total of 13 goose families (13 adult pairs, 38 juveniles) fitted with GPS transmitters (2013, n = 3, 2014, n = 4: e-obs GmBH, & 2016, n = 6: madebytheo) (dataset *E*). In addition, 2016 transmitters collected short 0.5 Hz bursts of position data from take-off events. Families fitted with GPS transmitters were tracked within the study site (2 - 10°E, 50 - 54°N) in winter (pre-April 01) for 78 days on average (range: 34 - 135).
For all families, we identified the day and position where splits were first detected as a decrease in the number of birds within a 250m radius of a designated reference bird (see Fig.1). Before analysing the daily probability of splitting, we defined 'flights' as displacement events over 1km every day, and counted their number and daily frequency. For 2016 families, we identified the half-hour when they split, and identified take-offs as 0.5 Hz records with a ground speed above 2 m/s. We then calculated the time since the last take-off at each half-hour.

\begin{table*} \centering
\begin{tabular}{c*5l}
\toprule
Dataset & Type & Records & Sites & Spatial extent (\textdegree ) & Temporal extent (yr)\\
\midrule
A & Flock counts & 7,149 & 123 & 4.0 - 8.8 E, 51.1 - 53.4 N & 2000 - 2017 \\
B & Family counts & 51,037 & 65 & 4.8 - 7.3 E, 51.1 - 53.4 N & 2000 - 2017 \\

C & Marked geese & 10,635 & 8,416 & 2.7 - 9.7 E, 50.9 - 53.9 N & 2000 - 2017 \\
D & Family counts & 116 & 26 & 49 E, 69 N & 2016 \\
E & Family GPS tracks & 13\textsuperscript{a}; 32,630\textsuperscript{b} & 32,630 & 3.9 - 7.9 E, 51.3 - 54.3 N & 2013\textsuperscript{c}, 2014\textsuperscript{d}, 2016\textsuperscript{e} \\\midrule

\multicolumn{6}{l}{\emph{a: Number of families, b: Number of half hourly positions, c: 3 families, d: 4 families, e: 5 families}}\\
\bottomrule
\end{tabular}
\caption{Summary of filtered datasets.}
\end{table*}

\begin{figure*}
\centering
\includegraphics[width = 0.8\linewidth]{datamap.pdf}
\caption{\emph{a.} Wintering grounds of greater white-fronted geese \emph{Anser a. albifrons} in the Netherlands and northern Germany, with 65 sites
(dots) where 51,037 successful families in 1,884 flocks were recorded.
21 splits (diamonds) were observed in 13 GPS tracked families. Shaded
area bounds 10,635 observations of marked geese. Data were collected
from 2000 - 2017. \emph{b.} Breeding grounds (ellipse) with Kolguyev
Island (dot) and rough migration route (arrow) to wintering area
(rectangle).}

\end{figure*}

### Supplementary data

To relate observation data to migration timing, we collected daily records (n = 6,266) of flock flight intensity pooled over 84 spring and 180 autumn (overlap = 72) Trektellen sites (*trektellen.org*, @van2009veranderingen) in the Netherlands.
We excluded flight activity records from sites close to night roosts, and records which did not match the direction of migration appropriate to the season. We used these data to find the beginning and end of each goose winter across the study period. We took the goose winter to begin with the first mass arrival of geese in autumn, and to end with the last mass departure in spring.

Following previous studies [@jongejans2015naar] we estimated an index of summer predation for the breeding grounds of this population from rodent abundance data (*arcticbirds.net*). We calculated a pooled mean of 0 - 2 (low - high) lemming indices from sites in the region, taking care to include a value of 0 in each year to reflect absence of a lemming cycle in the core breeding area on Kolguyev Island. The index takes into account the change in lemming abundance, with higher values when lemming abundance had decreased from the previous year reflecting the increased predation pressure on Arctic birds from abundant predators switching to alternative prey [see @dhondt1987cycles].

### Analyses

We first tested whether (*1.*) the number of juveniles, which determines family size, was correlated with the distance from the breeding grounds at which families were observed For this, we used datasets *B* and *C*. Using dataset *B*, we tested whether (*2.a.*) the number of juveniles in a family, and (*2.b.*) the total number of successful families were explained by flock size, number of days since the arrival of geese in autumn, and level of summer predation. We also tested using whether (*2.c*) the number of juveniles in families was different 1 month prior, and up to 2 months after autumn migration in 2016 using datasets *B, C* and *D* and . To add context, we searched for (*3.*) an effect on flock size (from dataset *A*) of distance from the breeding grounds, the number of days since arrival, and summer predation, and examined whether (*4.*) the proportion of juveniles in flocks (from dataset *A*) was explained by the flock size, distance from the breeding grounds, number of days since arrival, and summer predation (see Tab. A1).

Further, using dataset *E* we examined whether (*5.a.*) the split probability (no-split or split, binomial distribution) each day was predicted by the days since arrival, the number of flights that day, the cumulative number of flights until that day, the distance travelled that day, the cumulative distance travelled until that day, and the family size on that day. For the 2016 families we tested (*5.b.*) the half-hourly split probability in relation to the time since the last take-off and the distance travelled in the previous half hour (see Tab. A2).

All analyses were performed in the *R* environment [@R] (see Tab.A1). We used a simple Poisson-error generalised linear model to test *2.c*. We used Poisson*lme4* [@lme4] generalised linear mixed models (GLMMs) to test *1, 2.a*, and 3, and binomial-error GLMMs for *5.a* and *5.b*. In *2.b* and *4*, we used *mgcv* [@wood2013gam] Poisson generalised additive mixed models (GAMMs) to include smooth functions of the flocksize (in *2.b*) and the number of days since winter (in *4*) as predictors. We included some covariates as random effects, and models were dependent on the datasets used for the effects tested in each (see Table 1). We assessed the importance of each predictor using Type II Wald χ^2^ tests, and effect sizes using Cohen's *f^2*.
