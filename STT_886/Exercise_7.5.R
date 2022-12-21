# Exercise 7.5
# Let U_1, U_2, ... be independent uniform (0,1) random variables, and define N 
# by N=min{n: U_1+U-2+...+U_n>1}
# What is E[N]?

library("stats")

simulation <- function() {
  n <- 0
  total <- 0
  while (total <= 1) {
    total <- total + runif(1)
    n <- n+1
  }
  return(n)
}

mean(replicate(10000, simulation()))
print("Actual: ")
print(exp(1))