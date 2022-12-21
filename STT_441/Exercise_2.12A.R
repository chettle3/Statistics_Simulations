# Exercise 2.12A
# We choose a number from the set {1, 2, 3, ..., 100} uniformly at random and 
# denote this number by X. For each of the following choices decide whether the
# two events in question are independent or not.
# (a) A={X is even}, B={X is divisible by 5}

set.seed(314)

A = 0
B = 0
AB = 0
count = 0

while (count != 1e6) {
  outcome = sample(1:100, 1)
  if (outcome %% 2 == 0) {
    A = A+1
  }
  if (outcome %% 5 == 0) {
    B = B+1
  }
  
  if (outcome %% 2 == 0 && outcome %% 5 == 0) {
    AB = AB+1
  }
  count = count + 1
}

print(A/count*B/count)
print(AB/count)