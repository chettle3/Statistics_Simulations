# When determining the confidence interval for a population proportion, one 
# calculates:
# P(|phat - p|<eps) = 2 pnorm(eps*sqrt(n)/sqrt(p*(1-p))) - 1
# However, p is unknown. We could either substitute p*(1-p) with 1/4 (the worst 
# case scenario) or let p=phat. We call the former type I, and the latter type 
# II. We show that the former yields a confidence interval that captures the 
# true proportion at least 95% of the time, while the latter does not.

library(tidyverse)
set.seed(314)

typeI <- function(n, p, p.hat, conf) {
  eps <- qnorm((conf+1)/2)/(2*sqrt(n))
  list(p.hat - eps, p.hat + eps)
}

typeII <- function(n, p, p.hat, conf) {
  eps <- qnorm((conf+1)/2)*sqrt(p.hat*(1-p.hat))/(sqrt(n))
  list(p.hat - eps, p.hat + eps)
}

in.interval <- function(intervals, p) {
  intervals[[1]] < p & p < intervals[[2]]
}

run_test <- function(n, p, conf, reps) {
  Sn <- rbinom(reps, n, p)
  p.hat <- Sn/n
  boundsI <- typeI(n, p, p.hat, conf)
  boundsII <- typeII(n, p, p.hat, conf)
  p.inI <- mean(in.interval(boundsI, p))
  p.inII <- mean(in.interval(boundsII, p))
  c(p.inI, p.inII)
}

n <- 64
p <- 0.3
conf <- .95
reps <- 1000
num.tests <- 100
results <- replicate(num.tests, run_test(n, p, conf, reps))
results <- data.frame(percent.I = results[1,], percent.II = results[2,])

results %>%
  pivot_longer(cols=c(percent.I,percent.II)) %>% 
  ggplot(aes(value)) +
  geom_histogram(aes(fill=name), alpha=.5, position="identity", bins=30) +
  ggtitle("Percent of Confidence Intervals Containing True Proportion") +
  xlab("Percent")