# p_n = P = n (3*n - 1) / 2
# 3n^2 - n - 2P
# r1,r2 = (1 +- sqrt(1 - 4(3)(-2p)) )/6

pentagon = ->(number) { number * ((3 * number) - 1) / 2 }
inv_pentagon = lambda { |number|
  det = Math.sqrt(1 + (24 * number))
  [1 + det, 1 - det].map! { |i| i / 6 }
                    .filter { |j| j.positive? && j.eql?(j.ceil.to_f) }
                    .shift
}

# checks for pentagonals
# 1.upto(10).each do |i|
#   puts pentagon.call i
# end

# checks for inverse of pentagonal if pentagonal
# (1..1000).each do |j|
#   p "we have #{j} is #{inv_pentagon.call(j).to_i} " unless inv_pentagon.call(j).nil?
# end

pent_arr = (1..1000).map { |i| pentagon.call(i) }

j_k = pent_arr.product(pent_arr)
              .map { |pair| [pair[0] + pair[1], (pair[0] - pair[1]).abs] }
              .map { |arr| [inv_pentagon.call(arr[0]), inv_pentagon.call(arr[1])] }
              .map(&:compact)
              .reject { |el| el.nil? || el.empty? }
              .filter { |arr| arr.size.eql?(2) }

p j_k
