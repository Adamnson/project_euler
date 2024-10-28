condition_check = lambda { |num,factor|
  ret_val = true  
  (1..factor).each do |f|
    ret_val &= (f*num).to_s.chars.sort.eql?(num.to_s.chars.sort)
  end
  ret_val
}

(100_000..150_000).each do |number|
  puts number if condition_check.call(number,6)
end

#one
# basis = %w[0 1 2 3 4 5 6 7 8 9] * 2
# p basis
# number_of_digits = (4..7).to_a # found that only 8 digit numbers have the property that x and 6x have same number of digits
# specials = []
# find_specials = lambda { |n|
#   n_digits = basis.permutation(n)
#   t0 = Time.now
#   p n_digits.size
#   n_digits = n_digits.filter { |arr| (arr.inject(:+).to_i * 6).size.eql?(n) }
#   p Time.now - t0, n_digits.size

#   n_digits.each do |arr|
#     num = arr.inject(:+).to_i
#     temp = (1..6).to_a.map { |el| el * num }
#                  .map { |multiple| multiple.to_s.chars.sort.eql?(num.to_s.chars.sort) }

#     specials.append(num) if temp.all?
#   end
# }

# number_of_digits.map { |el| find_specials.call(el) }
# p specials.size
# p specials
#two
# p((1..6).to_a.map { |el| el * specials.first })
# (100_000..1_000_000_000).each do |num|
# (100_000..110_000).each do |num|
#   if (1..6).to_a.map { |el| (el * num).to_s.size }.all? { |el| el == 6 }
#     (1..6).to_a.map { |el| (el * num).to_s.chars }
#           .filter
#   end
# end

