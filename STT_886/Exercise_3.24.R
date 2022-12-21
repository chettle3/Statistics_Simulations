# A coin, having a probability p of landing heads, is continually flipped until 
# at least one head and one tail have been flipped.
# a) Find the expected number of flips needed.
# b) Find the expected number of flips that land on heads.
# c) Find the expected number of flips that land on tails.
# d) Repeat part (a) in the case where flipping is continued until a total of at
#    least two heads and one tail have been flipped.

library("Rlab")
library("pbapply")

p = 0.4

simulationA <- function(p) {
  total <- 0
  total_head <- 0
  total_tail <- 0
  while (total_head < 1 || total_tail < 1) {
    flip <- rbern(1,p)
    if (flip == 1) {
      total_head <- total_head+1
    } else {
      total_tail <- total_tail+1
    }
    total <- total+1
  }
  return(total)
}

mean(pbreplicate(10000, simulationA(p)))
cat("Actual: ", (-p^2+p-1)/(p^2-p))

simulationB <- function(p) {
  total <- 0
  total_head <- 0
  total_tail <- 0
  while (total_head < 1 || total_tail < 1) {
    flip <- rbern(1,p)
    if (flip == 1) {
      total_head <- total_head+1
    } else {
      total_tail <- total_tail+1
    }
    total <- total+1
  }
  return(total_head)
}

mean(pbreplicate(10000, simulationB(p)))
cat("Actual: ", (p^2-p+1)/(1-p))

simulationC <- function(p) {
  total <- 0
  total_head <- 0
  total_tail <- 0
  while (total_head < 1 || total_tail < 1) {
    flip <- rbern(1,p)
    if (flip == 1) {
      total_head <- total_head+1
    } else {
      total_tail <- total_tail+1
    }
    total <- total+1
  }
  return(total_tail)
}

mean(pbreplicate(10000, simulationC(p)))
cat("Actual: ", (p^2-p+1)/p)

simulationD <- function(p) {
  total <- 0
  total_head <- 0
  total_tail <- 0
  while (total_head < 2 || total_tail < 1) {
    flip <- rbern(1,p)
    if (flip == 1) {
      total_head <- total_head+1
    } else {
      total_tail <- total_tail+1
    }
    total <- total+1
  }
  return(total)
}

mean(pbreplicate(1000000, simulationD(p)))
cat("Actual: ", (2/p+1)*(1-p)+p/(p-p^2))