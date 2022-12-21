# Exercise 4.70
# A total of m white and m black balls are distributed among two urns, with each
# urn containing m balls. At each stage, a ball is randomly selected from each 
# urn and the two selected balls are interchanged. Let Xn denote the number of 
# black balls in urn 1 after the nth interchange.
# Find the limiting probabilities.

simulation <- function(m,len) {
  x <- sample(0:m, 1)
  xlist <- c(x)
  for (rep in 1:len) {
    balls1 <- rep(c("B", "W"), c(x, m-x))
    ball1 <- sample(balls1, 1)
    balls2 <- rep(c("B", "W"), c(m-x, x))
    ball2 <- sample(balls2, 1)
    if (ball1 == "W" & ball2 == "B") {
      x <- x+1
    } else if(ball1 == "B" & ball2 == "W") {
      x <- x-1
    }
    xlist <- append(xlist, x)
  }
  return (xlist)
}

prop.table(table(simulation(5, 10000)))
print("Actual: ")
sapply(0:5, function(i) choose(2*5,5)^(-1)*choose(5,i)^2)