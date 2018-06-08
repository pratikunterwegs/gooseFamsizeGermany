
# H1: Differences between kolguyev and nl

> mod.site

	Kruskal-Wallis rank sum test

data:  famsize by site
Kruskal-Wallis chi-squared = 469.11, df = 2, p-value < 2.2e-16

> summary(mod.site.posthoc)

	Pairwise comparisons using Nemenyi-test with Chi-squared	
                       approximation for independent samples 

data:  data2016$famsize and data2016$site 


P value adjustment method: none 
                H0 statistic p.value
1  kolguyev  =  nl  17.51476 0.00016
2 kolguyev  =  nl2 248.53554 < 2e-16
3       nl  =  nl2 436.70889 < 2e-16
> 

***_***

# H2: a: Family size ~ flock size

# H3: a: Family size ~ time

> summary(mod.famsize.flock.time)
Generalized linear mixed model fit by maximum likelihood (Laplace
  Approximation) [glmerMod]
 Family: poisson  ( log )
Formula: 
famsize ~ log(flocksize) + sqrt(t_since_in) + (1 | Breeding_year) +  
    (1 | Observer) + (1 | Food_type)
   Data: fams.expand

     AIC      BIC   logLik deviance df.resid 
132134.8 132187.2 -66061.4 132122.8    46470 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-1.0211 -0.5193 -0.3373  0.3541  5.8070 

Random effects:
 Groups        Name        Variance  Std.Dev.
 Food_type     (Intercept) 0.0002638 0.01624 
 Observer      (Intercept) 0.0148556 0.12188 
 Breeding_year (Intercept) 0.0091692 0.09576 
Number of obs: 46476, groups:  
Food_type, 28; Observer, 17; Breeding_year, 16

Fixed effects:
                  Estimate Std. Error z value Pr(>|z|)    
(Intercept)       0.757457   0.049036  15.447  < 2e-16 ***
log(flocksize)   -0.017573   0.004098  -4.288 1.81e-05 ***
sqrt(t_since_in) -0.011262   0.001299  -8.669  < 2e-16 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr) lg(fl)
log(flcksz) -0.509       
sqrt(t_sn_) -0.080 -0.065
convergence code: 0
Model is nearly unidentifiable: very large eigenvalue
 - Rescale variables?

***_***

> summary(mod.famsize.geeseorg)
Generalized linear mixed model fit by maximum likelihood (Laplace
  Approximation) [glmerMod]
 Family: poisson  ( log )
Formula: famsize ~ sqrt(t_since_in) + (1 | neckring) + (1 | breedyr)
   Data: geeseorg

     AIC      BIC   logLik deviance df.resid 
 20863.9  20893.0 -10428.0  20855.9    10605 

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-1.9188 -0.5084 -0.4003  0.1467  8.2603 

Random effects:
 Groups   Name        Variance Std.Dev.
 neckring (Intercept) 1.60827  1.2682  
 breedyr  (Intercept) 0.02513  0.1585  
Number of obs: 10609, groups:  neckring, 3987; breedyr, 17

Fixed effects:
                  Estimate Std. Error z value Pr(>|z|)    
(Intercept)      -1.044153   0.074560 -14.004  < 2e-16 ***
sqrt(t_since_in) -0.028297   0.005639  -5.018 5.23e-07 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Correlation of Fixed Effects:
            (Intr)
sqrt(t_sn_) -0.660

***_***

> summary(distmod)
Linear mixed model fit by REML ['lmerMod']
Formula: distkol ~ famsize * sqrt(t_since_in) + (1 | Breeding_year) +  
    (1 | Observer) + (1 | Food_type) + (1 | zone)
   Data: fams.expand

REML criterion at convergence: 378047.1

Scaled residuals: 
     Min       1Q   Median       3Q      Max 
-10.1213  -0.1713  -0.0008   0.1884   4.1016 

Random effects:
 Groups        Name        Variance Std.Dev.
 Food_type     (Intercept)   56.57   7.521  
 Observer      (Intercept) 1119.74  33.462  
 Breeding_year (Intercept)   13.35   3.654  
 zone          (Intercept) 7089.72  84.201  
 Residual                   198.18  14.078  
Number of obs: 46476, groups:  
Food_type, 28; Observer, 17; Breeding_year, 16; zone, 4

Fixed effects:
                           Estimate Std. Error t value
(Intercept)              2883.49057   42.91314   67.19
famsize                     0.44785    0.15759    2.84
sqrt(t_since_in)           -0.11847    0.04608   -2.57
famsize:sqrt(t_since_in)   -0.08752    0.02197   -3.98

Correlation of Fixed Effects:
            (Intr) famsiz sq(__)
famsize     -0.007              
sqrt(t_sn_) -0.006  0.766       
fmsz:sq(__)  0.006 -0.899 -0.837
> Anova(distmod)
Analysis of Deviance Table (Type II Wald chisquare tests)

Response: distkol
                            Chisq Df Pr(>Chisq)    
famsize                    2.8759  1    0.08991 .  
sqrt(t_since_in)         116.6314  1  < 2.2e-16 ***
famsize:sqrt(t_since_in)  15.8704  1  6.783e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

***_***

> summary(distmod2)
Linear mixed model fit by REML ['lmerMod']
Formula: 
distkol ~ famsize * sqrt(t_since_in) + (1 | breedyr) + (1 | neckring)
   Data: geeseorg

REML criterion at convergence: 116373.3

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-6.1381 -0.2737  0.0706  0.3357  6.1292 

Random effects:
 Groups   Name        Variance Std.Dev.
 neckring (Intercept) 3283.2   57.30   
 breedyr  (Intercept)  194.2   13.93   
 Residual             1953.8   44.20   
Number of obs: 10609, groups:  neckring, 3987; breedyr, 17

Fixed effects:
                           Estimate Std. Error t value
(Intercept)              2887.98749    4.11353   702.1
famsize                    -0.77055    1.57656    -0.5
sqrt(t_since_in)            1.65982    0.21564     7.7
famsize:sqrt(t_since_in)    0.08539    0.17044     0.5

Correlation of Fixed Effects:
            (Intr) famsiz sq(__)
famsize     -0.220              
sqrt(t_sn_) -0.470  0.426       
fmsz:sq(__)  0.198 -0.939 -0.439
> Anova(distmod2)
Analysis of Deviance Table (Type II Wald chisquare tests)

Response: distkol
                           Chisq Df Pr(>Chisq)    
famsize                   0.0029  1     0.9572    
sqrt(t_since_in)         77.6191  1     <2e-16 ***
famsize:sqrt(t_since_in)  0.2510  1     0.6164    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1


