---
title: "Methods: Analyses"
bibliography: geese_citations.bib
csl: oikos.csl
header-includes:
 - \setmainfont{ETBembo}
---

# Family sizes in flocks

We first sought to test the main hypotheses: that more successful families winter in the west, larger families are seen in smaller flocks, and that family sizes decrease over the winter. We used the flock level data and expanded it from family frequency data to family level data, with all families from the same flock inheriting its attributes. We thinned the data such that the 'Rhinelands' zone contributed only a randomly selected half of its records. We used this thinned data (*n* = 38,567) in our full model.

Prior to building the full model, we selected one of the possible proxies for the progression of winter to include as a predictor in our full model. To do so, we ran two generalised linear mixed models (GLMMs) from the `lme4` package [@lme4], with one model using the number of days since the first mass goose arrivals on the autumn migration, and the other using the number of days to the end of mass goose departures on the spring migration as predictors of family size. We included breeding year, observer identity, and habitat type as *iid.* random effects. We ranked the two models by their AICc scores (here equivalent to AIC) using the `MuMIn` package [@mumin], and days since arrival ($AICc$ = 25,396) was selected over days to departure ($AICc$ = 25,729.7) for inclusion in our full model as a proxy for the time in winter in relation to geese. 
We then constructed a full generalised addtive model (GAM) using the `mgcv` package [@wood2011mgcv] for family size with longitude, flock size, summer predation index and days since arrival as fixed effects. We specified the same *iid.* random effects as above, coding them as penalised smooth terms with a "re", or random effect smoothing basis [@wood2013gam]. on data for which the data had complete cases for each and every one of the fixed and random effects.

# Family sizes of marked geese

We also tested hypothesis 1 and 3 using the data on observations of marked geese. In this case, we used a GLMM with longitude, days since arrival, and summer predation index as fixed effects. Along with breeding year, goose identity was included as a random effect, since geese were seen within and across breeding years. The random effects were assumed to be *iid*. We tested for the effect that the inclusion of unsuccessful pairs with a family size of zero had on our hypotheses, and fit the model while excluding unsuccessful pairs.
