days_since = function(x){ 
  as.numeric(x - as.POSIXct(ifelse(month(x) %in% c(1:4),
                                   paste(year(x)-1, "-10-15"),
                                   paste(year(x),"-10-15")),
                            format = "%Y -%m-%d"))
  }
