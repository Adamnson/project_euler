def get_factors(num)
  (1..num).filter { |div| (num % div).eql?(0) }
end

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
