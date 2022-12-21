# Exercise 5.26
# Let X b a random variable with density function
# f_X(x) = 2/9 x for 0<=x<=3, and 0 otherwise
# Find the density function of Y=X(X-3)

library("EnvStats")

num <- 100000
pdf_x_in <- seq(0,3,length.out=num)
pdf_x_out <- 2/9*pdf_x_in
plot(pdf_x_in, pdf_x_out)

cdf_x_in <- pdf_x_in
cdf_x_out <- cumsum(pdf_x_out)/(num/3)

r_unif <- runif(10000000)
r_x <- cdf_x_in[findInterval(r_unif, cdf_x_out)]

epdfPlot(r_x, add=T, curve.fill=T)

r_y <- r_x*(r_x-3)

epdfPlot(r_y, curve.fill=T)

y <- seq(-9/4,0,length.out=1000)
out <- 1/3*(y+9/4)**-0.5

lines(y, out, col="red")