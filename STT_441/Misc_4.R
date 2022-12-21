# What is the empirical probability of getting a full house (AABBB) from a deck
# of 52 cards?

library(pbapply)
set.seed(314)

get_hand <- function() {
  sample(rep(1:13,4), 5)
}

check_full_house <- function(hand) {
  setequal(as.numeric(table(hand)), c(2,3))
}

cat(sprintf("%.6f\n",mean(pbreplicate(1e6, check_full_house(get_hand())))))