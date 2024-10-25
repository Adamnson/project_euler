require_relative "../helpers/helper"

def prime_factors(num)
  factors = (1..Math.sqrt(num).ceil).filter { |div| (num.modulo div).zero? }
  factors.filter(&:prime?)
end

puts prime_factors(13_195)
puts prime_factors(600_851_475_143)
# puts prime_factors(7)
# puts prime_factors(17)
# puts prime_factors(37)
# puts prime_factors(35)
# puts prime_factors(45)

puts 35.prime?
puts 7.prime?
