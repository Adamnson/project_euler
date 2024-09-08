def natural_sum(n)
  (1...n).filter { |el| (el % 3).zero? || (el % 5).zero? }.sum
end

puts natural_sum(10)
puts natural_sum(1000)
