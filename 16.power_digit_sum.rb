num = (2**1000)

sum = 0

while num.positive?
  sum += num % 10
  num /= 10
end

puts sum
