# Exercise 2.1
# We roll two dice. Find the conditional probability that at least one of the 
# numbers is even, given that the sum is 8.

set.seed(314)

count = 0
successes = 0
while (count != 1e5) {
  rolls = sample(1:6, 2, replace=T)
  if (sum(rolls) == 8) {
    count = count + 1
    if (any((rolls %% 2) == 0)) {
      successes = successes + 1
    }
  }
}

successes/count