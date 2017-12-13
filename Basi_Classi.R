#################################################
#Definisco una classe                           #    
#sequenza è il nome della classe                #
#x e' il suo unico parametro di tipo carattere  #
setClass("sequenza",
         representation(x="character")
         )
#                                               #  
#                                               #
#################################################

#####################################################################
##     Nella sua forma completa setClass sarebbe così               #
#####################################################################
##  setClass("nomeclasse",                                          #
##  representation(parametro1="numeric",parametro2="character"),    #
##           prototype=list(parametro1=5,parametro2="ciao"),        #
##           contains="classe_madre"                                #    
##  )                                                               #
##################################################################### 
##prototype rappresenta eventuali valori di default per l'oggetto   #
##                                                                  #
##contains invece inserisce la classe madre da cui si vogliano      #
##         ereditare i metodi                                       #
#####################################################################


#####################################################################
#Ridefinisco un metodo perchè funzioni per oggetti di quella classe #
#####################################################################
# setMethod                                                         #
# "length" e' il metodo che vado a ridefinire                       #    
# "sequenza e' l'oggetto a cui applico il metodo                    #
# scrivo la funzione che il metodo svolge                           #  
#####################################################################
#                                                                   #
setMethod("length","sequenza",
          function(object){
            l=length(object@x)
            return(l)
          })
seque=new("sequenza",x=c("AGO","STO"))
length(seque)
#                                                                   #
#                                                                   #
#####################################################################




########## ORA DEFINISCO UN'ALTRA CLASSE #######################
setClass("percinque",
         representation(x="numeric")
)
########################## SETGENERIC ##########################
#  Quando voglio usare un metodo che non esiste                #
#  prima devo crearlo vuoto con setGeneric dove                #
#  l'unica cosa che faccio e' dire il nome del metodo          #
#  che voglio creare "mpercinque" e specificare i parametri    #
#  di cui ha bisogno in function, in questo caso solo x        #
#  e definirlo come standardGeneric                            #
################################################################
setGeneric("mpercinque",
           function(x)
             standardGeneric("mpercinque")
)
###################################################################
# Ora posso definire il metodo mpercinque per la classe percinque #
###################################################################

setMethod("mpercinque","percinque",
          function(object){
            l=object@x*5
            return(l)
          })


A=new("percinque",x=8)
mpercinque(A)

################ Esempio ereditarieta' ############
setClass("prova",
         representation(x="numeric",y="character"),
         prototype=list(x=0,y="A"),
         contains="percinque")
###################################################

B=new("prova",x=4,y="ciao")
mpercinque(B)





