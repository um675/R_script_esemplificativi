

###############
#  TECNICA 2  #
###############

###substr###

posVettoreDate="Y:/PaA/00_temp" # io ho messo il tuo file xls qui ma l'avevo convertito in csv (per R e' meglio)
setwd(posVettoreDate) #spostiamoci nella cartella del vettore date
vettoreDate=read.table("date.csv",col.names = F,sep=";")#memorizzo il file nella variabile
vettoreNomi=toString(vettoreDate[,1]) #alla fine questo non mi e' servito
vettoreDate[,1]=as.integer(vettoreDate[,1]) #convertiamo ad intero il vettore
dateVect=vettoreDate[,1] #siccome quando lo importo e' un dataFrame e non un vettore mi estraggo una colonna in un vettore
setwd("S:/CRYOMON/Albedo/MODIS_Data/MODIS_Albedo/2014")
vect=dir() #elenco file
posVect=substring(vect,14,16) #estraggo la parte del nome file che mi serve
posVect=as.integer(posVect) # e lo metto converto in intero


#testindice=sort(which(is.element(posVect,dateVect))) #PROVA di uguaglianza con la vecchia tecnica

#eccolo tutto con un solo comando .... quanto ti senti sfigato quando vedi che si può fare tutto con un solo comando!!!

risultatoFigo=vect[which(is.element(posVect,dateVect))]





