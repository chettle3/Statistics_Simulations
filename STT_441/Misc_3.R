# An urn has 3 white balls, green balls, and red balls.
# a) 3 balls are drawn with replacement. What is the probability that they are 
#    green, red, and white in some order?
# b) 3 balls are drawn with replacement. What is the probability that they are
#    red, white, and white in some order?
# c) 3 balls are drawn without replacement. What is the probability that they 
#    are green, red, and white in some order?
# d) 3 balls are drawn without replacement. What is the probability that they 
#    are red, white, and white in some order?

library(pbapply)

set.seed(314)
a = mean(pbreplicate(1e5, all(sort(sample(rep(c('W', 'G', 'R'), each=3), 3, replace=T))==c('G', 'R', 'W'))))
b = mean(pbreplicate(1e5, all(sort(sample(rep(c('W', 'G', 'R'), each=3), 3, replace=T))==c('R', 'W', 'W'))))
c = mean(pbreplicate(1e5, all(sort(sample(rep(c('W', 'G', 'R'), each=3), 3, replace=F))==c('G', 'R', 'W'))))
d = mean(pbreplicate(1e5, all(sort(sample(rep(c('W', 'G', 'R'), each=3), 3, replace=F))==c('R', 'W', 'W'))))

cat(sprintf("a) %.6f\n", a))
cat(sprintf("b) %.6f\n", b))
cat(sprintf("c) %.6f\n", c))
cat(sprintf("d) %.6f\n", d))