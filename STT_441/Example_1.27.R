# Example 1.27
#  Suppose n people arrive for a show and leave their hats in the cloakroom. 
# Unfortunately, the cloakroom attendant mixes up the hats completely so that 
# each person leaves with a random hat. Let us assume that all n! assignments of
# hats are equally likely. What is the probability that no one gets his/her own 
# hat?

library(pbapply)

# Set a random seed for reproducibility
set.seed(314)

# Write a function to perform the simulation with n hats
simulate_hats <- function(n, reps=1e6) {
  mean(pbreplicate(reps, all(sample(1:n) != 1:n)))
}

for (i in c(3,30,300,3000)) {
  cat(sprintf("n=%d: %.6f\n", i, simulate_hats(i, 1e6)))
}