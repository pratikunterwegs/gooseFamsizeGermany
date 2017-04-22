#'load knitr
library(knitr)
library(lubridate)
library(broom)
library(move)
library(RCurl)
library(bitops)

#'suppress all code output but run code
opts_chunk$set(echo = FALSE)
opts_knit$set(root.dir = "~/git/thesis/code")