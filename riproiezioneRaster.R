library(sp)
library(raster)
library(Rgbp)
library(rgdal)
library(sn)
library(MASS)
library(mnormt)
library(GEOmap)
library(PythonInR)
library(maptools)
library(mapproj)
library(geomapdata)
library(shapefiles)
library(tiff)
library(Rquake)
library(RSEIS)
rm(list=ls())

setwd("P:/02_Activities/Receiving_Station/PassesLogsCache/3rdgeneration")

rastrif=brick("EURAC_SNOW_MERGE.alps.h18v04.2015.MERGE.215.eurac.03.06.tif")
sissin=crs(rastrif)
vittima=brick("vscm-vrt.tif") # raster da riproiettare
vittima_sin=projectRaster(vittima,crs=sissin,method='ngb') #riproiezione
setwd("P:/02_Activities/Receiving_Station/PassesLogsCache/3rdgeneration/projected") #posizione output
writeRaster(vittima_sin,"vscm-vrt_sinusoidal.tif",format="GTiff") #salva come GeoTiff


###################################################################################
# Convertire il sistema di riferimento di Corn e Soybean nello stesso dei raster  #
#     NB      #                                                                   #
#             #                                                                   #
# spTransform(shapefile,sistemadiriferimento)  riproietta uno shapefile           #
# projectRaster(raster,crs=sistemadiriferimento)                                  #
###################################################################################
# utm15_wgs84=crs(july9HH)                                                        #
# fields_shp_rpj=spTransform(fields_shp,utm15_wgs84)                              #
###################################################################################