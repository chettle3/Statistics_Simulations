# Exercise 5.16
# Let X~Unif[0,1]. Find the nth moment of X.

library("EnvStats")

r_x <- runif(10000)

ns <- seq(0,10)
moments <- sapply(ns, function(t) mean(r_x**t))
plot(ns, moments)
lines(ns, 1/(ns+1), col="red")