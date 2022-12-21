# Let Z~N(0,1) and Y=Z^2. Find the PDF, CDF, and MGF of Y.

library(EnvStats)
library(stats)

r_x <- rnorm(1000000)
r_y <- r_x**2

epdfPlot(r_y)

actual_x_range <- seq(0, 20, length.out=10000)
actual_y <- 1/(2*pi*actual_x_range)**0.5*exp(-actual_x_range/2)
lines(actual_x_range, actual_y, col="red")

cdf_y_in <- actual_x_range
cdf_y_out <- ecdf(r_y)(actual_x_range)
plot(cdf_y_in, cdf_y_out)
actual_cdf_out <- 2*pnorm(cdf_y_in**0.5)-1
lines(cdf_y_in, actual_cdf_out, col="red")

mgf_y_in <- seq(-1, 1/2, length.out=100)
mgf_y_out <- sapply(mgf_y_in, function (t) mean(exp(r_y*t)))
plot(mgf_y_in, mgf_y_out)
lines(mgf_y_in, (1-2*mgf_y_in)**-0.5)