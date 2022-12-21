# Let X~Unif[-1,2]. Find the PDF of e^X.

library(EnvStats)

r_x <- runif(100000, -1, 2)
r_y <- exp(r_x)

epdfPlot(r_y)

actual_x_range <- seq(exp(-1), exp(2), length.out=10000)
actual_y <- 1/(3*actual_x_range)

lines(actual_x_range, actual_y, col="red")