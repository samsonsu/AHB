bee = read.table("beedata.csv", sep=",", header=TRUE)
hist(bee$Transit.Time, breaks=seq(0, 21, by=2), prob = TRUE, main = "Histogram of Estimated Transit Times",
     xlab = "Estimated transit time (mo per 100 km)", ylab = "Frequency")

# lines(density(bee$Transit.Time), lwd = 2, col = "blue")

qqnorm(y=bee$Transit.Time)
qqline(y = bee$Transit.Time)
#we see that if we would just use a normal distribution, the normal distribution 
#would understate the extreme positive values of x

#install.packages("MASS")
library(MASS)

normest = fitdistr(bee$Transit.Time, "normal")
curve(dnorm(x, normest$estimate[1], normest$estimate[2]), add=TRUE, col='red')

gammaest = fitdistr(bee$Transit.Time, densfun="gamma")
curve(dgamma(x, gammaest$estimate[1], gammaest$estimate[2]), add=TRUE, col='blue')

legend("topright", cex=0.75, pch=16, 
       col=c("red", "blue"), legend=c("Normal Dist", "Gamma Dist"))


#curve(dgamma(x= BeeTable$Transit.Time, shape=2, scale=1.5), from= 0, to = 20, main = "Gamma Distribution")
# dgamma(x= bee$Transit.Time, shape=1, scale=1.5)
#make a slider thingy to adjust the shape and the scale


