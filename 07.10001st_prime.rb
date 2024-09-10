def prime?(num)
  return false if num < 2

  (Math.sqrt(num) - 1).floor.times do |i|
    return false if (num % (i + 2)).eql?(0)
  end
  true
end

count = 0
num = 1
prime_nos = []
while count < 10_001
  if prime?(num)
    count += 1
    prime_nos.append(num)
  end
  num += 1
end
puts prime_nos.max
