BASIS = [1, 2, 5, 10, 20, 50, 100, 200]

#
# 1    2     5    10   20   50   100 200
# 0.01 0.02 0.05  0.1  0.2  0.5  1   2

values = BASIS.map { |el| el / 100.0 }
p values

value_based_inject = lambda { |arr|
  ret_val = 0
  arr.each_with_index do |number, idx|
    ret_val += number * (BASIS[-1 - idx] / 100.0)
  end
  ret_val
}

# t0 = Time.now
# (0..50).to_a.repeated_permutation(5)
#        #  .map { |el| el.append((el[0] * 200) + (el[1] * 100) + (el[2] * 50)) }
#        .reject { |el| value_based_inject.call(el) > 2.0 }
#        .map { |el| p el }
#        .filter { |el| el.last == 2.0 }
#        .map { |el| puts "match: #{el}" }
#        .size
# .map { |el| p el }

# puts "time : #{Time.now - t0}"

sizes200 = [0, 1]
sizes100 = [0, 1, 2]
sizes50 = (0..4).to_a
sizes20 = (0..10).to_a
sizes10 = (0..20).to_a
(0..40).to_a
(0..100).to_a
(0..200).to_a
t0 = Time.now
mega_sizes = sizes200.product(sizes100, sizes50, sizes50, sizes10, sizes10, sizes10, sizes20)

p mega_sizes.select { |el| value_based_inject.call(el) == 2.0 }
            .map { |el| p el }
            .size
puts Time.now - t0
# two
# BASIS = [1, 2, 5, 10, 20, 50, 100, 200]
# prod_mat = BASIS

# (2..8).each do |i|
#   prod_mat = prod_mat.product(BASIS).flatten.each_slice(i).to_a.filter { |el| el.inject(:+) < 200 }
# end
# p prod_mat.size

# def calc_combinations(number)
#   combinations = []
#   additional_count = 0
#   BASIS.each do |coin|
#     combinations.append([number, coin, number.divmod(coin)]) if coin <= number
#   end
#   p combinations
#   # big_combinations = combinations.map { |data| data[2][1] if data[2][1] > 1 }.flatten.slice(2, 2).to_a
#   big_combinations = combinations.filter { |data| data[2][1] if data[2][1] > 1 }
#   p "big combinations : #{big_combinations}"
#   additional_count = big_combinations.map { |i| calc_combinations(i[2][1]) }.inject(:+) || 0
#   p "inject on big_combs.map #{additional_count}"
#   combinations.count + additional_count
# end

# p calc_combinations(199)

# say we iterate from 1 to 200
# 1 - min number of coins required to make 200p
# 200 - max number of coins required to make 200p
# for each intermediate n we calculate the number of ways
#  of reaching the sum of 200p with n coins of any denomination

# pound_count = 0
# 8.times do |i|
#   prod_mat = prod_mat.product(basis)
#                      .map { |el| el.inject(:+) }
#                      .filter { |el| el <= 200 }
#   pound_count += prod_mat.count(200)
#   prod_mat = prod_mat.filter { |el| el < 200 }
#   p [i, prod_mat.size, pound_count]
#   # p prod_mat
#   # prod_mat = prod_mat.filter { |el| el > 200 }
# end

# p prod_mat.size

# two_pounds = prod_mat.filter { |el| el.eql?(200) }
# p two_pounds.count
