# Exercise 5.11B
# The random variable X has the following probability density function:
# f_X(x)= xe^(-x) for x>0, 0 otherwise
# a) Find the moment generating function of X.
# b) Find E[X^n] for positive integer n.

library("base")
library("pbapply")

# a)
num <- 10000
pdf_x_in <- seq(-10,10,length.out=num)
pdf_x_out <- ifelse(pdf_x_in>0, pdf_x_in * exp(-pdf_x_in), 0)
plot(pdf_x_in, pdf_x_out)

cdf_x_in <- pdf_x_in
cdf_x_out <- cumsum(pdf_x_out)/(num/20)
plot(cdf_x_in, cdf_x_out)

r_unif <- runif(num*10)
r_x <- cdf_x_in[findInterval(r_unif, cdf_x_out)]

mgf_x_in <- seq(-10,1,length.out=num)
mgf_x_out <- pblapply(mgf_x_in, function(t) mean(exp(r_x*t)))
plot(mgf_x_in, mgf_x_out)
lines(mgf_x_in, (1-mgf_x_in)**-2, col="red")

# b)
ns <- seq(1,4)
moments <- sapply(ns, function (n) mean(r_x**n))
plot(ns, moments)
points(ns, sapply(ns, function (n) factorial(n+1)),col="red")