graphGamma = function(alpha=1, beta=1) {
  x <- seq(0, 7, by=.001)
  plot(y=x, dgamma(x, alpha, beta), col = "red", type = "l", xlab = "X",
       ylab="Probability Density", main="Gamma Distribution")
}


plotCDF = function(alpha = 1, beta = 1){
  plot(ecdf(rgamma(1000, 1,1)))
}

dgamma(10, shape= 1)



x <- seq(0, 7, by=.001)
plot(x, dgamma(x, 1/2, 1), type="l",
     ylim=c(0,2), ylab="Density", 
     main="Gamma Densities: shape=.5, 1, 1.5, 2, 3, 4;
 scale = 1")
lines(x, dgamma(x, 1,1), col=2)

graphGamma(1,1)
