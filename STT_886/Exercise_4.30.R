# Exercise 4.30
# Three out of every four trucks on the road are followed by a car, while only 
# one out of every five cars is followed by a truck. What fraction of vehicles 
# on the road are trucks?

library("pbapply")

simulation <- function(n) {
  car <- F
  carcount <- 0
  truckcount <- 0
  while (carcount+truckcount<n) {
    if (car) {
      carcount <- carcount+1
      car <- runif(1)<4/5
    } else {
      truckcount <- truckcount+1
      car <- runif(1)<3/4
    }
  }
  return(truckcount/(truckcount+carcount))
}

mean(pbreplicate(1000, simulation(1000)))
print("Actual:")
print(4/19)