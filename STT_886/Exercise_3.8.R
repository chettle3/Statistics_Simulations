# Exercise 3.8
# An unbiased die is successively rolled. Let X and Y denote, respectively, the
# number of rolls necessary to obtain a six and a five. Find E[X] and E[X|Y=1].

library(pbapply)

simulation1 <- function() {
  num_rolls <- 0
  repeat {
    roll <- sample(1:6,1)
    num_rolls <- num_rolls + 1
    if (roll == 6) {
      break
    }
  }
  return(num_rolls)
}

mean(pbreplicate(10000, simulation1()))

simulation2 <- function() {
  num_rolls <- 0
  num_rolls_five <- 0
  repeat {
    roll <- sample(1:6,1)
    num_rolls <- num_rolls + 1
    if (roll == 6) {
      break
    }
    if (roll == 5 && num_rolls_five==0) {
      num_rolls_five <- num_rolls
    }
  }
  if (num_rolls_five == 1) {
    return(num_rolls)
  } else {
    return(simulation2())
  }
}

mean(pbreplicate(10000, simulation2()))