require "./helpers/helper"

# basis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
basis = [1, 4, 7, 8]

# four_digit_numbers = basis.permutation(4)
# the_family = []
# four_digit_numbers.each_with_index do |digits, idx|
#   # the_family = digits.product(digits, digits, digits) if idx.eql?(530)
#   the_family = digits.permutation if idx.eql?(530)
#   the_family.uniq
# end
the_family = basis.permutation
p the_family

the_family = the_family.map { |arr| arr.inject { |sum, n| (10 * sum) + n } }.filter { |el| el > 1000 }
p the_family

p "number_of_primes: #{the_family.filter(&:prime?).count}"
