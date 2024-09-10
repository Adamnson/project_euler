def prime_factors(num)
  factors = (1..Math.sqrt(num).ceil).filter { |div| (num % div).zero? }
  factors.filter { |f| prime?(f) }
end

def prime?(num)
  return false if num < 2

  (Math.sqrt(num) - 1).floor.times do |i|
    return false if (num % (i + 2)).eql?(0)
  end
  true
end

puts prime_factors(13_195)
puts prime_factors(600_851_475_143)
# puts prime_factors(7)
# puts prime_factors(17)
# puts prime_factors(37)
# puts prime_factors(35)
# puts prime_factors(45)

puts prime?(35)
puts prime?(7)
