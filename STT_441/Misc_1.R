# There are 36 students in the classroom. Suppose each date of the year is 
# equally likely to b the birthday of the student. Calculate the probability
# that there are at least two students having the same birthday.

# Set a random seed for reproducibility
set.seed(314)
# Create a sample of length 36 from [1,365] with replacement
# Check for duplicates (anyDuplicated return 0 if there are no duplicates)
# Repeat 1e6 times and count the number of times a duplicate occurred
sum(replicate(1e6, anyDuplicated(sample(1:365, 36, replace=T)) != 0))