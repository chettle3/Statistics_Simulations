# Exercise 3.44
# The number of customers entering a store on a given day is Poisson distributed
# with mean lambda=10. The amount of money spent by a customer is uniformly 
# distributed over (0,100). Find the mean and variance of the amount of money 
# that the store takes in on a given day.

library("stats")

simulation <- function() {
  n <- rpois(1,10)
  total <- 0
  for(x in 1:n) {
    total <- total+runif(1,0,100)
  }
  return(total)
}

results <- replicate(100000, simulation())
mean(results)
cat("Actual: ", 500, "\n")
var(results)
cat("Actual: ", 100000/3, "\n")