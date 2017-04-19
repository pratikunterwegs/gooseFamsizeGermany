library(parallel)
detectCores()
no_cores <- detectCores()-1

cl<-makeCluster(no_cores)
#'some computationally intensive function here:
#'for example:
#leovisit20 = getRecursions(leo.df, 200000) # uses 200000m radius, but takes a long time... 

stopCluster(cl)