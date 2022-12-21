# If we choose two numbers X and Y equally likely from the interval [0,1], what 
# is the probability that the distance between these points is less than 0.2?

# Set a random seed for reproducibility
set.seed(314)
# Calculate the absolute difference between two random variables from 0 to 1
# Determine if the event occurred by checking if the difference is less than 0.2
# Repeat 1e6 times and take the mean (equivalent to counting successes and 
# dividing by total)
sprintf("%.6f",mean(replicate(1e6, abs(runif(1)-runif(1))<0.2)))