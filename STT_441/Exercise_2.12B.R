# Exercise 2.12B
# We choose a number from the set {1, 2, 3, ..., 100} uniformly at random and 
# denote this number by X. For each of the following choices decide whether the
# two events in question are independent or not.
# (b) C={X has two digits}, D={X is divisible by 3}

set.seed(314)

C = 0
D = 0
CD = 0
count = 0

while (count != 1e6) {
  outcome = sample(1:100, 1)
  if (floor(log10(outcome))+1==2) {
    C = C+1
  }
  if (outcome %% 3 == 0) {
    D = D+1
  }
  
  if (floor(log10(outcome))+1==2 && outcome %% 3 == 0) {
    CD = CD+1
  }
  count = count + 1
}

print(C/count*D/count)
print(CD/count)