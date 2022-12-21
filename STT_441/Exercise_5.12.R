# Exercise 5.12
# Suppose the random variable X has the density function
# f(x) = 1/2 x^2 e^(-x) for x>=0, f(x)=0 otherwise
# Find the moment generating function M(t) of X.

library("EnvStats")

num <- 100000
pdf_x_in <- seq(0,10,length.out=num)
pdf_x_out <- 1/2*pdf_x_in**2*exp(-pdf_x_in)
plot(pdf_x_in, pdf_x_out)

cdf_x_in <- pdf_x_in
cdf_x_out <- cumsum(pdf_x_out)/(num/10)
plot(cdf_x_in, cdf_x_out)

r_unif <- runif(10000)
r_x <- cdf_x_in[findInterval(r_unif, cdf_x_out)]

mgf_x_in <- seq(-4,0.5,length.out=1000)
mgf_x_out <- sapply(mgf_x_in, function(t) mean(exp(r_x*t)))
plot(mgf_x_in, mgf_x_out)
lines(mgf_x_in, (1-mgf_x_in)**-3, col="red")