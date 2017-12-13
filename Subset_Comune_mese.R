library(sp)
library(raster)
library(Rgbp)
library(rgdal)
library(sn)
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
library(MASS)
rm(list=ls())

#CREARE IL SUBSET DI UN OGGETTO IN BASE A DEI CRITERI

pos2="C:/Users/APadovano/Desktop"
setwd(pos2)

#a=read.csv("GeoreferenzierteEinwohnerUndArbeitnehmer2015.tsv")

Original.tsv <- read.csv(file=paste(pos2,"GeoreferenzierteEinwohnerUndArbeitnehmer2015.tsv",sep="/") 
                         , sep="\t" # die Felder sind durch Tabulatoren getrennt
                         , dec="."  # als Dezimaltrennzeichen wird der Punkt benützt
)

str(Original.tsv)

A=Original.tsv

C_BZ_1=subset(A,A$ResidenzaComune==21008 | A$SedeComune==21008)
C_BZ=subset(C_BZ_1,C_BZ_1$mm==2)
write.csv(C_BZ,"C_BZ.csv")

C_CR_1=subset(A,A$ResidenzaComune==21026 | A$SedeComune==21026)
C_CR=subset(C_CR_1,C_CR_1$mm==2 | C_CR_1$mm==8)
write.csv(C_CR,"C_CR.csv")


