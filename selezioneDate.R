###substr###
rm(list=ls())
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

k=0 #contatore inizializzato a zero
for(i in 1:length(dateVect)){ #scorro sulle date da accettare

  for(j in 1:length(posVect)){ #scorro sulle date del modis
    
    if(dateVect[i]==posVect[j]){ #se coincidono
      k=k+1 #incremento il contatore
      if(k==1){ #se e' la prima volta che soddisfo la condizione 
        indx=j #inizializzo la variabile index con la posizione j del primo match
      }  
      else{ #le volte successive, in cui e' soddisfatta la condizione
        indx=append(indx,j) # aggiungo un valore alla variabile (che dopo il primo append diventa un vettore)
      }
    }
  }
}

#alla fine di tutti sti cicli e queste condizioni if poco eleganti degne del peggior programmatore del mondo
#ho una variabile indx che contiene gli indici di dove la condizione e' soddisfatta


setwd(posVettoreDate) # mi sposto nella mia cartella temp
sel_dir=vect[indx] # seleziono dall'elenco file solo quelli che hanno l'indice che soddisfaceva (soddisfava? era satisfacio quindi voto per soddisfaceva)
write.table(sel_dir,"sel_dir.csv",sep=";",col.names = F,row.names = F) #scrivo su file
