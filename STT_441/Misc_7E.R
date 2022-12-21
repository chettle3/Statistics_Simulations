# Let X~Exp(1). Find the PDF of Y=e^X.

library(EnvStats)
library(stats)

r_x <- rexp(100000, 1)
r_y <- exp(r_x)

r_y <- r_y[r_y<100]

epdfPlot(r_y)

actual_x_range <- seq(1, 100, length.out=10000)
actual_y <- actual_x_range**-2

lines(actual_x_range, actual_y, col="red")