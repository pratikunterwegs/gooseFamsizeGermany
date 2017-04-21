r2.mixed.mods <- function(m) {
  lmfit <-  lm(model.response(model.frame(m)) ~ fitted(m))
  summary(lmfit)$r.squared
}

#'suggested from http://glmm.wikidot.com/faq

o2.mixed.mods = function(m){
  abs(1-var(residuals(m))/(var(model.response(model.frame(m)))))
}

#'suggested from http://glmm.wikidot.com/faq, 
#'created by 
#'Xu, R. (2003), Measuring explained variation in linear mixed effects models. Statist. Med., 22: 3527–3541. doi:10.1002/sim.1572