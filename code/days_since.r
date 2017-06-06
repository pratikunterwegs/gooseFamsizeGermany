days_since = function(x){ 
  as.numeric(difftime(x, ifelse(month(x) %in% c(1:4),
  as.POSIXct(paste("01-10-",year(x)-1), format = "%d-%m-%Y",
             origin = "01-01-1970"),
  as.POSIXct(paste("01-10-",year(x)), format = "%d-%m-%Y",
             origin = "01-01-1970")),
  units = "days"))
  }
