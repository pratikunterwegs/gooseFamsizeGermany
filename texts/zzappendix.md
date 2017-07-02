
\normalsize

\clearpage

\setcounter{table}{0}
\renewcommand{\thetable}{A\arabic{table}}

\renewcommand\thefigure{A\arabic{figure}}

# Appendix 1

\setcounter{figure}{0}

### Data description

\begin{figure}[H]
\includegraphics[width = 1.5\linewidth]{data_density.pdf}
\caption{{\small Heatmap of number of flock counts per month in each calendar year. Data are sparse from the early 2000s. Data density is higher in the first three winter months (Oct, Nov, Dec) than the following ones (Jan, Feb, Mar). A mean of 47 flocks are censused per month (range: 0 - 177).}}

\end{figure}

\begin{figure}[H]
\includegraphics[width = 1.5\linewidth]{data_density_gorg.pdf}
\caption{{\small Heatmap of number of observations of geese marked with numbered neckbands per month in each calendar year. Data are sparse until the mid 2000s. Marked geese are sighted in the study area earlier and later than censused flocks. On average, 49 marked geese are seen each month (range: 0 - 294).}}

\end{figure}

\clearpage

# Appendix 2

### Model summaries

We provide tables (Tabs. A1, A2) summarising model structures used in the analysis. This table includes Cohen's *f^2^* effect sizes that are based on the variance explained. Cohen's *f^2^* was calculated for each model thus:

\begin{equation} f^2 =  \frac{R^2}{1 - R^2} \end{equation}

where $R^2$ is the coefficient of determination [@cohen1988statistical]. We calculated pseudo-$R^2$ for our models as the $R^2$ of a linear model taking the model response of a null generalised mixed model as the response, and the generalised mixed model fit as the predictor. These values corresponded closely with pseudo-$R^2$ provided by the *mgcv* package for generalised additive models and were considered reliable.
Cohen's *f^2^* values of 0.02, 0.15, and 0.35 are respectively considered small, medium, and large.

All models assumed idependent and identically distributed normal (*iid*) random effects. GLMMs implemented these through their inbuilt function. GAMMs (models *2.b* and *4*) implemented random effects as parametric terms penalized by a ridge penalty [see @wood2008fast; @wood2013gam].

\begin{table}[H]
\begin{tabular}{l*7l}
\toprule
Model & Type & Dataset & Response & Fixed effects & Random effects & Records used & Cohen's \emph{f\textsuperscript{2}}\\
\midrule
1 & GLMM & B & 6 & 1, 5 & 8, 9, 10 & 20,160\textsuperscript{a}; 14,018\textsuperscript{b} & 3.22\textsuperscript{a}; 4.74\textsuperscript{b}\\

1 & GLMM & C & 6 & 1, 5 & 8, 11 & 3,289\textsuperscript{a}; 7,320\textsuperscript{b} & 4.87\textsuperscript{a}; 4.43\textsuperscript{b}\\

2.a & GLMM & B & 1 & 3, 5, 7 & 8, 9, 10 & 34,179 & 0.09\\

2.a & GLMM & C & 1 & 5, 7 & 8, 11 & 10,426 & 7.72\textsuperscript{c}; 0.62\textsuperscript{d} \\

2.b & GAMM & A & 2 & 3, 5, 7 & 8, 9, 10 & 837 & 9.36\\

3 & GLMM & A & 3 & 5, 6, 7 & 8, 9, 10 & 5,700 & 0.199\\

4 & GAMM & A & 4 & 5, 6, 7 & 8, 9, 10 & 5,659 & 0.52\\\midrule

\multicolumn{8}{l}{\textbf{\emph{Effects}}: \emph{1: Number of juveniles per family, 2: Number of families, 3: Flock size,}} \\
\multicolumn{8}{l}{\emph{4: Proportion of juveniles, 5: Days since autumn arrival,}} \\
\multicolumn{8}{l}{\emph{6: Distance to breeding grounds, 7: Predation index, 8: Breeding year,}} \\
\multicolumn{8}{l}{\emph{9 Observer, 10: Habitat type, 11: Goose identity}} \\
\midrule
\multicolumn{8}{l}{\emph{a: \ensuremath{\le} 60 days after arrival, b: \ensuremath{\ge} 60 days after arrival, c: All families, d: Only successful families}} \\
\bottomrule
\end{tabular}
\caption{Models and inputs based on observation data.}
\end{table}

\begin{table}[H]
\begin{tabular}{l*6l}
\toprule
Model & Type & Response & Fixed effects & Random effects & Records used & Cohen's \emph{f\textsuperscript{2}}\\
\midrule
5.a & GLMM & 1 & 2, 3, 4, 5, 6, 7 & 9 & 1,009\textsuperscript{a} & 0.08 \\

5.b & GLMM & 1 & 3, 8 & 9 & 21,271\textsuperscript{b} & 0.0004\\
\midrule
\multicolumn{6}{l}{\textbf{\emph{Effects}}: \emph{1: Split occurrence , 2: Family size, 3: Days since autumn arrival,}}\\
\multicolumn{6}{l}{\emph{4: Daily number of flights, 5: Cumulative number of previous flights,}}\\
\multicolumn{6}{l}{\emph{6: Daily distance travelled, 7: Cumulative distance previously travelled,}}\\
\multicolumn{6}{l}{\emph{8: Time since last take-off, 9: Family identity}}\\
\midrule
\multicolumn{6}{l}{\emph{a: Daily positions, b: Half-hourly positions}}\\
\bottomrule
\end{tabular}

\caption{Models and inputs based on GPS tracking data.}

\end{table}

\clearpage

# Appendix 3

### Additional figures

\begin{figure}[H]
\includegraphics[width = 1\linewidth]{fam_predation.pdf}
\caption{{\small GLMM fits (lines) and mean number of juveniles per family at each
unique level of pooled summer predation index (symbols) using two
datasets: blue, all families of marked geese (dataset \emph{C}); red,
successful families cointed in flocks (dataset \emph{B}); black,
successful families only of marked geese (subset of \emph{C}).}}
\end{figure}

\begin{figure}[H]
\includegraphics[width = 1\linewidth]{juvprop_time.pdf}
\caption{{\small GAMM partial fit (line) and mean proportion of first-winter juveniles in
white-fronted goose flocks on each winter day, pooled across all years
(circles). Note that days since arrival was modelled as a smoothed
covariate using thin plate splines, and 4 knots, with the smooth forced
through 0. 95\% confidence interval is shaded grey.}}
\end{figure}

\begin{figure}[H]
\includegraphics[width = 1\linewidth]{flock_dist.pdf}
\caption{{\small GLMM fit (line) and mean size of flocks at each site (circles, n
= 111) as a function of its distance from Kolguyev Island. Sites to the north-east of the study site are approximately 500 km nearer to Kolguyev than sites in the south-west.}}
\end{figure}

\begin{figure}[H]
\includegraphics[width = 1\linewidth]{jprop_flock.pdf}
\caption{{\small GAMM fit (line) and mean juvenile proportion of flocks, in increments of 25 individuals (circles). Larger flocks have a lower proportion of juveniles, and lower variance in the proportion. 95\% confidence interval is shaded grey.}}
\end{figure}
