days_since = function(x){ 
  days(x - ifelse(month(x) %in% c(1:4),
  as.Date(paste("01-09-",year(x)-1), format = "%d-%m-%Y"),
  as.Date(paste("01-09-",year(x)), format = "%d-%m-%Y")))@day
  }
