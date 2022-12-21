# Exercise 5.34
#  Two individuals, A and B, both require kidney transplants. If she does not 
# receive a new kidney, then A will die after an exponential time with rate mu_A,
# and B after an exponential time with rate mu_B. New kidneys arrive in 
# accordance with a Poisson process having rate lambda. It has been decided that
# the first kidney will go to A (or to B if B is alive and A is not at that 
# time) and the next one to B (if still living).
# a) What is the probability that A obtains a new kidney?
# b) What is the probability that B obtains a new kidney?

library("stats")

simulationA <- function(muA, lambda) {
  a_time <- rexp(1,rate=muA)
  first_kidney <- rexp(1,rate=lambda)
  return (first_kidney<a_time)
}

muA <- 1.6
muB <- 1.3
lambda <- 2
mean(replicate(10000, simulationA(muA, lambda)))
print("Actual: ")
print(lambda/(lambda+muA))


simulationB <- function(muA, muB, lambda) {
  a_time <- rexp(1,rate=muA)
  b_time <- rexp(1,rate=muB)
  first_kidney <- rexp(1,rate=lambda)
  second_kidney <- rexp(1,rate=lambda)+first_kidney
  return(first_kidney<a_time && second_kidney<b_time || first_kidney>a_time && first_kidney < b_time)
}

mean(replicate(10000, simulationB(muA, muB, lambda)))
print("Actual: ")
print(lambda*(lambda+muA)/((lambda+muB)*(muB+muA+lambda)))