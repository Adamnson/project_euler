require_relative "../helpers/special_helper"

sum_diff_idx = lambda { |low, high|
  (low..high).map(&:pentagon)
             .permutation(2) # .product(pent_arr)
             .map { |pair| [pair.inject(:+), pair.inject(:-).abs] }
             .uniq
             .map { |sum_diff_arr| [sum_diff_arr.first.pentagon_idx, sum_diff_arr.last.pentagon_idx] }
             .map(&:compact)
             .reject { |el| el.nil? || el.empty? } # this results in arrays which contains j or k indices
             .filter { |arr| arr.size.eql?(2) } # searching for the array which contains both j & k
}
start = 1
interval_length = 5000
while start < 100
  puts " #{start} - #{start + interval_length} : #{sum_diff_idx.call(start, start + interval_length)}"
  start += interval_length
end

puts "the sum is p_2395: #{2395.pentagon} and difference is p_1912: #{1912.pentagon}"
puts "first number is #{0.5 * (2395.pentagon - 1912.pentagon)} at i #{(0.5 * (2395.pentagon - 1912.pentagon)).to_i.pentagon_idx}"
puts "other number is #{0.5 * (2395.pentagon + 1912.pentagon)} at j #{(0.5 * (2395.pentagon + 1912.pentagon)).to_i.pentagon_idx}"
puts "ans: #{1912.pentagon}"
