
# Results

After filtering the data, we obtained 7,149 flock counts from 75 observers at . Of these, 1,884 flocks yielded 51,037 families

The size of successful families recorded in flocks was found to be unexpectedly insensitive to most predictors. The number of juveniles accompanying pairs increased slightly with longitudinal position, ie, from west to east, but not significantly ($p = 0.874$, $\chi^2 = 0.025$), but did, however, decrease significantly as expected through the winter ($p < 2 \times 10^{-16}$, $\chi^2 = 87.2641$). Individual observations showed a different trend; while not significant, there was a slight decrease in size from west to east ($p = 0.244$, $\chi^2 = 1.36$), and the number of juveniles seen with individuals also decreased over the winter ($p = 1.17  \times 10^{-5}$, $\chi^2 = 19.21$).

As hypothesised, flocks were smaller in the west, and also tended to be larger the more days since the first autumn arrivals had passed ($p < 2 \times 10^{-16}$, $\chi^2 = 10340$). Consistent with the earliest ideas on how geese form flocks [@elder1949role], the number of families in flocks increased very rapidly with their size ($p < 2 \times 10^{-16}$, $\chi^2 = 8196$), but the size of successful families in flocks decreased slightly as flocks grew ($p = 0.257$, $\chi^2 = 1.28$).
Further, the proportion of first winter juveniles in flocks was not affected significantly by their longitudinal position ($p = 0.442$, $\chi^2 = 1.03$). However, it increased significantly through the winter as expected ($p = 0.00174$, $\chi^2 = 9.82$). Larger flocks also had a lower proportion of juveniles than expected ($p = 0.015$, $\chi^2 = 5.89$).

The effects of summer predation were not consistent across the levels of the population. The size of successful families in flocks increased, though not significantly, with the level of summer predation ($p = 0.377$, $\chi^2 = 0.78$), while the number of juveniles seen with marked geese was significantly decreased with high summer predation ($p = 6.45 \times 10^{-6}$, $\chi^2 = 20.35$). The apparent difference in trends might be explained by the fact that only successful families were counted in flocks. The effect of summer predation on family size could be masked by such a sampling method, especially if higher levels of predation caused goose pairs to fail to fledge any young at all. On testing this idea by excluding observations of unsuccessful pairs from our analysis, we found a similar trend as that of the family data from flocks, though it was still not a significant one ($p = 0.896$, $\chi^2 = 0.016$). At a higher level, the number of successful families in flocks showed a marked decrease with the level of summer predation ($p = 7.13 \times 10^{-16}$, $\chi^2 = 65.09$). This did not translate into a lower juvenile proportion ($p = 0.931$, $\chi^2 = 0.058$), or decreased flock sizes($p = 0.308$, $\chi^2 = 1.04$).

\begin{table*}
\centering
\begin{tabular}{*5l}\toprule 
Response & Data source & Fixed effects & Random effects & Model\tabularnewline \midrule
Family size & Family counts & 1, 2, 3, 4 & 5, 6, 7 & GLMM\tabularnewline

Family size & Individual observations & 1, 3, 4 & 5, 8 & GLMM\tabularnewline

\emph{n} families & Family counts & 1, 2, 3, 4 & 5, 6, 7 & GAM\tabularnewline

Flock size & Flock counts & 1, 3, 4 & 5, 6, 7 & GLMM\tabularnewline

Juvenile prop. & Flock counts & 1, 2, 3, 4 & 5, 6, 7 & GAM\tabularnewline \bottomrule

\end{tabular}

\caption{Model structures; effect codes: \emph{1} Longitude, \emph{2} Flock size, \emph{3} Days since arrivals, \emph{4} Summer predation index, \emph{5} Breeding year, \emph{6} Habitat type, \emph{7} Observer identity, \emph{8} Goose identity.}

\end{table*}

\begin{table*}
\centering
\begin{tabular}{*5l}\toprule 

Reponse & \multicolumn{4}{c}{Predictor}\tabularnewline
 & Longitude & Flock size & Days since arrival & Summer predation\tabularnewline \midrule
 
Family size, flocks & 0.0249 & 1.2836 & 87.2641{*} & 0.7805\tabularnewline
 
Family size, successful pairs & 0.0127 & - & 5.4859{*} & 0.0162\tabularnewline

Family size, all pairs & 1.3561 & - & 19.2147{*} & 20.3484{*}\tabularnewline
 
\emph{n} families & 0.416 & 8196{*} & - & 65.098{*}\tabularnewline

Flock size & 10340{*} & - & 4476{*} & 1.039\tabularnewline

Juvenile proportion & 1.029 & 5.888{*} & 9.816{*} & 0.058\tabularnewline \bottomrule

\end{tabular}

\caption{Model output and predictor $\chi{2}$ values. Asteriks indicate significant effects.}

\end{table*}