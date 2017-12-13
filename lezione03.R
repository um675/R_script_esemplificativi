#Writing own function
myfct <- function(x,y,z=10) {	#default value of z is 10 
  x1 <- x/y
  x2 <- x*y
  myvector <- c(x1,x2,z)
  myvector <- myvector^2
  return(myvector)
}
myfct(x=2,y=5)
#or
myfct(2,5)
#or
myfct(2,5,6) #z is now 6

#Statement SWITCH
calc <- function(x,type) { # se il tipo è sqrt calcola la radq se è log il logaritmo etc
  switch(type,
         sqrt = sqrt(x), 
         log = log(x), 
         square = x^2, 
         double = 2*x, 
         "Error: unknown type" )
}

x <- c(2,4,16)
calc(x,"double")

## Example for applying apply (matrix, array, data.frame) with with custom function
x <- 1:15
test_a <- function(x) { # Defines some custom function
  if(x < 6) { 
    x+1 
  } else { 
    x* x 
  } 
} 

apply(as.matrix(x), 1, test_a) # Returns same result as previous for loop*

## Same as above but with a single line of code
apply(as.matrix(x), 1, function(x) { if (x<6) { x+1 } else { x*x } })

#Experiment with set.seed
set.seed(1)
runif(10)
set.seed(4)
runif(10)
runif(10)

#Random Samples and Permutations
z <- seq(15) 
# a random permutation of z 
sample(z) 

# bootstrap resampling -- only if length(x) > 1 ! 
sample(z, replace = TRUE) 

#100 Bernoulli trials (unbiased) 
sample(c(0,1), 100, replace = TRUE)

#(Coin Toss Simulation) Simulation of tossing a fair (unbiased) coin to see how the law of large numbers works.
n<-1000;
U<-runif(n,min= 0,max= 1);
toss<-U<0.5;
a<-numeric(n+ 1);
avg<-numeric(n);
for(i in 2:n+ 1)
{a[i]<-a[i-1]+toss[i-1]
avg[i-1]<-a[i]/(i-1)
}
plot(1:n,avg[1:n],type="l",lwd=5,col="red",ylab="Proportion of Heads",
     xlab="CoinTossNumeber",cex.main=1.25,cex.lab=1.5,cex.axis=1.75)
#To do it for biased toss<-U<0.7

#Example: bootstrap_regression
#n<-number of bootstrap samples
bootstrap_reg<-function(n){
  #equidispersed regressor
  x<-seq(-3,3,le=5)
  #simulated dependent variable.When running the same experiment, 
  #you will obviously get different numerical values due to the use of a different random seed.
  y<-2+4*x+rnorm(5)
  #fit the linear model
  fit<-lm(y~x)
  print(summary(fit))
  #get the residuals
  Rdata<-fit$residuals
  #number of bootstrap samples
  nBoot<-n
  #bootstrap array
  B<-array(0,dim=c(nBoot,2))
  #bootstrap loop
  for(i in 1:nBoot){
    ystar<-y+sample(Rdata,replace=TRUE)
    Bfit<-lm(ystar~x)
    B[i,]<-Bfit$coefficients
  }
  par(mfrow=c(1,2))
  hist(B[,1],main ="Intercept")
  hist(B[,2],main ="Slope")
  }
#run function for 2000 samples
bootstrap_reg(2000)

###################ONE_DIMENSION_RANDOM_WALK######################
#Simulations of random walk in one dimension (temporal dynamic)
rw <- function(n){#n is a number of repetitions
  x=numeric(n)
  xdir=c(TRUE, FALSE)
  step=c(1,-1)
  for (i in 2:n)
    if (sample(xdir,1)) {
      x[i]=x[i-1]+sample(step,1)
    } else {
      x[i]=x[i-1]
    }
  list(x=x)
  plot(c(1:n),x,type="l",col="red", xlab="t",ylab="Current position on the line" )
}
rw(1000)

###################TWO_DIMENSIONS_RANDOM_WALK######################
#Simulated Random Walk in two dimensions (temporal and spatial dynamics)
random_walk_two<-function(n){
  plot(0:100,0:100,type="n",xlab="",ylab="")
  x<-y<-50
  points(50,50,pch=16,col="red",cex=1.5)
  for(i in 1:n){
    xi<-sample(c(1,0,-1),1)
    yi<-sample(c(1,0,-1),1)
    lines(c(x,x+xi),c(y,y+yi))
    x<-x+xi
    y<-y+yi
    if(x>100|x<0|y>100|y<0)
      break
  }
}
random_walk_two(10000)