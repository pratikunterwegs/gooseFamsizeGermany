
# Methods

## Observation and position data

We collected the following classes of data from western Europe: (*A*) Flock counts in which observers censused flocks of white-fronted geese and counted the numbers of adults and juveniles, (*B*) Family counts in which observers counted the sizes of successful families with at least one first winter juvenile (hereafter, juvenile) within a subset of the flocks above, and (*C*) Observations of geese marked with numbered plastic neckbands in pairs or with juveniles, including records of pairs with no juveniles. These data were filtered to exclude records outside the spatial (2 - 10°E, 50 - 54°N) and temporal (autumn 2000 - spring 2017, breeding years 2000 - 2016) limits of our study.
After filtering census data (*A, B, C*) (mapped in Fig.1), we obtained 7,149 flock counts from 75 observers at 123 geocoded sites. Of these, 1,884 flocks counted by 17 observers at 65 sites held 51,037 successful families. A further 10,635 marked geese were observed at 8,416 sites. Observations of marked geese did not include details on habitat type, flock size and observer.

We also collected (*D*) positions of 13 goose families (13 adult pairs, 38 juveniles) fitted with GPS loggers (2013, n = 3, 2014, n = 4: e-obs GmBH, & 2016, n = 6: madebytheo). In addition, 2016 loggers collected 0.5 Hz position data from take-off events. Families fitted with GPS loggers were were tracked within the wintering area for 78 days on average (range: 34 - 135).
For all families, we identified days on which splits occurred. Before analysing the daily probability of splitting, we defined 'flights' as displacement events over 1km every day, and counted their number and daily frequency. For 2016 families, we identified the half-hour when they split, and used the available take-off data to find the time since the last take-off at each half-hour.

\begin{table*} \centering
\begin{tabular}{c*5l}
\toprule
Dataset & Type & Records & Sites & Spatial extent (\textdegree ) & Temporal extent \\
\midrule
A & Flock counts & 7,149 & 123 & 4.0 - 8.8 E, 51.1 - 53.4 N & 2000 - 2017 \\
B & Family counts & 51,037 & 65 & 4.8 - 7.3 E, 51.1 - 53.4 N & 2000 - 2017 \\

C & Marked geese & 10,635 & 8,416 & 2.7 - 9.7 E, 50.9 - 53.9 N & 2000 - 2017 \\
D & Family GPS tracks & 13\textsuperscript{a}; 32,630\textsuperscript{b} & 32,630 & 3.9 - 7.9 E, 51.3 - 54.3 N & 2013\textsuperscript{c}, 2014\textsuperscript{d}, 2016\textsuperscript{e} \\\midrule

\multicolumn{6}{l}{\emph{a: Number of families, b: Number of half hourly positions, c: 3 families, d: 4 families, e: 5 families}}\\
\bottomrule
\end{tabular}
\caption{Spatial and temporal range of datasets used.}
\end{table*}

## Supplementary data

To relate observation data to migration timing, we collected daily records (n = 6,266) of flock flight intensity from from 84 spring and 180 autumn Trektellen sites (overlap = 72) (see *trektellen.org*, @van2009veranderingen) in the Netherlands.
We excluded flight activity records from sites close to night roosts, and records which did not match the direction of migration appropriate to the season. We used these data to find the beginning and end of each goose winter across the study period. We took the goose winter to begin with the first mass arrival of geese in autumn, and to end with the last mass departure in spring.

Following previous studies [@jongejans2015naar] we estimated an index of summer predation for the breeding grounds of this population from rodent abundance data (*arcticbirds.net*). We calculated a pooled mean of 0 - 2 (low - high) lemming indices from sites in the region, taking care to include a value of 0 in each year to reflect absence of a lemming cycle in the core breeding area on Kolguyev Island. The index takes into account the change in lemming abundance, with higher values when lemming abundance had decreased from the previous year reflecting the increased predation pressure on Arctic birds from abundant predators switching to alternative prey.

## Analyses

We first tested whether (*1.*) the number of juveniles, which determines family size, was correlated with the distance from the breeding grounds at which families were observed For this, we used datasets *B* and *C*. Within flocks, we tested whether (*2.a.*) family sizes, and (*2.b.*) the total number of families were explained by the number of birds in the flock, hereafter flock size, the number of days since the arrival of geese in autumn, and the level of summer predation. To add context, we searched for (*3.*) an effect on flock size of distance from the breeding grounds, the number of days since arrival, and summer predation, and examined whether (*4.*) the proportion of juveniles in flocks was explained by the flock size, distance from the breeding grounds, number of days since arrival, and summer predation.

Further, we examined whether (*5.a.*) the split probability (no-split or split, binomial distribution) each day was predicted by the days since arrival, the number of flights that day, the cumulative number of flights until that day, the distance travelled that day, the cumulative distance travelled until that day, and the family size on that day. For the 2016 families we identified take-offs as 0.5 Hz records with a ground speed above 2 m/s, and tested (*5.b.*) the half-hourly split probability in relation to the time since the last take-off and the distance travelled in the previous half hour.

All analyses were performed in the *R* environment [@R]. We used *lme4* [@lme4] generalised linear mixed models (GLMMs) to test *1, 2.a, 3, 5.a* and *5.b*, where we expected linear relationships. In cases *2.b* and *4*, we used *mgcv* [@wood2013gam] generalised additive mixed models (GAMMs) to include smooth functions of the flocksize (*2.b*) and the number of days since winter (*4, 5.b*) as predictors. We included some covariates as random effects, and models were dependent on the datasets used for the effects tested in each (see Table 1). We assessed the importance of each predictor using Type II Wald χ^2^ tests, and effect sizes using Cohen's *f^2* (see Appendix 1).
