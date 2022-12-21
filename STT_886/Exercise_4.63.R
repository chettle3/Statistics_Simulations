# Exercise 4.63
# For the Markov chain with states 1, 2, 3, 4 whose transition probability 
# matrix P is as specified below find f_{i3} and s_{i3} for i = 1, 2, 3.
# P = 0.4  0.4  0.1  0.3
#     0.1  0.5  0.2  0.2
#     0.3  0.4  0.2  0.1
#     0    0    0    1

simulation <- function(i) {
  state <- i
  visits <- 0
  
  while(state != 4) {
    if(state == 1) {
      state <- sample(c(1,2,3,4),1,prob=c(.4,.2,.1,.3))
    } else if(state == 2) {
      state <- sample(c(1,2,3,4),1,prob=c(.1,.5,.2,.2))
    } else {
      visits <- visits + 1
      state <- sample(c(1,2,3,4),1,prob=c(.3,.4,.2,.1))
    }
  }
  
  return(visits)
}

# f_{i3}
mean(replicate(10000, simulation(1)>0))
print("Actual: ")
print(9/28)

mean(replicate(10000, simulation(2)>0))
print("Actual: ")
print(13/28)

mean(replicate(10000, simulation(3)>1))
print("Actual: ")
print(27/56)

# s_{i3}
mean(replicate(100000, simulation(1)))
print("Actual: ")
print(18/29)

mean(replicate(100000, simulation(2)))
print("Actual: ")
print(26/29)

mean(replicate(100000, simulation(3)))
print("Actual: ")
print(56/29)