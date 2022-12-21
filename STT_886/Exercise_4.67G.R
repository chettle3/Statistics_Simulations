# Exercise 4.67
# At all times, an urn contains N balls-some white balls and some black balls. 
# At each stage, a coin having probability p, 0 < p < 1, of landing heads is 
# flipped. If heads appears, then a ball is chosen at random from the urn and is
# replaced by a white ball; if tails appears, then a ball is chosen from the urn
# and is replaced by a black ball. Let X_n denote the number of white balls in 
# the urn after the nth stage.
# g) If p = 1, what is the expected time until there are only white balls in the
# urn if initially there are i white and N ??? i black?

simulation <- function(N,x0,p,len) {
  x <- x0
  steps <- 0
  for (rep in 1:len) {
    coin <- sample(c("H", "T"), 1, prob=c(p, 1-p))
    ball <- sample(c("W", "B"), 1, prob=c(x,N-x))
    if (coin == "H") {
      if (ball == "B") {
        x <- x+1
      }
    } else {
      if (ball == "W") {
        x <- x-1
      }
    }
    steps <- steps+1
    if(x==N) {
      break
    }
  }
  return (steps)
}

mean(replicate(100000, simulation(4, 2, 1, 1000)))
print("Actual: ")
print(4*(1+1/2))