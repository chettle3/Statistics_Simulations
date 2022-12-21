# Exercise 4.28
# Every time that the team wins a game, it wins its next game with probability 
# 0.8; every time it loses a game, it wins its next game with probability 0.3. 
# If the team wins a game, then it has dinner together with probability 0.7, 
# whereas if the team loses then it has dinner together with probability 0.2. 
# What proportion of games result in a team dinner?

library("pbapply")

simulation <- function(n) {
  won <- F
  dinnercount <- 0
  nodinnercount <- 0
  while (dinnercount+nodinnercount<n) {
    if (won) {
      won = runif(1)<0.8
    } else {
      won = runif(1)<0.3
    }
    
    if (won) {
      if (runif(1)<0.7) {
        dinnercount <- dinnercount+1
      } else {
        nodinnercount <- nodinnercount+1
      }
    } else {
      if (runif(1)<0.2) {
        dinnercount <- dinnercount+1
      } else {
        nodinnercount <- nodinnercount+1
      }
    }
  }
  return(dinnercount/(dinnercount+nodinnercount))
}

mean(pbreplicate(1000, simulation(1000)))
print("Actual:")
print(1/2)