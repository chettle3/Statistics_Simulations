# Let X~N(1,2). Find the PDF of X^2.

library(EnvStats)

r_x <- rnorm(1000000, 1, 2**0.5)
r_y <- r_x**2

epdfPlot(r_y)

actual_x_range <- seq(0, 100, length.out=10000)
actual_y <- 1/(4*(pi*actual_x_range)**0.5)*(exp(-((actual_x_range**0.5+1)**2)/4)+exp(-((actual_x_range**0.5-1)**2)/4))

lines(actual_x_range, actual_y, col="red")