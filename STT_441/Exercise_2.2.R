# Exercise 2.2
# A fair coin is flipped three times. What is the probability that the second 
# flip is tails, given that there is at most one tail among the three flips?

set.seed(314)

count = 0
successes = 0
while (count != 1e5) {
  flips = sample(c("H","T"), 3, replace=T)
  if (sum(flips=="T")<=1) {
    count = count + 1
    if (flips[2]=="T") {
      successes = successes + 1
    }
  }
}

successes/count