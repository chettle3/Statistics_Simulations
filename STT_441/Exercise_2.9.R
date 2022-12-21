# Exercise 2.9
# We have two urns. The first urn contains three balls labeled 1, 2 and 3. The 
# second urn contains four balls labeled 2, 3, 4 and 5. We choose one of the 
# urns randomly, so that the probability of choosing the first one is 1/5 and 
# the probability of choosing the second is 4/5. Then we sample one ball 
# (uniformly at random) from the chosen urn. Suppose that ball 3 was chosen. 
# What is the probability that it came from the second urn?

pickball <- function() {
  urn <- sample(1:2, 1, prob=c(1/5,4/5))
  ball <- sample((1+(urn==2)):(3+2*(urn==2)), 1)
  return(c(urn, ball))
}

set.seed(314)

count = 0
successes = 0
while (count != 1e5) {
  outcome = pickball()
  if (outcome[2]==3) {
    count = count + 1
    if (outcome[1]==2) {
      successes = successes + 1
    }
  }
}

successes/count