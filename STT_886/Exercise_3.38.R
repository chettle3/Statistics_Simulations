# Exercise 3.38
# Let U be a uniform (0,1) random variable. Suppose that n trials are to be
# performed and that conditional on U=u these trials will be independent with
# a common success probability u. Compute the mean and variance of the number
# of successes that occur in these trials.

library("stats")

simulation <- function(n) {
  u <- runif(1)
  return(rbinom(1,n,u))
}

n <- 10
results <- replicate(100000, simulation(n))
mean(results)
cat("Actual: ", n/2, "\n")
var(results)
cat("Actual: ", (n^2+2*n)/12, "\n")