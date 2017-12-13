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


pos1="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Riproiezione/Matrice/matrixDEM_ver001"

setwd(pos1)

filename01="DEM30mres.img"
DEM=raster(filename01)
######    SGP1    ######
pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/SGP1"
setwd(pos2)
SGP1=readOGR(pos2,"SGP1")

ds_sgp1=distanceFromPoints(DEM,SGP1)
fileout2="sgp1_ds.img"
rnc <- writeRaster(ds_sgp1, filename=fileout2, format="ENVI", overwrite=TRUE)
quota_sgp1=extract(DEM,SGP1)

A=values(ds_sgp1)
A=A*A
B=values(DEM)
B=(B-quota_sgp1)*(B-quota_sgp1)
C=sqrt(A+B)

d3D_sgp1=ds_sgp1
values(d3D_sgp1)=C

fileout3="sgp1_d3D.img"
rnc <- writeRaster(d3D_sgp1, filename=fileout3, format="ENVI", overwrite=TRUE)

######    SGP2    ######

pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/SPP"
setwd(pos2)
SGP2=readOGR(pos2,"SPP")

ds_sgp2=distanceFromPoints(DEM,SGP2)
fileout2="sgp2_ds.img"
pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/SGP2"
setwd(pos2)
rnc <- writeRaster(ds_sgp2, filename=fileout2, format="ENVI", overwrite=TRUE)
quota_sgp2=extract(DEM,SGP2)

A=values(ds_sgp2)
A=A*A
B=values(DEM)
B=(B-quota_sgp2)*(B-quota_sgp2)
C=sqrt(A+B)

d3D_sgp2=ds_sgp2
values(d3D_sgp2)=C

pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/SGP2"
setwd(pos2)
fileout3="sgp2_d3D.img"
rnc <- writeRaster(d3D_sgp2, filename=fileout3, format="ENVI", overwrite=TRUE)

######    SPP    ######

pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/SPP"
setwd(pos2)
SPP=readOGR(pos2,"SPP")

ds_spp=distanceFromPoints(DEM,SPP)
fileout2="spp_ds.img"
rnc <- writeRaster(ds_spp, filename=fileout2, format="ENVI", overwrite=TRUE)
quota_spp=extract(DEM,SPP)

A=values(ds_spp)
A=A*A
B=values(DEM)
B=(B-quota_spp)*(B-quota_spp)
C=sqrt(A+B)

d3D_spp=ds_spp
values(d3D_spp)=C

fileout3="spp_d3D.img"
rnc <- writeRaster(d3D_spp, filename=fileout3, format="ENVI", overwrite=TRUE)

######    SGG    ######
pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/SGG"
setwd(pos2)
SGG=readOGR(pos2,"SGG")

ds_sgg=distanceFromPoints(DEM,SGG)
fileout2="sgg_ds.img"
rnc <- writeRaster(ds_sgg, filename=fileout2, format="ENVI", overwrite=TRUE)
quota_sgg=extract(DEM,SGG)

A=values(ds_sgg)
A=A*A
B=values(DEM)
B=(B-quota_sgg)*(B-quota_sgg)
C=sqrt(A+B)

d3D_sgg=ds_sgg
values(d3D_sgg)=C

fileout3="sgg_d3D.img"
rnc <- writeRaster(d3D_sgg, filename=fileout3, format="ENVI", overwrite=TRUE)


######    S40    ######

pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/S40"
setwd(pos2)
S40=readOGR(pos2,"SPP")

ds_s40=distanceFromPoints(DEM,S40)
fileout2="s40_ds.img"
rnc <- writeRaster(ds_s40, filename=fileout2, format="ENVI", overwrite=TRUE)
quota_s40=extract(DEM,S40)

A=values(ds_s40)
A=A*A
B=values(DEM)
B=(B-quota_s40)*(B-quota_s40)
C=sqrt(A+B)

d3D_s40=ds_s40
values(d3D_s40)=C

fileout3="s40_d3D.img"
rnc <- writeRaster(d3D_s40, filename=fileout3, format="ENVI", overwrite=TRUE)

######    S80    ######

pos2="C:/Users/APadovano/OneDrive/Collaborazioni/2015/Del Gaudio/Coordinate/Coordinate con quota/WGS84/S40"
setwd(pos2)
S40=readOGR(pos2,"SPP")

ds_s40=distanceFromPoints(DEM,S40)
fileout2="s80_ds.img"
rnc <- writeRaster(ds_s40, filename=fileout2, format="ENVI", overwrite=TRUE)
quota_s40=extract(DEM,S40)-40

A=values(ds_s40)
A=A*A
B=values(DEM)
B=(B-quota_s40)*(B-quota_s40)
C=sqrt(A+B)

d3D_s40=ds_s40
values(d3D_s40)=C

fileout3="s80_d3D.img"
rnc <- writeRaster(d3D_s40, filename=fileout3, format="ENVI", overwrite=TRUE)
