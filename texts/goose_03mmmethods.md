---
bibliography: geese_citations.bib
cls: oikos.csl
---
# Hypotheses and predictor variables

## Hypotheses
We sought to test the following three hypotheses related to family size: *1.* More successful families winter in the west, *2.* Larger families are seen in smaller flocks, and, *3.* Family sizes decrease over the winter. To disentangle the relationship between flock size, family size and space, we also tested whether *4.* Flock sizes are smaller in the west. Finally, we also tested whether *5.* The proportion of juveniles in flocks increases over the winter.

## Predictor variables
We chose main predictors to match our hypotheses. The longitudinal position of each observation, the flock size, and the time in winter were selected as hypothesis testing predictors, and were always included in further analyses. We added the summer predation index as an auxiliary predictor. Longitude was available for all records in both the observations of marked geese and the flock counts. While the individual observations were expected to hold information on the number of flock members and the habitat type, we could not obtain these and the analyses could not include flock size as a predictor when modelling the individual observation data.

We then chose between time since arrival, and time to departure to represent the time in winter as experienced by geese. To do so, we specified two generalised linear mixed models (GLMMs) from the `lme4` package [@lme4], with one model using the number of days since the first goose arrivals on the autumn migration, and the other using the number of days to the end of goose departures on the spring migration as predictors of family size. We ran these models on the family level data, and included breeding year, observer identity, and habitat type as *iid.* random effects. We ranked the two models by their AICc scores (here equivalent to AIC) using the `MuMIn` package [@mumin], and days since arrival ($AICc$ = 25,396) was selected over days to departure ($AICc$ = 25,729.7) as a proxy for the time in winter.

To quantify summer predation, we first obtained rodent (lemming) abundance indices for the breeding grounds from the website *Arctic Birds* (`www.arcticbirds.net`), an initiative of the International Breeding Conditions Survey on Arctic Birds. @nolet2013faltering previously used the same approach to to fill in gaps in the dataset they used. Sites on *Arctic Birds* are marked on a map and binned into four classes: "Unclear", "Low or absent", "Average", and "High". The same sites are not present in each year. We graded these sites on a 0 - 3 scale, with 0 for "Unclear, and 3 for "High". The distinction between sites graded 0 and 1 was itself unclear. Both 0 and 1 were used in different years to mark the island of Kolguyev, which is well known to have no lemming cycle. We took 0 to indicate a near or full absence of lemmings rather than an unsurveyed site, and also included an entry of 0 for Kolguyev in each year. Breeding birds form the major prey base for the island's predators, the majority of geese on the island are breeders [@kondratyev2008greater, @kruckenberg2008white], lending inclusion of the index for Kolguyev quite some value. We averaged the lemming index across the sites in each year, and then for each year *t*, we calculated a predation index (*P_t*).

 \begin{equation} P_t = \frac{L_{t-1} - L_t + 3}{2} \end{equation}

We matched this predation index to observations by the breeding year.

---

# Hypothesis testing

## Modelling family sizes

We used the family data and the individual data to model family sizes and so test the first three hypotheses. We constructed generalised linear mixed models (GLMMs) using the `lme4` package [@lme4]. Mixed models allow for the inclusion of factors that may introduce grouping in the response, but which are not predictors. The main predictors were included as fixed effects. We further specified the breeding year, the habitat type, and the observer as *iid.* random effects in the model run on family data.

We could not retrieve the habitat type and observer identity for the individual observations, and these could not be included as random effects when modelling the individual data. However, we did have information on the individual identity, and this was included as both an independent random effect as well as nested within the breeding year. We expected this structure to account for multiple observations of the same individual across and within breeding years. Table 2 shows the models and their effects. We used data for which there were complete cases for each and every one of the fixed and random effects. Since family sizes are discrete counts that can only take whole number values and are bounded at the lower limit by zero, we specified a Poisson error distribution for both models.

## Modelling flock sizes, juvenile proportions and number of families

We used the flock count data to model flock sizes and juvenile proportions. For flock size, we constructed a GLMM as described above. We chose to model juvenile proportion using a generalised additive model (GAM). GAMs are essentially generalised linear models which allow the inclusion of smoothed terms, where the response has a linear relationship with a smooth function of the predictor variable [@wood2006generalized]. As implemented through the `mgcv` package, they also allow for the modelling of random effects as penalised smoothed terms, specified using the smoothing basis "re" [@wood2013gam].

We included each of the main predictors in both models, except flock size when it was the response. When modelling juvenile proportions, we made two changes to the model structure. First, we used a binomial error distribution as is appropriate for proportion data. Second, we specified the number of days since goose arrivals as a smoothed term using a thin plate spline penalty basis [@wood2003tps], while treating the remaining predictor as parametric fixed effects. We specified a maximum of three knots for the thin plate spline, allowing the GAM to choose up to that number using generalised cross validation [@wood2004gcv].

We also modelled the sum of successful families in flocks using a GAM, with longitude, summer predation and time in winter as parametric fixed effects, and flock size as a smoothed term. Breeding year, habitat type, and observer identity were included as random effects using a "re" smoothing basis. We only used records in which the full flock had been sampled to build this model.

|Response|Data source|Fixed effects|Random effects|Model|
|---|---|---|---|---|
|Family size|Family counts|1, 2, 3, 4|5, 6, 7|GLMM
|Family size|Individual observations|1, 3, 4|5, 8|GLMM
|Number of families|Family counts|1, 2, 3, 4|5, 6, 7|GAM
|Flock size|Flock counts|1, 3, 4|5, 6, 7|GLMM
|Juvenile proportion|Flock counts|1, 2, 3, 4|5, 6, 7|GAM

Table: Model structures; effect codes: *1* Longitude, *2* Flock size, *3* Days since arrivals, *4* Summer predation index, *5* Breeding year, *6* Habitat type, *7* Observer identity, *8* Goose identity.

---
