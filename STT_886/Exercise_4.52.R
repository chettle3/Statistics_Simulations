# Exercise 4.52
# A taxi driver provides service in two zones of a city. Fares picked up in zone
# A will have destinations in zone A with probability 0.6 or in zone B with 
# probability 0.4. Fares picked up in zone B will have destinations in zone A
# with probability 0.3 or in zone B with probability 0.7. The driver's expected 
# profit for a trip entirely in zone A is 6; for a trip entirely in zone B is 8;
# and for a trip that involves both zones is 12. Find the taxi driver's average 
# profit per trip.

library("pbapply")

simulation <- function(n) {
  profit <- 0
  zoneA <- T
  count <- 0
  while (count<n) {
    if (zoneA) {
      if (runif(1) < 0.6) {
        profit <- profit + 6
      } else {
        zoneA <- F
        profit <- profit + 12
      }
    } else {
      if (runif(1) < 0.7) {
        profit <- profit+8
      } else {
        zoneA <- T
        profit <- profit + 12
      }
    }
    count <- count+1
  }
  return(profit/count)
}

mean(pbreplicate(1000, simulation(1000)))
print("Actual:")
print(62/7)