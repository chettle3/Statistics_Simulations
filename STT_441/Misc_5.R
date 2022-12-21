# Show that a sum of Bernoulli random variables (X) approaches normal (Y)

library(Rlab)
library(tidyverse)
library(pbapply)
set.seed(314)

p <- 0.5
n <- 500
m <- 1000

mean <- n*p
sd <- sqrt(n*p*(1-p))

hist_data <- data.frame(X=pbreplicate(m, sum(rbern(n, p))),
                        Y=rnorm(1000, mean, sd)) %>% 
  pivot_longer(cols=c(Y,X))
hist_data$name <- factor(hist_data$name, levels=c("X", "Y"))

normal_dist <- data.frame(x=200:300) %>%
  mutate(y = 4*m*dnorm(x, mean, sd))

hist_data %>%
  ggplot(aes(value)) +
  geom_histogram(binwidth=4) +
  facet_wrap(~name) +
  geom_line(aes(x, y), normal_dist, size=1.5, color="#C77CFF")