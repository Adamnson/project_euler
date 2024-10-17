require "./helper"
class Float
  def int?
    eql?(ceil.to_f)
  end
end

# p_n = P = n (3*n - 1) / 2
# 3n^2 - n - 2P
# r1,r2 = (1 +- sqrt(1 - 4(3)(-2p)) )/6

pentagon = ->(number) { number * ((3 * number) - 1) / 2 }
inv_pentagon = lambda { |number|
  det = Math.sqrt(1 + (24 * number))
  [1 + det, 1 - det].map! { |i| i / 6 }
                    .filter { |j| j.positive? && j.int? }
                    .shift
}

# t_n = T =  n (n + 1) / 2
# n^2 + n - 2T
# r1, r2 = (-1 +- sqrt(1 - (4)(1)(-2T)) ) / 2
triangle = ->(number) { number * (number + 1) / 2 }
inv_triangle = lambda { |number|
  det = Math.sqrt(1 + (8 * number))
  [-1 + det, -1 - det].map! { |i| i / 2 }
                      .filter { |j| j.positive? && j.int? }
                      .shift
}

# Hn = H = n(2*n - 1)
# 2n*2 - n - H
# r1, r2 = (1 +- sqrt(1 - (4)(2)(-H)) )/ 4

hexagon = ->(number) { number * ((2 * number) - 1) }
inv_hexagon = lambda { |number|
  det = Math.sqrt(1 + (8 * number))
  [1 + det, 1 - det].map! { |i| i / 4 }
                    .filter { |j| j.positive? && j.int? }
                    .shift
}

# #checks for pentagonals
# 1.upto(10).each do |i|
#   puts pentagon.call i
# end

# #checks for inverse of pentagonal if pentagonal
# (1..1000).each do |j|
#   p "we have #{j} is #{inv_pentagon.call(j).to_i} " unless inv_pentagon.call(j).nil?
# end

#=begins
# pent_arr = (1..1000).map { |i| pentagon.call(i) }

# j_k = pent_arr.product(pent_arr)
#               .map { |pair| [pair[0] + pair[1], (pair[0] - pair[1]).abs] }
#               .map { |arr| [inv_pentagon.call(arr[0]), inv_pentagon.call(arr[1])] }
#               .map(&:compact)
#               .reject { |el| el.nil? || el.empty? } # this results in arrays which contains j or k indices
#               .filter { |arr| arr.size.eql?(2) } # searching for the array which contains both j & k

# p j_k
#=end

# #checks for triangles
# 1.upto(10).each do |i|
# puts triangle.call i
# end
#
# puts "calling 55 #{inv_triangle.call(55)}"
# #checks for inverse of triangle if traingle
# (1..1000).each do |j|
# p "we have #{j} is #{inv_triangle.call(j).to_i} " unless inv_triangle.call(j).nil?
# end

commons = (000_000..30_000_000).map { |num| [inv_hexagon.call(num), inv_pentagon.call(num), inv_triangle.call(num)] }
                               .map(&:compact)
                               .reject { |g| g.empty? }
                               .filter { |arr| arr.size.eql?(3) }

p commons

commons.each do |hpt|
  p [hpt, hexagon.call(hpt[0]), pentagon.call(hpt[1]), triangle.call(hpt[2])]
end
