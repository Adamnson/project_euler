# for 28
# lets say the dimension of the matrix is p * p
# p is odd
# top right diagonal is (n**2) for odd numbers in (1..p)
# top left diagonal is (n**2) - (n-1) for odd numbers in (1..p)
# bottom left diagonal is (n**2) - 2*(n-1)
# bottom right diagonal is (n**2) - 3*(n-1)
# note that each sequence starts with 1 which is
# thus counted 4 times.

n = 5 # 101
n = 1001

sum_of_diagonals = (0..n).filter(&:odd?)
                         .map { |t| (4 * (t**2)) - (6 * (t - 1)) } # sum of all diagonals as explained above
                         .inject(-3, :+) # 1 is counted 4 times in all

puts sum_of_diagonals
