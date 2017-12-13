#Example2.1
data(mtcars)
?mtcars
plot(mtcars$mpg); 
plot(factor(mtcars$cyl));
plot(data.frame(x1=mtcars$mpg, x2=mtcars$cyl)); 

#Example2.2
par(mfrow=c(1,3))  
plot(mtcars$mpg); 
plot(factor(mtcars$cyl)); 
plot(data.frame(x1=mtcars$mpg, x2=mtcars$cyl));

#Example2.3
pdf("myplot.pdf")
par(mfrow=c(1,3)) 
plot(mtcars$mpg); 
plot(factor(mtcars$cyl)); 
plot(data.frame(x1=mtcars$mpg, x2=mtcars$cyl));
dev.off() 

#Example2.4
par(mfrow=c(1,1)) 
boxplot(mtcars$mpg)
title("Miles per gallon")

#Example2.5
boxplot(mtcars$mpg~mtcars$cyl) #crea un boxplot di mpg per ogni valore di cyl
title("Miles per gallon", "Number of cylinders")

#Example2.6
#Create 3 subsets according to the variable cyl
subset_4<-subset(mtcars, cyl == 4, select = mpg)
subset_6<-subset(mtcars, cyl == 6, select = mpg)
subset_8<-subset(mtcars, cyl == 8, select = mpg)
#Calculate mean of the variable mpg for each of subsets
mean_4<-mean(subset_4$mpg)
mean_6<-mean(subset_6$mpg)
mean_8<-mean(subset_8$mpg)
#create a vector of means
mean_mpg_cyl<-c(mean_4,mean_6,mean_8)
#another way to create objects created abowe is: 
#list1 <- list(subset4_,subset_6,subset_8)
#mean_mpg_cyl<-sapply(list1, mean) #this functionwe will know later


#create a boxplot con all'interno altri elementi aggiunti dopo

boxplot(mtcars$mpg~mtcars$cyl)#create a boxplot
#plot to the boxplot the mean values for each number of cylinders
points(c(mean_mpg_cyl), pch=8, col="red")
title("Miles per gallon", "Number of cylinders")# add title
legend("topright",c("Mean"), col="red",  pch=8) #add legend

#Example more complex plot
Orange$Tree <- as.numeric(Orange$Tree) # convert factor to numeric for convenience
numbtrees <- max(Orange$Tree)
x_range <- range(Orange$age)	# get the range for the x and y axis
y_range <- range(Orange$circumference)
# the plot
plot(x_range, y_range, type="n", xlab="Age (days)", ylab="Circumference (mm)" )
colors <- rainbow(numbtrees)
linetype <- c(1:numbtrees)
plotchar <- seq(0,numbtrees,1)
# add lines
for (i in 1:numbtrees) {	#loop (will be explained later)
  tree <- subset(Orange, Tree==i)
  lines(tree$age, tree$circumference, type="b", lwd=1.5,
        lty=linetype[i], col=colors[i], pch=plotchar[i])
}
title("Growth of Tree", "example of line plot")	# add a title and subtitle
legend(x_range[1], y_range[2], 1:numbtrees, col=colors,  pch=plotchar, lty=linetype, title="Tree") # add a legend

#Help search topic: distribution
help.search("distribution")

#Normal dustributio example 
pnorm(0) #the area under the standard normal curve to the left of zero DAL VALORE ALL'AREA

qnorm(0.9) #1.28 is the 90th percentile of the standard normal distributionv DALL'AREA AL VALORE CHE LA PRODUCE
#qnorm è tipo la funzione inversa di pnorm


y<-rnorm(100) #generates 100 random deviates from a standard normal distribution
hist(y)
y1<-rnorm(1000,50,10) #generates 100 random deviates from a normal distribution #with mean=50 and standard deviation=10 
hist(y1)


# Display the Student's t distributions with various
# degrees of freedom and compare to the normal distribution
x <- seq(-4, 4, length=100)
hx <- dnorm(x) #creo una funzione di densità su x cioè per ogni valore di x restituisce il valore dell'area
degf <- c(1, 5, 10, 30) #gradi di libertà
colors <- c("blue", "red", "green", "gold","black")
labels <- c("df=1", "df=5", "df=10", "df=30", "normal")
plot(x, hx, type="l", lty=2, xlab="x value",
     ylab="Density", main="Comparison of t Distributions")
for (i in 1:4){
  lines(x, dt(x,degf[i]), lwd=2, col=colors[i])
}
legend("topright", inset=.05, title="Distributions",labels, lwd=2, lty=c(1, 1, 1, 1, 2), col=colors)




# A agricultural company produces tomatoes. The productive process is regulated in such way that each tomatoes tin contains, on average, 130 grams. 
#The standard deviation of the effective weight is 1 grams and 
#it is assumed that the weight is distributed normally. 
#Determine the probability that a randomly chosen tin contains 
#the amount of tomatoes so that the weight is between 130 and 132 grams. 

mean=130; sd=1
lb=130; ub=132
x <- seq(-4,4,length=100)*sd + mean #produco dalla curva normale la nostra curva di distribuzione
hx <- dnorm(x,mean,sd) #calcolo l'area in corrispondenza di ogni valore
plot(x, hx, type="n", xlab="IQ Values", ylab="",
     main="Normal Distribution", axes=FALSE)
i <- x >= lb & x <= ub #logical in corrispondenza di x restituisce vero o falso
lines(x, hx)
polygon(c(lb,x[i],ub), c(0,hx[i],0), col="red")
area <- pnorm(ub, mean, sd) - pnorm(lb, mean, sd)
result <- paste("P(",lb,"< Weight <",ub,") =",
                signif(area, digits=3))
mtext(result,3)
axis(1, at=seq(127, 133, 1), pos=0) 

# Q-Q plots
par(mfrow=c(1,2))
# create sample data
x <- rt(100, df=3)
# normal fit
qqnorm(x); qqline(x)
# t(3Df) fit
qqplot(rt(1000,df=3), x, main="t(3) Q-Q Plot",
       ylab="Sample Quantiles")
abline(0,1) 

#Table of &
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE
#Table of |
TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE
#Boolean expresion
3+2 < 5
10-4 > 5
10+4 == 7+7
4!=factorial(3)-factorial(2)

#Structures IF
if(1==0) {
  print(3)
} else {
  print(2)
}

#Structures IFELSE
x <- 1:10
ifelse(x<5, x, 0) #un if veloce

#LOOP FOR
#ex1
for (i in 1:10) {
  print(i) }
#ex2
for (i in list("a", "b", TRUE)) {
  print(i) }

#LOOP WHILE
z <- 0
while (z<5) {
  z <- z+2
  print(z)
}

#LOOP REPEAT c'è una specie di cycle verifica una condizione e se non è soddisfatta non esce dal ciclo la condizione di uscita è con break
num <- 0 
repeat { num <- num + 1 
if (num %% 2 == 0) { 
  next
} 
print(num) 
if (num > 10) {
  break
} 
}
#Conditional Stop of Loops
x <- 1:10
z <- NULL
for(i in seq(x)) {
  if(x[i] <5) {
    z <- c(z, x[i]-1)
    print(z)
  } else {
    stop("values need to be <5")
  }
}

#The apply Functions : tapply
mtcars[1:4,]	#shows the first four rows of the dataset
tapply(mtcars$mpg, mtcars$cyl, mean) #effettuala la media di mtcars$mpg per ogni mtcars$cyl

#gives the mean of the Miles/(US) gallon of the cars in #the dataset defined by the number of cylinders

#The apply Functions : sapply and lapply
list1 <- list(a= -3:3, beta= log(1:4), logic= c(TRUE, FALSE, TRUE))
lapply (list1, mean) #returns a list objects ... per ogni elemento della lista fa la media ed il risultato è sotto forma di lista
sapply(list1, mean) #return vector or matrix objects when this is possible ... per ogni elemento della lista fa la media ed il risultato lo da sotto forma di vettore
