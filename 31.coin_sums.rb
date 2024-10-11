BASIS = [1, 2, 5, 10, 20, 50, 100, 200]

def calc_combinations(number)
  combinations = []
  additional_count = 0
  BASIS.each do |coin|
    combinations.append([number, coin, number.divmod(coin)]) if coin <= number
  end
  p combinations
  # big_combinations = combinations.map { |data| data[2][1] if data[2][1] > 1 }.flatten.slice(2, 2).to_a
  big_combinations = combinations.filter { |data| data[2][1] if data[2][1] > 1 }
  p "big combinations : #{big_combinations}"
  additional_count = big_combinations.map { |i| calc_combinations(i[2][1]) }.inject(:+) || 0
  p "inject on big_combs.map #{additional_count}"
  combinations.count + additional_count
end

p calc_combinations(199)

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
