---
title: Model building
---

Model selection was carried out as follows. The three hypotheses related to family size were listed. The predictors for these hypotheses were longitude, flock size, and number of days elapsed since the beginning of the wintering period. The predictor selected was family size, ie, the number of juveniles in a family. This process was run on the SOVON flock level data. Data were 'untabled' in R to yield a separate record for each family.

# A simple GAM

The first model was a GAM that used family size as the response and the three main predictors, with a Poisson error structure assumed. Thin plate spline smoothing was applied over the longitude, and latitude was added as a smoothed variable. No random effects were included.
Flock size, days in winter, and both coordinates were found to be significant predictors.

# Splitting days in winter

The second GAM built on the first by adding random effects of breeding year, observer and habitat type, using the gam option ```bs = "re"```. Days in winter was modeled separately as **t_since_in**, the time, in days, since the first day of that breeding year's autumn on which the flight activity of geese in the Netherlands crossed the 90th percentile of all activity between July and the end of the year, and also as **t_to_out**, the time in days until the last day in the spring of the next year on which goose flight activity was higher than or equal to the 90th percentile of all activity between the beginning of the year and July.
This model found that **t_to_out** was a significant predictor while **t_since_in** was not. Among the smooth terms, only longitude was a significant predictor, while latitude was not.

# Removing t_since_in

A third GAM removed the variable **t_since_in**, while retaining the others. Flock size was nearly significant and was not removed from the model. The AIC score difference was around 2.5, and a model comparison using ```anova``` did not find that the second model added any information over the third.

# Removing latitude

As a trial exercise, a fourth gam removed latitude as a smooth term. Flock size was just significant again. The AIC score difference was 1.8, and the fourth model was not significantly different from the second or the third.

# Modelling using GAMM

In order to check for spatial autocorrelation of the residuals, I implemented the fourth gam using the function ```gamm```, which treats the random effects as nested or hierarchical, whether they are or not. The putative hierarchy chosen was breeding year, habitat type and observer, with the understanding that this was most likely, but also that no nesting or structure should be assumed. This model's residuals are then to be used to test for spatial autocorrelation over the X axis, with a further model correcting for this if present. This is possible via an added argument to gamm, which internally uses lme, which accepts correlation terms to correct for.

# Modelling both coordinates

I further included a smooth over the longitude and latitude in a single isotropically smoothed term. This was done in order to test the spatial autocorrelation over both X and Y axes.

# Checking spatial autocorrelation

Plotting a semivariogram of the model residuals against their locations is an accepted way of checking visually for spatial autocorrelation. An increasing trend in the semivariance over distance would indicate the presence of spatial autocorrelation. Two libraries in R allow for the computation and plotting of variograms: **gstat** and **nlme**.
