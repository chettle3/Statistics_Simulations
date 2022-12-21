# Exercise 4.56
# Suppose that on each play of the game a gambler either wins 1 with probability
# p or loses 1 with probability 1-p. The gambler continues betting until she or
# he is either up n or down m. What is the probability that the gambler quits a
# winner?

simulation <- function(n,m,p) {
  profit <- 0
  repeat {
    if (runif(1) < p) {
      profit <- profit + 1
      if (profit>=n) {
        return(T)
      }
    } else {
      profit <- profit - 1
      if (profit<=-m) {
        return(F)
      }
    }
  }
}

expected <- function(n,m,p) {
  if (p==1/2) {
    return(m/(m+n))
  } else {
    return((1-((1-p)/p)^m)/(1-((1-p)/p)^(m+n)))
  }
}

mean(replicate(10000, simulation(2,3,.4)))
print("Actual:")
print(expected(2,3,.4))

mean(replicate(10000, simulation(10,10,.55)))
print("Actual:")
print(expected(10,10,.55))