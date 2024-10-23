require "./helpers/helper"
require "./helpers/special_helper"
# four

t0 = Time.now
ans = (1..20_000).map(&:triangle)
                 .filter { |i| i.factors.size >= 500 }.min

p "time: #{Time.now - t0}"
p ans
# p 76_576_500.triangle_idx

# the learning is that, you need an efficient algorithm
# the Integer#factors is much faster than get_factors(number)
# one
# puts "Brute Force"
# n_factors = 0
# num = 000_000
# max = 0
# while n_factors < 500
#   triangular_num = num * (num + 1) / 2
#   n_factors = get_factors(triangular_num).count
#   max = n_factors if max < n_factors
#   p [triangular_num, n_factors, max]
#   num += 1
# end
#
