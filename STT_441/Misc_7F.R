# Let X~Exp(1). Find the PDF of Y=X^2.

library(EnvStats)

r_x <- rexp(100000, 1)
r_y <- r_x**2

r_y <- r_y[r_y<50]


epdfPlot(r_y)

actual_x_range <- seq(0, 50, length.out=10000)
actual_y <- exp(-actual_x_range**0.5)/(2*actual_x_range**0.5)
lines(actual_x_range, actual_y, col="red")