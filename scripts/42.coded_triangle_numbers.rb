require_relative "../helpers/helper"

WORDS = File.read("../helpers/helper.42.words.txt").split(",").map { |w| w.delete('"') }

sums = WORDS.map { |w| w.bytes.map { |ch| ch - 64 }.inject(:+) }
p WORDS[41]
p sums[41]

tiangular_numbers = (1..100).map { |n| n * (n + 1) / 2 }
# p tiangular_numbers
# sums.each_with_index do |sum, idx|
#   puts "#{sum}, #{WORDS[idx]}" if tiangular_numbers.include?(sum)
# end

p sums.filter { |sum| tiangular_numbers.include?(sum) }.size
