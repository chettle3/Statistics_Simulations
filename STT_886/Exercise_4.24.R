# Exercise 4.24
# Consider three urns, one colored red, one white, and one blue. The red urn 
# contains 1 red and 4 blue balls; the white urn contains 3 white balls, 2 red 
# balls, and 2 blue balls; the blue urn contains 4 white balls, 3 red balls, and
# 2 blue balls. At the initial stage, a ball is randomly selected from the red 
# urn and then returned to that urn. At every subsequent stage, a ball is 
# randomly selected from the urn whose color is the same as that of the ball 
# previously selected and is then returned to that urn. In the long run, what 
# proportion of the selected balls are red? What proportion are white? What 
# proportion are blue?

library("pbapply")

simulation <- function(n) {
  urn <- "R"
  rcount <- 0
  wcount <- 0
  bcount <- 0
  while (rcount+wcount+bcount<n) {
    if (urn=="R") {
      rcount <- rcount+1
      balls <- rep(c("R","W","B"),c(1,0,4))
      urn <- sample(balls,1)
    } else if (urn=="W") {
      wcount <- wcount+1
      balls <- rep(c("R","W","B"),c(2,3,2))
      urn <- sample(balls,1)
    } else {
      bcount <- bcount+1
      balls <- rep(c("R","W","B"),c(3,4,2))
      urn <- sample(balls,1)
    }
  }
  return(c(rcount,wcount,bcount)/(rcount+wcount+bcount))
}

apply(pbreplicate(10000, simulation(100)), 1, mean)
print("Actual: ")
print(c(25, 28, 36)/89)