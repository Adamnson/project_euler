def get_factors(num)
  (1..num).filter { |div| (num % div).eql?(0) }
end

num = 1
100.times do
  triangular_num = num * (num + 1) / 2
  p [[num.to_s.to_sym, get_factors(num).count],
     [(num + 1).to_s.to_sym, get_factors(num + 1).count],
     [triangular_num.to_s.to_sym, get_factors(triangular_num).count]]
  num += 1
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
