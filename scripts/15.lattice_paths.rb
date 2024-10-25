require_relative "../helpers/helper"

# to reach (n,n) in a grid, you need to take 2n steps
# n vertical, n horizontal
# the total number of paths is the number of ways to select
# n places in a string of length 2n i.e. 2n C n

p 40.C(20)
