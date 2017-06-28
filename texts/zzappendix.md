
\newpage

# Appendix 1

## Model summaries

We provide a table summarising structures of models used in the analysis. This table includes Cohen's *f^2^* effect sizes that are based on the variance explained. Cohen's *f^2^* was calculated for each model thus:

\begin{equation} f^2 =  \frac{R^2}{1 - R^2} \end{equation}

where $R^2$ is the coefficient of determination. We calculated pseudo-$R^2$ for our models as the $R^2$ of a linear model taking the model response of a null generalised mixed model as the response, and the generalised mixed model fit as the predictor. These values corresponded closely with pseudo-$R^2$ provided by the *mgcv* package for generalised additive models and were considered reliable.
Cohen's *f^2^* values of 0.02, 0.15, and 0.35 are respectively considered small, medium, and large.

\begin{table*} \centering
\begin{tabular}{l*7l}
\toprule
Model & Type & Dataset & Response & Fixed effects & Random effects & Records used & Cohen's \emph{f\textsuperscript{2}}\\
\midrule
1 & GLMM & B & 5 & 1, 5 & 8, 9, 10 & 20,160\textsuperscript{a}; 14,018\textsuperscript{b} & 3.22\textsuperscript{a}; 4.74\textsuperscript{b}\\

1 & GLMM & C & 5 & 1, 5 & 8, 11 & 3,289\textsuperscript{a}; 7,320\textsuperscript{b} & 4.87\textsuperscript{a}; 4.43\textsuperscript{b}\\

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
\end{table*}

\begin{table*} \centering
\begin{tabular}{l*6l}
\toprule
Model & Type & Response & Fixed effects & Random effects & Records used & Effect size\\
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

\end{table*}
