rm(list=ls())
x=3
getwd() # print the current working directory -cwd
ls()# list the objects in the current workspace
a=getwd()
setwd(a) # change to mydirectory

sink("myfile01.txt",append=FALSE,split=FALSE) #split FALSE il risultato non viene visto su console append FALSE sovrascrive se esiste
x=3
x
y=5
y
sink()
assign("z",9)
print(z)
ls()
x<-c(9,16,25,36,NA)
mean(x)
mean(x,na.rm=TRUE) #rimuove gli eventuali NA dal vettore x

!complete.cases(x) # risponde valore per valore alla domanda, c'è un valore mancante (o meglio non è completo?)
x[!complete.cases(x)] #mostra i valori di x che sono veri alla condizione "non completo"
complete.cases(x) # x completo cioè esiste
!complete.cases(x) # x non completo cioè non esiste

xv=c(5,4,3,2) #creo un vettore xv
xv_r=rbind(xv) #vettore riga
xv_r
xv_c=cbind(xv) #vettore colonna
xv_c
vec_str=c("c","g","f")
vec_str

X<-matrix(c(2,3,4,5,6,7), nrow=3, ncol=2)
Y<-matrix(c(2,3,4,5,6,7), nrow=3, ncol=2, byrow=TRUE)
X
Y
y <-matrix(1:4, ncol=2, dimnames= list(c("a", "b"), c("first", "second")))

seq(length=10,from=5,by=0.15) #sequenza di 10 elementi parte da 5 e con passo di 0.15
seq(9,5,-0.5) #se vado da un numero maggiore ad uno minore il passo deve essere negativo

letters[seq(5,7)] #restituisce dalla 5 alla 7 lettera dell'alfabeto

rep(1:4,3) #ripeto la sequenza da 1 a 4 per tre volte
rep(1:4,each=3) #ripeto ogni elemento della sequenza 3 volte

#come dare un nome alle colonne dopo avere creato un vettore
y<-c("Kevin", "Chantal", "Jessica")
names(y)<-c("Name 1","Name 2","Name 3")
##########################################################

x<-c(1,1,1,4,5,7,5,6,89,6,7,34)
x[4:11] #slicing

M<-matrix(seq(20),c(5,4)) # 20 elementi consecutivi organizzati in 5 righe e 4 colonne


B=NULL #definisco B sconosciuto
B[5]=5 #assegno un valore al 5nto elemento ed in automatico crea un vettore di 5 elementi di cui i primi 4 NA ... non funziona per le matrice

C[2]=2 #questo non funzionerà


V=seq(1:12)

M<-array(V, c(3,2,2), dimnames=list(c("a","b","c"), c("weight","height"),c("2010","2011")))
#creo un assary 3x2x2
MM=matrix(M[,,1],3,2)


n<-c(2,3,5)
s<-c("aaa","bbb","ccc","ddd","eee")
b<-c(TRUE,FALSE,TRUE,FALSE,FALSE)
x<-list(n,s,b,3)#xcontainscopiesofn,s,b

y=x[2]
y
z=x[[2]]
z



x<-c("blue","yellow","blue","red","blue","blue","red", "red")
factor(x) #sceglie le 3 diverse modalita presenti in x (cioè blue red e yellow)

summary(factor(x)) # ci da il numero di elementi per categoria


#FATA FRAME

n<-c(2,3,5);
s<-c("aaa","bbb","ccc");
b<-c(TRUE,FALSE,TRUE);
data_D<-data.frame(n,s,b)
data_E<-data.frame(n/2,s,b)

dataD_E<-merge(data_D,data_E,by="s")
  




data(mtcars) #dataset di R
View(mtcars) # la V è MAIUSCOLA

A=seq(1:100)
B=(A%%7==0) # crea un vettore che risponde elemento per elemento alla domanda A è divisibile per 7?

A<-array(seq(1,100,2), c(25,2))
M=array(seq(8),c(4,2))
RS=apply(M,1,sum) # effettua l'operazione somma riga per riga
CS=apply(M,2,sum) # effettua l'operazione somma colonna per colonna


library(beanplot)
beanplot()




