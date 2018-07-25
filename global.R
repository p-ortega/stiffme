library(leaflet)
library(htmltools)
library(leaflet.extras)
library(ggplot2)
library(DT)
library(shinythemes)
library(shinyWidgets)
library(shinydashboard)
library(sp)
library(randomcoloR)
library(geojsonio)
library(rgdal)
library(prettydoc)
library(knitr)


source("stiff-to-geojson.R")
dataexample = read.csv("www/data/data.csv")



