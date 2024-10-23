def natural_sum(n)
  (1...n).filter { |el| (el.modulo 3).zero? || (el.modulo 5).zero? }.sum
end

puts natural_sum(10)
puts natural_sum(1000)
