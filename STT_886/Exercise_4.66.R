# Exercise 4.66
# For a branching process, calculate pi_0 when
# a) P_0=1/4, P_2=3/4
# b) P_0=1/4, P_1=1/2, P_2=1/4
# c) P_0=1/6, P_1=1/2, P_3=1/3

library("pbapply")

simulation <- function(p0,p1,p2,p3,len) {
  num <- 1
  for (rep in 1:len) {
    offspring <- 0
    for (i in 1:num) {
      this_offspring <- sample(c(0,1,2,3), 1, prob=c(p0,p1,p2,p3))
      offspring <- offspring + this_offspring
    }
    num <- offspring
    if (num == 0) {
      return(T)
    }
    if (num > 100) {
      return(F)
    }
  }
  return(F)
}

mean(pbreplicate(10000, simulation(1/4, 0, 3/4, 0, 1000)))
print("Actual: ")
print(1/3)

mean(pbreplicate(10000, simulation(1/4, 1/2, 1/4, 0, 1000)))
print("Actual: ")
print(1)

mean(pbreplicate(10000, simulation(1/6, 1/2, 0, 1/3, 1000)))
print("Actual: ")
print((sqrt(3)-1)/2)