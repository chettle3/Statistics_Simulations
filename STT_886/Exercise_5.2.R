# Exercise 5.2
#  Suppose that you arrive at a single-teller bank to find five other customers 
# in the bank, one being served and the other four waiting in line. You join the
# end of the line. If the service times are all exponential with rate ??, what is
# the expected amount of time you will spend in the bank?
  
library("stats")

simulation <- function(mu) {
  wait <- 0
  for (person in 1:6) {
    wait <- wait + rexp(1,rate=mu)
  }
  return(wait)
}

mu <- 2
mean(replicate(10000, simulation(mu)))
print("Actual: ")
print(6/mu)
