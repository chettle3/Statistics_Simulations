# Exercise 4.67
# At all times, an urn contains N balls-some white balls and some black balls. 
# At each stage, a coin having probability p, 0 < p < 1, of landing heads is 
# flipped. If heads appears, then a ball is chosen at random from the urn and is
# replaced by a white ball; if tails appears, then a ball is chosen from the urn
# and is replaced by a black ball. Let X_n denote the number of white balls in 
# the urn after the nth stage.
# d) Let N=2. Find the proportion of time in each state.
# e-f) Find the case for general n

simulation <- function(N,x0,p,len) {
  x <- x0
  xlist <- c(x0)
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
    xlist <- append(xlist, x)
  }
  return (xlist)
}

# d)
p <- 0.4
prop.table(table(simulation(2, 0, p, 10000)))
print("Actual: ")
c((1-p)^2, 2*p*(1-p), p^2)

# e-f)
p <- 0.4
prop.table(table(simulation(4, 0, p, 10000)))
print("Actual: ")
sapply(0:4, function (i) choose(4,i)*p^i*(1-p)^(4-i))

