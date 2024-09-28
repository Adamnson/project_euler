def get_factors(num)
  (1..num).filter { |div| (num % div).eql?(0) }
end

num_divs = [0, [0]]
n = 1
while n < 10_000
  tri_num = n * (n + 1) / 2
  factors = get_factors(tri_num)
  num_divs = [n, factors] if factors.count > num_divs[1].count
  n += 1
end
p num_divs

# puts "Start"
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
