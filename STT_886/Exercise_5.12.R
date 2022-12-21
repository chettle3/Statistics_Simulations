# Exercise 5.12
# If X_i, i=1,2,3, are independent exponential random variables with rates
# lambda_i, i=1,2,3, find
# a) P(X_1<X_2<X_3)
# b) P(X_1<X_2|max(X_1,X_2,X_3)=X_3)
# c) E[max X_i|X_1<X_2<X_3]

library("stats")

simulation1 <- function(lambda_1, lambda_2, lambda_3) {

  X1 <- rexp(1, rate=lambda_1)
  X2 <- rexp(1, rate=lambda_2)
  X3 <- rexp(1, rate=lambda_3)
  
  return(X1 < X2 && X2 < X3)
}

l1 <- 1.2
l2 <- 1.0
l3 <- 1.3

mean(replicate(10000, simulation1(l1, l2, l3)))
print("Actual: ")
print(l1/(l1+l2+l3)*l2/(l2+l3))

simulation2 <- function(lambda_1, lambda_2, lambda_3) {
  repeat {
    X1 <- rexp(1, rate=lambda_1)
    X2 <- rexp(1, rate=lambda_2)
    X3 <- rexp(1, rate=lambda_3)

    if (X3==max(X1, X2, X3)) {
      break
    }
  }
  return(X1 < X2)
}

mean(replicate(10000, simulation2(l1, l2, l3)))
print("Actual: ")
print((l1+l3)/(l1+l2+2*l3))

simulation3 <- function(lambda_1, lambda_2, lambda_3) {
  repeat {
    X1 <- rexp(1, rate=lambda_1)
    X2 <- rexp(1, rate=lambda_2)
    X3 <- rexp(1, rate=lambda_3)
    
    if (X1<X2 && X2<X3) {
      break
    }
  }
  return(X3)
}

mean(replicate(10000, simulation3(l1, l2, l3)))
print("Actual: ")
print(1/l3+(l1+2*(l2+l3))/((l2+l3)*(l1+l2+l3)))