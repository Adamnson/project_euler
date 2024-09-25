require "./helper"

# to reach (n,n) in a grid, you need to take 2n steps
# n vertical, n horizontal
# the total number of paths is the number of ways to select
# n places in a string of length 2n i.e. 2n C n

p nCr(40, 20)
