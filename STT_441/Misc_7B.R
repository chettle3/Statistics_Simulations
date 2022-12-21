# Let X~Unif[-1,2]. Find the PDF of X^2.

library(EnvStats)

r_x <- runif(100000, -1, 2)
r_y <- r_x**2

epdfPlot(r_y)

actual_x_range1 <- seq(0, 1, length.out=10000)
actual_y1 <- 1/(3*actual_x_range1**0.5)
lines(actual_x_range1, actual_y1, col="red")
actual_x_range2 <- seq(1, 4, length.out=10000)
actual_y2 <- 1/(6*actual_x_range2**0.5)
lines(actual_x_range2, actual_y2, col="red")