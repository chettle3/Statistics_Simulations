# Let X~N(1,2). Find the PDF of e^X.

library(EnvStats)
library(stats)

r_x <- rnorm(10000000, 1, 2**0.5)
r_y <- exp(r_x)

r_y <- r_y[r_y<100]

epdfPlot(r_y, xlim=c(0,100))

actual_x_range <- seq(0, 100, length.out=10000)
actual_y <- 1/(2*actual_x_range*pi**0.5)*exp(-((log(actual_x_range)-1)**2)/4)

lines(actual_x_range, actual_y, col="red")