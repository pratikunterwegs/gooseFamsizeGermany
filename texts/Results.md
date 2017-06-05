
# Results

After filtering the data (mapped in figure 1), we obtained 7,149 flock counts from 75 observers at 123 geocoded sites. Of these, 1,884 flocks counted by 17 observers at 64 sites yielded 51,037 successful families. A further 10,635 marked geese were observed at 8,416 sites. Positions from 64 individual geese (13 adult pairs, 38 juveniles) in 13 families were recorded in the winters of 2013 (n = 3), 2014 (n = 4), and 2016 (n = 6). A mean of 6,628 positions per individual were recorded over 138 days on average, during which 19 fission events occurred, which were not restricted to juveniles.
Goose flight activity records from 84 spring and 180 autumn sites (overlap = 72) yielded 6,266 days of data. Geese began to arrive between September 26 and October 30, and the last geese left between March 03 and April 01, resulting in a mean goose winter of 165 days.
Lemming abundance from the breeding grounds transformed into a predation index ranged between 1.17 and 1.9, with very low variance ($\sigma^2$ = 0.048).

We found no influence of family size on how far away from the breeding grounds a family wintered during the first sixty days after arrival (datasets *B* and *C*, model *A*, $\chi^2_B = 1.135$, $p_B = 0.286$, $\chi^2_C = 2.179$, $p_C = 0.139$). Over the remainder, larger families from dataset *B* wintered farther west ($\chi^2 = 4.1936$, $p = 0.041$), while dataset *C* did not reveal any influence of family size on wintering site ($\chi^2 = 0.023$, $p = 0.879$).

**Add hyp 2 - 5 here.**

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