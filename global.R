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


source("stiff-to-geojson.R")
dataexample = data.frame(read.csv("www/data/data.csv"))



