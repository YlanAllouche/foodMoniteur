#! /usr/local/bin/Rscript

library(tidyverse)
library(plumber)
library(rmarkdown)
library(knitr)
library(kableExtra)
library(htmltools)
library(esquisse)
library(plotly)
library(flexdashboard)
library(shinydashboard)

setwd("/app")
source("functions.R")
setwd("/data")

p=plumber::plumb("/app/api.R")

p$run(port = 80, host= "0.0.0.0")
