# Exercise 5.22
# Let X~Exp(lambda). Find the moment generating function of Y=3X-2.

library("EnvStats")

lambda = 1

r_x <- 3*rexp(10000, lambda)-2

mgf_x_in <- seq(-4, lambda/3, length.out=1000)
mgf_x_out <- sapply(mgf_x_in, function(t) mean(exp(r_x*t)))
plot(mgf_x_in, mgf_x_out)
lines(mgf_x_in, lambda*exp(-2*mgf_x_in)/(lambda-3*mgf_x_in), col="red")