library(openxlsx)
library(dplyr)
library(terra)
library(sf)
###############################################################
setwd("C:\\aaa_lavori\\lav_falesie")
###############################################################

aa=read.csv("falesie.csv")
aa[,1:2]=apply(aa[,1:2],2,FUN=function(x) as.numeric(gsub(",",".",x)))
places <- st_as_sf(aa,coords = c("lon", "lat"),crs = st_crs(4326))
places_vect=vect(places)
writeVector(places_vect, "falesie.shp", overwrite=TRUE)
writeVector(places_vect, "falesie.json",filetype="GeoJSON",overwrite=TRUE)
saveRDS(places_vect,"falesie.rds")

#############################################################################